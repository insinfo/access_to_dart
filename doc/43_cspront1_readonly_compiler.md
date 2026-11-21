# Compilação estrita de CSPRONT1 para PostgreSQL

## Entrega e limite

`AccessSelectCompiler` compila um subconjunto explícito de SELECT Access para
PostgreSQL, sem encaminhar fragmentos SQL originais ao servidor. Esta etapa não
adiciona endpoint, execução automática de consultas, edição ou interface de
prontuário. A validação real usa CSPRONT1 e três tabelas físicas: CadResidencia,
TbPessoa e TbUnidade.

O parser próprio consome a entrada inteira. Aceita projeções físicas qualificadas,
INNER JOIN aninhado, AND, igualdade e IS NULL. Recusa aliases de tabela, wildcard,
funções, expressões calculadas, subconsultas, comentários, cláusulas adicionais,
SQL truncado, múltiplas instruções e literais numéricos. Estes últimos não são
necessários na consulta alvo; não há tratamento permissivo de vírgula decimal.
Identificadores devem existir no schema analisado e no escopo FROM/JOIN. Colisões
de nomes normalizados, NUL e identificadores acima de 63 bytes são recusados.
A política de nomes físicos é a mesma da migração (`snake_ascii` por padrão).

Literais de texto e parâmetros tornam-se bindings posicionais `$1`, `$2`, etc.
`CompiledAccessSelect.bind` exige exatamente os parâmetros declarados. O parâmetro
DAO Text usado contra CodFam aceita string inteira na faixa Long ou null, convertida
em binding inteiro com CAST explícito. Valores fracionários, espaços, overflow,
chaves desconhecidas e strings contendo SQL não são interpolados. A coerção é
intencionalmente mais restrita que o Access: `1.0` e ` 1 ` são recusados. NULL foi
testado no binding unitário; os sete casos de paridade DAO usam strings inteiras,
portanto não estabelecem paridade DAO de parâmetro NULL. Literais com
aspas permanecem dados. O teste PostgreSQL usa `rewriteParameters: false` do
Dpgsql com a coleção de parâmetros na ordem retornada pelo plano.

Comparações de texto exigem opt-in `asciiCaseInsensitiveText: true`. Nesse modo,
literais/parâmetros de comparação devem ser ASCII e a expressão emitida usa
`lower(... COLLATE "C")`. Isso corresponde ao literal real `Pessoa de Referencia`
nos casos testados e ao oráculo controlado já existente, que aceita variação de
caixa e distingue `Referencia` de `Referência`. Não representa equivalência geral
de collations Access: Unicode, espaços finais e demais regras linguísticas ainda
precisam de oráculos próprios antes de ampliar esse contrato. Não há suporte a
joins textuais; joins físicos desta etapa exigem Long dos dois lados.

## Shape DAO e resultados reais

`tools/audit_dao_query_shape.ps1` abre o backend original em modo read-only e cria
QueryDef temporário sem nome. O shape de CSPRONT1 tem 134 projeções: 78 Boolean,
42 Text, 6 Long, 6 DateTime e 2 Money; um parâmetro DAO Text. As duas projeções NOME
recebem os nomes DAO `TbPessoa.NOME` e `TbUnidade.NOME`. O compilador aceita esses
nomes como contrato ordinal validado contra as colunas físicas, sem permitir
expressões arbitrárias como aliases. O teste confronta todos os nomes e tipos.

`tools/audit_dao_cspront1_results.ps1` gera um oráculo separado de resultados. Abre
o mesmo ACCDB read-only, executa a fixture CSPRONT1 com bindings DAO e escolhe cinco
famílias com resultados, além dos parâmetros 0 e -1. O artefato privado contém
sete casos e hashes SHA-256 de cada linha completa, preservando multiplicidade;
não publica nomes ou outros valores pessoais. Cada uma das 134 células é
normalizada por tipo, distinguindo NULL de texto vazio. Money usa quatro casas
decimais, datas usam precisão de milissegundos. O hash do arquivo fonte é conferido
antes/depois; hashes do ACCDB e SQL também são confrontados pelo teste PostgreSQL.

`test/generation/long/cspront1_postgres_parity_test.dart` recorta as três tabelas do
snapshot analisado, usa a migração real em PostgreSQL temporário criado com
TEMPLATE template0 e executa o SELECT compilado com bindings reais. Todos os hashes
de linhas dos sete casos coincidiram com o DAO. A base e arquivos temporários são
removidos ao final. Esta é paridade de resultados para sete casos, não uma auditoria
de todas as famílias, de todo o SQL Access ou de todo o snapshot de 54 tabelas.

## Reprodução

Usar o snapshot local `build/codex-sigasul-goal/analysis-complex-complete/analysis.json`
e as fixtures originais. Configurar `ACCESS_DAO_PASSWORD` e as variáveis
`ACCESS_TO_DART_TEST_PG_*` no ambiente autorizado, sem gravá-las em documentos.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/audit_dao_query_shape.ps1 -Source fixtures/SIGA2021-SUL_be_senha_4462.accdb -Analysis build/codex-sigasul-goal/analysis-complex-complete/analysis.json -QueryName CSPRONT1 -Output build/codex-sigasul-goal/query-audit/cspront1-shape.json
powershell -NoProfile -ExecutionPolicy Bypass -File tools/audit_dao_cspront1_results.ps1 -Source fixtures/SIGA2021-SUL_be_senha_4462.accdb -SqlFile fixtures/SIGAsul.accdb.src/queries/CSPRONT1.sql -Output build/codex-sigasul-goal/query-audit/cspront1-results.json
dart test test/access_select_compiler_test.dart
dart test test/generation/long/cspront1_postgres_parity_test.dart
```

O teste rápido inclui rejeição de sintaxe, nomes e parâmetros inválidos, prevenção
de truncamento de identificadores e preservação de literal com conteúdo parecido
com SQL. O caso de shape real é omitido se o snapshot privado não existir; os casos
sintéticos continuam executáveis. O teste longo exige explicitamente os artefatos
locais e PostgreSQL, falhando se faltarem pré-requisitos.
