import 'package:jackcess_dart/jackcess_dart.dart';

class AccessTableRowsSnapshot {
  final Map<String, List<Map<String, dynamic>>> rowsByTable;

  const AccessTableRowsSnapshot({required this.rowsByTable});

  int get tableCount => rowsByTable.length;

  int get rowCount => rowsByTable.values.fold<int>(
        0,
        (sum, rows) => sum + rows.length,
      );
}

class AccessTableRowsReader {
  Future<AccessTableRowsSnapshot> readAll({
    required String accdbPath,
    String? password,
  }) async {
    final database = await AccessDatabase.openPath(accdbPath, password: password);
    try {
      final catalog = AccessCatalog(
        format: database.format,
        pageChannel: database.pageChannel,
      );
      final model = await catalog.read(accdbPath);
      final tableReader = TableReader(
        format: database.format,
        pageChannel: database.pageChannel,
      );

      final rowsByTable = <String, List<Map<String, dynamic>>>{};
      for (final table in model.tables) {
        rowsByTable[table.name] = await tableReader.readAllRows(
          table.tdefPageNumber,
        );
      }

      return AccessTableRowsSnapshot(rowsByTable: rowsByTable);
    } finally {
      await database.close();
    }
  }
}