# SIGAsul: lookup com INNER JOIN e filtro textual

Data: 2026-11-21. Continuação do estado registrado no doc22.

## Consultas atendidas

O gerador agora materializa plano tipado para os dois RowSources complexos observados no SIGAsul:

- `TbBeneficioEmergencial.Nome`: INNER JOIN TbPessoa/CadResidencia pela igualdade CodFam, ordenado pelo nome da pessoa. Pessoas sem residência correspondente não entram na lista.
- `TbViolacoes.NomePessoa`: igualdade textual `TbPessoa.Parentesco = 'Pessoa de Referencia'`, ordenada por Nome. Outros parentescos e NULL ficam excluídos.

O parser de expressões exige consumo completo do predicado. Tabelas e colunas são resolvidas exclusivamente contra o modelo, sem nomes de identificadores fornecidos pelo cliente. O backend usa join do query builder, colunas qualificadas e aliases próprios para value/label; o literal do filtro é binding de `LOWER(coluna_citada) = LOWER(?)`. O tokenizer ganhou opção `preserveStringLiterals`, ativada apenas para geração executável; a normalização anterior permanece padrão na reconciliação.

Escopo deliberado: um INNER JOIN de igualdade entre duas tabelas, um filtro de igualdade com coluna textual qualificada à esquerda e literal à direita. LEFT JOIN, expressões compostas, referências Forms!, parâmetros de formulário, filtros numéricos, funções, ordenações múltiplas/descendentes e agrupamento continuam recusados. Não há execução arbitrária do SQL Access.

## Evidência Access e PostgreSQL

`tools/test_lookup_dao_equality.ps1` cria ACCDB temporária sintética via DAO.DBEngine.120, collation General (LANGID0409), e compara quatro linhas. O Access seleciona a grafia original e a minúscula; não seleciona a variante com acento nem NULL. Saída: `DAO_LOOKUP_EQUALITY_OK: ids=1,2; accented and NULL excluded` e `TEMP_REMOVED=True`.

Os testes PostgreSQL usam os mesmos casos de caixa/acento/NULL e verificam JOIN com linha órfã, tabela dona contendo rótulo sentinela diferente, ordenação numérica 2/10, limite e recusa de campo desconhecido. Rodam scaffold realmente gerado nos estilos snake_ascii/original, sem mocks. Bancos são isolados com TEMPLATE template0 e removidos no teardown. Senhas somente em variáveis de sessão.

A equivalência de collation foi verificada para essas strings portuguesas e fixture DAO General. Não se afirma equivalência universal de ordenação/igualdade Unicode entre Access e PostgreSQL para todos os locales.

## Cobertura real e pendências

Scaffold completo gerado de `build/codex-sigasul-goal/analysis-final/analysis.json` para `build/codex-sigasul-goal/lookup-complex-generated`: 50 tabelas na análise, 49 campos Table/Query e **47 chamadas de lookup geradas**, incluindo os dois casos acima. O inventário anterior de 46 SELECTs simples descrevia forma sintática, não resolução bem-sucedida de todas as fontes.

Duas pendências permanecem:

- `TbDemandaReprimida.NomeFuncionario`: RowSource vazio.
- `TbAtualSCFV.CodDPscfv`: referência a `TbDadosPessoaisSCFV`, ausente nas tabelas e consultas da análise. Não substituir por outra tabela por semelhança de nome.

A interface atual consome somente value/label. As colunas adicionais dos SELECTs (endereço, bairro, CPF etc.) permanecem no SQL original, mas não viraram dropdown multicoluna. A execução correta do filtro/JOIN não significa equivalência visual completa nem conversão integral do aplicativo.

## Validação

- `dart test test/generation/fast/generate_lookup_semantics_test.dart test/generation/fast/generate_emits_dropdown_controls_test.dart --concurrency=1 --reporter expanded`: 13 testes passaram, incluindo recusa de identificadores desconhecidos e expressões não suportadas, literal com apóstrofo preservado/bound e projeção única.
- `dart test test/generation/long/generated_lookup_complex_postgres_test.dart test/generation/long/generated_lookup_source_postgres_test.dart test/sql_tokenizer_literal_preservation_test.dart --concurrency=1 --reporter expanded`: 6 casos PostgreSQL reais e teste de compatibilidade do tokenizer passaram (7/7). Conferência posterior em pg_database: zero bases com prefixo access_lookup_.
- `dart analyze lib/src/project_generator lib/src/query_reconciliation/sql_tokenizer.dart test/generation/long/generated_lookup_complex_postgres_test.dart test/generation/fast/generate_lookup_semantics_test.dart test/sql_tokenizer_literal_preservation_test.dart`: nenhum erro; na execução havia dois avisos informativos de chaves no subform_generator.dart em desenvolvimento paralelo, comunicados ao responsável.
- `powershell -NoProfile -ExecutionPolicy Bypass -File tools/test_lookup_dao_equality.ps1`.

Os bancos de integração contêm apenas dados sintéticos. As consultas reais SIGAsul foram conferidas pelo código gerado a partir dos metadados, sem imprimir dados pessoais.
