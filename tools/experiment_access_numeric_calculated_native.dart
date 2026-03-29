import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const _accessProgIds = <String>['Access.Application'];
const _dbBoolean = 1;
const _dbLong = 4;
const _dbCurrency = 5;
const _dbText = 10;
const _dbNumeric = 16;

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      defaultsTo: r'C:\Temp\experiment_numeric_calculated_native.accdb',
      help: 'Caminho do arquivo .accdb a ser criado.',
    )
    ..addFlag('overwrite', defaultsTo: true)
    ..addFlag('help', abbr: 'h', negatable: false);

  final args = parser.parse(arguments);
  if (args['help'] as bool) {
    stdout.writeln(parser.usage);
    return;
  }

  runExperiment(
    args['output'] as String,
    overwrite: args['overwrite'] as bool,
  );
}

void runExperiment(String dbPath, {bool overwrite = true}) {
  dbPath = File(dbPath).absolute.path;
  initializeComApartment();

  Dispatcher? access;
  Dispatcher? db;
  Dispatcher? tableDefs;

  try {
    final file = File(dbPath);
    file.parent.createSync(recursive: true);
    terminateProcessesByExecutableName('MSACCESS.EXE');
    if (file.existsSync()) {
      if (!overwrite) {
        throw StateError('Arquivo ja existe: $dbPath');
      }
      file.deleteSync();
    }

    access = createDispatcher(_accessProgIds);
    setProperty(access, 'Visible', false);
    invokeMethod(access, 'NewCurrentDatabase', [dbPath]);
    db = invokeDispatchMethod(access, 'CurrentDb');
    tableDefs = getDispatchProperty(db, 'TableDefs');

    _createAfterAppendVariant(db, tableDefs);
    _createBeforeAppendVariant(db, tableDefs);
    _createTextControlVariant(db, tableDefs);

    invokeMethod(db, 'Execute', [
      'INSERT INTO CalcAfterAppendNumeric (ID, Quantidade, PrecoUnitario) VALUES (1, 3, 10.5)'
    ]);
    invokeMethod(db, 'Execute', [
      'INSERT INTO CalcBeforeAppendNumeric (ID, Quantidade, PrecoUnitario) VALUES (1, 3, 10.5)'
    ]);
    invokeMethod(db, 'Execute', [
      'INSERT INTO CalcTextControl (ID, Quantidade, PrecoUnitario) VALUES (1, 3, 10.5)'
    ]);

    invokeMethod(access, 'CloseCurrentDatabase');
    invokeMethod(access, 'Quit');

    stdout.writeln('Experimento criado em: $dbPath');
    stdout.writeln('Tabelas: CalcAfterAppendNumeric, CalcBeforeAppendNumeric, CalcTextControl');
  } finally {
    releaseDispatcher(tableDefs);
    releaseDispatcher(db);
    releaseDispatcher(access);
    CoUninitialize();
    sleep(const Duration(milliseconds: 1500));
    terminateProcessesByExecutableName('MSACCESS.EXE');
  }
}

void _createAfterAppendVariant(Dispatcher db, Dispatcher tableDefs) {
  Dispatcher? tableDef;
  Dispatcher? fields;
  Dispatcher? idField;
  Dispatcher? qtdField;
  Dispatcher? priceField;
  Dispatcher? totalField;
  try {
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['CalcAfterAppendNumeric']);
    fields = getDispatchProperty(tableDef, 'Fields');

    idField = _createField(tableDef, fields, 'ID', _dbLong, required: true);
    qtdField = _createField(tableDef, fields, 'Quantidade', _dbLong, required: true);
    priceField = _createField(tableDef, fields, 'PrecoUnitario', _dbCurrency, required: true);
    totalField = _createField(tableDef, fields, 'Total', _dbNumeric, precision: 18, scale: 4);

    invokeMethod(tableDefs, 'Append', [tableDef]);

    _setPropertyIfPossible(totalField, 'Expression', '([Quantidade] * [PrecoUnitario])');
    _setPropertyIfPossible(totalField, 'ResultType', _dbNumeric);
    _setPropertyIfPossible(totalField, 'DecimalPlaces', 4);
    _setPropertyIfPossible(totalField, 'Caption', 'Total');
  } finally {
    releaseDispatcher(totalField);
    releaseDispatcher(priceField);
    releaseDispatcher(qtdField);
    releaseDispatcher(idField);
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
  }
}

void _createBeforeAppendVariant(Dispatcher db, Dispatcher tableDefs) {
  Dispatcher? tableDef;
  Dispatcher? fields;
  Dispatcher? idField;
  Dispatcher? qtdField;
  Dispatcher? priceField;
  Dispatcher? totalField;
  try {
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['CalcBeforeAppendNumeric']);
    fields = getDispatchProperty(tableDef, 'Fields');

    idField = _createField(tableDef, fields, 'ID', _dbLong, required: true);
    qtdField = _createField(tableDef, fields, 'Quantidade', _dbLong, required: true);
    priceField = _createField(tableDef, fields, 'PrecoUnitario', _dbCurrency, required: true);
    totalField = invokeDispatchMethod(tableDef, 'CreateField', ['Total', _dbNumeric]);

    _setPropertyIfPossible(totalField, 'Precision', 18);
    _setPropertyIfPossible(totalField, 'Scale', 4);
    _setPropertyIfPossible(totalField, 'Expression', '([Quantidade] * [PrecoUnitario])');
    _setPropertyIfPossible(totalField, 'ResultType', _dbNumeric);
    _setPropertyIfPossible(totalField, 'DecimalPlaces', 4);
    _setPropertyIfPossible(totalField, 'Caption', 'Total');
    invokeMethod(fields, 'Append', [totalField]);

    invokeMethod(tableDefs, 'Append', [tableDef]);
  } finally {
    releaseDispatcher(totalField);
    releaseDispatcher(priceField);
    releaseDispatcher(qtdField);
    releaseDispatcher(idField);
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
  }
}

void _createTextControlVariant(Dispatcher db, Dispatcher tableDefs) {
  Dispatcher? tableDef;
  Dispatcher? fields;
  Dispatcher? idField;
  Dispatcher? qtdField;
  Dispatcher? priceField;
  Dispatcher? totalField;
  try {
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['CalcTextControl']);
    fields = getDispatchProperty(tableDef, 'Fields');

    idField = _createField(tableDef, fields, 'ID', _dbLong, required: true);
    qtdField = _createField(tableDef, fields, 'Quantidade', _dbLong, required: true);
    priceField = _createField(tableDef, fields, 'PrecoUnitario', _dbCurrency, required: true);
    totalField = _createField(tableDef, fields, 'TotalTexto', _dbText, size: 255);

    invokeMethod(tableDefs, 'Append', [tableDef]);

    _setPropertyIfPossible(totalField, 'Expression', '([Quantidade] * [PrecoUnitario])');
    _setPropertyIfPossible(totalField, 'ResultType', _dbNumeric);
    _setPropertyIfPossible(totalField, 'Caption', 'Total texto');
  } finally {
    releaseDispatcher(totalField);
    releaseDispatcher(priceField);
    releaseDispatcher(qtdField);
    releaseDispatcher(idField);
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
  }
}

Dispatcher _createField(
  Dispatcher tableDef,
  Dispatcher fields,
  String name,
  int type, {
  int? size,
  bool? required,
  int? precision,
  int? scale,
}) {
  final args = <Object?>[name, type];
  if (size != null) {
    args.add(size);
  }
  final field = invokeDispatchMethod(tableDef, 'CreateField', args);
  try {
    if (required != null) {
      _setPropertyIfPossible(field, 'Required', required);
    }
    if (precision != null) {
      _setPropertyIfPossible(field, 'Precision', precision);
    }
    if (scale != null) {
      _setPropertyIfPossible(field, 'Scale', scale);
    }
    invokeMethod(fields, 'Append', [field]);
    return field;
  } catch (_) {
    releaseDispatcher(field);
    rethrow;
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
    return _dbBoolean;
  }
  if (value is int) {
    return _dbLong;
  }
  return _dbText;
}