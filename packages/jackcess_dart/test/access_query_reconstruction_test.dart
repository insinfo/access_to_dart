import 'package:jackcess_dart/src/access_catalog.dart';
import 'package:test/test.dart';

void main() {
  group('Access query reconstruction', () {
    test('maps object flags to semantic query types', () {
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 0},
        ]),
        1,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 80},
        ]),
        2,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 64},
        ]),
        3,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 48},
        ]),
        4,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 32},
        ]),
        5,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 16},
        ]),
        6,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 96},
        ]),
        7,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 112},
        ]),
        8,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 128},
        ]),
        9,
      );
    });

    test('reconstructs a select with join where group having and order by', () {
      final rows = <Map<String, dynamic>>[
        {'Attribute': 3, 'Flag': 2},
        {'Attribute': 5, 'Name1': 'Table1'},
        {'Attribute': 5, 'Name1': 'Table2', 'Name2': 'Another Table'},
        {'Attribute': 6, 'Expression': 'Table1.id'},
        {'Attribute': 6, 'Expression': 'Table1.col', 'Name1': 'Some.Alias'},
        {
          'Attribute': 7,
          'Expression': '(Table1.id = [Another Table].id)',
          'Flag': 1,
          'Name1': 'Table1',
          'Name2': 'Another Table',
        },
        {'Attribute': 8, 'Expression': '(Table1.col2 < 13)'},
        {'Attribute': 9, 'Expression': 'Table1.id'},
        {'Attribute': 9, 'Expression': 'SUM(Table1.val)'},
        {'Attribute': 10, 'Expression': '(SUM(Table1.val) = 500)'},
        {'Attribute': 11, 'Expression': 'Table1.id'},
        {'Attribute': 11, 'Expression': 'Table2.val', 'Name1': 'D'},
      ];

      final sql = AccessCatalog.reconstructSqlFromRows(rows, 1);

      expect(sql, isNotNull);
      expect(sql, contains('SELECT DISTINCT'));
      expect(sql, contains('[Table1].[id]'));
      expect(sql, contains('AS [Some].[Alias]'));
      expect(
        sql,
        contains('([Table1] INNER JOIN [Table2] AS [Another Table] ON (Table1.id = [Another Table].id))'),
      );
      expect(sql, contains('WHERE\n  (Table1.col2 < 13)'));
      expect(sql, contains('GROUP BY\n  [Table1].[id],\n  SUM(Table1.val)'));
      expect(sql, contains('HAVING\n  (SUM(Table1.val) = 500)'));
      expect(sql, contains('ORDER BY\n  [Table1].[id],\n  [Table2].[val] DESC'));
    });

    test('reconstructs pass-through SQL from remote db rows', () {
      final sql = AccessCatalog.reconstructSqlFromRows([
        {'Attribute': 4, 'Expression': 'SELECT 1'},
      ], 8);

      expect(sql, 'SELECT 1');
    });

    test('recognizes canonical queryType values 1..9 in Attribute=1 rows', () {
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 1},
        ]),
        1,
      );
      expect(
        AccessCatalog.inferQueryTypeFromRows([
          {'Attribute': 1, 'Flag': 9},
        ]),
        9,
      );
    });

    test('reconstructs UNION and UNION ALL queries with optional ORDER BY', () {
      final unionAllSql = AccessCatalog.reconstructSqlFromRows([
        {'Attribute': 1, 'Flag': 9},
        {'Attribute': 3, 'Flag': 1},
        {'Attribute': 5, 'Name2': 'X7YZ_____2', 'Expression': 'SELECT 2 AS N FROM B;'},
        {'Attribute': 5, 'Name2': 'X7YZ_____1', 'Expression': 'SELECT 1 AS N FROM A'},
      ], 9);
      expect(unionAllSql, 'SELECT 1 AS N FROM A\nUNION ALL\nSELECT 2 AS N FROM B');

      final unionOrderedSql = AccessCatalog.reconstructSqlFromRows([
        {'Attribute': 1, 'Flag': 9},
        {'Attribute': 3, 'Flag': 0},
        {'Attribute': 5, 'Name2': 'X7YZ_____1', 'Expression': 'SELECT A.Nome FROM A'},
        {'Attribute': 5, 'Name2': 'X7YZ_____2', 'Expression': 'SELECT B.Nome FROM B'},
        {'Attribute': 11, 'Expression': 'Nome', 'Name1': 'D'},
      ], 9);
      expect(
        unionOrderedSql,
        'SELECT A.Nome FROM A\nUNION\nSELECT B.Nome FROM B\nORDER BY\n  [Nome] DESC',
      );
    });

    test('deduplicates repeated Attribute=7 join rows and combines distinct conditions cleanly', () {
      final dupSql = AccessCatalog.reconstructSqlFromRows([
        {'Attribute': 5, 'Name1': 'A'},
        {'Attribute': 5, 'Name1': 'B'},
        {'Attribute': 6, 'Expression': 'A.Id'},
        {'Attribute': 7, 'Flag': 1, 'Name1': 'A', 'Name2': 'B', 'Expression': 'A.Id = B.AId'},
        {'Attribute': 7, 'Flag': 1, 'Name1': 'A', 'Name2': 'B', 'Expression': 'A.Id = B.AId'},
      ], 1);
      expect(dupSql, contains('([A] INNER JOIN [B] ON A.Id = B.AId)'));
      expect('INNER JOIN'.allMatches(dupSql!).length, 1);

      final compoundSql = AccessCatalog.reconstructSqlFromRows([
        {'Attribute': 5, 'Name1': 'A'},
        {'Attribute': 5, 'Name1': 'B'},
        {'Attribute': 6, 'Expression': 'A.Id'},
        {'Attribute': 7, 'Flag': 1, 'Name1': 'A', 'Name2': 'B', 'Expression': 'A.Id = B.AId'},
        {'Attribute': 7, 'Flag': 1, 'Name1': 'A', 'Name2': 'B', 'Expression': 'A.Kind = B.Kind'},
      ], 1);
      expect(compoundSql, contains('(A.Id = B.AId) AND (A.Kind = B.Kind)'));
      expect('INNER JOIN'.allMatches(compoundSql!).length, 1);
    });

    test('reconstructs top select flag', () {
      final sql = AccessCatalog.reconstructSqlFromRows([
        {'Attribute': 3, 'Flag': 0x10, 'Name1': '50'},
        {'Attribute': 5, 'Name1': 'Filtro'},
        {'Attribute': 6, 'Expression': 'Filtro.Idade'},
      ], 1);

      expect(sql, isNotNull);
      expect(sql, contains('SELECT TOP 50'));
      expect(sql, contains('[Filtro].[Idade]'));
    });
  });
}
