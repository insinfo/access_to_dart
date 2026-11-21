# 48 — DateTime físico preservado na migração e no CRUD

## Falha observada

A auditoria integral rejeitou a migração em `migration-integrated-803634a-rejected-time-loss`: 885 das 887 colunas escalares coincidiram com o oráculo DAO. `TbAtColetivo.horario` e `TbGrupo.Horario` perderam componentes de data porque `Format`/`InputMask` de apresentação faziam o gerador escolher PostgreSQL `TIME`. As contagens de NULL coincidiam; isso não era um problema de ordenação nem uma autorização para normalizar o oráculo.

## Correção

O tipo físico Access `DateTime` agora produz `TIMESTAMP` independentemente de máscara, formato, defaults ou amostras. Tipos explicitamente `Date`/`Time` continuam distintos. A semântica visual continua escolhendo os controles de data/hora. `Time()` e `TimeSerial()` em DateTime usam a data-base 1899-12-30; `Date()` mantém meia-noite.

INSERT, COPY textual e o executor binário conservam os componentes civis e microssegundos. Um DateTime local é transportado com os mesmos componentes, sem aplicar conversão de instante para UTC. O DTO gerado serializa DateTime completo mesmo quando a tela apresenta somente data ou hora; o parser aceita tanto ISO completo quanto a entrada legada HH:mm. Os helpers da tela transformam ISO em valor nativo válido para input date/time e não aplicam máscara dd/mm/yyyy ao ISO produzido pelo input date.

Carregar e reenviar um DTO sem editar conserva o valor completo. Editar explicitamente um input de hora ancora o novo valor em 1899-12-30; editar data produz meia-noite. O oráculo COM `tools/test_temporal_display_edit_access.ps1` (commit `0aa6cbf`) confirmou esses três comportamentos em formulário Access temporário, por `.Text`, mudança de foco e salvamento de `.Dirty`, com a configuração regional Windows atual. Não é uma prova de cliques humanos em todos os formulários SIGA.

## Validação

- `dart analyze lib test/generation/long/temporal_storage_postgres_test.dart test/access_temporal_semantics_test.dart test/migration_statement_builder_test.dart test/migration_temporal_batch_test.dart`: sem problemas.
- `dart test test/generation/long/temporal_storage_postgres_test.dart --reporter expanded`: passou contra PostgreSQL real em banco temporário TEMPLATE template0, com cleanup. Verifica INSERT, COPY, caminho binário elegível, defaults, data real em ShortTime, hora oculta em ShortDate e microssegundos. Fuso local observado: UTC−03; sessão PostgreSQL usa Pacific/Honolulu.
- O mesmo teste gera, analisa e compila backend real e verifica GET, PUT sem alteração, PUT/POST com ISO completo, entrada HH:mm e defaults locais via HTTP. Executa também helpers efetivamente emitidos para o frontend, em probe Dart isolado, incluindo data com máscara; esse probe não substitui teste Angular em navegador.
- `dart test test/generation/fast test/access_temporal_semantics_test.dart test/migration_statement_builder_test.dart test/migration_temporal_batch_test.dart --concurrency=1 --reporter expanded`: 83 testes passaram. Regressões rápidas e temporais estão registradas em `build/codex-temporal-final-fast.log`; evidência HTTP em `build/codex-temporal-http-test.log`.

O resultado integral pós-correção das 887 colunas depende da nova execução coordenada do gate e será registrado no documento 45. A evidência rejeitada e os oráculos anteriores permanecem preservados; esta correção não declara toda a aplicação convertida ou validada.
