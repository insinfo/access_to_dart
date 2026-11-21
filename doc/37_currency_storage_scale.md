# Escala física de Access Money

Data: 2026-11-21.

O segundo gate PostgreSQL, após correções de Boolean, anexos, ordenação do auditor e NULLs físicos, aprovou 50 contagens, quatro payloads e 187/188 colunas escalares do recorte DAO. A única divergência era `TbPessoa.Renda per capita`, Money armazenado como NUMERIC(19,2), apesar de ter NULLs corretamente preservados.

A causa estava no mapeamento fixo de `MigrationStatementBuilder`: o alias `money` retornava NUMERIC(19,2), enquanto `currency` e `smallmoney` já retornavam NUMERIC(19,4). Não foi o Format visual que escolheu a escala neste caso. O tipo Access Currency/Money usa inteiro de 64 bits escalado por quatro casas, conforme [Jackcess ColumnImpl.readCurrencyValue](https://github.com/jahlborn/jackcess/blob/master/src/main/java/com/healthmarketscience/jackcess/impl/ColumnImpl.java).

A correção remove esse desvio: os três aliases agora geram NUMERIC(19,4). O tratamento de Numeric com precision/scale explícitos permanece igual. Nenhum valor do oráculo foi arredondado ou substituído.

Validação:

- Três casos rápidos cobrem Money, Currency e SmallMoney, além de Numeric(18,6).
- A fixture real de metadados numéricos/calculados passou com a expectativa física Money corrigida para quatro casas.
- Um teste CLI→PostgreSQL real cria base TEMPLATE template0 e migra valores sintéticos `123.4567` e `0.0001`; confirma os dois valores completos e numeric_scale=4, depois remove a base.
- Analyze dos quatro arquivos alterados ficou limpo.

Evidência anterior preservada: `build/codex-sigasul-goal/migration-value-audit-null-fixed/postgres-value-audit.json`. A nova execução com o mesmo oráculo DAO passou: 50/50 contagens, 188/188 hashes escalares e 4/4 payloads, além do smoke HTTP de 7.040 pessoas. O relatório privado `migration-value-audit-money-fixed/postgres-value-audit.json` tem SHA256 `602b9757070a4041d210912ee89eb39a4c83e973f0c09485fa9f5d1a05cfcebf`; o doc32 registra os demais artefatos. O escopo de 50 tabelas/188 colunas/quatro payloads é delimitado; a expansão de campos complexos do doc35 tem validação separada.
