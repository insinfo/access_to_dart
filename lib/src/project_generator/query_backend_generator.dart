part of 'project_generator.dart';

typedef _QueryCompilationResult = ({
  Map<String, Map<String, Object?>> specifications,
  List<Map<String, Object?>> diagnostics,
});

extension _CompiledQueryBackend on ProjectGenerator {
  _QueryCompilationResult _compileQuerySpecifications(AnalysisProject project) {
    final specifications = <String, Map<String, Object?>>{};
    final diagnostics = <Map<String, Object?>>[];
    final queries =
        (project.raw['queries'] as List? ?? const []).whereType<Map>();
    for (final query in queries) {
      final name = query['name'] as String? ?? '';
      final contract = query['executionContract'];
      if (contract is! Map) {
        diagnostics.add({'query': name, 'status': 'missing-dao-contract'});
        continue;
      }
      try {
        final plan = compileContractQuery(project.raw,
            query.cast<String, dynamic>(), contract.cast<String, dynamic>(),
            identifiers: identifierPolicy,
            questionMarkParameters: true,
            ordinalOutputAliases: true);
        final key = toSnakeCaseIdentifier(name);
        if (specifications.containsKey(key)) {
          throw FormatException('Query route collision');
        }
        specifications[key] = {
          'name': name,
          'sql': plan.sql,
          'bindings': plan.bindingDescriptors,
          'parameters': [
            for (var i = 0; i < (contract['parameters'] as List).length; i++)
              {
                'key': 'p$i',
                'sourceName': contract['parameters'][i]['name'],
                'daoType': contract['parameters'][i]['daoType']
              }
          ],
          'columns': [
            for (var i = 0; i < plan.outputs.length; i++)
              {
                'ordinal': i,
                'resultKey': 'c$i',
                'name': plan.outputs[i].name,
                'daoType': plan.outputs[i].typeCode,
                'sourceTable': plan.outputs[i].sourceTable,
                'sourceColumn': plan.outputs[i].sourceColumn
              }
          ],
          'sqlSha256': contract['sqlSha256'],
          'sourceSha256': contract['sourceSha256'],
        };
        diagnostics.add(
            {'query': name, 'status': 'compiled-read-only', 'routeKey': key});
      } on FormatException catch (error) {
        diagnostics.add(
            {'query': name, 'status': 'rejected', 'reason': error.message});
      }
    }
    return (specifications: specifications, diagnostics: diagnostics);
  }

  MapEntry<String, Map<String, Object?>>? _compileExtendedQuerySpecification(
    AnalysisProject project, {
    required String key,
    required String name,
    required String sqlText,
    Map<String, String> namedSubqueries = const {},
  }) {
    final plan = AccessSelectCompiler(
      project.tables,
      identifiers: identifierPolicy,
    ).compile(
      sqlText,
      asciiCaseInsensitiveText: true,
      questionMarkParameters: true,
      ordinalOutputAliases: true,
      allowExtendedSyntax: true,
      inferParameterTypes: true,
      namedSubqueries: namedSubqueries,
    );
    return MapEntry(key, {
      'name': name,
      'sql': plan.sql,
      'bindings': plan.bindingDescriptors,
      'parameters': [
        for (var i = 0; i < plan.orderedParameters.length; i++)
          {
            'key': 'p$i',
            'sourceName': plan.orderedParameters[i],
            'daoType': plan.inferredParameterTypes[plan.orderedParameters[i]] ?? 10,
          }
      ],
      'columns': [
        for (var i = 0; i < plan.outputs.length; i++)
          {
            'ordinal': i,
            'resultKey': 'c$i',
            'name': plan.outputs[i].name,
            'daoType': plan.outputs[i].typeCode,
            'sourceTable': plan.outputs[i].sourceTable,
            'sourceColumn': plan.outputs[i].sourceColumn,
          }
      ],
      'allowNonAsciiText': true,
      if (plan.hasExplicitOrdering) 'ordering': 'explicit',
      if (plan.hasLimit) 'hasLimit': true,
      if (plan.isUnion) 'isUnion': true,
    });
  }

  Future<void> _generateQueryBackend(
      AnalysisProject project, Directory backendDir) async {
    final compiled = _compileQuerySpecifications(project);
    final rawQueries =
        (project.raw['queries'] as List? ?? const []).whereType<Map>();
    final namedSubqueries = <String, String>{
      for (final q in rawQueries)
        if (q['name'] is String &&
            !(q['name'] as String).startsWith('~') &&
            q['sqlText'] is String &&
            (q['sqlText'] as String).trim().isNotEmpty)
          q['name'] as String: q['sqlText'] as String,
    };
    final extendedSpecifications = <String, Map<String, Object?>>{};
    final extendedDiagnostics = <Map<String, Object?>>[];
    for (final q in rawQueries) {
      final name = q['name'] as String? ?? '';
      if (name.isEmpty || name.startsWith('~')) continue;
      final key = toSnakeCaseIdentifier(name);
      if (compiled.specifications.containsKey(key)) continue;
      if (extendedSpecifications.containsKey(key)) {
        extendedDiagnostics.add({
          'query': name,
          'status': 'skipped-extended',
          'reason': 'route-key-collision',
        });
        continue;
      }
      var sqlText = (q['sqlText'] as String? ?? '').trim();
      if (sqlText.startsWith('\ufeff')) {
        sqlText = sqlText.substring(1).trimLeft();
      }
      final upper = sqlText.toUpperCase();
      if (sqlText.isEmpty ||
          (!upper.startsWith('SELECT') &&
              !upper.startsWith('PARAMETERS') &&
              !upper.startsWith('('))) {
        extendedDiagnostics.add({
          'query': name,
          'status': 'skipped-extended',
          'reason': 'non-select-query',
        });
        continue;
      }
      try {
        final compiledEntry = _compileExtendedQuerySpecification(
          project,
          key: key,
          name: name,
          sqlText: sqlText,
          namedSubqueries: namedSubqueries,
        );
        if (compiledEntry != null) {
          extendedSpecifications[key] = compiledEntry.value;
          extendedDiagnostics.add({
            'query': name,
            'status': 'compiled-extended',
            'routeKey': key,
          });
        }
      } on FormatException catch (error) {
        extendedDiagnostics.add({
          'query': name,
          'status': 'skipped-extended',
          'reason': error.message,
        });
      }
    }
    final reportsResult = compileEligibleReports(project);
    final mergedSpecifications = <String, Map<String, Object?>>{
      ...compiled.specifications,
      ...extendedSpecifications,
      for (final entry in reportsResult.compiledReportQueries.entries)
        if (!compiled.specifications.containsKey(entry.key) &&
            !extendedSpecifications.containsKey(entry.key))
          entry.key: entry.value,
    };
    await File(p.join(backendDir.path, 'lib/src/shared/access_queries.dart'))
        .writeAsString(_queryBackendSource.replaceFirst('/*SPECIFICATIONS*/',
            _dartStringLiteral(jsonEncode(mergedSpecifications))));
    await File(p.join(backendDir.path, 'lib/src/shared/access_queries.json'))
        .writeAsString(const JsonEncoder.withIndent('  ').convert({
      'queries': mergedSpecifications,
      'diagnostics': compiled.diagnostics,
      'extended_diagnostics': extendedDiagnostics,
    }));
  }
}

const _queryBackendSource = r'''
import 'dart:convert';
import 'package:eloquent/eloquent.dart';
import 'package:shelf/shelf.dart';
import 'extensions/request_extension.dart';
import 'utils/api_utils.dart';

class AccessQueryInputError implements Exception {
  final String message;
  AccessQueryInputError(this.message);
}

class AccessQueryController {
  static final Map<String,dynamic> specifications=(jsonDecode(/*SPECIFICATIONS*/) as Map).cast<String,dynamic>();

  static List<Object?> _buildBindings(Map descriptor, Map input) {
    final parameters=descriptor['parameters'] as List;
    if(input.length!=parameters.length || parameters.any((p)=>!input.containsKey(p['key']))) {
      throw AccessQueryInputError('Informe exatamente os parametros declarados p0, p1, ... .');
    }
    final bySource=<String,Object?>{};
    for(final p in parameters) {
      final value=input[p['key']];
      if(value!=null && value is! String) throw AccessQueryInputError('Parametro DAO Text exige string ou null.');
      bySource[p['sourceName'] as String]=value;
    }
    final bindings=<Object?>[];
    final allowNonAscii = descriptor['allowNonAsciiText'] == true;
    for(final binding in descriptor['bindings'] as List) {
      final isParam = binding['parameter'] != null;
      final value = isParam ? bySource[binding['parameter']] : binding['literal'];
      if(value==null){bindings.add(null);continue;}
      final bType = binding['typeCode'];
      if(bType==4 || bType==3) {
        final int? number;
        if(!isParam && value is int) {
          number = value;
        } else {
          if(value is! String || !RegExp(r'^[+-]?[0-9]+$').hasMatch(value)) throw AccessQueryInputError('Comparacao Long exige string inteira.');
          number = int.tryParse(value);
        }
        if(number==null || number < -2147483648 || number > 2147483647) throw AccessQueryInputError('Parametro fora da faixa Long.');
        bindings.add(number);
      } else if(bType==1) {
        if(!isParam && value is bool) {
          bindings.add(value);
        } else {
          final lower = value.toString().trim().toLowerCase();
          if(lower=='true'||lower=='yes'||lower=='sim'||lower=='1') {bindings.add(true);}
          else if(lower=='false'||lower=='no'||lower=='nao'||lower=='0') {bindings.add(false);}
          else {throw AccessQueryInputError('Comparacao booleana invalida.');}
        }
      } else if(bType==5 || bType==7) {
        if(!isParam && value is num) {
          bindings.add(bType==5 ? value.toString() : value.toDouble());
        } else {
          final parsed = num.tryParse(value.toString().trim().replaceAll(',', '.'));
          if(parsed==null) throw AccessQueryInputError('Comparacao numerica invalida.');
          bindings.add(bType==5 ? parsed.toString() : parsed.toDouble());
        }
      } else if(bType==8) {
        final rawDate = value.toString().trim();
        DateTime? dt = DateTime.tryParse(rawDate);
        if(dt==null) {
          final br = RegExp(r'^(\d{2})/(\d{2})/(\d{4})$').firstMatch(rawDate);
          if(br!=null) {
            dt = DateTime(int.parse(br.group(3)!), int.parse(br.group(2)!), int.parse(br.group(1)!));
          }
        }
        if(dt==null) throw AccessQueryInputError('Comparacao de data exige ISO-8601 ou DD/MM/AAAA.');
        bindings.add(dt);
      } else {
        if(value is! String || (!allowNonAscii && value.codeUnits.any((c)=>c>127))) throw AccessQueryInputError('Comparacao textual restrita a ASCII.');
        bindings.add(value);
      }
    }
    return bindings;
  }

  static Future<Map<String,dynamic>> executeDescriptor(
    Request request,
    Map descriptor, {
    Map<String,Object?>? parsedParametersOverride,
  }) async {
    final query=request.url.queryParametersAll;
    if(query.keys.any((k)=>k!='parameters' && k!='limit') || query.values.any((v)=>v.length!=1)) {
      throw AccessQueryInputError('Parametros HTTP desconhecidos ou repetidos.');
    }
    final Map input;
    if(parsedParametersOverride!=null) {
      input=parsedParametersOverride;
    } else {
      final raw=query['parameters']?.single;
      if(raw==null || raw.length>4096) throw AccessQueryInputError('parameters deve conter um objeto JSON explicito.');
      input=_parseParameters(raw);
    }
    final limitText=query['limit']?.single ?? '100';
    if(!RegExp(r'^[0-9]+$').hasMatch(limitText)) throw AccessQueryInputError('limit deve ser inteiro entre 1 e 100.');
    final limit=int.tryParse(limitText);
    if(limit==null || limit<1 || limit>100) throw AccessQueryInputError('limit deve ser inteiro entre 1 e 100.');
    final parameters=descriptor['parameters'] as List;
    final bindings=_buildBindings(descriptor, input);
    // SQL is a build-time compiler product; request data enters only bindings.
    final rawSql = descriptor['sql'] as String;
    final execSql = (descriptor['hasLimit'] == true || descriptor['isUnion'] == true)
        ? 'SELECT * FROM ($rawSql) AS _access_q LIMIT 101'
        : '$rawSql LIMIT 101';
    final rows=await request.make<Connection>().select(execSql,bindings);
    final columns=descriptor['columns'] as List;
    return {
      'query':descriptor['name'],'columns':columns,'parameters':parameters,
      'rows':[for(final row in rows.take(limit))
        [for(final column in columns) _readValue(row,column)]],
      'limit':limit,'truncated':rows.length>limit,'readOnly':true,
      'ordering':descriptor['ordering'] ?? 'unspecified',
    };
  }

  static Future<Map<String,String>> executeLookupMap(
    Request request,
    String queryKey,
    int boundOrdinal,
    int displayOrdinal,
  ) async {
    final descriptor=specifications[queryKey] as Map?;
    if(descriptor==null) return const <String,String>{};
    if(((descriptor['parameters'] as List?) ?? const []).isNotEmpty) {
      return const <String,String>{};
    }
    final bindings=<Object?>[
      for(final b in (descriptor['bindings'] as List? ?? const []))
        b['literal'],
    ];
    final rawSql=descriptor['sql'] as String;
    final execSql=(descriptor['hasLimit'] == true || descriptor['isUnion'] == true)
        ? 'SELECT * FROM ($rawSql) AS _access_lkp LIMIT 50000'
        : '$rawSql LIMIT 50000';
    final rows=await request.make<Connection>().select(execSql, bindings);
    final map=<String,String>{};
    final boundKey='c$boundOrdinal';
    final dispKey='c$displayOrdinal';
    for(final row in rows) {
      final k=row[boundKey];
      if(k==null) continue;
      map.putIfAbsent(k.toString(), ()=>(row[dispKey] ?? '').toString());
    }
    return map;
  }

  static Future<List<List<Object?>>> executeRowsInternal(
    Request request,
    String queryKey,
    Map<String,Object?> paramInput, {
    int maxRows = 5000,
  }) async {
    final descriptor=specifications[queryKey] as Map?;
    if(descriptor==null) return const <List<Object?>>[];
    final bindings=_buildBindings(descriptor, paramInput);
    final rawSql=descriptor['sql'] as String;
    final execSql=(descriptor['hasLimit'] == true || descriptor['isUnion'] == true)
        ? 'SELECT * FROM ($rawSql) AS _access_sub LIMIT $maxRows'
        : '$rawSql LIMIT $maxRows';
    final rows=await request.make<Connection>().select(execSql, bindings);
    final columns=descriptor['columns'] as List;
    return [
      for(final row in rows)
        [for(final column in columns) _readValue(row, column)],
    ];
  }

  static Future<Response> run(Request request,String key) async {
    final descriptor=specifications[key] as Map?;
    if(descriptor==null) return responseError('Consulta nao compilada.',statusCode:404);
    try {
      return responseJson(await executeDescriptor(request,descriptor));
    } on AccessQueryInputError catch(error) {
      return responseError(error.message,statusCode:400);
    } catch(_) {
      return responseError('Nao foi possivel executar a consulta compilada.',statusCode:500);
    }
  }
  static Map _parseParameters(String raw) {
    final Object? parsed;
    try {parsed=jsonDecode(raw);} on FormatException {throw AccessQueryInputError('parameters deve ser JSON valido.');}
    if(parsed is! Map) throw AccessQueryInputError('parameters deve ser um objeto JSON.');
    return parsed;
  }
  static Object? _readValue(Map row,Map column) {
    final key=column['resultKey'];
    if(!row.containsKey(key)) throw StateError('Missing compiled result column.');
    return _value(row[key],column['daoType'] as int);
  }
  static Object? _value(Object? value,int type) {
    if(value==null) return null;
    switch(type) {
      case 1: if(value is bool) return value; break;
      case 3: case 4: case 18:
        if(value is int) return value;
        if(value is BigInt) return value.toInt();
        if(value is num) return value.toInt();
        final parsedInt = int.tryParse(value.toString().trim());
        if(parsedInt!=null) return parsedInt;
        break;
      case 7:
        if(value is num) return value.toDouble();
        if(value is BigInt) return value.toDouble();
        final parsedDouble = double.tryParse(value.toString().trim());
        if(parsedDouble!=null) return parsedDouble;
        break;
      case 5:
        final match=RegExp(r'^(-?)([0-9]+)(?:\.([0-9]+))?$').firstMatch(value.toString());
        if(match==null) break;
        final fraction=match.group(3) ?? '';
        if(fraction.length>4 && fraction.substring(4).contains(RegExp('[1-9]'))) break;
        final digits=fraction.padRight(4,'0').substring(0,4);
        final integer=BigInt.parse(match.group(2)!).toString();
        final sign=integer=='0' && digits=='0000' ? '' : match.group(1)!;
        return '$sign$integer.$digits';
      case 8:
        if(value is DateTime) return value.toIso8601String();
        if(value is String) return value;
        break;
      case 10: case 12:
        if(value is String) return value;
        return value.toString();
      case 11: if(value is List<int>) return base64Encode(value); return value.toString();
    }
    throw StateError('Unexpected database result type.');
  }
}
''';
