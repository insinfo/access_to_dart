import 'dart:convert';
import 'dart:io';
import 'package:access_to_dart/access_to_dart.dart';

/// Structural preservation audit. Counts do not imply execution support.
Future<void> main(List<String> args) async {
  if (args.length != 1) {
    stderr.writeln('Usage: dart run tools/audit_src_behavior.dart <accdb.src>');
    exitCode = 64;
    return;
  }
  final project = await AccessSrcReader().readDirectory(args.single);
  Map<String, Object> audit(List<Map<String, Object?>> objects) {
    final actions = <String, int>{};
    final events = <String, int>{};
    var macros = 0;
    var codeBehind = 0;
    void steps(List values) {
      for (final value in values.cast<Map>()) {
        final action = value['action'] as String?;
        if (action != null) {
          actions.update(action, (n) => n + 1, ifAbsent: () => 1);
        }
        steps((value['children'] as List?) ?? const []);
      }
    }

    void node(Map value) {
      for (final entry in ((value['events'] as Map?) ?? const {}).entries) {
        if (entry.value == '[Event Procedure]') {
          events.update(entry.key as String, (n) => n + 1, ifAbsent: () => 1);
        }
      }
      final definitions = (value['macroDefinitions'] as Map?) ?? const {};
      macros += definitions.length;
      for (final definition in definitions.values) {
        steps(definition as List);
      }
    }

    for (final object in objects) {
      if ((object['rawVbaCode'] as String? ?? '').isNotEmpty) codeBehind++;
      node(object);
      for (final control
          in ((object['controls'] as List?) ?? const []).cast<Map>()) {
        node(control);
      }
    }
    return {
      'objects': objects.length,
      'codeBehindPreserved': codeBehind,
      'embeddedMacrosPreserved': macros,
      'actionsPreserved': actions,
      'eventProcedureBindingsPreserved': events
    };
  }

  stdout.writeln(const JsonEncoder.withIndent('  ').convert({
    'scope': 'Preservation only; no claim of translated/executed behavior',
    'forms': audit(project.forms.map((f) => f.toJson()).toList()),
    'reports': audit(project.reports.map((r) => r.toJson()).toList()),
  }));
}
