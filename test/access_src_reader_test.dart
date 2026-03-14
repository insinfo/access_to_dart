import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

void main() {
  test('parses internal teste1.accdb.src into the canonical source model',
      () async {
    final fixtureDir = Directory.fromUri(
      Directory.current.uri.resolve('fixtures/teste1/teste1.accdb.src/'),
    );
    expect(await fixtureDir.exists(), isTrue);

    final project = await AccessSrcReader().readDirectory(fixtureDir.path);

    expect(project.tables, hasLength(1));
    expect(project.queries, hasLength(1));
    expect(project.forms, hasLength(3));

    final contatos =
        project.tables.singleWhere((table) => table.name == 'Contatos');
    expect(contatos.indexes.any((index) => index.name == 'PrimaryKey'), isTrue);
    expect(contatos.indexes.any((index) => index.name == 'ZIP_PostalCode'),
        isTrue);

    final anexos =
        contatos.columns.singleWhere((column) => column.name == 'Anexos');
    expect(anexos.isAttachment, isTrue);
    expect(
        anexos.children.map((child) => child.name),
        containsAll(<String>[
          'FileData',
          'FileFlags',
          'FileName',
          'FileTimeStamp',
          'FileType',
          'FileURL',
        ]));

    final nomeDoContato = contatos.columns
        .singleWhere((column) => column.name == 'NomeDoContato');
    expect(nomeDoContato.isCalculated, isTrue);
    expect(nomeDoContato.expression, contains('IIf('));

    final query = project.queries
        .singleWhere((item) => item.name == 'ContatosEstendidos');
    expect(query.sql, contains('AS Pesquisável'));

    final detalhes =
        project.forms.singleWhere((form) => form.name == 'DetalhesDoContato');
    expect(detalhes.recordSource, 'Contatos');
    expect(detalhes.caption, 'Detalhes do Contato');
    expect(detalhes.macros['OnLoadEmMacro'], contains('GoToControl'));

    final firstNameControl = detalhes.controls
        .singleWhere((control) => control.name == 'txtFirstName');
    expect(firstNameControl.controlSource, 'Nome');

    final listagem =
        project.forms.singleWhere((form) => form.name == 'ListaDeContatos');
    expect(listagem.caption, 'Lista de Contatos');

    final folha = project.forms
        .singleWhere((form) => form.name == 'FolhaDeDadosDoContato');
    expect(folha.recordSource, 'ContatosEstendidos');
  });

  test('parses linked table metadata from SIGAsul.accdb.src', () async {
    final fixtureDir = Directory.fromUri(
      Directory.current.uri.resolve('fixtures/SIGAsul.accdb.src/'),
    );
    expect(await fixtureDir.exists(), isTrue);

    final project = await AccessSrcReader().readDirectory(fixtureDir.path);

    expect(project.tables.length, greaterThanOrEqualTo(40));
    expect(project.queries.length, greaterThanOrEqualTo(300));

    final tbPessoa =
        project.tables.singleWhere((table) => table.name == 'TbPessoa');
    expect(tbPessoa.isLinked, isTrue);
    expect(
      tbPessoa.connect,
      contains('SIGA2021-SUL_be_senha_4462.accdb'),
    );
    expect(tbPessoa.sourceTableName, 'TbPessoa');
    expect(tbPessoa.primaryKey, '[CodPessoa]');
    expect(
      tbPessoa.indexes.any((index) => index.primary && index.key == '[CodPessoa]'),
      isTrue,
    );
  });
}
