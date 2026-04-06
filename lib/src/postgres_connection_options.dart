import 'package:dpgsql/dpgsql.dart';

class PostgresConnectionOptions {
  final String host;
  final int port;
  final String database;
  final String username;
  final String? password;
  final SslMode? sslMode;

  const PostgresConnectionOptions({
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
    required this.sslMode,
  });

  PostgresConnectionOptions copyWith({
    String? host,
    int? port,
    String? database,
    String? username,
    String? password,
    SslMode? sslMode,
  }) {
    return PostgresConnectionOptions(
      host: host ?? this.host,
      port: port ?? this.port,
      database: database ?? this.database,
      username: username ?? this.username,
      password: password ?? this.password,
      sslMode: sslMode ?? this.sslMode,
    );
  }

  PostgresConnectionOptions forAdminDatabase([String databaseName = 'postgres']) {
    return copyWith(database: databaseName);
  }

  factory PostgresConnectionOptions.parse(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) {
      throw const FormatException('Empty PostgreSQL connection string.');
    }

    if (trimmed.startsWith('postgres://') ||
        trimmed.startsWith('postgresql://')) {
      return _fromUri(Uri.parse(trimmed));
    }

    return _fromKeyValuePairs(trimmed);
  }

  String toDpgsqlConnectionString() {
    final parts = <String>[
      'Host=$host',
      'Port=$port',
      'Database=$database',
      'Username=$username',
    ];
    if (password != null) {
      parts.add('Password=$password');
    }
    final sslMode = this.sslMode;
    if (sslMode != null) {
      parts.add('SSL Mode=${_dpgsqlSslMode(sslMode)}');
    }
    return parts.join(';');
  }

  static PostgresConnectionOptions _fromUri(Uri uri) {
    final username = uri.userInfo.contains(':')
        ? uri.userInfo.split(':').first
        : uri.userInfo;
    final password = uri.userInfo.contains(':')
        ? uri.userInfo.substring(uri.userInfo.indexOf(':') + 1)
        : null;
    final database = uri.pathSegments.isEmpty
        ? uri.path.replaceFirst('/', '')
        : uri.pathSegments.last;

    return PostgresConnectionOptions(
      host: uri.host,
      port: uri.hasPort ? uri.port : 5432,
      database: database,
      username: username,
      password: password,
      sslMode: _parseSslMode(uri.queryParameters['sslmode']),
    ).._validate();
  }

  static PostgresConnectionOptions _fromKeyValuePairs(String value) {
    final parts = _splitKeyValueTokens(value);
    final data = <String, String>{};
    for (final part in parts) {
      final separator = part.indexOf('=');
      if (separator <= 0) {
        throw FormatException(
          'Invalid PostgreSQL connection token "$part". Use key=value.',
        );
      }
      final key = part.substring(0, separator).trim().toLowerCase();
      final rawValue = part.substring(separator + 1).trim();
      data[key] = _stripQuotes(rawValue);
    }

    final options = PostgresConnectionOptions(
      host: data['host'] ?? data['server'] ?? '',
      port: int.tryParse(data['port'] ?? '') ?? 5432,
      database: data['database'] ?? data['dbname'] ?? '',
      username: data['user'] ?? data['username'] ?? '',
      password: data['password'],
      sslMode: _parseSslMode(data['sslmode']),
    );
    options._validate();
    return options;
  }

  void _validate() {
    if (host.isEmpty) {
      throw const FormatException('PostgreSQL host is required.');
    }
    if (database.isEmpty) {
      throw const FormatException('PostgreSQL database is required.');
    }
    if (username.isEmpty) {
      throw const FormatException('PostgreSQL username is required.');
    }
  }

  static List<String> _splitKeyValueTokens(String input) {
    final result = <String>[];
    final buffer = StringBuffer();
    String? quote;

    for (var index = 0; index < input.length; index++) {
      final char = input[index];
      final isSeparator = char == ';' || (quote == null && _isWhitespace(char));

      if ((char == '"' || char == '\'') && quote == null) {
        quote = char;
        buffer.write(char);
        continue;
      }

      if (quote != null && char == quote) {
        buffer.write(char);
        quote = null;
        continue;
      }

      if (isSeparator) {
        final token = buffer.toString().trim();
        if (token.isNotEmpty) {
          result.add(token);
        }
        buffer.clear();
        continue;
      }

      buffer.write(char);
    }

    final tail = buffer.toString().trim();
    if (tail.isNotEmpty) {
      result.add(tail);
    }

    return result;
  }

  static bool _isWhitespace(String char) {
    return char == ' ' || char == '\n' || char == '\r' || char == '\t';
  }

  static String _stripQuotes(String input) {
    if (input.length >= 2) {
      final first = input[0];
      final last = input[input.length - 1];
      if ((first == '"' && last == '"') || (first == '\'' && last == '\'')) {
        return input.substring(1, input.length - 1);
      }
    }
    return input;
  }

  static SslMode? _parseSslMode(String? value) {
    switch (value?.trim().toLowerCase()) {
      case null:
      case '':
        return null;
      case 'disable':
        return SslMode.disable;
      case 'verify-full':
      case 'verify_full':
      case 'verifyfull':
      case 'full':
        return SslMode.verifyFull;
      case 'prefer':
        return SslMode.prefer;
      case 'allow':
        return SslMode.allow;
      case 'require':
        return SslMode.require;
      default:
        return null;
    }
  }

  static String _dpgsqlSslMode(SslMode value) {
    return switch (value) {
      SslMode.disable => 'Disable',
      SslMode.allow => 'Allow',
      SslMode.prefer => 'Prefer',
      SslMode.require => 'Require',
      SslMode.verifyCa => 'VerifyCA',
      SslMode.verifyFull => 'VerifyFull',
    };
  }
}
