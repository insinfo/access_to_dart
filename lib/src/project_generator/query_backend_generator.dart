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
    });
  }

  Future<void> _generateQueryBackend(
      AnalysisProject project, Directory backendDir) async {
    final compiled = _compileQuerySpecifications(project);
    final reportsResult = compileEligibleReports(project);
    final mergedSpecifications = <String, Map<String, Object?>>{
      ...compiled.specifications,
      for (final entry in reportsResult.compiledReportQueries.entries)
        if (!compiled.specifications.containsKey(entry.key))
          entry.key: entry.value,
    };
    await File(p.join(backendDir.path, 'lib/src/shared/access_queries.dart'))
        .writeAsString(_queryBackendSource.replaceFirst('/*SPECIFICATIONS*/',
            _dartStringLiteral(jsonEncode(mergedSpecifications))));
    await File(p.join(backendDir.path, 'lib/src/shared/access_queries.json'))
        .writeAsString(const JsonEncoder.withIndent('  ').convert({
      'queries': mergedSpecifications,
      'diagnostics': compiled.diagnostics,
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

  static Future<Map<String,dynamic>> executeDescriptor(Request request,Map descriptor) async {
    final query=request.url.queryParametersAll;
    if(query.keys.any((k)=>k!='parameters' && k!='limit') || query.values.any((v)=>v.length!=1)) {
      throw AccessQueryInputError('Parametros HTTP desconhecidos ou repetidos.');
    }
    final raw=query['parameters']?.single;
    if(raw==null || raw.length>4096) throw AccessQueryInputError('parameters deve conter um objeto JSON explicito.');
    final input=_parseParameters(raw);
    final limitText=query['limit']?.single ?? '100';
    if(!RegExp(r'^[0-9]+$').hasMatch(limitText)) throw AccessQueryInputError('limit deve ser inteiro entre 1 e 100.');
    final limit=int.tryParse(limitText);
    if(limit==null || limit<1 || limit>100) throw AccessQueryInputError('limit deve ser inteiro entre 1 e 100.');
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
        final dt = DateTime.tryParse(value.toString().trim());
        if(dt==null) throw AccessQueryInputError('Comparacao de data exige ISO-8601.');
        bindings.add(dt);
      } else {
        if(value is! String || (!allowNonAscii && value.codeUnits.any((c)=>c>127))) throw AccessQueryInputError('Comparacao textual restrita a ASCII.');
        bindings.add(value);
      }
    }
    // SQL is a build-time compiler product; request data enters only bindings.
    final rows=await request.make<Connection>().select('${descriptor['sql']} LIMIT 101',bindings);
    final columns=descriptor['columns'] as List;
    return {
      'query':descriptor['name'],'columns':columns,'parameters':parameters,
      'rows':[for(final row in rows.take(limit))
        [for(final column in columns) _readValue(row,column)]],
      'limit':limit,'truncated':rows.length>limit,'readOnly':true,
      'ordering':descriptor['ordering'] ?? 'unspecified',
    };
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
      case 3: case 4: case 18: if(value is int) return value; if(value is BigInt) return value.toInt(); if(value is num) return value.toInt(); break;
      case 7: if(value is num) return value.toDouble(); break;
      case 5:
        final match=RegExp(r'^(-?)([0-9]+)(?:\.([0-9]+))?$').firstMatch(value.toString());
        if(match==null) break;
        final fraction=match.group(3) ?? '';
        if(fraction.length>4 && fraction.substring(4).contains(RegExp('[1-9]'))) break;
        final digits=fraction.padRight(4,'0').substring(0,4);
        final integer=BigInt.parse(match.group(2)!).toString();
        final sign=integer=='0' && digits=='0000' ? '' : match.group(1)!;
        return '$sign$integer.$digits';
      case 8: if(value is DateTime) return value.toIso8601String(); break;
      case 10: case 12: if(value is String) return value; break;
      case 11: if(value is List<int>) return base64Encode(value); return value.toString();
    }
    throw StateError('Unexpected database result type.');
  }
}
''';
