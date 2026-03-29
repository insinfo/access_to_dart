import 'package:access_to_dart/src/identifier_utils.dart';
import 'package:test/test.dart';

void main() {
  test('toCamelCaseIdentifier torna nomes iniciados por digito seguros para Dart', () {
    expect(toCamelCaseIdentifier('0a_5'), 'field0a5');
    expect(toCamelCaseIdentifier('60mais'), 'field60mais');
  });

  test('toCamelCaseIdentifier evita palavra reservada do Dart', () {
    expect(toCamelCaseIdentifier('class'), 'fieldClass');
  });

  test('toPascalCaseIdentifier torna nomes iniciados por digito seguros para Dart', () {
    expect(toPascalCaseIdentifier('12a_14'), 'Generated12a14');
  });
}