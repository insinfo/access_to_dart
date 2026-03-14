import 'dart:io';
import 'dart:typed_data';

import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  group('AccessDatabase', () {
    test('opens the checked-in teste1 fixture without using referencias',
        () async {
      final fixture = await _resolveCheckedInFixture();
      expect(await fixture.exists(), isTrue);

      final database = await AccessDatabase.openFile(fixture);
      addTearDown(database.close);

      expect(database.info.fileSize, greaterThan(0));
      expect(database.info.pageSize, 4096);
      expect(database.info.pageCount, greaterThan(0));

      final systemCatalog = await database.inspectSystemCatalogPage();
      expect(systemCatalog.pageNumber, AccessDatabase.systemCatalogPageNumber);
      expect(systemCatalog.pageTypeName, 'TABLE_DEF');
      expect(systemCatalog.rowCount, greaterThan(0));
    });

    test('opens an accdb file from an arbitrary path', () async {
      final directory = await Directory.systemTemp.createTemp(
        'jackcess_dart_test_',
      );
      addTearDown(() => directory.delete(recursive: true));

      final file = await _createAccdbFixture(
        directory,
        versionByte: 0x05,
        totalBytes: 5000,
      );

      final database = await AccessDatabase.openPath(file.path);
      addTearDown(database.close);

      expect(database.info.path, file.path);
      expect(database.info.format, same(JetFormat.version16));
      expect(database.info.pageSize, 4096);
      expect(database.info.fileSize, 5000);
      expect(database.info.pageCount, 2);
    });

    test('pads partially read pages to the page size', () async {
      final directory = await Directory.systemTemp.createTemp(
        'jackcess_dart_test_',
      );
      addTearDown(() => directory.delete(recursive: true));

      final file = await _createAccdbFixture(
        directory,
        versionByte: 0x05,
        totalBytes: 5000,
        customize: (bytes) {
          bytes[4096] = 0x7A;
        },
      );

      final database = await AccessDatabase.openPath(file.path);
      addTearDown(database.close);

      final page = (await database.readPage(1)).asUint8List();
      expect(page.length, 4096);
      expect(page.first, 0x7A);
      expect(page.skip(904).every((value) => value == 0), isTrue);
    });

    test('rejects files smaller than the access header', () async {
      final directory = await Directory.systemTemp.createTemp(
        'jackcess_dart_test_',
      );
      addTearDown(() => directory.delete(recursive: true));

      final file = File('${directory.path}\\invalid.accdb');
      await file.writeAsBytes(List<int>.filled(20, 0));

      expect(
        () => AccessDatabase.openPath(file.path),
        throwsA(isA<Exception>()),
      );
    });

    test('detects and opens the encrypted SIGA backend with password',
        () async {
      final fixture = await _resolveEncryptedBackendFixture();
      if (!await fixture.exists()) return;

      final database = await AccessDatabase.openPath(
        fixture.path,
        password: '4462',
      );
      addTearDown(database.close);

      expect(database.encryptionInfo, isNotNull);
      expect(database.encryptionInfo!.versionLabel, '4.4');
      expect(database.encryptionInfo!.cipherAlgorithm, 'AES');
      expect(database.encryptionInfo!.keyBits, 256);

      final systemCatalog = await database.inspectSystemCatalogPage();
      expect(systemCatalog.pageNumber, AccessDatabase.systemCatalogPageNumber);
      expect(systemCatalog.pageTypeName, 'TABLE_DEF');
      expect(systemCatalog.rowCount, greaterThan(0));
    });
  });

  group('Catalog reverse engineering', () {
    test('extracts schema flags for auto-number and calculated columns',
        () async {
      final fixture = await _resolveCheckedInFixture();
      expect(await fixture.exists(), isTrue);

      final database = await AccessDatabase.openFile(fixture);
      addTearDown(database.close);

      final catalog = AccessCatalog(
        format: database.format,
        pageChannel: database.pageChannel,
      );
      final model = await catalog.read(fixture.path);

      final contatos =
          model.tables.singleWhere((table) => table.name == 'Contatos');
      final id = contatos.columns.singleWhere((column) => column.name == 'ID');
      final nomeDoContato = contatos.columns.singleWhere(
        (column) => column.name == 'NomeDoContato',
      );
      final arquivoComo = contatos.columns.singleWhere(
        (column) => column.name == 'ArquivoComo',
      );

      expect(id.isAutoNumber, isTrue);
      expect(id.typeCode, 0x04);
      expect(nomeDoContato.isCalculated, isTrue);
      expect(arquivoComo.isCalculated, isTrue);
      expect(contatos.sampleRows, isNotEmpty);
      expect(contatos.sampleRows.first['Sobrenome'], 'sdf');
      expect(contatos.sampleRows.first['Nome'], 'dfs');
      expect(contatos.sampleRows.first['NomeDoContato'], 'dfs sdf');
      expect(contatos.sampleRows.first['ArquivoComo'], 'sdf, dfs');

      final contatosEstendidos = model.queries.singleWhere(
        (query) => query.name == 'ContatosEstendidos',
      );
      expect(contatosEstendidos.queryTypeName, isNotEmpty);
      expect(contatosEstendidos.sqlText, contains('SELECT'));
      expect(contatosEstendidos.sqlText, contains('FROM'));
      expect(contatosEstendidos.sqlText, contains('AS [Pesquisável]'));
      expect(contatosEstendidos.sqlText, contains('ORDER BY'));
      expect(contatosEstendidos.sqlText, contains('[Contatos].[NomeDoContato]'));
      final searchableRow = contatosEstendidos.rows.singleWhere(
        (row) => row.name1 == 'Pesquisável',
      );
      expect(searchableRow.expressionAst, isNotNull);
    });
  });
}

Future<File> _createAccdbFixture(
  Directory directory, {
  required int versionByte,
  required int totalBytes,
  void Function(Uint8List bytes)? customize,
}) async {
  final bytes = Uint8List(totalBytes);
  bytes[20] = versionByte;
  customize?.call(bytes);

  final file = File('${directory.path}\\fixture.accdb');
  await file.writeAsBytes(bytes, flush: true);
  return file;
}

Future<File> _resolveCheckedInFixture() async {
  final candidates = <File>[
    File.fromUri(
      Directory.current.uri.resolve('../../fixtures/teste1/teste1.accdb'),
    ),
    File.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb'),
    ),
  ];

  for (final file in candidates) {
    if (await file.exists()) {
      return file;
    }
  }

  return candidates.first;
}

Future<File> _resolveEncryptedBackendFixture() async {
  final candidates = <File>[
    File.fromUri(
      Directory.current.uri.resolve('../../fixtures/SIGA2021-SUL_be_senha_4462.accdb'),
    ),
    File.fromUri(
      Directory.current.uri.resolve('fixtures/SIGA2021-SUL_be_senha_4462.accdb'),
    ),
  ];

  for (final file in candidates) {
    if (await file.exists()) {
      return file;
    }
  }

  return candidates.first;
}
