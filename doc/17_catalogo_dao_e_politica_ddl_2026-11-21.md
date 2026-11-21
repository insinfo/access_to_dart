# Reconciliação do catálogo DAO e do DDL analítico — 21/11/2026

A suíte ampla revelou seis falhas. A revisão separou expectativas antigas de dois
problemas reais: inclusão de consultas internas no catálogo de queries e aplicação
implícita de relaxamento de `NOT NULL` ao esquema descritivo de `analyze`.

## Oráculo independente

Foi usado `DAO.DBEngine.120` no Windows, abrindo os bancos com
`OpenDatabase(path, false, true, connect)`: o terceiro argumento solicita somente
leitura. Foram consultados apenas metadados: `MSysObjects.RecordCount` por
`TableDefs`, `TableDefs`, `QueryDefs`, `Containers('Forms').Documents` e
`Containers('Reports').Documents`. Não foram lidos registros de pessoas.

Uma tentativa inicial de consultar `MSysObjects` via SQL foi recusada pelo DAO
por permissão de leitura; não foram alteradas permissões. A conferência prosseguiu
pelas coleções oficiais de metadados, que estavam acessíveis.

| Fixture | SHA-256 |
|---|---|
| `fixtures/teste1/teste1.accdb` | `f4b879c0d4e81fb52199dc150840ba889af3ddbe4c80b69a29f144141d177f08` |
| `fixtures/SIGAsul.accdb` | `3dd6f80991f010f99140c58f7da72d929f2a589427f1a6e311907d272a4419e0` |
| Backend SIGA criptografado em `fixtures/` | `49da020eb4f0aa40118cff541a0365a03b9d6a7f05c84f68268ed16531a7c1f3` |

| Metadado | teste1 | SIGAsul frontend | SIGA backend |
|---|---:|---:|---:|
| RecordCount do catálogo | 54 | 943 | 124 |
| Tabelas de usuário (incluindo vínculos) | 1 | 45 | 45 |
| Tabelas vinculadas | 0 | 45 | 0 |
| QueryDefs | 7 | 501 | 0 |
| Forms | 3 | 97 | 0 |
| Reports | 4 | 165 | 0 |

As expectativas anteriores de 53 registros de catálogo no teste1, 38 vínculos,
85 forms, 147 reports e 40 tabelas de backend não descreviam estas fixtures.
Os testes foram atualizados para os valores confirmados pelo DAO, sem substituir
asserções exatas por limites permissivos.

## As 39 queries adicionais eram um bug real

O decoder listava **540** queries no SIGAsul. A comparação dos nomes completos
mostrou **todos os 501 nomes do DAO, mais 39 artefatos internos**, sem omissão de
nenhuma query exposta por DAO. A lista independente de nomes e o hash da fixture
ficaram em `test/fixtures/sigasul_dao_catalog.json`.

| Grupo | Flags (hexadecimal sem sinal) | Quantidade |
|---|---|---:|
| Exposto por DAO | `0x0` | 298 |
| Exposto por DAO | `0x40000` | 110 |
| Exposto por DAO | `0x3` | 57 |
| Exposto por DAO | `0x80` | 21 |
| Exposto por DAO | `0x40003` | 15 |
| Interno, ausente do DAO | `0x80060100` | 29 |
| Interno, ausente do DAO | `0x80020100` | 10 |

`tools/inspect_access_catalog.dart --verbose-rows` confirmou registros não
apagados, incluindo referências overflow. A classificação deve usar **tipo 5 e
bit alto `0x80000000` desligado**. O getter `isQueryDefinition` implementa esse
contrato. O inventário bruto de `debugGetAllEntries()` conserva os 540 registros.

Não se filtram nomes por sufixo hexadecimal nem pelo prefixo `~sq_`. O bit `0x02`
também aparece nas consultas legítimas de controles/formulários: reutilizar o
predicado genérico `isSystem` excluiria indevidamente 72 queries expostas pelo
DAO. Essa alternativa foi rejeitada pelo teste do conjunto exato. O significado
interno detalhado dos demais bits não foi deduzido apenas desta amostra.

A conferência separada de `read-src` encontrou **409** queries exportadas, todas
presentes no conjunto DAO. Portanto, `missingInBinary=0` e `missingInSource=92`:
a expectativa antiga de que obrigatoriamente haveria uma lacuna no binário também
estava desatualizada. O teste agora exige estes valores exatos, mantendo
`mismatched=0` e as verificações dos tipos de reconciliação.

## DDL de análise e política de migração

`AccdbAnalyzer` e `AnalysisOverlayMerger` produzem `postgres_ddl` para descrever
o esquema observado. Passam agora `MigrationNotNullMode.strict` explicitamente
para conservar `Required` como `NOT NULL` nesse relatório.

A migração continua com seu padrão anterior `relax-not-null`; esta revisão não
muda a política tolerante de importação. O teste de overlay verifica ambos:
metadado requerido e DDL analítico estrito, mas DDL de migração padrão tolerante.

## Verificações reproduzíveis

- `dart test test/access_catalog_query_visibility_test.dart`: casos sintéticos
  de flags positivos/negativos de 32 bits, queries ocultas, nomes livres e
  comparação integral do conjunto SIGAsul contra o oráculo DAO.
- `dart test test/analysis_overlay_merger_test.dart`: campos, defaults e separação
  entre DDL estrito de análise e DDL tolerante de migração.
- `dart test test/access_to_dart_cli_test.dart --concurrency=1`: inspeção das
  fixtures, contagens, reconciliação de queries e metadados do overlay.

O teste sintético aceita um nome terminado em 32 dígitos hexadecimais quando não
há flag interna; a identificação não depende de heurística do nome. As contagens
são específicas dos hashes acima. Novas versões das fixtures exigem uma nova
conferência independente, e não apenas atualizar os números até os testes passarem.

## Resultado desta rodada

Os três arquivos de teste acima executados juntos com `--concurrency=1` passaram:
**13 testes, 0 falhas, 2min04s**. O log local está em
`build/codex-cli-reconciled-final.log` (artefato de execução, não versionado).
`git diff --check` também passou. A política de migração padrão foi preservada.
