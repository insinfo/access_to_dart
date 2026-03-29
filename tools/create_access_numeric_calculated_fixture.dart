import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const _accessProgIds = <String>['Access.Application'];
const _dbDouble = 7;
const _dbNumeric = 20;

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Caminho do arquivo .accdb a ser criado.',
      defaultsTo: r'C:\Temp\numeric_calculated_fixture.accdb',
    )
    ..addFlag(
      'visible',
      help: 'Abre o Microsoft Access ao final.',
      defaultsTo: false,
    )
    ..addFlag(
      'overwrite',
      help: 'Sobrescreve o arquivo se ele ja existir.',
      defaultsTo: true,
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Mostra esta ajuda.',
    );

  final args = parser.parse(arguments);
  if (args['help'] as bool) {
    stdout.writeln(parser.usage);
    return;
  }

  createAccessNumericCalculatedFixture(
    args['output'] as String,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createAccessNumericCalculatedFixture(
  String dbPath, {
  bool visibleAtEnd = false,
  bool overwrite = true,
}) {
  dbPath = File(dbPath).absolute.path;
  final calculatedFixturePath = _resolveCalculatedFixtureSourcePath();
  initializeComApartment();

  Dispatcher? access;
  Dispatcher? db;
  Dispatcher? doCmd;
  Dispatcher? tableDefs;
  Dispatcher? tableDef;
  Dispatcher? fields;
  final persistedFields = <String, Dispatcher>{};

  final specs = <_FieldSpec>[
    const _FieldSpec(name: 'ID', dataType: 4),
    const _FieldSpec(
      name: 'Quantidade',
      dataType: 4,
      required: true,
      defaultValue: '1',
      caption: 'Quantidade',
      description: 'Quantidade base para calculos financeiros.',
      decimalPlaces: 0,
      format: 'Fixed',
    ),
    const _FieldSpec(
      name: 'PrecoUnitario',
      dataType: 5,
      required: true,
      defaultValue: '10.5000',
      caption: 'Preco unitario',
      description: 'Preco monetario por unidade.',
      decimalPlaces: 4,
      format: 'Currency',
    ),
    const _FieldSpec(
      name: 'PercentualDesconto',
      dataType: 7,
      required: false,
      defaultValue: '0.125',
      caption: 'Percentual desconto',
      description: 'Aliquota percentual aplicada ao calculo.',
      decimalPlaces: 4,
      format: 'Percent',
    ),
    const _FieldSpec(
      name: 'FatorAjuste',
      dataType: 7,
      required: false,
      defaultValue: '1.333333',
      caption: 'Fator ajuste',
      description: 'Fator decimal com maior precisao para exportacao.',
      decimalPlaces: 6,
      format: 'Fixed',
    ),
  ];

  try {
    final file = File(dbPath);
    file.parent.createSync(recursive: true);

    terminateProcessesByExecutableName('MSACCESS.EXE');

    if (file.existsSync()) {
      if (!overwrite) {
        throw StateError('O arquivo ja existe: $dbPath');
      }
      file.deleteSync();
    }

    access = createDispatcher(_accessProgIds);
    setProperty(access, 'Visible', false);
    invokeMethod(access, 'NewCurrentDatabase', [dbPath]);
    db = invokeDispatchMethod(access, 'CurrentDb');
    doCmd = getDispatchProperty(access, 'DoCmd');

    tableDefs = getDispatchProperty(db, 'TableDefs');
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['FinanceiroMetricas']);
    fields = getDispatchProperty(tableDef, 'Fields');

    for (final spec in specs) {
      persistedFields[spec.name] = _appendFieldWithDaoProperties(
        tableDef,
        fields,
        spec,
      );
    }

    invokeMethod(tableDefs, 'Append', [tableDef]);

    for (final spec in specs) {
      final field = persistedFields[spec.name]!;
      _applyAccessDefinedFieldProperties(field, spec);
    }

    _createNativeCalculatedCurrencyTable(db, tableDefs);
    _createNativeCalculatedDoubleTable(db, tableDefs);
    _createExplicitNumericTable(db, tableDefs);
    _createNativeCalculatedNumericTable(db, tableDefs);

    invokeMethod(db, 'Execute', [
      'INSERT INTO FinanceiroMetricas (ID, Quantidade, PrecoUnitario, PercentualDesconto, FatorAjuste) '
          'VALUES (1, 3, 10.5, 0.125, 1.333333)'
    ]);
    invokeMethod(db, 'Execute', [
      'INSERT INTO CalcNativeCurrency (ID, Quantidade, PrecoUnitario) VALUES (1, 3, 10.5)'
    ]);
    invokeMethod(db, 'Execute', [
      'INSERT INTO CalcNativeDouble (ID, Quantidade, FatorBase) VALUES (1, 3, 1.25)'
    ]);
    invokeMethod(db, 'Execute', [
      'INSERT INTO NumericPrecisaoEscala (ID, QuantiaPrecisa, TaxaPrecisa) VALUES (1, 150.1250, 1.234567)'
    ]);
    invokeMethod(db, 'Execute', [
      'INSERT INTO CalcNativeNumeric (ID, QuantidadeNumerica, FatorNumerico) VALUES (1, 120.2500, 1.125000)'
    ]);

    invokeMethod(doCmd, 'TransferDatabase', [
      _acImport,
      'Microsoft Access',
      calculatedFixturePath,
      _acTable,
      'Contatos',
      'ContatosCalculados',
      false,
    ]);

    if (visibleAtEnd) {
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }

    stdout.writeln('Banco de fixture numerico/calculado criado com sucesso em: $dbPath');
  } finally {
    for (final field in persistedFields.values) {
      releaseDispatcher(field);
    }
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
    releaseDispatcher(tableDefs);
    releaseDispatcher(doCmd);
    releaseDispatcher(db);
    releaseDispatcher(access);
    CoUninitialize();

    if (!visibleAtEnd) {
      sleep(const Duration(milliseconds: 2500));
      terminateProcessesByExecutableName('MSACCESS.EXE');
    }
  }
}

void _createNativeCalculatedCurrencyTable(Dispatcher db, Dispatcher tableDefs) {
  Dispatcher? tableDef;
  Dispatcher? fields;
  Dispatcher? idField;
  Dispatcher? quantidadeField;
  Dispatcher? precoField;
  Dispatcher? totalField;
  try {
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['CalcNativeCurrency']);
    fields = getDispatchProperty(tableDef, 'Fields');

    idField = _appendField(tableDef, fields, 'ID', 4, required: true);
    quantidadeField = _appendField(tableDef, fields, 'Quantidade', 4, required: true);
    precoField = _appendField(tableDef, fields, 'PrecoUnitario', 5, required: true);
    totalField = invokeDispatchMethod(tableDef, 'CreateField', ['TotalCalculado', 5]);

    _setPropertyIfPossible(totalField, 'Expression', '([Quantidade] * [PrecoUnitario])');
    invokeMethod(fields, 'Append', [totalField]);
    invokeMethod(tableDefs, 'Append', [tableDef]);

    _setAccessDefinedFieldProperty(totalField, 'Caption', 12, 'Total calculado');
    _setAccessDefinedFieldProperty(totalField, 'DecimalPlaces', 2, 2);
    _setAccessDefinedFieldProperty(totalField, 'Format', 10, 'Currency');
  } finally {
    releaseDispatcher(totalField);
    releaseDispatcher(precoField);
    releaseDispatcher(quantidadeField);
    releaseDispatcher(idField);
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
  }
}

void _createNativeCalculatedDoubleTable(Dispatcher db, Dispatcher tableDefs) {
  Dispatcher? tableDef;
  Dispatcher? fields;
  Dispatcher? idField;
  Dispatcher? quantidadeField;
  Dispatcher? fatorField;
  Dispatcher? resultadoField;
  try {
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['CalcNativeDouble']);
    fields = getDispatchProperty(tableDef, 'Fields');

    idField = _appendField(tableDef, fields, 'ID', 4, required: true);
    quantidadeField = _appendField(tableDef, fields, 'Quantidade', 4, required: true);
    fatorField = _appendField(tableDef, fields, 'FatorBase', _dbDouble, required: true);
    resultadoField = invokeDispatchMethod(tableDef, 'CreateField', ['ResultadoCalculado', _dbDouble]);

    _setPropertyIfPossible(resultadoField, 'Expression', '([Quantidade] * [FatorBase])');
    invokeMethod(fields, 'Append', [resultadoField]);
    invokeMethod(tableDefs, 'Append', [tableDef]);

    _setAccessDefinedFieldProperty(resultadoField, 'Caption', 12, 'Resultado calculado');
    _setAccessDefinedFieldProperty(resultadoField, 'DecimalPlaces', 2, 4);
    _setAccessDefinedFieldProperty(resultadoField, 'Format', 10, 'Fixed');
  } finally {
    releaseDispatcher(resultadoField);
    releaseDispatcher(fatorField);
    releaseDispatcher(quantidadeField);
    releaseDispatcher(idField);
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
  }
}

void _createExplicitNumericTable(Dispatcher db, Dispatcher tableDefs) {
  Dispatcher? tableDef;
  Dispatcher? fields;
  Dispatcher? idField;
  Dispatcher? quantiaField;
  Dispatcher? taxaField;
  try {
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['NumericPrecisaoEscala']);
    fields = getDispatchProperty(tableDef, 'Fields');

    idField = _appendField(tableDef, fields, 'ID', 4, required: true);
    quantiaField = _appendField(
      tableDef,
      fields,
      'QuantiaPrecisa',
      _dbNumeric,
      required: true,
      precision: 18,
      scale: 4,
    );
    taxaField = _appendField(
      tableDef,
      fields,
      'TaxaPrecisa',
      _dbNumeric,
      required: true,
      precision: 12,
      scale: 6,
    );
    invokeMethod(tableDefs, 'Append', [tableDef]);

    _setAccessDefinedFieldProperty(quantiaField, 'Caption', 12, 'Quantia precisa');
    _setAccessDefinedFieldProperty(quantiaField, 'DecimalPlaces', 2, 4);
    _setAccessDefinedFieldProperty(quantiaField, 'Format', 10, 'Fixed');
    _setAccessDefinedFieldProperty(taxaField, 'Caption', 12, 'Taxa precisa');
    _setAccessDefinedFieldProperty(taxaField, 'DecimalPlaces', 2, 6);
    _setAccessDefinedFieldProperty(taxaField, 'Format', 10, 'Fixed');
  } finally {
    releaseDispatcher(taxaField);
    releaseDispatcher(quantiaField);
    releaseDispatcher(idField);
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
  }
}

void _createNativeCalculatedNumericTable(Dispatcher db, Dispatcher tableDefs) {
  Dispatcher? tableDef;
  Dispatcher? fields;
  Dispatcher? idField;
  Dispatcher? quantidadeField;
  Dispatcher? fatorField;
  Dispatcher? resultadoField;
  try {
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['CalcNativeNumeric']);
    fields = getDispatchProperty(tableDef, 'Fields');

    idField = _appendField(tableDef, fields, 'ID', 4, required: true);
    quantidadeField = _appendField(
      tableDef,
      fields,
      'QuantidadeNumerica',
      _dbNumeric,
      required: true,
      precision: 18,
      scale: 4,
    );
    fatorField = _appendField(
      tableDef,
      fields,
      'FatorNumerico',
      _dbNumeric,
      required: true,
      precision: 12,
      scale: 6,
    );
    resultadoField = invokeDispatchMethod(tableDef, 'CreateField', ['ResultadoNumerico', _dbNumeric]);
    _setPrecisionScaleIfPossible(resultadoField, 24, 6);
    _setPropertyIfPossible(resultadoField, 'Expression', '([QuantidadeNumerica] * [FatorNumerico])');
    invokeMethod(fields, 'Append', [resultadoField]);
    invokeMethod(tableDefs, 'Append', [tableDef]);

    _setAccessDefinedFieldProperty(resultadoField, 'Caption', 12, 'Resultado numerico');
    _setAccessDefinedFieldProperty(resultadoField, 'DecimalPlaces', 2, 6);
    _setAccessDefinedFieldProperty(resultadoField, 'Format', 10, 'Fixed');
  } finally {
    releaseDispatcher(resultadoField);
    releaseDispatcher(fatorField);
    releaseDispatcher(quantidadeField);
    releaseDispatcher(idField);
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
  }
}

Dispatcher _appendField(
  Dispatcher tableDef,
  Dispatcher fields,
  String name,
  int dataType, {
  bool? required,
  int? precision,
  int? scale,
}) {
  final field = invokeDispatchMethod(tableDef, 'CreateField', [name, dataType]);
  try {
    if (required != null) {
      _setPropertyIfPossible(field, 'Required', required);
    }
    _setPrecisionScaleIfPossible(field, precision, scale);
    invokeMethod(fields, 'Append', [field]);
    return field;
  } catch (_) {
    releaseDispatcher(field);
    rethrow;
  }
}

void _setPrecisionScaleIfPossible(Dispatcher field, int? precision, int? scale) {
  if (precision != null) {
    _setPropertyIfPossible(field, 'Precision', precision);
  }
  if (scale != null) {
    _setPropertyIfPossible(field, 'Scale', scale);
  }
}

Dispatcher _appendFieldWithDaoProperties(
  Dispatcher tableDef,
  Dispatcher fields,
  _FieldSpec spec,
) {
  final field = invokeDispatchMethod(tableDef, 'CreateField', [spec.name, spec.dataType]);
  try {
    if (spec.required != null) {
      setProperty(field, 'Required', spec.required);
    }
    if (spec.defaultValue != null) {
      setProperty(field, 'DefaultValue', spec.defaultValue);
    }
    invokeMethod(fields, 'Append', [field]);
    return field;
  } catch (e, s) {
    stderr.writeln('Falha ao criar/configurar o campo DAO ${spec.name}: $e\n$s');
    releaseDispatcher(field);
    rethrow;
  }
}

void _applyAccessDefinedFieldProperties(Dispatcher field, _FieldSpec spec) {
  if (spec.caption != null) {
    _setAccessDefinedFieldProperty(field, 'Caption', 12, spec.caption);
  }
  if (spec.description != null) {
    _setAccessDefinedFieldProperty(field, 'Description', 12, spec.description);
  }
  if (spec.decimalPlaces != null) {
    _setAccessDefinedFieldProperty(field, 'DecimalPlaces', 2, spec.decimalPlaces);
  }
  if (spec.format != null) {
    _setAccessDefinedFieldProperty(field, 'Format', 10, spec.format);
  }
}

void _setAccessDefinedFieldProperty(
  Dispatcher field,
  String propertyName,
  int dataType,
  Object? value,
) {
  try {
    setProperty(field, propertyName, value);
    return;
  } catch (_) {}

  Dispatcher? properties;
  Dispatcher? property;
  try {
    properties = getDispatchProperty(field, 'Properties');
    property = invokeDispatchMethod(field, 'CreateProperty', [propertyName, dataType, value]);
    invokeMethod(properties, 'Append', [property]);
  } finally {
    releaseDispatcher(property);
    releaseDispatcher(properties);
  }
}

void _setPropertyIfPossible(Dispatcher dispatcher, String propertyName, Object? value) {
  try {
    setProperty(dispatcher, propertyName, value);
    return;
  } catch (_) {}

  Dispatcher? properties;
  Dispatcher? property;
  try {
    properties = getDispatchProperty(dispatcher, 'Properties');
    property = invokeDispatchMethod(
      dispatcher,
      'CreateProperty',
      [propertyName, _propertyTypeForValue(value), value],
    );
    invokeMethod(properties, 'Append', [property]);
  } catch (e) {
    stdout.writeln('Propriedade ignorada $propertyName=$value (${value.runtimeType}): $e');
  } finally {
    releaseDispatcher(property);
    releaseDispatcher(properties);
  }
}

int _propertyTypeForValue(Object? value) {
  if (value is bool) {
    return 1;
  }
  if (value is int) {
    return 4;
  }
  return 10;
}

String _resolveCalculatedFixtureSourcePath() {
  final scriptDir = File.fromUri(Platform.script).parent;
  final repoRoot = scriptDir.parent;
  final fixture = File(
    '${repoRoot.path}\\fixtures\\teste1\\teste1.accdb',
  );
  if (!fixture.existsSync()) {
    throw StateError(
      'Fixture de campos calculados nao encontrado: ${fixture.path}',
    );
  }
  return fixture.path;
}

const _acImport = 0;
const _acTable = 0;

class _FieldSpec {
  final String name;
  final int dataType;
  final bool? required;
  final String? defaultValue;
  final String? caption;
  final String? description;
  final int? decimalPlaces;
  final String? format;

  const _FieldSpec({
    required this.name,
    required this.dataType,
    this.required,
    this.defaultValue,
    this.caption,
    this.description,
    this.decimalPlaces,
    this.format,
  });
}
