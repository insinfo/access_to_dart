import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/src/complex_collection_rows.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/migration_writer.dart';
import 'package:test/test.dart';

void main() {
  test('unreachable child rows remain intact and ambiguous ownership fails',
      () {
    final orphan = <String, dynamic>{
      'owner': 99,
      'Value': 'unreachable',
      'id': 4
    };
    final partition = partitionComplexCollectionRows(parentRows: [
      {'collection': 7}
    ], childRows: [
      {'owner': 7, 'Value': 'visible'},
      orphan
    ], parentColumn: 'collection', linkColumn: 'owner');
    expect(partition.linkedRows.single['Value'], 'visible');
    expect(partition.orphanRows.single, same(orphan));
    expect(
        () => partitionComplexCollectionRows(parentRows: [
              {'collection': 7},
              {'collection': 7}
            ], childRows: [
              {'owner': 7, 'Value': 'ambiguous'}
            ], parentColumn: 'collection', linkColumn: 'owner'),
        throwsStateError);
  });
  test(
      'migration preserves orphan storage and reports incomplete full data explicitly',
      () async {
    final output = await Directory.systemTemp.createTemp('complex_quarantine_');
    try {
      final rows = {
        'Choices': [
          <String, dynamic>{'owner': 99, 'Value': ' x\ny ', 'nullable': null}
        ]
      };
      final artifact = await MigrationWriter().write(
          project: AnalysisProject.fromJson(
              {'source': 'synthetic-test', 'tables': []}),
          outputDirectory: output.path,
          tableRowsByName: {},
          quarantinedRowsByName: rows);
      expect(artifact.quarantineFile, isNotNull);
      final preserved =
          jsonDecode(await artifact.quarantineFile!.readAsString());
      expect(preserved['tables'], rows);
      final manifest = jsonDecode(await artifact.manifestFile.readAsString());
      expect(manifest['quarantinedRowCount'], 1);
      expect(manifest['fullDataIncluded'], isFalse);
      expect(manifest['logicalDataIncluded'], isTrue);
      expect(manifest['quarantineFile'], 'orphaned_complex_rows.json');
    } finally {
      await output.delete(recursive: true);
    }
  });
}
