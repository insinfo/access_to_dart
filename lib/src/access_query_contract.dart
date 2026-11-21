import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'access_select_compiler.dart';
import 'analysis_model.dart';
import 'migration_identifier_style.dart';

String accessQuerySchemaHash(Map<String, dynamic> analysis) => sha256
    .convert(utf8.encode(jsonEncode([
      for (final raw in analysis['tables'] as List)
        {
          'name': raw['name'],
          'syntheticKind': raw['syntheticKind'],
          'columns': [
            for (final c in raw['columns'] as List)
              {
                'name': c['name'],
                'typeCode': c['typeCode'],
                'isCalculated': c['isCalculated'] == true
              }
          ]
        }
    ])))
    .toString();
String accessQuerySqlHash(String sql) =>
    sha256.convert(utf8.encode(sql)).toString();

/// Import a DAO shape only after the caller has hashed the actual source file.
void attachDaoQueryContract(
    Map<String, dynamic> analysis, Map<String, dynamic> shape,
    {required String actualSourceHash,
    required bool asciiCaseInsensitiveText}) {
  if (shape['readOnly'] != true || shape['sourceSha256'] != actualSourceHash) {
    throw FormatException('DAO source hash/read-only contract mismatch');
  }
  final matches = (analysis['queries'] as List)
      .cast<Map>()
      .where((q) => q['name'] == shape['queryName'])
      .toList();
  if (matches.length != 1) {
    throw FormatException('Expected exactly one named query');
  }
  final query = matches.single;
  if (accessQuerySqlHash(query['sqlText'] as String) != shape['sqlSha256']) {
    throw FormatException('DAO SQL hash differs from analysis query');
  }
  final contract = <String, dynamic>{
    'version': 1,
    'sourceSha256': actualSourceHash,
    'sqlSha256': shape['sqlSha256'],
    'schemaSha256': accessQuerySchemaHash(analysis),
    'parameters': shape['parameters'],
    'columns': shape['columns'],
    'asciiCaseInsensitiveText': asciiCaseInsensitiveText,
  };
  compileContractQuery(analysis, query.cast<String, dynamic>(), contract);
  analysis['queries'] = [
    for (final original in analysis['queries'] as List)
      if (identical(original, query))
        <String, dynamic>{
          ...query.cast<String, dynamic>(),
          'executionContract': contract
        }
      else
        original,
  ];
}

CompiledAccessSelect compileContractQuery(
  Map<String, dynamic> analysis,
  Map<String, dynamic> query,
  Map<String, dynamic> contract, {
  MigrationIdentifierPolicy identifiers = const MigrationIdentifierPolicy(
      style: MigrationIdentifierStyle.snakeAscii),
  bool questionMarkParameters = false,
  bool ordinalOutputAliases = false,
}) {
  if (query['sqlText'] is! String ||
      contract['parameters'] is! List ||
      contract['columns'] is! List ||
      (contract['parameters'] as List).any((p) => p is! Map) ||
      (contract['columns'] as List).any((c) => c is! Map)) {
    throw FormatException('Invalid DAO contract structure');
  }
  if (contract['version'] != 1 ||
      contract['schemaSha256'] != accessQuerySchemaHash(analysis) ||
      contract['sqlSha256'] != accessQuerySqlHash(query['sqlText'] as String) ||
      !RegExp(r'^[a-f0-9]{64}$')
          .hasMatch(contract['sourceSha256'] as String? ?? '')) {
    throw FormatException('Query contract is absent, stale or invalid');
  }
  final parameters = <String, int>{};
  for (final p in contract['parameters'] as List) {
    if (p['name'] is! String ||
        p['daoType'] != 10 ||
        parameters.containsKey(p['name'])) {
      throw FormatException('Unsupported/duplicate DAO parameter declaration');
    }
    parameters[p['name'] as String] = 10;
  }
  final columns = (contract['columns'] as List).cast<Map>();
  for (var i = 0; i < columns.length; i++) {
    if (columns[i]['ordinal'] != i || columns[i]['name'] is! String) {
      throw FormatException('Invalid DAO ordinal output shape');
    }
  }
  final plan = AccessSelectCompiler(
          (analysis['tables'] as List)
              .map((v) =>
                  AnalysisTable.fromJson((v as Map).cast<String, dynamic>()))
              .toList(),
          identifiers: identifiers)
      .compile(query['sqlText'] as String,
          parameterTypes: parameters,
          outputNames: columns.map((v) => v['name'] as String).toList(),
          asciiCaseInsensitiveText:
              contract['asciiCaseInsensitiveText'] == true,
          questionMarkParameters: questionMarkParameters,
          ordinalOutputAliases: ordinalOutputAliases);
  for (var i = 0; i < plan.outputs.length; i++) {
    if (plan.outputs[i].typeCode != columns[i]['daoType']) {
      throw FormatException('DAO result type differs from physical schema');
    }
  }
  return plan;
}
