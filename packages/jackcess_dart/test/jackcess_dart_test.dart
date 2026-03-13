import 'dart:io';
import 'dart:typed_data';

import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  group('AccessDatabase', () {
    test('opens the checked-in teste1 fixture without using referencias',
        () async {
      final fixture = File.fromUri(
        Directory.current.uri.resolve('../../fixtures/teste1/teste1.accdb'),
      );
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
