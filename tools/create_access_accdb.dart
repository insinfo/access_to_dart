import 'dart:io';

import 'package:args/args.dart';
import 'package:win32/win32.dart';

import '_com_automation.dart';

const _defaultProviders = <String>[
  'Microsoft.ACE.OLEDB.16.0',
  'Microsoft.ACE.OLEDB.12.0',
];

const _defaultCatalogProgIds = <String>[
  'ADOX.Catalog',
  'ADOX.Catalog.6.0',
];

const _accessProgIds = <String>[
  'Access.Application',
];

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Caminho do arquivo .accdb a ser criado.',
      defaultsTo: r'C:\Temp\demo_access.accdb',
    )
    ..addOption(
      'table',
      help: 'Nome da tabela de exemplo.',
      defaultsTo: 'Users',
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

  final outputPath = args['output'] as String;
  final tableName = args['table'] as String;
  final overwrite = args['overwrite'] as bool;

  createAccessDatabase(
    outputPath,
    tableName: tableName,
    overwrite: overwrite,
  );
}

void createAccessDatabase(
  String dbPath, {
  String tableName = 'Users',
  bool overwrite = true,
}) {
  initializeComApartment();

  Dispatcher? catalog;
  Dispatcher? connection;
  Dispatcher? access;

  try {
    final file = File(dbPath);
    file.parent.createSync(recursive: true);

    if (file.existsSync()) {
      if (!overwrite) {
        throw StateError('O arquivo ja existe: $dbPath');
      }
      file.deleteSync();
    }

    String provider;
    try {
      catalog = createDispatcher(_defaultCatalogProgIds);
      provider = _createAccdb(catalog, dbPath);
      connection = getDispatchProperty(catalog, 'ActiveConnection');
      _seedDemoTable(connection, tableName);
      invokeMethod(connection, 'Close');
    } catch (error) {
      connection?.dispose();
      connection = null;
      catalog?.dispose();
      catalog = null;

      try {
        access = createDispatcher(_accessProgIds);
        setProperty(access, 'Visible', false);
        invokeMethod(access, 'NewCurrentDatabase', [dbPath]);
        connection = getDispatchProperty(access, 'CurrentDb');
        _seedDemoTable(connection, tableName);
        invokeMethod(access, 'CloseCurrentDatabase');
        provider = 'Access.Application';

        stdout.writeln(
          'Fallback acionado: provider ACE/ADOX indisponivel no ambiente. Usando Access.Application.',
        );
        stdout.writeln('Erro original do provider: $error');
      } catch (fallbackError) {
        throw StateError(
          'Falha ao criar ACCDB neste ambiente. '
          'Os providers ACE/ADOX nao estao registrados e o ProgID Access.Application tambem nao esta disponivel. '
          'Erro ACE/ADOX: $error. '
          'Erro Access.Application: $fallbackError',
        );
      }
    }

    if (!file.existsSync()) {
      throw StateError('O arquivo nao foi criado em: $dbPath');
    }

    stdout.writeln('Banco criado com sucesso: $dbPath');
    stdout.writeln('Provider utilizado: $provider');
    stdout.writeln('Tabela criada: $tableName');
  } finally {
    releaseDispatcher(access);
    releaseDispatcher(connection);
    releaseDispatcher(catalog);
    CoUninitialize();
  }
}

void _seedDemoTable(Dispatcher connection, String tableName) {
  invokeMethod(connection, 'Execute', [
    'CREATE TABLE $tableName ('
        'UserID COUNTER PRIMARY KEY, '
        'UserName TEXT(100), '
        'CreatedAt DATETIME'
        ')'
  ]);

  invokeMethod(connection, 'Execute', [
    "INSERT INTO $tableName (UserName, CreatedAt) VALUES ('Alice', Now())"
  ]);
  invokeMethod(connection, 'Execute', [
    "INSERT INTO $tableName (UserName, CreatedAt) VALUES ('Bruno', Now())"
  ]);
}

String _createAccdb(Dispatcher catalog, String dbPath) {
  Object? lastError;
  for (final provider in _defaultProviders) {
    final connectionString = 'Provider=$provider;Data Source=$dbPath;';
    try {
      invokeMethod(catalog, 'Create', [connectionString]);
      return provider;
    } catch (error) {
      lastError = error;
    }
  }

  throw StateError(
    'Falha ao criar ACCDB com os providers testados: '
    '${_defaultProviders.join(', ')}. Ultimo erro: $lastError',
  );
}
