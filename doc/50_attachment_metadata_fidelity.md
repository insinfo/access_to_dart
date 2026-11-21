# Metadados e associação dos anexos: oráculo DAO separado

## Escopo

A prova de payloads não demonstra, sozinha, fidelidade dos nomes/tipos dos arquivos,
metadados ou associação ao pai. Esta auditoria acrescenta um contrato próprio,
`attachment-metadata-parent-v1`, sem alterar IR, gerador, migração ou os números do
gate geral de valores. Não transforma a auditoria de células escalares em uma prova
de todos os dados complexos.

`audit_dao_attachment_metadata.ps1` abre o ACCDB original read-only e percorre as
coleções dos registros pais. Descobre os campos realmente expostos pelo recordset
filho DAO: FileData (11), FileFlags (4), FileName (10), FileTimeStamp (8), FileType
(10) e FileURL (12). Não aparece ID interno do filho nesse recordset; nenhum ID
oculto é inferido ou alegado como comparado.

Cada registro associa tabela, coluna complexa, PK tipada do pai, hash/tamanho do
payload e hashes dos cinco metadados. SaveToFile extrai cada payload em diretório
temporário exclusivo, removido no finally. A fonte é conferida por SHA-256 antes e
depois. O artefato privado contém hashes, tipos e nulidade, não nomes de arquivos,
URLs, timestamps ou IDs em claro. Hashes não devem ser tratados como anonimização;
os artefatos continuam restritos a `build/` e não são versionados.

`audit_reader_attachment_metadata.dart` lê os TDEFs/linhas físicos com TableReader.
Resolve a ligação pelo ponteiro complexo do pai e pela coluna de ligação física do
filho, exigindo proprietário único; não confunde PK do pai com ponteiro. Compara o
schema visível DAO, decodifica FileData e confronta multiconjuntos de registros,
preservando duplicatas sem depender da ordem física ou de ordinal DAO.

A canonicalização distingue NULL, string vazia e zero. Text/Memo são UTF-8 exatos;
Long usa representação inteira; DateTime civil usa seis casas fracionárias, sem
conversão de timezone. Strings do multiconjunto são enquadradas por comprimento,
para não colidir lista vazia com item vazio ou itens contendo separadores.

## Resultado real DAO → TableReader

As seis coleções contêm cinco anexos: TbUnidade.LOGO, RODAPE, imgCartaoSuas e rma1;
TbReuniao.Ata; TbAcaoComun.ListagemAnexa está vazia. Coincidiram inventário,
contagens de pais/filhos, associação à PK do pai, cinco payloads/tamanhos e 25 células
de metadados. O hash da fonte permaneceu inalterado. Um teste negativo alterou
apenas o hash de FileName em uma cópia privada do oráculo: o comparador retornou
exit1/ALL_MATCH=false; com o oráculo original, exit0/ALL_MATCH=true.

| Campo | Não NULL | NULL | Resultado |
|---|---:|---:|---|
| FileName | 5 | 0 | Igualdade exata |
| FileType | 5 | 0 | Igualdade exata |
| FileTimeStamp | 0 | 5 | Nulidade preservada |
| FileFlags | 0 | 5 | Nulidade preservada |
| FileURL | 0 | 5 | Nulidade preservada |

Portanto o conjunto real não prova leitura de timestamps, flags ou URLs não NULL.
Os testes sintéticos do contrato cobrem distinção de tipos, fração de microssegundos,
ausência de conversão de timezone e multiplicidade; não substituem um oráculo DAO
com esses valores preenchidos. Nenhuma afirmação de precisão submicrossegundo é feita.

## Comparador PostgreSQL preparado

`audit_postgres_attachment_metadata.dart` aceita o banco temporário já migrado do
gate integrado. Abre transação READ ONLY e faz rollback no finally; não cria,
migra nem remove banco. Usa aliases ASCII e consulta os metadados/payloads junto
com a PK pai, mantendo o mesmo contrato de hashes. O payload BYTEA migrado já é o
conteúdo decodificado; não é decodificado novamente.

A execução PostgreSQL fica pendente do handoff do gate integrado. A prova concluída
nesta etapa é DAO → TableReader. Um resultado PostgreSQL será registrado
separadamente após a execução real; analyze não equivale a essa validação.

## Reprodução

Configurar ACCESS_DAO_PASSWORD e ACCESS_TO_DART_TEST_PG_* no ambiente autorizado.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/audit_dao_attachment_metadata.ps1 -Source fixtures/SIGA2021-SUL_be_senha_4462.accdb -Analysis build/codex-sigasul-goal/analysis-integrated-803634a/analysis.json -Output build/codex-sigasul-goal/value-audit/dao-attachment-metadata.json
dart run tools/audit_reader_attachment_metadata.dart --source fixtures/SIGA2021-SUL_be_senha_4462.accdb --analysis build/codex-sigasul-goal/analysis-integrated-803634a/analysis.json --oracle build/codex-sigasul-goal/value-audit/dao-attachment-metadata.json --output build/codex-sigasul-goal/value-audit/reader-attachment-metadata.json
dart test test/attachment_metadata_contract_test.dart
dart run tools/audit_postgres_attachment_metadata.dart --analysis build/codex-sigasul-goal/analysis-integrated-query/analysis.json --oracle build/codex-sigasul-goal/value-audit/dao-attachment-metadata.json --database BANCO_TEMPORARIO_DO_HANDOFF --output build/codex-sigasul-goal/value-audit/pg-attachment-metadata.json
```

Os comparadores retornam exit1 em divergência,65 em falha estrutural/execução e0
somente quando todos os registros e associações do escopo conferem. Logs mostram
apenas totais/status; os relatórios locais apresentam contagens e campos divergentes,
sem imprimir valores pessoais.
