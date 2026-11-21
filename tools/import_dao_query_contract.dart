import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:crypto/crypto.dart';
import 'package:access_to_dart/src/access_query_contract.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('analysis', mandatory: true)
    ..addOption('shape', mandatory: true)
    ..addOption('source', mandatory: true)
    ..addOption('output', mandatory: true)
    ..addFlag('ascii-case-insensitive-text',
        defaultsTo: false, negatable: false);
  try {
    final args = parser.parse(arguments);
    final analysis =
        jsonDecode(await File(args['analysis'] as String).readAsString())
            as Map<String, dynamic>;
    final source = File(args['source'] as String);
    final sourcePath = await source.resolveSymbolicLinks();
    final sources = [
      analysis['source'],
      (analysis['backend_analysis'] as Map?)?['source']
    ].whereType<String>();
    var matched = false;
    for (final path in sources) {
      if (await File(path).resolveSymbolicLinks() == sourcePath) matched = true;
    }
    if (!matched) {
      throw FormatException(
          'Source file is not a source recorded in the analysis');
    }
    final shape = jsonDecode(await File(args['shape'] as String).readAsString())
        as Map<String, dynamic>;
    final digest = await sha256.bind(source.openRead()).first;
    attachDaoQueryContract(analysis, shape,
        actualSourceHash: digest.toString(),
        asciiCaseInsensitiveText: args['ascii-case-insensitive-text'] as bool);
    final output = File(args['output'] as String);
    await output.parent.create(recursive: true);
    await output.writeAsString(jsonEncode(analysis));
    stdout.writeln('DAO query contract imported and validated.');
  } catch (error) {
    stderr.writeln('Query contract import rejected: $error');
    exitCode = 65;
  }
}
