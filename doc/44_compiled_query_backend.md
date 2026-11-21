# Consulta compilada no backend gerado

## Contrato explícito de execução

Esta etapa conecta o compilador restrito do documento43 ao backend gerado. Não
implementa renderer, relatório, formulário de prontuário ou edição de resultados.
Nenhuma consulta é habilitada apenas por existir em `analysis.json`.

O analisador atual preserva SQL de queries, mas não extrai o tipo DAO dos parâmetros
implícitos de formulário. `tools/import_dao_query_contract.dart` importa um shape
obtido pelo oráculo DAO. Confere o arquivo fonte registrado no analysis, seu SHA-256,
o hash do SQL, cada ordinal/nome/tipo de saída e a compilação contra o schema físico.
Não infere o tipo a partir do nome CodFamTxt. Grava `executionContract` com parâmetros,
shape, hash de schema e política textual explícita. O gerador recompila esse contrato
contra o SQL/schema atual; contrato ausente, alterado ou sintaxe não suportada gera
diagnóstico e não habilita a consulta. Colisão de route keys também é recusada.

O contrato é metadado de build local verificável, não uma assinatura/autorização de
terceiros. Nenhum hash particular do SIGAsul está embutido no compilador/gerador.
Não há COM ou arquivo ACCDB acessado pelo servidor em runtime. A extração/importação
DAO ainda é um passo explícito; integrar essa produção ao analyze Windows fica para
uma etapa futura.

Exemplo reproduzível, sem repetir a análise física:

```powershell
dart run tools/import_dao_query_contract.dart --analysis build/codex-sigasul-goal/analysis-integrated-803634a/analysis.json --shape build/codex-sigasul-goal/query-audit/cspront1-shape.json --source fixtures/SIGA2021-SUL_be_senha_4462.accdb --output build/codex-sigasul-goal/analysis-integrated-query/analysis.json --ascii-case-insensitive-text
dart run bin/access_to_dart.dart generate --analysis build/codex-sigasul-goal/analysis-integrated-query/analysis.json --output build/codex-sigasul-goal/generated-query
```

O importador só escreve o caminho solicitado após validar todo o contrato. Hashes
incompatíveis requerem novo oráculo ou correção do artefato; não há fallback para
tipos inferidos. A política ASCII e a coerção Text→Long mantêm os limites do doc43.

## Endpoint e representação

`GET /api/v1/access-queries/cspront1` aceita somente `parameters` (objeto JSON
URL-encoded) e `limit` opcional entre1 e100. Para a query real, `parameters` é
`{"p0":"42"}`; `p0` corresponde ao parâmetro DAO de formulário preservado no
contrato. NULL é explícito como `{"p0":null}`. Parâmetros numéricos JSON, faltantes,
extras, strings fracionárias/fora da faixa Long, JSON inválido, argumentos HTTP
repetidos/desconhecidos e tentativa de fornecer SQL recebem400. Query não compilada
recebe404. Não existe endpoint que aceite texto SQL.

O resultado contém `columns` ordenadas com ordinal, nome DAO, tipo e origem;
`parameters` com a declaração; `rows` como arrays na mesma ordem; `limit`,
`truncated`, `readOnly: true` e `ordering: "unspecified"`. Não é paginação e não
promete ordenação que o SELECT original não possui. O servidor busca no máximo101
linhas e devolve até o limite pedido; não inventa contagem total.

CSPRONT1 preserva134 projeções e os nomes distintos `TbPessoa.NOME` e
`TbUnidade.NOME`. NULL continua null; Boolean e Long são valores JSON tipados;
Money é string decimal com quatro casas, sem conversão por double; DateTime usa
string ISO; Text permanece string. Erro interno de execução/shape recebe500 sem
expor SQL/valores ao cliente.

`query_backend_generator.dart` gera `shared/access_queries.dart` com SQL compilado
e bindings estáticos, além de `access_queries.json` com descritores/diagnósticos.
Apenas valores entram como bindings Eloquent; a requisição não altera FROM, WHERE,
projeções ou nomes físicos. O código usa os serviços e middleware existentes.

## Falha detectada e correção de transporte

O primeiro teste HTTP retornou200, porém os hashes divergiam em17 ordinais cujos
aliases DAO continham acentos ou `º`; o SELECT direto via Dpgsql não divergira.
Ler o mapa do driver por esses nomes podia converter ausência de chave em NULL.
A causa interna exata do tratamento de aliases pelo driver não foi alterada aqui.

A solução no gerador é emitir aliases internos ASCII por posição (`c0`…`c133`),
manter os nomes DAO somente nos metadados de saída e montar cada linha pela chave
ordinal. Isso evita depender de normalização do driver. Ausência de uma chave
esperada agora é erro de shape, nunca NULL silencioso. Os identificadores físicos
continuam resolvidos pela política de migração e não foram substituídos por aliases
inventados de tabelas/colunas fonte.

## Validação

- Testes do compilador/contrato: importação, parâmetros, hashes SQL/fonte/schema,
  mudança posterior de tipo/SQL, ordinal/tipo DAO incorreto e SQL não suportado.
- Importador executado sobre o snapshot real, gerando artefato independente.
- `cspront1_http_query_test.dart`: migração real isolada de três tabelas, geração,
  pub get e analyze do backend, servidor HTTP loopback real, sete casos DAO e
  comparação de todas134 células de cada linha via SHA-256. Também confronta
  valores HTTP com Dpgsql direto no mesmo banco; nenhum valor pessoal vai ao log.
- Fixture controlada no mesmo banco temporário:150 resultados, truncamento100/2,
  NULL, Money12.3456, dez GETs concorrentes, rejeições de entrada e nomes de saída
  `Ação`/`Acao`, `Nº`/`No`, `Cost$"tag`, com valores distintos verificados por ordinal.
  Essa fixture usa contrato declarado de teste; não é apresentada como extração DAO.

O banco, servidor e arquivos privados temporários são removidos pelo teste. A prova
real continua limitada aos sete casos DAO do doc43; não é equivalência global dos
relatórios ou de todas as queries. HTTP NULL foi validado como resultado vazio;
ainda não existe oráculo DAO específico para coerção de parâmetro NULL.
