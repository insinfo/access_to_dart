import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('property map fixture extracts validation metadata from local table fields', () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir = await Directory.systemTemp.createTemp('access_property_map_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile = File('${tempDir.path}${Platform.pathSeparator}property_map_fixture.accdb');
    final analysisDir = Directory('${tempDir.path}${Platform.pathSeparator}analysis');

    await runCheckedProcess(
      'dart',
      ['run', 'tools/create_access_property_map_fixture.dart', '--output', fixtureFile.path],
      description: 'create property map validation fixture accdb',
    );

    final analyzeOut = StringBuffer();
    final analyzeErr = StringBuffer();
    final analyzeExit = await run(
      ['analyze', '--accdb', fixtureFile.path, '--output', analysisDir.path],
      out: analyzeOut,
      err: analyzeErr,
    );

    expect(analyzeExit, 0, reason: analyzeErr.toString());

    final analysisFile = File('${analysisDir.path}${Platform.pathSeparator}analysis.json');
    final analysisJson = jsonDecode(await analysisFile.readAsString()) as Map<String, dynamic>;
    final tables = (analysisJson['tables'] as List<dynamic>).cast<Map<String, dynamic>>();
    final clientes = tables.singleWhere((table) => table['name'] == 'Clientes');
    final columns = (clientes['columns'] as List<dynamic>).cast<Map<String, dynamic>>();

    final nome = columns.singleWhere((column) => column['name'] == 'Nome');
    expect(nome['validationRule'], 'Len([Nome] & "") >= 3');
    expect(nome['validationText'], 'Informe ao menos 3 caracteres no nome.');
    expect(nome['defaultValue'], '"SEM NOME"');
    expect(nome['caption'], 'Nome completo');
    expect(nome['description'], 'Nome civil do cliente.');
    expect(nome['format'], '>');
    expect(nome['allowZeroLength'], isFalse);

    final cpf = columns.singleWhere((column) => column['name'] == 'CPF');
    expect(cpf['validationRule'], 'Like "###.###.###-##"');
    expect(cpf['validationText'], 'CPF deve seguir o padrao 000.000.000-00.');
    expect(cpf['caption'], 'CPF');
    expect(cpf['description'], 'Documento CPF com mascara nacional.');
    expect(cpf['inputMask'], r'000\.000\.000\-00;0;_');

    final cep = columns.singleWhere((column) => column['name'] == 'CEP');
    expect(cep['defaultValue'], '"74000-000"');
    expect(cep['caption'], 'CEP residencial');

    final uf = columns.singleWhere((column) => column['name'] == 'UF');
    expect(uf['defaultValue'], '"GO"');
    expect(uf['caption'], 'UF');

    final dataNascimento = columns.singleWhere((column) => column['name'] == 'DataNascimento');
    expect(dataNascimento['defaultValue'], 'Date()');
    expect(dataNascimento['caption'], 'Nascimento');
    expect(dataNascimento['description'], 'Data de nascimento do cliente.');
    expect(dataNascimento['validationRule'], '<=Date()');
    expect(dataNascimento['inputMask'], '99/99/0000');

    final salario = columns.singleWhere((column) => column['name'] == 'Salario');
    expect(salario['defaultValue'], '0');
    expect(salario['caption'], 'Salario base');
    expect(salario['description'], 'Valor de renda mensal informado.');
    expect(salario['decimalPlaces'], 2);
    expect(salario['validationRule'], '>=0');
    expect(salario['validationText'], 'Salario nao pode ser negativo.');
    expect(salario['format'], 'Currency');

    expect(clientes['validationRule'], '[Salario] >= 0');
    expect(
      clientes['validationText'],
      'Os registros da tabela Clientes exigem salario nao negativo.',
    );
  },
      timeout: const Timeout(Duration(minutes: 10)));
}