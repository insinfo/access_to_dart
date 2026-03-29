import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const _accessProgIds = <String>['Access.Application'];

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Caminho do arquivo .accdb a ser criado.',
      defaultsTo: r'C:\Temp\property_map_fixture.accdb',
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

  createAccessPropertyMapFixture(
    args['output'] as String,
    visibleAtEnd: args['visible'] as bool,
    overwrite: args['overwrite'] as bool,
  );
}

void createAccessPropertyMapFixture(
  String dbPath, {
  bool visibleAtEnd = false,
  bool overwrite = true,
}) {
  dbPath = File(dbPath).absolute.path;
  initializeComApartment();

  Dispatcher? access;
  Dispatcher? db;
  Dispatcher? tableDefs;
  Dispatcher? tableDef;
  Dispatcher? fields;
  final persistedFields = <String, Dispatcher>{};

  final specs = <_FieldSpec>[
    const _FieldSpec(
      name: 'ID',
      dataType: 4,
    ),
    const _FieldSpec(
      name: 'Nome',
      dataType: 10,
      size: 80,
      required: true,
      allowZeroLength: false,
      defaultValue: '"SEM NOME"',
      validationRule: 'Len([Nome] & "") >= 3',
      validationText: 'Informe ao menos 3 caracteres no nome.',
      caption: 'Nome completo',
      description: 'Nome civil do cliente.',
      format: '>',
    ),
    const _FieldSpec(
      name: 'CPF',
      dataType: 10,
      size: 14,
      required: true,
      allowZeroLength: false,
      validationRule: 'Like "###.###.###-##"',
      validationText: 'CPF deve seguir o padrao 000.000.000-00.',
      caption: 'CPF',
      description: 'Documento CPF com mascara nacional.',
      format: '@@@@@@@@@@@@@@',
      inputMask: r'000\.000\.000\-00;0;_',
    ),
    const _FieldSpec(
      name: 'CEP',
      dataType: 10,
      size: 9,
      required: false,
      allowZeroLength: false,
      defaultValue: '"74000-000"',
      validationRule: 'Like "#####-###"',
      validationText: 'CEP deve seguir o padrao 00000-000.',
      caption: 'CEP residencial',
      inputMask: r'00000\-000;0;_',
    ),
    const _FieldSpec(
      name: 'UF',
      dataType: 10,
      size: 2,
      required: true,
      allowZeroLength: false,
      defaultValue: '"GO"',
      validationRule: 'In ("GO","SP","RJ","MG")',
      validationText: 'UF deve estar entre GO, SP, RJ ou MG.',
      caption: 'UF',
      format: '>',
      inputMask: '>LL',
    ),
    const _FieldSpec(
      name: 'DataNascimento',
      dataType: 8,
      defaultValue: 'Date()',
      validationRule: '<=Date()',
      validationText: 'A data nao pode estar no futuro.',
      caption: 'Nascimento',
      description: 'Data de nascimento do cliente.',
      format: 'dd/mm/yyyy',
      inputMask: '99/99/0000',
    ),
    const _FieldSpec(
      name: 'Salario',
      dataType: 5,
      defaultValue: '0',
      validationRule: '>=0',
      validationText: 'Salario nao pode ser negativo.',
      caption: 'Salario base',
      description: 'Valor de renda mensal informado.',
      decimalPlaces: 2,
      format: 'Currency',
    ),
    const _FieldSpec(
      name: 'Ativo',
      dataType: 1,
      defaultValue: 'True',
      caption: 'Registro ativo',
      format: 'Yes/No',
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

    tableDefs = getDispatchProperty(db, 'TableDefs');
    tableDef = invokeDispatchMethod(db, 'CreateTableDef', ['Clientes']);
    fields = getDispatchProperty(tableDef, 'Fields');

    // 1) Propriedades DAO/engine:
    //    setar ANTES do Fields.Append.
    for (final spec in specs) {
      persistedFields[spec.name] = _appendFieldWithDaoProperties(
        tableDef,
        fields,
        spec,
      );
    }

    // 2) Persiste a tabela.
    invokeMethod(tableDefs, 'Append', [tableDef]);

    _applyTableDaoProperties(
      tableDef,
      validationRule: '[Salario] >= 0',
      validationText: 'Os registros da tabela Clientes exigem salario nao negativo.',
    );

    // Opcional, mas deixa a coleção consistente para reacesso.
    try {
      invokeMethod(tableDefs, 'Refresh');
    } catch (_) {
      // Nem toda automacao expoe Refresh do jeito esperado.
    }

    // 3) Propriedades definidas pelo Access (UI/metadata):
    //    setar DEPOIS que a tabela ja existe.
    for (final spec in specs) {
      final persistedField = persistedFields[spec.name];
      if (persistedField == null) {
        throw StateError('Campo persistido nao encontrado: ${spec.name}');
      }
      _applyAccessDefinedFieldProperties(persistedField, spec);
    }

    invokeMethod(db, 'Execute', [
      "INSERT INTO Clientes (ID, Nome, CPF, CEP, UF, DataNascimento, Salario, Ativo) VALUES "
          "(1, 'Ana Souza', '529.982.247-25', '74000-000', 'GO', #1991-02-03#, 1234.56, True)"
    ]);

    if (visibleAtEnd) {
      setProperty(access, 'Visible', true);
    } else {
      invokeMethod(access, 'CloseCurrentDatabase');
      invokeMethod(access, 'Quit');
    }

    stdout.writeln('Banco de fixture PropertyMap criado com sucesso em: $dbPath');
    stdout.writeln('Tabela Clientes criada com ValidationRule, ValidationText, DefaultValue, Caption, Description, DecimalPlaces, Format, InputMask e AllowZeroLength.');
  } finally {
    for (final field in persistedFields.values) {
      releaseDispatcher(field);
    }
    releaseDispatcher(fields);
    releaseDispatcher(tableDef);
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
    // Estas sao propriedades do mecanismo DAO.
    if (spec.required != null) {
      setProperty(field, 'Required', spec.required);
    }
    if (spec.allowZeroLength != null) {
      setProperty(field, 'AllowZeroLength', spec.allowZeroLength);
    }
    if (spec.defaultValue != null) {
      setProperty(field, 'DefaultValue', spec.defaultValue);
    }
    if (spec.validationRule != null) {
      setProperty(field, 'ValidationRule', spec.validationRule);
    }
    if (spec.validationText != null) {
      setProperty(field, 'ValidationText', spec.validationText);
    }
    invokeMethod(fields, 'Append', [field]);
    return field;
  } catch (e, s) {
    stderr.writeln(
      'Falha ao criar/configurar o campo DAO ${spec.name}: $e\n$s',
    );
    releaseDispatcher(field);
    rethrow;
  }
}

void _applyTableDaoProperties(
  Dispatcher tableDef, {
  String? validationRule,
  String? validationText,
}) {
  if (validationRule != null) {
    setProperty(tableDef, 'ValidationRule', validationRule);
  }
  if (validationText != null) {
    setProperty(tableDef, 'ValidationText', validationText);
  }
}

void _applyAccessDefinedFieldProperties(
  Dispatcher field,
  _FieldSpec spec,
) {
  if (spec.caption == null &&
      spec.description == null &&
      spec.decimalPlaces == null &&
      spec.format == null &&
      spec.inputMask == null) {
    return;
  }

  if (spec.caption != null) {
    _setAccessDefinedFieldProperty(
      field,
      'Caption',
      12,
      spec.caption,
    );
  }

  if (spec.description != null) {
    _setAccessDefinedFieldProperty(
      field,
      'Description',
      12,
      spec.description,
    );
  }

  if (spec.decimalPlaces != null) {
    _setAccessDefinedFieldProperty(
      field,
      'DecimalPlaces',
      2,
      spec.decimalPlaces,
    );
  }

  if (spec.format != null) {
    _setAccessDefinedFieldProperty(
      field,
      'Format',
      10,
      spec.format,
    );
  }

  if (spec.inputMask != null) {
    _setAccessDefinedFieldProperty(
      field,
      'InputMask',
      10,
      spec.inputMask,
    );
  }
}

void _setAccessDefinedFieldProperty(
  Dispatcher field,
  String propertyName,
  int dataType,
  Object? value,
) {
  // Se ja existir, define direto.
  try {
    setProperty(field, propertyName, value);
    return;
  } catch (_) {
    // segue para CreateProperty
  }

  Dispatcher? properties;
  Dispatcher? property;
  try {
    properties = getDispatchProperty(field, 'Properties');
    property = invokeDispatchMethod(
      field,
      'CreateProperty',
      [propertyName, dataType, value],
    );
    invokeMethod(properties, 'Append', [property]);
  } catch (e, s) {
    stderr.writeln(
      'Falha ao criar/configurar propriedade Access $propertyName: $e\n$s',
    );
    rethrow;
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
  final bool? allowZeroLength;
  final String? defaultValue;
  final String? validationRule;
  final String? validationText;
  final String? caption;
  final String? description;
  final int? decimalPlaces;
  final String? format;
  final String? inputMask;

  const _FieldSpec({
    required this.name,
    required this.dataType,
    this.size,
    this.required,
    this.allowZeroLength,
    this.defaultValue,
    this.validationRule,
    this.validationText,
    this.caption,
    this.description,
    this.decimalPlaces,
    this.format,
    this.inputMask,
  });
}