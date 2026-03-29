import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const _accessProgIds = <String>['Access.Application'];
const _dbBoolean = 1;
const _dbLong = 4;
const _dbText = 10;

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Caminho do arquivo .accdb a ser criado.',
      defaultsTo: r'C:\Temp\combo_fixture.accdb',
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

  createAccessComboFixture(
    args['output'] as String,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createAccessComboFixture(
  String dbPath, {
  bool visibleAtEnd = false,
  bool overwrite = true,
}) {
  dbPath = File(dbPath).absolute.path;
  initializeComApartment();

  Dispatcher? access;
  Dispatcher? db;
  Dispatcher? tableDefs;
  Dispatcher? lookupTable;
  Dispatcher? comboTable;
  final lookupFields = <String, Dispatcher>{};
  final comboFields = <String, Dispatcher>{};

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
    tableDefs = getDispatchProperty(db, 'TableDefs');

    lookupTable = invokeDispatchMethod(db, 'CreateTableDef', ['PessoasLookup']);
    lookupFields.addAll(
      _appendTable(
        tableDefs: tableDefs,
        tableDef: lookupTable,
        specs: const <_FieldSpec>[
          _FieldSpec(name: 'ID', dataType: _dbLong, required: true),
          _FieldSpec(name: 'Nome', dataType: _dbText, size: 80, required: true),
        ],
      ),
    );

    comboTable = invokeDispatchMethod(db, 'CreateTableDef', ['ComboMetadados']);
    comboFields.addAll(
      _appendTable(
        tableDefs: tableDefs,
        tableDef: comboTable,
        specs: const <_FieldSpec>[
          _FieldSpec(name: 'ID', dataType: _dbLong, required: true),
          _FieldSpec(
            name: 'Categoria',
            dataType: _dbText,
            size: 40,
            caption: 'Categoria',
            displayControl: 111,
            rowSourceType: 'Value List',
            rowSource: '"Ativo";"Inativo";"Pendente"',
          ),
          _FieldSpec(
            name: 'PessoaSelecionada',
            dataType: _dbLong,
            caption: 'Pessoa selecionada',
            displayControl: 111,
            rowSourceType: 'Table/Query',
            rowSource:
                'SELECT [PessoasLookup].[ID], [PessoasLookup].[Nome] FROM PessoasLookup ORDER BY [Nome];',
          ),
          _FieldSpec(
            name: 'Tags',
            dataType: _dbText,
            size: 255,
            caption: 'Tags',
            displayControl: 111,
            allowMultipleValues: true,
            rowSourceType: 'Value List',
            rowSource: '"Urgente";"Revisao";"Concluido"',
          ),
        ],
      ),
    );

    invokeMethod(db, 'Execute', [
      "INSERT INTO PessoasLookup (ID, Nome) VALUES (1, 'Ana Souza')"
    ]);
    invokeMethod(db, 'Execute', [
      "INSERT INTO PessoasLookup (ID, Nome) VALUES (2, 'Bruno Lima')"
    ]);
    invokeMethod(db, 'Execute', [
      'INSERT INTO ComboMetadados (ID, Categoria, PessoaSelecionada, Tags) VALUES (1, "Ativo", 1, "Urgente")'
    ]);

    if (visibleAtEnd) {
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }

    stdout.writeln('Banco de fixture de combos criado com sucesso em: $dbPath');
  } finally {
    for (final field in lookupFields.values) {
      releaseDispatcher(field);
    }
    for (final field in comboFields.values) {
      releaseDispatcher(field);
    }
    releaseDispatcher(comboTable);
    releaseDispatcher(lookupTable);
    releaseDispatcher(tableDefs);
    releaseDispatcher(db);
    releaseDispatcher(access);
    CoUninitialize();

    if (!visibleAtEnd) {
      sleep(const Duration(milliseconds: 2500));
      terminateProcessesByExecutableName('MSACCESS.EXE');
    }
  }
}

Map<String, Dispatcher> _appendTable({
  required Dispatcher tableDefs,
  required Dispatcher tableDef,
  required List<_FieldSpec> specs,
}) {
  final fields = getDispatchProperty(tableDef, 'Fields');
  final persistedFields = <String, Dispatcher>{};
  try {
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
    return persistedFields;
  } finally {
    releaseDispatcher(fields);
  }
}

Dispatcher _appendFieldWithDaoProperties(
  Dispatcher tableDef,
  Dispatcher fields,
  _FieldSpec spec,
) {
  final args = <Object?>[spec.name, spec.dataType];
  if (spec.size != null) {
    args.add(spec.size);
  }

  final field = invokeDispatchMethod(tableDef, 'CreateField', args);
  try {
    if (spec.required != null) {
      setProperty(field, 'Required', spec.required);
    }
    invokeMethod(fields, 'Append', [field]);
    return field;
  } catch (_) {
    releaseDispatcher(field);
    rethrow;
  }
}

void _applyAccessDefinedFieldProperties(
  Dispatcher field,
  _FieldSpec spec,
) {
  if (spec.caption != null) {
    _setAccessDefinedFieldProperty(field, 'Caption', 12, spec.caption);
  }
  if (spec.displayControl != null) {
    _setAccessDefinedFieldProperty(field, 'DisplayControl', 3, spec.displayControl);
  }
  if (spec.rowSourceType != null) {
    _setAccessDefinedFieldProperty(field, 'RowSourceType', 10, spec.rowSourceType);
  }
  if (spec.rowSource != null) {
    _setAccessDefinedFieldProperty(field, 'RowSource', 12, spec.rowSource);
  }
  if (spec.allowMultipleValues != null) {
    _setAccessDefinedFieldProperty(
      field,
      'AllowMultipleValues',
      _dbBoolean,
      spec.allowMultipleValues,
    );
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

class _FieldSpec {
  final String name;
  final int dataType;
  final int? size;
  final bool? required;
  final String? caption;
  final int? displayControl;
  final bool? allowMultipleValues;
  final String? rowSourceType;
  final String? rowSource;

  const _FieldSpec({
    required this.name,
    required this.dataType,
    this.size,
    this.required,
    this.caption,
    this.displayControl,
    this.allowMultipleValues,
    this.rowSourceType,
    this.rowSource,
  });
}