import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

Future<File> ensureTeste1QuickAnalysis() async {
  final analysisFile = File.fromUri(
    Directory.current.uri.resolve('build/teste1_quick/analysis.json'),
  );
  if (await analysisFile.exists()) {
    return analysisFile;
  }

  final fixture = File.fromUri(
    Directory.current.uri.resolve('fixtures/teste1/teste1.accdb'),
  );
  final srcDir = Directory.fromUri(
    Directory.current.uri.resolve('fixtures/teste1/teste1.accdb.src/'),
  );
  expect(await fixture.exists(), isTrue);
  expect(await srcDir.exists(), isTrue);

  final out = StringBuffer();
  final err = StringBuffer();
  final exitCode = await run(
    [
      'analyze',
      '--accdb',
      fixture.path,
      '--src',
      srcDir.path,
      '--output',
      analysisFile.parent.path,
    ],
    out: out,
    err: err,
  );

  expect(exitCode, 0, reason: err.toString());
  expect(await analysisFile.exists(), isTrue, reason: out.toString());
  return analysisFile;
}

Future<ProcessResult> runCheckedProcess(
  String executable,
  List<String> arguments, {
  required String description,
  String? workingDirectory,
  Set<int> allowedNonZeroExitCodes = const <int>{},
  List<String> requiredOutputSnippets = const <String>[],
}) async {
  final result = await Process.run(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    runInShell: true,
  );

  final stdoutText = result.stdout.toString();
  final stderrText = result.stderr.toString();
  final allowedExitCodes = <int>{0, ...allowedNonZeroExitCodes};

  expect(
    allowedExitCodes.contains(result.exitCode),
    isTrue,
    reason:
        '$description failed with exit ${result.exitCode}\nSTDOUT:\n$stdoutText\nSTDERR:\n$stderrText',
  );

  final combinedOutput = '$stdoutText\n$stderrText';
  for (final snippet in requiredOutputSnippets) {
    expect(
      combinedOutput,
      contains(snippet),
      reason:
          '$description did not contain expected snippet: $snippet\nOUTPUT:\n$combinedOutput',
    );
  }

  return result;
}

Future<void> compileGeneratedProject(String outputDir) async {
  final coreDir = Directory('$outputDir${Platform.pathSeparator}core');
  final backendDir = Directory('$outputDir${Platform.pathSeparator}backend');
  final frontendDir = Directory('$outputDir${Platform.pathSeparator}frontend');

  await runCheckedProcess(
    'dart',
    ['pub', 'get'],
    workingDirectory: coreDir.path,
    description: 'core dart pub get',
  );
  await runCheckedProcess(
    'dart',
    ['analyze', '.'],
    workingDirectory: coreDir.path,
    description: 'core dart analyze',
  );

  await runCheckedProcess(
    'dart',
    ['pub', 'get'],
    workingDirectory: backendDir.path,
    description: 'backend dart pub get',
  );
  await runCheckedProcess(
    'dart',
    ['analyze', '.'],
    workingDirectory: backendDir.path,
    description: 'backend dart analyze',
    allowedNonZeroExitCodes: {2},
  );

  final backendBuildDir =
      Directory('${backendDir.path}${Platform.pathSeparator}build');
  await backendBuildDir.create(recursive: true);

  await runCheckedProcess(
    'dart',
    ['compile', 'exe', 'bin/server.dart', '-o', 'build/server.exe'],
    workingDirectory: backendDir.path,
    description: 'backend compile server exe',
  );
  await runCheckedProcess(
    'dart',
    ['compile', 'exe', 'bin/public_backend.dart', '-o', 'build/public_backend.exe'],
    workingDirectory: backendDir.path,
    description: 'backend compile public backend exe',
  );

  expect(
    File('${backendBuildDir.path}${Platform.pathSeparator}server.exe')
        .existsSync(),
    isTrue,
  );
  expect(
    File('${backendBuildDir.path}${Platform.pathSeparator}public_backend.exe')
        .existsSync(),
    isTrue,
  );

  await runCheckedProcess(
    'dart',
    ['pub', 'get'],
    workingDirectory: frontendDir.path,
    description: 'frontend dart pub get',
  );
  await runCheckedProcess(
    'dart',
    ['analyze', 'lib'],
    workingDirectory: frontendDir.path,
    description: 'frontend dart analyze lib',
  );
  await runCheckedProcess(
    'dart',
    ['run', 'webdev', 'build'],
    workingDirectory: frontendDir.path,
    description: 'frontend webdev build',
  );

  final frontendBuildDir =
      Directory('${frontendDir.path}${Platform.pathSeparator}build');
  final frontendBuildArtifact = File(
    '${frontendDir.path}${Platform.pathSeparator}build${Platform.pathSeparator}main.dart.js',
  );
  final frontendLegacyArtifact = File(
    '${frontendDir.path}${Platform.pathSeparator}build${Platform.pathSeparator}web${Platform.pathSeparator}main.dart.js',
  );
  final frontendGeneratedArtifact = findGeneratedFrontendArtifact(frontendDir);

  await waitForPath(
    () => frontendBuildDir.existsSync(),
    description: 'frontend build directory',
  );
  await waitForPath(
    () =>
        frontendBuildArtifact.existsSync() ||
        frontendLegacyArtifact.existsSync() ||
        frontendGeneratedArtifact?.existsSync() == true,
    description: 'frontend webdev artifact',
  );

  expect(frontendBuildDir.existsSync(), isTrue);
  expect(
    frontendBuildArtifact.existsSync() ||
        frontendLegacyArtifact.existsSync() ||
        frontendGeneratedArtifact?.existsSync() == true,
    isTrue,
  );
}

File? findGeneratedFrontendArtifact(Directory frontendDir) {
  final generatedDir = Directory(
    '${frontendDir.path}${Platform.pathSeparator}.dart_tool${Platform.pathSeparator}build${Platform.pathSeparator}generated',
  );
  if (!generatedDir.existsSync()) {
    return null;
  }

  for (final entity in generatedDir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('main.dart.js')) {
      return entity;
    }
  }
  return null;
}

Future<void> waitForPath(
  bool Function() probe, {
  required String description,
  Duration timeout = const Duration(seconds: 10),
}) async {
  final deadline = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(deadline)) {
    if (probe()) {
      return;
    }
    await Future<void>.delayed(const Duration(milliseconds: 250));
  }

  expect(probe(), isTrue, reason: '$description was not materialized in time');
}

Future<File> writeMoneyAnalysisFixture(Directory tempDir) async {
  final analysisFile = File('${tempDir.path}${Platform.pathSeparator}analysis.json');
  await analysisFile.writeAsString(
    const JsonEncoder.withIndent('  ').convert({
      'schema_version': '1.0',
      'source': 'fixtures/money.accdb',
      'format': 'VERSION_14',
      'summary': {
        'tables': 1,
        'linkedTables': 0,
        'relationships': 0,
        'queries': 0,
        'forms': 0,
        'reports': 0,
        'macros': 0,
        'modules': 0,
      },
      'tables': [
        {
          'name': 'Lancamentos',
          'rowCount': 0,
          'columns': [
            {
              'name': 'ValorMoeda',
              'typeName': 'Currency',
              'typeCode': 5,
              'isAutoNumber': false,
              'isCalculated': false,
              'precision': null,
              'scale': null,
            },
            {
              'name': 'Taxa',
              'typeName': 'Numeric',
              'typeCode': 16,
              'isAutoNumber': false,
              'isCalculated': false,
              'precision': 18,
              'scale': 6,
            },
          ],
          'indexes': [],
          'sampleRows': [],
        },
      ],
      'linkedTables': [],
      'forms': [],
    }),
  );
  return analysisFile;
}