import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

/// A successful compiler process alone does not prove a deployable output.
Future<void> main(List<String> args) async {
  if (args.length != 1) {
    stderr.writeln('Usage: dart run tools/verify_frontend_output.dart OUTPUT');
    exitCode = 64;
    return;
  }
  final root = p.normalize(p.absolute(args.single));
  final missing = <String>[];
  final manifest = File(p.join(root, '.build.manifest'));
  if (!await manifest.exists()) {
    stderr.writeln('Missing .build.manifest in $root');
    exitCode = 1;
    return;
  }
  final entries =
      (await manifest.readAsLines()).where((s) => s.isNotEmpty).toList();
  if (entries.isEmpty ||
      !entries.contains('index.html') ||
      !entries.contains('main.dart.js')) {
    stderr.writeln('Invalid release manifest: missing entrypoints.');
    exitCode = 1;
    return;
  }
  for (final entry in entries) {
    final file = p.normalize(p.join(root, entry));
    if (!p.isWithin(root, file) || !await File(file).exists()) {
      missing.add(entry);
    }
  }
  for (final required in ['index.html', 'main.dart.js']) {
    final file = File(p.join(root, required));
    if (!await file.exists() || await file.length() == 0) {
      if (!missing.contains(required)) missing.add(required);
    }
  }
  stdout.writeln(const JsonEncoder.withIndent('  ').convert({
    'manifestEntries': entries.length,
    'missingOrEmpty': missing,
    'status': missing.isEmpty ? 'passed' : 'failed',
  }));
  if (missing.isNotEmpty) exitCode = 1;
}
