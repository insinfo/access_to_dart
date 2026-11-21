import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';
import 'package:access_to_dart/src/analysis_overlay_merger.dart';

Future<void> main(List<String> args) async {
  if (args.length != 3) {
    stderr.writeln(
        'Usage: dart run tools/generate_openform_validation_slice.dart ANALYSIS SRC OUTPUT');
    exitCode = 64;
    return;
  }
  final raw =
      jsonDecode(await File(args[0]).readAsString()) as Map<String, dynamic>;
  final source = await AccessSrcReader().readDirectory(args[1]);
  AnalysisOverlayMerger().mergeSourceOverlay(raw, source);
  raw['source_overlay'] = source.toJson();
  const selected = {
    'TbAtend',
    'TbBeneficioEmergencial',
    'TbBeneficiosMunicipais',
    'TbEncaminhamento'
  };
  raw['tables'] = (raw['tables'] as List)
      .cast<Map>()
      .where((t) => selected.contains(t['name']))
      .toList();
  for (final t in raw['tables'] as List) {
    t['sampleRows'] = [];
  }
  raw['linkedTables'] = [];
  raw['relationships'] = [];
  await Directory(args[2]).create(recursive: true);
  await File('${args[2]}/analysis.json').writeAsString(jsonEncode(raw));
  exitCode = await run([
    'generate',
    '--analysis',
    '${args[2]}/analysis.json',
    '--output',
    '${args[2]}/app'
  ], out: stdout, err: stderr);
}
