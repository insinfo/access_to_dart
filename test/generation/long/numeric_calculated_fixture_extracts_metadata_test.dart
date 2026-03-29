import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  final guidMatcher = matches(RegExp(r'^[0-9A-F]{32}$'));

  test('numeric and calculated fixture extracts decimal metadata and generated columns', () async {
    if (!Platform.isWindows) {
      return;
    }

    final tempDir = await Directory.systemTemp.createTemp('access_numeric_calc_');
    addTearDown(() => tempDir.delete(recursive: true));

    final fixtureFile = File('${tempDir.path}${Platform.pathSeparator}numeric_calculated_fixture.accdb');
    final analysisDir = Directory('${tempDir.path}${Platform.pathSeparator}analysis');

    await runCheckedProcess(
      'dart',
      [
        'run',
        'tools/create_access_numeric_calculated_fixture.dart',
        '--output',
        fixtureFile.path,
      ],
      description: 'create numeric calculated fixture accdb',
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

    final metricas = tables.singleWhere((table) => table['name'] == 'FinanceiroMetricas');
    final metricasColumns = (metricas['columns'] as List<dynamic>).cast<Map<String, dynamic>>();

    final precoUnitario = metricasColumns.singleWhere((column) => column['name'] == 'PrecoUnitario');
    expect(precoUnitario['defaultValue'], '10.5000');
    expect(precoUnitario['description'], 'Preco monetario por unidade.');
    expect(precoUnitario['decimalPlaces'], 4);
    expect(precoUnitario['format'], 'Currency');

    final fatorAjuste = metricasColumns.singleWhere((column) => column['name'] == 'FatorAjuste');
    expect(fatorAjuste['defaultValue'], '1.333333');
    expect(fatorAjuste['decimalPlaces'], 6);
    expect(fatorAjuste['format'], 'Fixed');

    final contatosCalculados = tables.singleWhere((table) => table['name'] == 'ContatosCalculados');
    final contatosColumns = (contatosCalculados['columns'] as List<dynamic>).cast<Map<String, dynamic>>();

    final nomeDoContato = contatosColumns.singleWhere((column) => column['name'] == 'NomeDoContato');
    expect(nomeDoContato['isCalculated'], isTrue);
    expect(nomeDoContato['calculatedExpression'], contains('[Nome]'));
    expect(nomeDoContato['displayControl'], 109);
    expect(nomeDoContato['imeMode'], 0);
    expect(nomeDoContato['imeSentenceMode'], 0);
    expect(nomeDoContato['resultType'], 10);

    final arquivoComo = contatosColumns.singleWhere((column) => column['name'] == 'ArquivoComo');
    expect(arquivoComo['isCalculated'], isTrue);
    expect(arquivoComo['calculatedExpression'], contains('[Sobrenome]'));
    expect(arquivoComo['resultType'], 10);

    final id = contatosColumns.singleWhere((column) => column['name'] == 'ID');
    expect(id['propertyGuid'], guidMatcher);
    expect(id['wssFieldId'], 'ID');

    final empresa = contatosColumns.singleWhere((column) => column['name'] == 'Empresa');
    expect(empresa['propertyGuid'], guidMatcher);
    expect(empresa['wssFieldId'], 'Company');
    expect(empresa['allowZeroLength'], isFalse);

    final postgresDdl = contatosCalculados['postgres_ddl'] as String;
    expect(postgresDdl, contains('"nome_do_contato" TEXT GENERATED ALWAYS AS'));
    expect(postgresDdl, contains('"arquivo_como" TEXT GENERATED ALWAYS AS'));
    expect(postgresDdl, contains('CASE WHEN'));

    final metricasDdl = metricas['postgres_ddl'] as String;
    expect(metricasDdl, contains('"preco_unitario" NUMERIC(19,2) NOT NULL DEFAULT 10.5000'));
    expect(metricasDdl, contains('"fator_ajuste" DOUBLE PRECISION DEFAULT 1.333333'));

    final numericPrecisao = tables.singleWhere((table) => table['name'] == 'NumericPrecisaoEscala');
    final numericPrecisaoColumns =
      (numericPrecisao['columns'] as List<dynamic>).cast<Map<String, dynamic>>();
    final quantiaPrecisa =
      numericPrecisaoColumns.singleWhere((column) => column['name'] == 'QuantiaPrecisa');
    expect(quantiaPrecisa['typeName'], 'Numeric');
    expect(quantiaPrecisa['precision'], 38);
    expect(quantiaPrecisa['scale'], 0);
    expect(quantiaPrecisa['format'], 'Fixed');

    final taxaPrecisa =
      numericPrecisaoColumns.singleWhere((column) => column['name'] == 'TaxaPrecisa');
    expect(taxaPrecisa['typeName'], 'Numeric');
    expect(taxaPrecisa['precision'], 38);
    expect(taxaPrecisa['scale'], 0);
    expect(taxaPrecisa['format'], 'Fixed');

    final numericPrecisaoDdl = numericPrecisao['postgres_ddl'] as String;
    expect(numericPrecisaoDdl, contains('"quantia_precisa" NUMERIC(38,0) NOT NULL'));
    expect(numericPrecisaoDdl, contains('"taxa_precisa" NUMERIC(38,0) NOT NULL'));

    final calcNativeCurrency = tables.singleWhere((table) => table['name'] == 'CalcNativeCurrency');
    final calcNativeCurrencyColumns =
        (calcNativeCurrency['columns'] as List<dynamic>).cast<Map<String, dynamic>>();
    final totalCalculado =
        calcNativeCurrencyColumns.singleWhere((column) => column['name'] == 'TotalCalculado');
    expect(totalCalculado['isCalculated'], isTrue);
    expect(totalCalculado['calculatedExpression'], '([Quantidade] * [PrecoUnitario])');
    expect(totalCalculado['caption'], 'Total calculado');
    expect(totalCalculado['format'], 'Currency');
    expect(totalCalculado['decimalPlaces'], 2);
    expect(totalCalculado['resultType'], isNotNull);

    final calcNativeDouble = tables.singleWhere((table) => table['name'] == 'CalcNativeDouble');
    final calcNativeDoubleColumns =
        (calcNativeDouble['columns'] as List<dynamic>).cast<Map<String, dynamic>>();
    final resultadoCalculado = calcNativeDoubleColumns.singleWhere(
      (column) => column['name'] == 'ResultadoCalculado',
    );
    expect(resultadoCalculado['isCalculated'], isTrue);
    expect(resultadoCalculado['calculatedExpression'], '([Quantidade] * [FatorBase])');
    expect(resultadoCalculado['caption'], 'Resultado calculado');
    expect(resultadoCalculado['format'], 'Fixed');
    expect(resultadoCalculado['decimalPlaces'], 4);
    expect(resultadoCalculado['resultType'], isNotNull);

    final calcNativeNumeric = tables.singleWhere((table) => table['name'] == 'CalcNativeNumeric');
    final calcNativeNumericColumns =
      (calcNativeNumeric['columns'] as List<dynamic>).cast<Map<String, dynamic>>();
    final quantidadeNumerica =
      calcNativeNumericColumns.singleWhere((column) => column['name'] == 'QuantidadeNumerica');
    expect(quantidadeNumerica['typeName'], 'Numeric');
    expect(quantidadeNumerica['precision'], 38);
    expect(quantidadeNumerica['scale'], 0);

    final fatorNumerico =
      calcNativeNumericColumns.singleWhere((column) => column['name'] == 'FatorNumerico');
    expect(fatorNumerico['typeName'], 'Numeric');
    expect(fatorNumerico['precision'], 38);
    expect(fatorNumerico['scale'], 0);

    final resultadoNumerico =
      calcNativeNumericColumns.singleWhere((column) => column['name'] == 'ResultadoNumerico');
    expect(resultadoNumerico['isCalculated'], isTrue);
    expect(resultadoNumerico['typeName'], 'Numeric');

    final calcNativeNumericDdl = calcNativeNumeric['postgres_ddl'] as String;
    expect(calcNativeNumericDdl, contains('"quantidade_numerica" NUMERIC(38,0)'));
    expect(calcNativeNumericDdl, contains('"fator_numerico" NUMERIC(38,0)'));
    expect(calcNativeNumericDdl, contains('"resultado_numerico" NUMERIC'));
  }, timeout: const Timeout(Duration(minutes: 10)));
}