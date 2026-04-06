import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption(
      'full-sql',
      help: 'Dump SQL de referencia do Full Convert',
      defaultsTo: 'fixtures/access_siga_struture_end_data.sql',
    )
    ..addOption(
      'seed-sql',
      help: 'Seed SQL gerado pelo migrador',
      defaultsTo: 'build/migration_access_siga_codex_20260405_fix_reader/seed.sql',
    )
    ..addFlag('help', abbr: 'h', help: 'Mostra ajuda', negatable: false);

  final args = parser.parse(arguments);
  if (args['help'] as bool) {
    stdout.writeln(parser.usage);
    return;
  }

  final fullPath = args['full-sql'] as String;
  final seedPath = args['seed-sql'] as String;

  final fullCounts = await _countTables(
    fullPath,
    RegExp(r'^INSERT INTO "public"\."([^"]+)" VALUES \('),
  );
  final seedCounts = await _countTables(
    seedPath,
    RegExp(r'^INSERT INTO "([^"]+)" '),
  );

  final allTables = <String>{...fullCounts.keys, ...seedCounts.keys}.toList()
    ..sort();

  final diffs = <({String table, int full, int seed, int delta})>[];
  for (final table in allTables) {
    final full = fullCounts[table] ?? 0;
    final seed = seedCounts[table] ?? 0;
    if (full != seed) {
      diffs.add((table: table, full: full, seed: seed, delta: seed - full));
    }
  }

  stdout.writeln('fullTables=${fullCounts.length}');
  stdout.writeln('seedTables=${seedCounts.length}');
  stdout.writeln('diffTables=${diffs.length}');
  for (final diff in diffs.take(100)) {
    stdout.writeln(
      '${diff.table}\tfull=${diff.full}\tseed=${diff.seed}\tdelta=${diff.delta}',
    );
  }
  _printClassifiedDiffs(fullCounts, seedCounts);

  await _printKeyDiff(
    fullPath,
    seedPath,
    table: 'tb_atend',
    fullPattern: RegExp(r'^INSERT INTO "public"\."tb_atend" VALUES \(([-]?[0-9]+),'),
    seedPattern: RegExp(r'^INSERT INTO "tb_atend" .*VALUES \(([-]?[0-9]+),'),
  );
  await _printKeyDiff(
    fullPath,
    seedPath,
    table: 'tb_pessoa',
    fullPattern: RegExp(r'^INSERT INTO "public"\."tb_pessoa" VALUES \(([-]?[0-9]+),'),
    seedPattern: RegExp(r'^INSERT INTO "tb_pessoa" .*VALUES \(([-]?[0-9]+),'),
  );
}

Future<Map<String, int>> _countTables(String path, RegExp pattern) async {
  final counts = <String, int>{};
  final lines = File(path)
      .openRead()
      .transform(SystemEncoding().decoder)
      .transform(const LineSplitter());
  await for (final line in lines) {
    final match = pattern.firstMatch(line);
    if (match == null) {
      continue;
    }
    final table = match.group(1)!.toLowerCase();
    counts[table] = (counts[table] ?? 0) + 1;
  }
  return counts;
}

void _printClassifiedDiffs(
  Map<String, int> fullCounts,
  Map<String, int> seedCounts,
) {
  final fullByCanonical = <String, List<MapEntry<String, int>>>{};
  final seedByCanonical = <String, List<MapEntry<String, int>>>{};

  for (final entry in fullCounts.entries) {
    fullByCanonical
        .putIfAbsent(_canonicalTableName(entry.key), () => <MapEntry<String, int>>[])
        .add(entry);
  }
  for (final entry in seedCounts.entries) {
    seedByCanonical
        .putIfAbsent(_canonicalTableName(entry.key), () => <MapEntry<String, int>>[])
        .add(entry);
  }

  final canonicalNames = <String>{
    ...fullByCanonical.keys,
    ...seedByCanonical.keys,
  }.toList()
    ..sort();

  final nameOnlyMatches = <String>[];
  final attachmentOnly = <String>[];
  final unexplained = <String>[];

  for (final canonicalName in canonicalNames) {
    final fullEntries = fullByCanonical[canonicalName] ?? const <MapEntry<String, int>>[];
    final seedEntries = seedByCanonical[canonicalName] ?? const <MapEntry<String, int>>[];
    final fullTotal = fullEntries.fold<int>(0, (sum, entry) => sum + entry.value);
    final seedTotal = seedEntries.fold<int>(0, (sum, entry) => sum + entry.value);

    final fullNames = fullEntries.map((entry) => entry.key).toList(growable: false);
    final seedNames = seedEntries.map((entry) => entry.key).toList(growable: false);

    if (_allAttachmentTables(seedNames) && fullEntries.isEmpty) {
      attachmentOnly.add(
        '${seedNames.join(', ')} seed=$seedTotal (tabela sintetica de attachment)',
      );
      continue;
    }

    if (fullTotal == seedTotal &&
        fullEntries.isNotEmpty &&
        seedEntries.isNotEmpty &&
        !_sameNameList(fullNames, seedNames)) {
      nameOnlyMatches.add(
        '${fullNames.join(', ')} => ${seedNames.join(', ')} count=$seedTotal',
      );
      continue;
    }

    if (fullTotal != seedTotal ||
        (fullEntries.isNotEmpty && seedEntries.isNotEmpty && !_sameNameList(fullNames, seedNames))) {
      unexplained.add(
        'canonical=$canonicalName full=[${fullNames.join(', ')}:$fullTotal] seed=[${seedNames.join(', ')}:$seedTotal]',
      );
    }
  }

  stdout.writeln('classifiedDiffs:');
  stdout.writeln('  nameOnly=${nameOnlyMatches.length}');
  for (final item in nameOnlyMatches) {
    stdout.writeln('  nameOnly: $item');
  }
  stdout.writeln('  attachmentOnly=${attachmentOnly.length}');
  for (final item in attachmentOnly) {
    stdout.writeln('  attachmentOnly: $item');
  }
  stdout.writeln('  unexplained=${unexplained.length}');
  for (final item in unexplained) {
    stdout.writeln('  unexplained: $item');
  }
}

String _canonicalTableName(String value) {
  final normalized = _repairCommonMojibake(value);
  final repaired = _repairMojibake(normalized);
  final ascii = _foldToAscii(_repairCommonMojibake(repaired)).toLowerCase();
  final buffer = StringBuffer();
  for (final codeUnit in ascii.codeUnits) {
    final isLetter = codeUnit >= 97 && codeUnit <= 122;
    final isDigit = codeUnit >= 48 && codeUnit <= 57;
    if (isLetter || isDigit) {
      buffer.writeCharCode(codeUnit);
    }
  }
  return buffer.toString();
}

String _repairCommonMojibake(String value) {
  return value
      .replaceAll('ã§ã£', 'ca')
      .replaceAll('Ã§Ã£', 'ca')
      .replaceAll('ã§', 'c')
      .replaceAll('Ã§', 'c')
      .replaceAll('ã£', 'a')
      .replaceAll('Ã£', 'a')
      .replaceAll('ã¡', 'a')
      .replaceAll('Ã¡', 'a')
      .replaceAll('ã©', 'e')
      .replaceAll('Ã©', 'e')
      .replaceAll('ã­', 'i')
      .replaceAll('Ã­', 'i')
      .replaceAll('ã³', 'o')
      .replaceAll('Ã³', 'o')
      .replaceAll('ãº', 'u')
      .replaceAll('Ãº', 'u');
}

String _repairMojibake(String value) {
  try {
    return utf8.decode(latin1.encode(value), allowMalformed: true);
  } catch (_) {
    return value;
  }
}

String _foldToAscii(String value) {
  final buffer = StringBuffer();
  for (final rune in value.runes) {
    switch (rune) {
      case 0x00C0:
      case 0x00C1:
      case 0x00C2:
      case 0x00C3:
      case 0x00C4:
      case 0x00C5:
      case 0x00E0:
      case 0x00E1:
      case 0x00E2:
      case 0x00E3:
      case 0x00E4:
      case 0x00E5:
        buffer.write('a');
      case 0x00C7:
      case 0x00E7:
        buffer.write('c');
      case 0x00C8:
      case 0x00C9:
      case 0x00CA:
      case 0x00CB:
      case 0x00E8:
      case 0x00E9:
      case 0x00EA:
      case 0x00EB:
        buffer.write('e');
      case 0x00CC:
      case 0x00CD:
      case 0x00CE:
      case 0x00CF:
      case 0x00EC:
      case 0x00ED:
      case 0x00EE:
      case 0x00EF:
        buffer.write('i');
      case 0x00D1:
      case 0x00F1:
        buffer.write('n');
      case 0x00D2:
      case 0x00D3:
      case 0x00D4:
      case 0x00D5:
      case 0x00D6:
      case 0x00F2:
      case 0x00F3:
      case 0x00F4:
      case 0x00F5:
      case 0x00F6:
        buffer.write('o');
      case 0x00D9:
      case 0x00DA:
      case 0x00DB:
      case 0x00DC:
      case 0x00F9:
      case 0x00FA:
      case 0x00FB:
      case 0x00FC:
        buffer.write('u');
      case 0x00DD:
      case 0x00FD:
      case 0x00FF:
        buffer.write('y');
      default:
        buffer.write(String.fromCharCode(rune));
    }
  }
  return buffer.toString();
}

bool _allAttachmentTables(List<String> names) {
  return names.isNotEmpty && names.every((name) => name.endsWith('_attachment'));
}

bool _sameNameList(List<String> left, List<String> right) {
  if (left.length != right.length) {
    return false;
  }
  for (var i = 0; i < left.length; i++) {
    if (left[i] != right[i]) {
      return false;
    }
  }
  return true;
}

Future<void> _printKeyDiff(
  String fullPath,
  String seedPath, {
  required String table,
  required RegExp fullPattern,
  required RegExp seedPattern,
}) async {
  final fullKeys = await _extractKeys(fullPath, fullPattern);
  final seedKeys = await _extractKeys(seedPath, seedPattern);
  final missingInSeed = fullKeys.difference(seedKeys).toList()..sort();
  final extraInSeed = seedKeys.difference(fullKeys).toList()..sort();
  stdout.writeln('keyDiff:$table');
  stdout.writeln('  missingInSeed=${missingInSeed.length}');
  stdout.writeln('  extraInSeed=${extraInSeed.length}');
  stdout.writeln(
    '  missingSample=${missingInSeed.take(20).join(', ')}',
  );
  stdout.writeln(
    '  extraSample=${extraInSeed.take(20).join(', ')}',
  );
}

Future<Set<int>> _extractKeys(String path, RegExp pattern) async {
  final keys = <int>{};
  final lines = File(path)
      .openRead()
      .transform(SystemEncoding().decoder)
      .transform(const LineSplitter());
  await for (final line in lines) {
    final match = pattern.firstMatch(line);
    if (match == null) {
      continue;
    }
    final raw = match.group(1);
    final value = raw == null ? null : int.tryParse(raw);
    if (value != null) {
      keys.add(value);
    }
  }
  return keys;
}