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
    expect(query.semanticSql, isNotNull);

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
    expect(project.queries.length, greaterThanOrEqualTo(409));
    expect(
      project.queries.any(
        (query) => query.basText != null && query.basText!.trim().isNotEmpty,
      ),
      isTrue,
    );
    final basOnly = project.queries
        .singleWhere((query) => query.name == 'Union Perfil Presenca');
    expect(basOnly.sql, isEmpty);
    expect(basOnly.basText, isNotEmpty);
    expect(basOnly.semanticSql, isNotNull);
    expect(basOnly.semanticSql, isNot(contains(r'\015\012')));

    final listaPresenca = project.queries.singleWhere(
      (query) => query.name == 'LISTA-PRESENÇA-ENTREGA-KITS',
    );
    expect(listaPresenca.semanticSql, contains('FROM'));
    expect(listaPresenca.semanticSql, contains('TbUnidade'));
    expect(listaPresenca.semanticSql, contains('ORDER BY'));
    expect(listaPresenca.semanticSql, contains('PrincipalSCFVExterno.Nome'));

    final relatorioGeral = project.queries.singleWhere(
      (query) => query.name == 'SISC EXTERNO RELATORIO GERAL',
    );
    expect(relatorioGeral.semanticSql, contains('FROM'));
    expect(
      relatorioGeral.semanticSql,
      contains('SISC SCFV EXTERNO GRUPOS E RF, TbUnidade'),
    );
    expect(relatorioGeral.semanticSql, contains('ORDER BY'));

    final codfamComposicao = project.queries.singleWhere(
      (query) => query.name == 'codfam e num composição',
    );
    expect(codfamComposicao.semanticSql, contains('SELECT TOP 60'));

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
      tbPessoa.indexes
          .any((index) => index.primary && index.key == '[CodPessoa]'),
      isTrue,
    );
  });
}
