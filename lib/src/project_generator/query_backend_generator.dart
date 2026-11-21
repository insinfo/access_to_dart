part of 'project_generator.dart';

extension _CompiledQueryBackend on ProjectGenerator {
  Future<void> _generateQueryBackend(
      AnalysisProject project, Directory backendDir) async {
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
        if (specifications.containsKey(key))
          throw FormatException('Query route collision');
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
    await File(p.join(backendDir.path, 'lib/src/shared/access_queries.dart'))
        .writeAsString(_queryBackendSource.replaceFirst('/*SPECIFICATIONS*/',
            _dartStringLiteral(jsonEncode(specifications))));
    await File(p.join(backendDir.path, 'lib/src/shared/access_queries.json'))
        .writeAsString(const JsonEncoder.withIndent('  ')
            .convert({'queries': specifications, 'diagnostics': diagnostics}));
  }
}

const _queryBackendSource = r'''
import 'dart:convert';
import 'package:eloquent/eloquent.dart';
import 'package:shelf/shelf.dart';
import 'extensions/request_extension.dart';
import 'utils/api_utils.dart';

class _QueryInputError implements Exception {
  final String message;
  _QueryInputError(this.message);
}

class AccessQueryController {
  static final Map<String,dynamic> specifications=(jsonDecode(/*SPECIFICATIONS*/) as Map).cast<String,dynamic>();
  static Future<Response> run(Request request,String key) async {
    final descriptor=specifications[key] as Map?;
    if(descriptor==null) return responseError('Consulta nao compilada.',statusCode:404);
    try {
      final query=request.url.queryParametersAll;
      if(query.keys.any((k)=>k!='parameters' && k!='limit') || query.values.any((v)=>v.length!=1)) {
        throw _QueryInputError('Parametros HTTP desconhecidos ou repetidos.');
      }
      final raw=query['parameters']?.single;
      if(raw==null || raw.length>4096) throw _QueryInputError('parameters deve conter um objeto JSON explicito.');
      final input=_parseParameters(raw);
      final limitText=query['limit']?.single ?? '100';
      if(!RegExp(r'^[0-9]+$').hasMatch(limitText)) throw _QueryInputError('limit deve ser inteiro entre 1 e 100.');
      final limit=int.tryParse(limitText);
      if(limit==null || limit<1 || limit>100) throw _QueryInputError('limit deve ser inteiro entre 1 e 100.');
      final parameters=descriptor['parameters'] as List;
      if(input.length!=parameters.length || parameters.any((p)=>!input.containsKey(p['key']))) {
        throw _QueryInputError('Informe exatamente os parametros declarados p0, p1, ... .');
      }
      final bySource=<String,Object?>{};
      for(final p in parameters) {
        final value=input[p['key']];
        if(value!=null && value is! String) throw _QueryInputError('Parametro DAO Text exige string ou null.');
        bySource[p['sourceName'] as String]=value;
      }
      final bindings=<Object?>[];
      for(final binding in descriptor['bindings'] as List) {
        final value=binding['parameter']==null ? binding['literal'] : bySource[binding['parameter']];
        if(value==null){bindings.add(null);continue;}
        if(binding['typeCode']==4) {
          if(value is! String || !RegExp(r'^[+-]?[0-9]+$').hasMatch(value)) throw _QueryInputError('Comparacao Long exige string inteira.');
          final number=int.tryParse(value);
          if(number==null || number < -2147483648 || number > 2147483647) throw _QueryInputError('Parametro fora da faixa Long.');
          bindings.add(number);
        } else {
          if(value is! String || value.codeUnits.any((c)=>c>127)) throw _QueryInputError('Comparacao textual restrita a ASCII.');
          bindings.add(value);
        }
      }
      // SQL is a build-time compiler product; request data enters only bindings.
      final rows=await request.make<Connection>().select('${descriptor['sql']} LIMIT 101',bindings);
      final columns=descriptor['columns'] as List;
      return responseJson({
        'query':descriptor['name'],'columns':columns,'parameters':parameters,
        'rows':[for(final row in rows.take(limit))
          [for(final column in columns) _readValue(row,column)]],
        'limit':limit,'truncated':rows.length>limit,'readOnly':true,
        'ordering':'unspecified',
      });
    } on _QueryInputError catch(error) {
      return responseError(error.message,statusCode:400);
    } catch(_) {
      return responseError('Nao foi possivel executar a consulta compilada.',statusCode:500);
    }
  }
  static Map _parseParameters(String raw) {
    final Object? parsed;
    try {parsed=jsonDecode(raw);} on FormatException {throw _QueryInputError('parameters deve ser JSON valido.');}
    if(parsed is! Map) throw _QueryInputError('parameters deve ser um objeto JSON.');
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
      case 4: if(value is int) return value; if(value is BigInt) return value.toInt(); break;
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
      case 10: if(value is String) return value; break;
    }
    throw StateError('Unexpected database result type.');
  }
}
''';
