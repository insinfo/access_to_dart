import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';
import 'package:test/test.dart';

import '../support/backend_autonumber_fixture.dart';

void main() {
  for (final style in ['snake_ascii', 'original']) {
    test('repository gerado insere chave autonumerica $style', () async {
      final temp = await Directory.systemTemp.createTemp('access_pk_runtime_');
      addTearDown(() => temp.delete(recursive: true));
      final analysis = await writeAutonumberAnalysis(temp);
      final output = '${temp.path}/generated';
      final err = StringBuffer();
      expect(
          await run([
            'generate',
            '--analysis',
            analysis.path,
            '--output',
            output,
            '--identifier-style',
            style,
          ], out: StringBuffer(), err: err),
          0,
          reason: err.toString());
      final backend = '$output/backend';
      final key = style == 'original' ? 'CodigoCadastro' : 'codigo_cadastro';
      final nameKey = style == 'original' ? 'Nome' : 'nome';
      final table = style == 'original' ? 'Cadastro' : 'cadastro';
      final pub = await Process.run(Platform.resolvedExecutable, ['pub', 'get'],
              workingDirectory: backend)
          .timeout(const Duration(minutes: 2));
      expect(pub.exitCode, 0, reason: '${pub.stdout}\n${pub.stderr}');
      final probe = File('$backend/bin/autonumber_contract.dart');
      await probe.writeAsString('''
import 'package:eloquent/eloquent.dart';
import 'package:cadastro_app_generated_core/core.dart';
import '../lib/src/modules/cadastro/repositories/cadastro_repository.dart';

// Executa o repository emitido com o contrato real do Eloquent, sem banco.
class FakeConnection implements Connection {
  final fakeQuery = FakeQuery();
  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #table) {
      if (invocation.positionalArguments.single != '$table') {
        throw StateError('Tabela incorreta');
      }
      return fakeQuery;
    }
    return super.noSuchMethod(invocation);
  }
}

class FakeQuery implements QueryBuilder {
  int calls = 0;
  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #insertGetId) {
      final arguments = invocation.positionalArguments;
      final payload = arguments.first as Map<String, dynamic>;
      // Sem a coluna explícita, o Eloquent usa "id", inexistente nesta tabela.
      if (arguments.length != 2 || arguments[1] != '$key') {
        throw StateError('RETURNING usa coluna errada');
      }
      if (payload['$nameKey'] != 'Ana') {
        throw StateError('Campo de dados perdido');
      }
      if (calls == 0 && payload.containsKey('$key')) {
        throw StateError('NULL explícito impede o default da sequência');
      }
      if (calls == 1 && payload['$key'] != 99) {
        throw StateError('Chave explícita não foi preservada');
      }
      calls++;
      return Future<dynamic>.value(calls == 1 ? 42 : 99);
    }
    return super.noSuchMethod(invocation);
  }
}

Future<void> main() async {
  final connection = FakeConnection();
  final repository = CadastroRepository(connection);
  final generatedId = await repository.insert(const Cadastro(nome: 'Ana'));
  if (generatedId != 42) throw StateError('Chave retornada incorreta');
  final explicitId = await repository.insert(
      const Cadastro(codigoCadastro: 99, nome: 'Ana'));
  if (explicitId != 99 || connection.fakeQuery.calls != 2) {
    throw StateError('Contrato de inserção incorreto');
  }
  print('AUTONUMBER_CONTRACT_OK');
}
''');
      final result = await Process.run(
              Platform.resolvedExecutable, ['run', probe.path],
              workingDirectory: backend)
          .timeout(const Duration(minutes: 2));
      expect(result.exitCode, 0, reason: '${result.stdout}\n${result.stderr}');
      expect(result.stdout, contains('AUTONUMBER_CONTRACT_OK'));
    }, timeout: const Timeout(Duration(minutes: 5)));
  }
}
