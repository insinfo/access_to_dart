
import 'dart:io';
import 'package:jackcess_dart/jackcess_dart.dart';
import 'package:test/test.dart';

void main() {
  test('extracts all 65 VBA modules (form + standalone) from SIGAsul.accdb',
      () async {
    final candidates = [
      'fixtures/SIGAsul.accdb',
      '../../fixtures/SIGAsul.accdb',
    ];
    final path = candidates.firstWhere(
      (p) => File(p).existsSync(),
      orElse: () => '',
    );
    if (path.isEmpty) return;

    final db = await AccessDatabase.openPath(path);
    addTearDown(db.close);
    final reader = TableReader(format: db.format, pageChannel: db.pageChannel);
    final modules = await VbaProjectReader(reader).extractModules();

    expect(modules.length, 65);
    expect(modules.values.every((code) => code.trim().isNotEmpty), isTrue);
    expect(modules.keys, contains('Form_FrmCadGeral'));
    expect(modules.keys, contains('Form_PBFFAMILIA-NÃO'));
    expect(modules.keys, contains('mod_geral'));
  });
}
