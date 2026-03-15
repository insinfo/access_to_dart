import 'package:test/test.dart';
import 'package:access_to_dart/src/vba_parser/vba_lexer.dart';
import 'package:access_to_dart/src/vba_parser/vba_parser.dart';
import 'package:access_to_dart/src/vba_parser/vba_compiler.dart';

void main() {
  test('Lexer, Parser and Compiler pipeline', () {
    final vbaCode = '''
Sub btnSave_Click()
    Dim userName As String
    userName = "Admin"
    
    On Error Resume Next
    
    For i = 1 To 10 Step 2
        Call DoSomething(i)
    Next i
    
    Do While userName <> ""
        ExitLoopRound
    Loop
    
    If userName = "Admin" Then
        MsgBox "Saved"
    Else
        Call ErrorHandler
    End If
End Sub
''';

    final lexer = VbaLexer(vbaCode);
    final tokens = lexer.tokenize();

    final parser = VbaParser(tokens);
    final ast = parser.parse();

    final compiler = VbaCompiler(ast);
    final dartCode = compiler.compile();
    print('--- GENERATED DART CODE ---');
    print(dartCode);
    print('---------------------------');

    expect(dartCode.contains('void btnSave_Click()'), isTrue);
    expect(dartCode.contains('String userName;'), isTrue);
    expect(dartCode.contains('userName = \'Admin\';'), isTrue);
    expect(dartCode.contains('// TODO: Implement Try-Catch envelope for On Error Resume Next'), isTrue);
    expect(dartCode.contains('for (var i = 1; i <= 10; i += 2)'), isTrue);
    expect(dartCode.contains('DoSomething(i);'), isTrue);
    expect(dartCode.contains('while (userName != \'\')'), isTrue);
    expect(dartCode.contains('if (userName == \'Admin\')'), isTrue);
    expect(dartCode.contains('MsgBox(\'Saved\');'), isTrue);
    expect(dartCode.contains('ErrorHandler();'), isTrue);
  });
}
