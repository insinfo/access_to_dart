import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/generation_test_utils.dart';

void main() {
  test('generate expõe defaults semânticos e UUID no scaffold', () async {
    final tempDir = await Directory.systemTemp.createTemp('access_semantic_defaults_');
    addTearDown(() => tempDir.delete(recursive: true));

    final analysisFile = await writeSemanticDefaultsAnalysisFixture(tempDir);
    final outputDir = '${tempDir.path}${Platform.pathSeparator}semantic_defaults_generated';
    final out = StringBuffer();
    final err = StringBuffer();

    final exitCode = await run(
      ['generate', '--analysis', analysisFile.path, '--output', outputDir],
      out: out,
      err: err,
    );

    expect(exitCode, 0, reason: err.toString());
    expect(err.toString(), isEmpty);

    final coreModelFile = File(
      '$outputDir${Platform.pathSeparator}core${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models${Platform.pathSeparator}eventos.dart',
    );
    final coreModelContent = await coreModelFile.readAsString();
    expect(coreModelContent, contains('static Map<String, dynamic> defaultValues()'));
    expect(coreModelContent, contains('eventoIdCol: _accessUuidV4()'));
    expect(coreModelContent, contains('statusCol: ("novo").toUpperCase()'));
    expect(coreModelContent, contains('codigoCol: (13.9).floor()'));
    expect(coreModelContent, contains('dataBaseCol: _accessDateSerial(2024, 2, 30)'));
    expect(coreModelContent, contains('horaBaseCol: _accessTimeSerial(15, 57, 34)'));
    expect(coreModelContent, contains('static String _accessUuidV4()'));

    final frontendPageFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}eventos${Platform.pathSeparator}pages${Platform.pathSeparator}incluir_eventos${Platform.pathSeparator}incluir_eventos_page.dart',
    );
    final frontendPageContent = await frontendPageFile.readAsString();
    expect(frontendPageContent, contains('..addAll(val?.toMap() ?? Eventos.defaultValues());'));

    final frontendServiceFile = File(
      '$outputDir${Platform.pathSeparator}frontend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}eventos${Platform.pathSeparator}services${Platform.pathSeparator}eventos_service.dart',
    );
    final frontendServiceContent = await frontendServiceFile.readAsString();
    expect(frontendServiceContent, contains('Future<Eventos> getById(String id)'));
    expect(frontendServiceContent, contains('Future<void> deleteRow(String id)'));

    final backendRepositoryFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}eventos${Platform.pathSeparator}repositories${Platform.pathSeparator}eventos_repository.dart',
    );
    final backendRepositoryContent = await backendRepositoryFile.readAsString();
    expect(backendRepositoryContent, contains('Future<Map<String, dynamic>?> findById(String id)'));
    expect(backendRepositoryContent, contains("return payload['evento_id'] as String?;"));

    final backendControllerFile = File(
      '$outputDir${Platform.pathSeparator}backend${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}modules${Platform.pathSeparator}eventos${Platform.pathSeparator}controllers${Platform.pathSeparator}eventos_controller.dart',
    );
    final backendControllerContent = await backendControllerFile.readAsString();
    expect(backendControllerContent, contains('...Eventos.defaultValues(),'));
    expect(backendControllerContent, contains('final String id = idRaw;'));
  });
}