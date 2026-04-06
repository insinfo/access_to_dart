import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/project_generator/project_generator.dart';
import 'package:dpgsql/dpgsql.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test(
    'generated app supports create and remove attachment subresource end-to-end',
    () async {
      if (!Platform.isWindows) {
        return;
      }

      final harness = _LocalPostgresHarness.fromEnvironment();
      if (!await harness.canConnect()) {
        stdout.writeln('Skipping generated attachment E2E: admin connection unavailable.');
        return;
      }

      final tempDir = await Directory.systemTemp.createTemp('access_attachment_e2e_');
      addTearDown(() => tempDir.delete(recursive: true));

      final outputDir = Directory('${tempDir.path}${Platform.pathSeparator}generated_app');

      final generator = ProjectGenerator();
      await generator.generate(
        project: _buildAttachmentProject(),
        outputDirectory: outputDir.path,
      );

      await compileGeneratedProject(outputDir.path);

      final databaseName = await harness.createTempDatabase();
      addTearDown(() => harness.dropTempDatabase(databaseName));

      final connection = await harness.openDatabase(databaseName);
      try {
        await connection
            .createCommand(
              'CREATE TABLE "contatos" ('
              '"id" BIGINT PRIMARY KEY, '
              '"anexos" BIGINT NULL'
              ')',
            )
            .executeNonQuery();
        await connection
            .createCommand(
              'CREATE TABLE "contatos_anexos_attachment" ('
              '"_anexos" BIGINT NOT NULL, '
              '"file_name" TEXT NULL, '
              '"file_data" BYTEA NULL'
              ')',
            )
            .executeNonQuery();
        await connection
            .createCommand(
              'INSERT INTO "contatos" ("id", "anexos") VALUES (1, NULL)',
            )
            .executeNonQuery();
      } finally {
        await connection.close();
      }

      final backendDir = Directory('${outputDir.path}${Platform.pathSeparator}backend');
      final serverExe =
          '${backendDir.path}${Platform.pathSeparator}build${Platform.pathSeparator}server.exe';
      final port = 18500 + Random().nextInt(500);
      final serverProcess = await Process.start(
        serverExe,
        ['--address', '127.0.0.1', '--port', '$port'],
        workingDirectory: backendDir.path,
        runInShell: true,
        environment: {
          ...Platform.environment,
          'ACCESS_TO_DART_DB_HOST': harness.host,
          'ACCESS_TO_DART_DB_PORT': '${harness.port}',
          'ACCESS_TO_DART_DB_NAME': databaseName,
          'ACCESS_TO_DART_DB_USER': harness.user,
          'ACCESS_TO_DART_DB_PASSWORD': harness.password,
        },
      );

      addTearDown(() async {
        serverProcess.kill();
        await serverProcess.exitCode.timeout(
          const Duration(seconds: 5),
          onTimeout: () => -1,
        );
      });

      final baseUrl = 'http://127.0.0.1:$port/api/v1/contatos/1/attachments/anexos';
      await _waitForHttp(baseUrl);

      final initialRows = await _httpGetJsonList(baseUrl);
      expect(initialRows, isEmpty);

      final created = await _httpPostJson(
        baseUrl,
        <String, dynamic>{
          'file_name': 'teste.txt',
          'file_data': base64Encode(utf8.encode('abc')),
        },
      );
      expect(created['file_name'], 'teste.txt');
      expect(created['file_data'], '<binary>');
      expect(created['file_data_byte_length'], 3);
      expect(created['_attachmentOrdinal'], 0);

      final rowsAfterCreate = await _httpGetJsonList(baseUrl);
      expect(rowsAfterCreate, hasLength(1));
      expect(rowsAfterCreate.first['file_name'], 'teste.txt');

      final verificationConnection = await harness.openDatabase(databaseName);
      try {
        final parentRows = await _readRows(
          verificationConnection,
          'SELECT "anexos" FROM "contatos" WHERE "id" = 1',
          const ['anexos'],
        );
        expect(parentRows.single['anexos'], isNotNull);

        final attachmentRows = await _readRows(
          verificationConnection,
          'SELECT "_anexos", "file_name", OCTET_LENGTH("file_data") AS "byte_length" '
          'FROM "contatos_anexos_attachment"',
          const ['_anexos', 'file_name', 'byte_length'],
        );
        expect(attachmentRows, hasLength(1));
        expect(attachmentRows.single['file_name'], 'teste.txt');
        expect(attachmentRows.single['byte_length'], 3);
      } finally {
        await verificationConnection.close();
      }

      await _httpDelete('$baseUrl/0');

      final rowsAfterDelete = await _httpGetJsonList(baseUrl);
      expect(rowsAfterDelete, isEmpty);

      final cleanupConnection = await harness.openDatabase(databaseName);
      try {
        final parentRows = await _readRows(
          cleanupConnection,
          'SELECT "anexos" FROM "contatos" WHERE "id" = 1',
          const ['anexos'],
        );
        expect(parentRows.single['anexos'], isNull);

        final attachmentRows = await _readRows(
          cleanupConnection,
          'SELECT COUNT(*) AS "count" FROM "contatos_anexos_attachment"',
          const ['count'],
        );
        expect(attachmentRows.single['count'], 0);
      } finally {
        await cleanupConnection.close();
      }
    },
    timeout: const Timeout(Duration(minutes: 20)),
  );
}

AnalysisProject _buildAttachmentProject() {
  return AnalysisProject(
    schemaVersion: '1.0',
    source: 'synthetic/generated_attachment_e2e.accdb',
    format: 'VERSION_14',
    summary: const <String, dynamic>{
      'tables': 2,
      'linkedTables': 0,
      'relationships': 0,
      'queries': 0,
      'forms': 0,
      'reports': 0,
      'macros': 0,
      'modules': 0,
    },
    tables: <AnalysisTable>[
      AnalysisTable(
        name: 'Contatos',
        rowCount: 1,
        postgresDdl: null,
        dartClassName: null,
        columns: <AnalysisColumn>[
          AnalysisColumn(
            name: 'Id',
            typeName: 'Long',
            typeCode: 4,
            isAutoNumber: false,
            isCalculated: false,
            isRequired: true,
            caption: null,
            defaultValue: null,
            maxLength: null,
            calculatedExpression: null,
            validationRule: null,
            validationText: null,
            description: null,
            decimalPlaces: null,
            displayControl: null,
            textFormat: null,
            imeMode: null,
            imeSentenceMode: null,
            resultType: null,
            propertyGuid: null,
            allowMultipleValues: null,
            rowSourceType: null,
            rowSource: null,
            wssFieldId: null,
            formatString: null,
            inputMask: null,
            allowZeroLength: null,
            precision: null,
            scale: null,
            complexTypeClassification: null,
            attachmentTableName: null,
            attachmentLinkColumn: null,
          ),
          AnalysisColumn(
            name: 'Anexos',
            typeName: 'ComplexType',
            typeCode: 18,
            isAutoNumber: false,
            isCalculated: false,
            isRequired: false,
            caption: 'Anexos',
            defaultValue: null,
            maxLength: null,
            calculatedExpression: null,
            validationRule: null,
            validationText: null,
            description: null,
            decimalPlaces: null,
            displayControl: null,
            textFormat: null,
            imeMode: null,
            imeSentenceMode: null,
            resultType: null,
            propertyGuid: null,
            allowMultipleValues: null,
            rowSourceType: null,
            rowSource: null,
            wssFieldId: null,
            formatString: null,
            inputMask: null,
            allowZeroLength: null,
            precision: null,
            scale: null,
            complexTypeClassification: 'attachment',
            attachmentTableName: 'Contatos_Anexos_attachment',
            attachmentLinkColumn: '_Anexos',
          ),
        ],
        indexes: <AnalysisIndex>[
          AnalysisIndex(
            name: 'pk_contatos',
            indexNumber: null,
            backingDataNumber: null,
            isPrimaryKey: true,
            isForeignKey: false,
            isUnique: true,
            isRequired: true,
            ignoreNulls: false,
            flags: null,
            columns: <AnalysisIndexColumn>[
              AnalysisIndexColumn(
                name: 'Id',
                columnNumber: 0,
                ascending: true,
                flags: null,
              ),
            ],
          ),
        ],
        sampleRows: const <Map<String, dynamic>>[
          <String, dynamic>{'Id': 1, 'Anexos': null},
        ],
      ),
      AnalysisTable(
        name: 'Contatos_Anexos_attachment',
        rowCount: 0,
        postgresDdl: null,
        dartClassName: null,
        syntheticKind: 'attachment',
        attachmentParentTable: 'Contatos',
        attachmentParentColumn: 'Anexos',
        attachmentLinkColumn: '_Anexos',
        columns: <AnalysisColumn>[
          AnalysisColumn(
            name: '_Anexos',
            typeName: 'Long',
            typeCode: 4,
            isAutoNumber: false,
            isCalculated: false,
            isRequired: false,
            caption: null,
            defaultValue: null,
            maxLength: null,
            calculatedExpression: null,
            validationRule: null,
            validationText: null,
            description: null,
            decimalPlaces: null,
            displayControl: null,
            textFormat: null,
            imeMode: null,
            imeSentenceMode: null,
            resultType: null,
            propertyGuid: null,
            allowMultipleValues: null,
            rowSourceType: null,
            rowSource: null,
            wssFieldId: null,
            formatString: null,
            inputMask: null,
            allowZeroLength: null,
            precision: null,
            scale: null,
            complexTypeClassification: null,
            attachmentTableName: null,
            attachmentLinkColumn: null,
          ),
          AnalysisColumn(
            name: 'FileName',
            typeName: 'Text',
            typeCode: 10,
            isAutoNumber: false,
            isCalculated: false,
            isRequired: false,
            caption: 'Nome do arquivo',
            defaultValue: null,
            maxLength: 255,
            calculatedExpression: null,
            validationRule: null,
            validationText: null,
            description: null,
            decimalPlaces: null,
            displayControl: null,
            textFormat: null,
            imeMode: null,
            imeSentenceMode: null,
            resultType: null,
            propertyGuid: null,
            allowMultipleValues: null,
            rowSourceType: null,
            rowSource: null,
            wssFieldId: null,
            formatString: null,
            inputMask: null,
            allowZeroLength: null,
            precision: null,
            scale: null,
            complexTypeClassification: null,
            attachmentTableName: null,
            attachmentLinkColumn: null,
          ),
          AnalysisColumn(
            name: 'FileData',
            typeName: 'OLE',
            typeCode: 11,
            isAutoNumber: false,
            isCalculated: false,
            isRequired: false,
            caption: 'Conteudo',
            defaultValue: null,
            maxLength: null,
            calculatedExpression: null,
            validationRule: null,
            validationText: null,
            description: null,
            decimalPlaces: null,
            displayControl: null,
            textFormat: null,
            imeMode: null,
            imeSentenceMode: null,
            resultType: null,
            propertyGuid: null,
            allowMultipleValues: null,
            rowSourceType: null,
            rowSource: null,
            wssFieldId: null,
            formatString: null,
            inputMask: null,
            allowZeroLength: null,
            precision: null,
            scale: null,
            complexTypeClassification: null,
            attachmentTableName: null,
            attachmentLinkColumn: null,
          ),
        ],
        indexes: const <AnalysisIndex>[],
        sampleRows: const <Map<String, dynamic>>[],
      ),
    ],
    linkedTables: const <AnalysisLinkedTable>[],
    relationships: const <AnalysisRelationship>[],
    forms: const <AnalysisForm>[],
    canonicalAnalysis: null,
    queryReconciliation: null,
    raw: const <String, dynamic>{},
  );
}

class _LocalPostgresHarness {
  final String host;
  final int port;
  final String adminDatabase;
  final String user;
  final String password;

  const _LocalPostgresHarness({
    required this.host,
    required this.port,
    required this.adminDatabase,
    required this.user,
    required this.password,
  });

  factory _LocalPostgresHarness.fromEnvironment() {
    return _LocalPostgresHarness(
      host: Platform.environment['ACCESS_TO_DART_TEST_PG_HOST'] ?? 'localhost',
      port: int.tryParse(
            Platform.environment['ACCESS_TO_DART_TEST_PG_PORT'] ?? '',
          ) ??
          5432,
      adminDatabase:
          Platform.environment['ACCESS_TO_DART_TEST_PG_DATABASE'] ?? 'postgres',
      user: Platform.environment['ACCESS_TO_DART_TEST_PG_USER'] ?? 'postgres',
      password:
          Platform.environment['ACCESS_TO_DART_TEST_PG_PASSWORD'] ?? 'slsadm1n',
    );
  }

  Future<bool> canConnect() async {
    try {
      final connection = await openDatabase(adminDatabase);
      await connection.close();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String> createTempDatabase() async {
    final name =
        'access_attachment_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1 << 20).toRadixString(36)}';
    final connection = await openDatabase(adminDatabase);
    try {
      await connection
          .createCommand('CREATE DATABASE ${_quoteIdentifier(name)}')
          .executeNonQuery();
      return name;
    } finally {
      await connection.close();
    }
  }

  Future<void> dropTempDatabase(String databaseName) async {
    final connection = await openDatabase(adminDatabase);
    try {
      await connection
          .createCommand(
            "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '${_escapeLiteral(databaseName)}' AND pid <> pg_backend_pid()",
          )
          .executeNonQuery();
      await connection
          .createCommand('DROP DATABASE IF EXISTS ${_quoteIdentifier(databaseName)}')
          .executeNonQuery();
    } finally {
      await connection.close();
    }
  }

  Future<NpgsqlConnection> openDatabase(String databaseName) async {
    final connection = NpgsqlConnection(
      'Host=$host;Port=$port;Database=$databaseName;Username=$user;Password=$password;SSL Mode=Disable',
    );
    await connection.open();
    return connection;
  }

  String _quoteIdentifier(String value) {
    return '"${value.replaceAll('"', '""')}"';
  }

  String _escapeLiteral(String value) {
    return value.replaceAll("'", "''");
  }
}

Future<void> _waitForHttp(String url) async {
  final deadline = DateTime.now().add(const Duration(seconds: 30));
  Object? lastError;

  while (DateTime.now().isBefore(deadline)) {
    try {
      final request = await HttpClient().getUrl(Uri.parse(url));
      final response = await request.close();
      if (response.statusCode >= 200 && response.statusCode < 500) {
        await response.drain<void>();
        return;
      }
    } catch (error) {
      lastError = error;
    }
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  fail('Timed out waiting for HTTP endpoint $url. Last error: $lastError');
}

Future<List<Map<String, dynamic>>> _httpGetJsonList(String url) async {
  final request = await HttpClient().getUrl(Uri.parse(url));
  final response = await request.close();
  final body = await response.transform(utf8.decoder).join();
  expect(response.statusCode, 200, reason: body);
  final decoded = jsonDecode(body);
  expect(decoded, isA<List<dynamic>>(), reason: body);
  return (decoded as List<dynamic>)
      .whereType<Map>()
      .map((row) => row.cast<String, dynamic>())
      .toList(growable: false);
}

Future<Map<String, dynamic>> _httpPostJson(String url, Object payload) async {
  final client = HttpClient();
  final request = await client.postUrl(Uri.parse(url));
  request.headers.contentType = ContentType.json;
  request.write(jsonEncode(payload));
  final response = await request.close();
  final body = await response.transform(utf8.decoder).join();
  expect(response.statusCode, 200, reason: body);
  final decoded = jsonDecode(body);
  expect(decoded, isA<Map>(), reason: body);
  return (decoded as Map).cast<String, dynamic>();
}

Future<void> _httpDelete(String url) async {
  final request = await HttpClient().deleteUrl(Uri.parse(url));
  final response = await request.close();
  final body = await response.transform(utf8.decoder).join();
  expect(response.statusCode, 200, reason: body);
}

Future<List<Map<String, dynamic>>> _readRows(
  NpgsqlConnection connection,
  String sql,
  List<String> columnNames,
) async {
  final reader = await connection.executeReader(sql);
  final rows = <Map<String, dynamic>>[];
  try {
    while (await reader.read()) {
      final row = <String, dynamic>{};
      for (var i = 0; i < columnNames.length; i++) {
        row[columnNames[i]] = reader.getValue(i);
      }
      rows.add(row);
    }
  } finally {
    await reader.close();
  }
  return rows;
}