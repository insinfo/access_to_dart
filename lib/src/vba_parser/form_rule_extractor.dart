import 'vba_lexer.dart';
import 'vba_token.dart';

enum AccessFormFieldRuleKind {
  required,
  cpf,
  email,
  phone,
  custom,
}

class AccessFormRuleSet {
  final List<AccessFormProcedureRule> procedures;
  final List<AccessFormFieldRule> fieldRules;

  const AccessFormRuleSet({
    this.procedures = const <AccessFormProcedureRule>[],
    this.fieldRules = const <AccessFormFieldRule>[],
  });
}

class AccessFormProcedureRule {
  final String procedureName;
  final String? eventControlName;
  final String? eventName;
  final List<String> messages;
  final List<String> referencedControls;
  final bool cancelsEvent;
  final List<AccessFormValidationOccurrence> occurrences;

  const AccessFormProcedureRule({
    required this.procedureName,
    required this.eventControlName,
    required this.eventName,
    required this.messages,
    required this.referencedControls,
    required this.cancelsEvent,
    required this.occurrences,
  });
}

class AccessFormValidationOccurrence {
  final String message;
  final Set<String> controls;
  final bool cancelsEvent;

  const AccessFormValidationOccurrence({
    required this.message,
    required this.controls,
    required this.cancelsEvent,
  });
}

class AccessFormFieldRule {
  final String controlName;
  final Set<AccessFormFieldRuleKind> kinds;
  final List<String> messages;
  final Set<String> events;
  final Set<String> referencedControls;

  const AccessFormFieldRule({
    required this.controlName,
    required this.kinds,
    required this.messages,
    required this.events,
    required this.referencedControls,
  });
}

class AccessFormRuleExtractor {
  static AccessFormRuleSet extract(String source) {
    final tokens = VbaLexer(source).tokenize();
    final procedures = _scanProcedures(tokens);
    return AccessFormRuleSet(
      procedures: procedures,
      fieldRules: _deriveFieldRules(procedures),
    );
  }

  static List<AccessFormProcedureRule> _scanProcedures(List<Token> tokens) {
    final procedures = <AccessFormProcedureRule>[];
    var index = 0;
    while (index < tokens.length) {
      final token = tokens[index];
      if (_isModifier(token)) {
        index++;
        continue;
      }
      if (token.type != TokenType.kwSub && token.type != TokenType.kwFunction) {
        index++;
        continue;
      }
      if (index + 1 >= tokens.length || tokens[index + 1].type != TokenType.identifier) {
        index++;
        continue;
      }

      final name = tokens[index + 1].lexeme;
      final kind = token.type;
      var bodyStart = index + 2;
      while (bodyStart < tokens.length && tokens[bodyStart].type != TokenType.newLine) {
        bodyStart++;
      }
      if (bodyStart < tokens.length) {
        bodyStart++;
      }

      final bodyEnd = _findProcedureEnd(tokens, bodyStart, kind);
      procedures.add(_buildProcedureRule(name, tokens.sublist(bodyStart, bodyEnd)));
      index = bodyEnd;
    }
    return procedures;
  }

  static int _findProcedureEnd(List<Token> tokens, int start, TokenType kind) {
    for (var index = start; index < tokens.length - 1; index++) {
      if (tokens[index].type == TokenType.kwEnd && tokens[index + 1].type == kind) {
        return index;
      }
    }
    return tokens.length;
  }

  static AccessFormProcedureRule _buildProcedureRule(
    String procedureName,
    List<Token> bodyTokens,
  ) {
    final separator = procedureName.lastIndexOf('_');
    final eventControlName = separator > 0 ? procedureName.substring(0, separator) : null;
    final eventName = separator > 0 && separator < procedureName.length - 1
        ? procedureName.substring(separator + 1)
        : null;
    final messages = <String>[];
    final referencedControls = <String>{};
    var cancelsEvent = false;

    final occurrences = _extractValidationOccurrences(bodyTokens);
    for (final occurrence in occurrences) {
      messages.add(occurrence.message);
      referencedControls.addAll(occurrence.controls);
      cancelsEvent = cancelsEvent || occurrence.cancelsEvent;
    }

    if (messages.isEmpty) {
      messages.addAll(_extractValidationMessages(bodyTokens));
    }
    referencedControls.addAll(_extractReferencedControls(bodyTokens));
    cancelsEvent = cancelsEvent || _containsCancelAssignment(bodyTokens);

    return AccessFormProcedureRule(
      procedureName: procedureName,
      eventControlName: eventControlName,
      eventName: eventName,
      messages: messages,
      referencedControls: referencedControls.toList(),
      cancelsEvent: cancelsEvent,
      occurrences: occurrences,
    );
  }

  static List<AccessFormFieldRule> _deriveFieldRules(
    List<AccessFormProcedureRule> procedures,
  ) {
    final builders = <String, _FieldRuleBuilder>{};
    for (final procedure in procedures) {
      if (procedure.occurrences.isNotEmpty) {
        for (final occurrence in procedure.occurrences) {
          final key = _lookupKey(occurrence.message);
          final kinds = _inferKindsFromValues(
            procedureName: procedure.procedureName,
            eventControlName: procedure.eventControlName,
            referencedControls: occurrence.controls.toList(),
            messages: <String>[occurrence.message],
          );
          if (kinds.isEmpty && key.isEmpty) {
            continue;
          }

          final targets = occurrence.controls.isNotEmpty
              ? occurrence.controls
              : {
                  if (procedure.eventControlName != null)
                    procedure.eventControlName!,
                };
          for (final target in targets) {
            final builder = builders.putIfAbsent(
              target,
              () => _FieldRuleBuilder(target),
            );
            builder.kinds.addAll(kinds);
            builder.events.add(procedure.eventName ?? 'unknown');
            builder.referencedControls.addAll(occurrence.controls);
            if (!builder.messages.contains(occurrence.message)) {
              builder.messages.add(occurrence.message);
            }
          }
        }
        continue;
      }

      final kinds = _inferKinds(procedure);
      if (kinds.isEmpty && procedure.messages.isEmpty) {
        continue;
      }

      final targets = <String>{...procedure.referencedControls};
      if (targets.isEmpty && procedure.eventControlName != null) {
        targets.add(procedure.eventControlName!);
      }

      for (final target in targets) {
        final builder = builders.putIfAbsent(target, () => _FieldRuleBuilder(target));
        builder.kinds.addAll(kinds);
        builder.events.add(procedure.eventName ?? 'unknown');
        builder.referencedControls.addAll(procedure.referencedControls);
        for (final message in procedure.messages) {
          if (!builder.messages.contains(message)) {
            builder.messages.add(message);
          }
        }
      }
    }

    return builders.values
        .map(
          (builder) => AccessFormFieldRule(
            controlName: builder.controlName,
            kinds: builder.kinds,
            messages: builder.messages,
            events: builder.events,
            referencedControls: builder.referencedControls,
          ),
        )
        .toList();
  }

  static Set<AccessFormFieldRuleKind> _inferKinds(
    AccessFormProcedureRule procedure,
  ) {
    return _inferKindsFromValues(
      procedureName: procedure.procedureName,
      eventControlName: procedure.eventControlName,
      referencedControls: procedure.referencedControls,
      messages: procedure.messages,
    );
  }

  static Set<AccessFormFieldRuleKind> _inferKindsFromValues({
    required String procedureName,
    required String? eventControlName,
    required List<String> referencedControls,
    required List<String> messages,
  }) {
    final key = <String>[
      procedureName,
      if (eventControlName != null) eventControlName,
      ...referencedControls,
      ...messages,
    ].map(_lookupKey).join(' ');

    final kinds = <AccessFormFieldRuleKind>{};
    if (key.contains('informe') || key.contains('obrigat')) {
      kinds.add(AccessFormFieldRuleKind.required);
    }
    if (key.contains('cpf')) {
      kinds.add(AccessFormFieldRuleKind.cpf);
    }
    if (key.contains('email')) {
      kinds.add(AccessFormFieldRuleKind.email);
    }
    if (key.contains('telefone') || key.contains('fone')) {
      kinds.add(AccessFormFieldRuleKind.phone);
    }
    if (kinds.isEmpty && messages.isNotEmpty) {
      kinds.add(AccessFormFieldRuleKind.custom);
    }
    return kinds;
  }

  static List<AccessFormValidationOccurrence> _extractValidationOccurrences(
    List<Token> tokens,
  ) {
    final occurrences = <AccessFormValidationOccurrence>[];
    var index = 0;
    while (index < tokens.length) {
      if (tokens[index].type != TokenType.kwIf) {
        index++;
        continue;
      }

      final thenIndex = _findThenIndex(tokens, index + 1);
      if (thenIndex == -1) {
        index++;
        continue;
      }

      final endIndex = _findIfBlockEnd(tokens, thenIndex + 1);
      final conditionTokens = tokens.sublist(index + 1, thenIndex);
      final blockTokens = tokens.sublist(thenIndex + 1, endIndex);
      final message = _firstValidationMessage(blockTokens);
      if (message != null) {
        occurrences.add(
          AccessFormValidationOccurrence(
            message: message,
            controls: _extractReferencedControls(conditionTokens),
            cancelsEvent: _containsCancelAssignment(blockTokens),
          ),
        );
      }
      index = endIndex;
    }
    return occurrences;
  }

  static int _findThenIndex(List<Token> tokens, int start) {
    for (var index = start; index < tokens.length; index++) {
      if (tokens[index].type == TokenType.kwThen) {
        return index;
      }
      if (tokens[index].type == TokenType.newLine) {
        break;
      }
    }
    return -1;
  }

  static int _findIfBlockEnd(List<Token> tokens, int start) {
    var depth = 0;
    for (var index = start; index < tokens.length - 1; index++) {
      if (tokens[index].type == TokenType.kwIf) {
        depth++;
      }
      if (tokens[index].type == TokenType.kwEnd && tokens[index + 1].type == TokenType.kwIf) {
        if (depth == 0) {
          return index;
        }
        depth--;
      }
    }
    for (var index = start; index < tokens.length; index++) {
      if (tokens[index].type == TokenType.newLine || tokens[index].type == TokenType.colon) {
        return index;
      }
    }
    return tokens.length;
  }

  static List<String> _extractValidationMessages(List<Token> tokens) {
    final messages = <String>[];
    for (var index = 0; index < tokens.length; index++) {
      if (tokens[index].type != TokenType.kwMsgBox) {
        continue;
      }
      final message = _firstStringLiteral(tokens, index + 1);
      if (message != null && _isValidationMessage(message)) {
        messages.add(message);
      }
    }
    return messages;
  }

  static String? _firstValidationMessage(List<Token> tokens) {
    for (var index = 0; index < tokens.length; index++) {
      if (tokens[index].type != TokenType.kwMsgBox) {
        continue;
      }
      final message = _firstStringLiteral(tokens, index + 1);
      if (message != null && _isValidationMessage(message)) {
        return message;
      }
    }
    return null;
  }

  static String? _firstStringLiteral(List<Token> tokens, int start) {
    for (var index = start; index < tokens.length; index++) {
      if (tokens[index].type == TokenType.stringLiteral) {
        return tokens[index].lexeme;
      }
      if (tokens[index].type == TokenType.newLine || tokens[index].type == TokenType.colon) {
        break;
      }
    }
    return null;
  }

  static Set<String> _extractReferencedControls(List<Token> tokens) {
    final controls = <String>{};
    for (var index = 0; index < tokens.length - 2; index++) {
      if (tokens[index].type == TokenType.identifier &&
          tokens[index].lexeme.toLowerCase() == 'me' &&
          tokens[index + 1].type == TokenType.dot &&
          tokens[index + 2].type == TokenType.identifier) {
        controls.add(tokens[index + 2].lexeme);
      }
    }
    return controls;
  }

  static bool _containsCancelAssignment(List<Token> tokens) {
    for (var index = 0; index < tokens.length - 2; index++) {
      if (tokens[index].type == TokenType.identifier &&
          tokens[index].lexeme.toLowerCase() == 'cancel' &&
          tokens[index + 1].type == TokenType.equal &&
          tokens[index + 2].type == TokenType.kwTrue) {
        return true;
      }
    }
    return false;
  }

  static bool _isValidationMessage(String message) {
    final key = _lookupKey(message);
    return key.contains('informe') ||
        key.contains('inval') ||
        key.contains('obrigat') ||
        key.contains('erro');
  }

  static bool _isModifier(Token token) {
    if (token.type != TokenType.identifier) {
      return false;
    }
    final lower = token.lexeme.toLowerCase();
    return lower == 'private' || lower == 'public' || lower == 'friend';
  }

  static String _lookupKey(String value) {
    final buffer = StringBuffer();
    for (final codeUnit in value.toLowerCase().codeUnits) {
      final isLetter = codeUnit >= 97 && codeUnit <= 122;
      final isDigit = codeUnit >= 48 && codeUnit <= 57;
      if (isLetter || isDigit) {
        buffer.writeCharCode(codeUnit);
      }
    }
    return buffer.toString();
  }
}

class _FieldRuleBuilder {
  final String controlName;
  final Set<AccessFormFieldRuleKind> kinds = <AccessFormFieldRuleKind>{};
  final List<String> messages = <String>[];
  final Set<String> events = <String>{};
  final Set<String> referencedControls = <String>{};

  _FieldRuleBuilder(this.controlName);
}