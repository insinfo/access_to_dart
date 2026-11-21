# Gate de valores DAO → PostgreSQL

Data: 2026-11-21.

`tools/audit_postgres_value_hashes.dart` oferece `auditPostgresValueHashes(...)`, que recebe uma conexão já aberta, análise, oráculo DAO, MigrationIdentifierPolicy e SHA256 da fonte. Não migra nem altera dados. O modo CLI aceita `analysis.json dao-value-oracle.json database output.json` e usa credenciais de sessão ACCESS_TO_DART_TEST_PG_*.

`tools/verify_sigasul_migration.dart` aceita agora um quinto argumento opcional: `analysis.json output-dir dao-count-oracle.json backend.exe dao-value-oracle.json`. Após migrar e conferir contagens, compara valores na mesma base temporária, salva `postgres-value-audit.json` e só continua ao smoke HTTP se o gate passar. Divergência falha explicitamente; o finally continua removendo a base. O oráculo precisa corresponder ao SHA256 da fonte e cobrir todas as colunas das tabelas auditadas. Uma nova análise do mesmo arquivo pode ser usada; não se exige o hash da análise antiga.

## Comparação sem ocultar perda

O contrato é o mesmo `typed-column-pk-v1` do doc29, por coluna com PK incorporada e sem valores pessoais exportados. Nomes SQL são resolvidos pelo MigrationIdentifierPolicy e citados. O PostgreSQL retorna representações textuais sob DateStyle ISO; NUMERIC não é convertido para double. Currency permite apenas padronização que preserve exatamente o valor na escala quatro: dígitos não zero além da escala são recusados.

Datas não passam pelo Format visual do Access. TIMESTAMP preserva todos os componentes civis e microssegundos; DATE representa meia-noite e diverge se o DAO tinha componente de hora diferente. TIME não recebe data artificial: um valor não NULL é marcado com data ausente e diverge do datetime completo. O relatório expõe o tipo PostgreSQL, armazenamento date-only, componentes ausentes, nulos e representações não suportadas. Não se aplica conversão de fuso para forçar igualdade.

Os quatro payloads de anexos são comparados diretamente com os hashes DAO SaveToFile, por pai e ordinal, após JOIN pela chave complexa original. LEFT JOIN mantém órfãos visíveis ao gate. O bytea é convertido em hexadecimal para transporte sem normalização dos bytes; contagem, hash e tamanho são registrados sem nomes/conteúdo dos anexos.

## Validação da ferramenta

`test/generation/long/postgres_value_hash_audit_test.dart` valida os dois estilos de identificadores em PostgreSQL real com base sintética TEMPLATE template0:

- valor NUMERIC grande com quatro casas preservado exatamente;
- texto Unicode/espaços, false e timestamp com microssegundos coincidem com o contrato;
- converter timestamp para DATE ou TIME faz o gate falhar;
- payload BYTEA correto passa e remover um byte faz o gate falhar, mesmo com todas as colunas escalares ainda corretas.

Resultado: três testes passaram (os dois casos de banco cobrem ambos os estilos) e analyze dos quatro arquivos ficou limpo. O teste separado de canonicalização recusa precisão monetária extra não zero. As bases sintéticas são removidas em finally. A execução integral SIGAsul com 188 colunas e quatro payloads é uma etapa posterior; este documento não afirma resultado PostgreSQL completo antes dessa execução.

## Gate do leitor após os dois decoders

`reader-value-comparison-after-decoders.json` preserva raw hash e decoded hash lado a lado: 188/188 colunas escalares e 4/4 payloads decodificados coincidem com DAO. Os quatro hashes brutos continuam diferentes, pois incluem envelopes/compressão Access; não foram substituídos nem apagados. O comando do leitor retorna sucesso pelo hash do payload decodificado e preserva `allRawAttachmentPayloadsMatch=false` como evidência do envelope.

## Correção do auditor após o primeiro ensaio integral

O primeiro ensaio completo confirmou 50/50 contagens e quatro payloads, mas não passou no gate escalar. Havia um defeito no próprio auditor: `SELECT pk::text ... ORDER BY pk` podia ordenar pelo alias textual da projeção. Foi substituído por `ORDER BY audit_rows.pk`, qualificado pela tabela de origem, preservando a ordenação numérica usada no DAO. Os hashes esperados e valores não foram alterados.

A regressão agora usa PKs 2, 10 e 256 inseridas fora de ordem. Falhou nos dois estilos antes da correção e passou nos dois depois; os testes de perda temporal e corrupção BYTEA continuam passando. O relatório inicial permanece em `migration-value-audit/postgres-value-audit.json`, sem ser apresentado como prova válida para as colunas afetadas pela ordem.

O mesmo ensaio identificou três divergências independentes de NULL em CadResidencia: `Nº Comodos` (2), `Nº Dormitorios` (1) e `Nº pessoas/Dormitorio` (5) tinham NULL no DAO e zero NULL no PostgreSQL. Elas exigem correção no carregamento dos dados; não se deve alterar o oráculo nem converter NULL para default no auditor. A validação integral deve ser repetida após corrigir essa origem.

## Handoff opcional para navegador

Com `ACCESS_TO_DART_TEST_PG_HANDOFF_FILE` definido, o verificador só disponibiliza a base depois de contagens, valores e smoke HTTP aprovados. Grava um JSON privado com nome da base, host, porta e prazo (sem credenciais), espera o arquivo `.release` por no máximo 15 minutos e executa o cleanup no finally. Sem a variável, o comportamento anterior de cleanup imediato permanece. Um gate reprovado não publica a base para navegador.

## Resultado PostgreSQL após as correções de origem

O terceiro ensaio, em `migration-value-audit-money-fixed`, passou com a mesma fonte e os mesmos oráculos: 123.866 registros carregados, 50/50 contagens, 188/188 hashes de colunas escalares e 4/4 payloads iguais ao DAO. O smoke HTTP do backend gerado retornou as 7.040 pessoas esperadas, sem escritas. Foram corrigidos o carregamento dos NULLs físicos e o mapeamento Money para NUMERIC(19,4); não foram ajustados valores esperados para obter aprovação.

Evidências privadas em `build/codex-sigasul-goal/migration-value-audit-money-fixed/`, SHA256:

| Artefato | SHA256 |
| --- | --- |
| row-count-audit.json | `694d71508ddc4df392afb9e556c019129afac4b1b0a66b8b0360fecc8578bc36` |
| postgres-value-audit.json | `602b9757070a4041d210912ee89eb39a4c83e973f0c09485fa9f5d1a05cfcebf` |
| backend-http-audit.json | `cb16ac9a50d6b15dde4cb79d362b6fc377c35476d06b39a8ce9d8490fe960725` |

Este resultado cobre o snapshot de 50 tabelas (45 físicas e cinco coleções de anexos) e o recorte escalar de três tabelas/188 colunas do contrato v1. O inventário posterior do doc35 identificou outras coleções complexas; elas não estão aprovadas por este ensaio. A ampliação dos hashes escalares para todas as 45 tabelas físicas será versionada separadamente. Os ensaios anteriores reprovados permanecem preservados.
