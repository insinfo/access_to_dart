import 'dart:convert';
import 'dart:io';

import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  AccessCatalogEntry entry(String name, int flags, {int type = 5}) =>
      AccessCatalogEntry(
          id: 1,
          parentId: 0,
          name: name,
          objectType: AccessObjectType.fromTypeValue(type),
          flags: flags,
          rawType: type);

  test(
      'QueryDefs usa flags de sistema e preserva queries ocultas e nomes livres',
      () {
    expect(entry('Consulta', 0x40000).isQueryDefinition, isTrue);
    expect(entry('~sq_fFormulario', 0x08).isQueryDefinition, isTrue);
    expect(
        entry('Consulta_0123456789ABCDEF0123456789ABCDEF', 0).isQueryDefinition,
        isTrue);
    expect(entry('Consulta', 0x80020100).isQueryDefinition, isFalse);
    expect(entry('Consulta', -2147090176).isQueryDefinition, isFalse);
    expect(entry('~sq_fFormulario', 0x03).isQueryDefinition, isTrue);
    expect(entry('~sq_fFormulario', 0x40003).isQueryDefinition, isTrue);
    expect(entry('Tabela', 0, type: 1).isQueryDefinition, isFalse);
  });

  test('catalogo SIGAsul corresponde ao conjunto DAO sem artefatos internos',
      () async {
    final oracle = jsonDecode(
            await File('test/fixtures/sigasul_dao_catalog.json').readAsString())
        as Map<String, dynamic>;
    final database = await AccessDatabase.openPath(oracle['fixture'] as String);
    addTearDown(database.close);
    final catalog = AccessCatalog(
        format: database.format, pageChannel: database.pageChannel);
    final raw = await catalog.debugGetAllEntries();
    final rawQueries = raw.where((entry) => entry.rawType == 5).toList();
    final systemQueries =
        rawQueries.where((entry) => (entry.flags & 0x80000000) != 0).toList();
    expect(rawQueries, hasLength(540));
    expect(systemQueries, hasLength(39));
    final model = await catalog.read(oracle['fixture'] as String);
    final names = model.queries.map((query) => query.name).toList()..sort();
    expect(
        names, orderedEquals((oracle['query_names'] as List).cast<String>()));
    expect(model.linkedTables, hasLength(oracle['linked_tables'] as int));
    expect(model.forms, hasLength(oracle['forms'] as int));
    expect(model.reports, hasLength(oracle['reports'] as int));
    expect(names.any((name) => name.startsWith('~sq_')), isTrue);
    expect(systemQueries.every((entry) => !names.contains(entry.name)), isTrue);
  });
}
