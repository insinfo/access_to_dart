# SIGAsul: consultas de opções no backend gerado

Data: 2026-11-21.

## Falha e correção

O descritor de lookup já identificava a tabela referenciada pelo RowSource, mas o serviço não passava essa origem ao repositório. O repositório consultava a tabela dona do campo. Exemplo real: `TbAtend.CodFunc` deve obter `CodFunc/Nome` de `TbCadFuncionario`; consultar `TbAtend` produz opções incorretas ou vazias.

O serviço agora passa `sourceTable` resolvida no modelo, e o repositório usa essa origem. Ordenação e limite passam ao query builder PostgreSQL, que cita identificadores e preserva tipos: números 2 e 10 são ordenados numericamente, sem converter para texto e sem carregar toda a tabela. Campos de lookup desconhecidos continuam recusados; tabela e colunas não vêm de parâmetros HTTP arbitrários.

Uma projeção de apenas uma coluna usa essa mesma coluna como rótulo. Antes, podia escolher uma coluna de nome fora da projeção.

## Cobertura e limites reais

Inspeção de `build/codex-sigasul-goal/analysis-final/analysis.json` (snapshot final com 50 tabelas: 45 físicas e cinco sintéticas de anexos): 49 campos com RowSourceType Table/Query, dos quais 46 têm SELECT simples de uma tabela, dois têm semântica ainda não executada e um tem RowSource vazio.

Pendências concretas:

- `TbBeneficioEmergencial.Nome`: INNER JOIN entre TbPessoa e CadResidencia.
- `TbViolacoes.NomePessoa`: WHERE restringindo a pessoa de referência.
- `TbDemandaReprimida.NomeFuncionario`: RowSource vazio na análise.

O resolvedor agora recusa WHERE, JOIN, GROUP/HAVING, modificadores DISTINCT/TOP/INTO, ordenação descendente ou múltipla não implementados. Não descarta silenciosamente essas cláusulas para retornar opções diferentes do Access. O SQL original continua preservado nos metadados e no hint do campo. Atualmente um Table/Query recusado permanece como select sem opções dinâmicas (placeholder), sem aviso específico além do hint. Implementar diagnóstico amigável e execução fiel dessas consultas permanece TODO; esta entrega não representa conversão funcional completa do SIGAsul. Consultas RecordSource de formulários, macros e relatórios também não são resolvidas por esta correção.

## Validação

- `dart test test/generation/fast/generate_lookup_semantics_test.dart test/generation/fast/generate_emits_dropdown_controls_test.dart --reporter expanded --concurrency=1`: 7 testes, incluindo rejeição dos cinco formatos não suportados, projeção única e dropdown existente.
- `dart test test/generation/long/generated_lookup_source_postgres_test.dart --reporter expanded --concurrency=1`: 2 testes PostgreSQL reais passaram, estilos snake_ascii e original. Geram scaffold, resolvem dependências e executam o serviço/repositório gerado. Tabela dona tem uma linha sentinela diferente; tabela referenciada contém IDs 2 e 10. Confere origem, ordenação numérica, limit 1 e recusa de campo desconhecido.
- `dart analyze` nos emitters backend, IR e dois testes novos: sem problemas após ajuste final de projeção única.

O teste real exige variáveis ACCESS_TO_DART_TEST_PG_* de sessão, sem senha embutida. Cada caso cria base sintética isolada com TEMPLATE template0 e a remove em teardown; nenhuma tabela de usuário é alterada. Conferência posterior de pg_database encontrou zero bases com prefixo access_lookup_. Os testes de execução usam fixture sintética, não migram dados pessoais do SIGAsul. A incidência no SIGAsul foi auditada por metadados reais.
