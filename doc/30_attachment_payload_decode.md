# Attachment.FileData: conteúdo original e BYTEA fiel ao DAO

## Diferença real detectada

O campo binário da tabela interna de anexos contém um envelope Access, não o
arquivo diretamente. O oráculo independente `DAO Attachment.FileData.SaveToFile`
mostrou quatro diferenças na fixture SIGA-SUL:

| Tabela auxiliar | Bytes armazenados | Bytes do arquivo DAO | Armazenamento |
| --- | ---: | ---: | --- |
| TbReuniao_Ata_attachment | 1016648 | 1190422 | zlib |
| TbUnidade_LOGO_attachment | 91202 | 91174 | bruto com envelope |
| TbUnidade_RODAPE_attachment | 15908 | 15880 | bruto com envelope |
| TbUnidade_imgCartaoSuas_attachment | 599228 | 599200 | bruto com envelope |

SHA256 da fixture: `49da020eb4f0aa40118cff541a0365a03b9d6a7f05c84f68268ed16531a7c1f3`.
Os hashes de armazenamento e de arquivo estão preservados lado a lado em
`test/fixtures/sigasul_attachment_dao_hashes.json`, sem conteúdo dos arquivos.
Os oráculos originais em `build/codex-sigasul-goal/value-audit/` não foram
alterados para fazer o envelope parecer um arquivo válido.

## Formato e correção

A referência local de desenvolvimento é
`third_party/jackcess_src/com/healthmarketscience/jackcess/impl/complex/AttachmentColumnInfoImpl.java`,
métodos `AttachmentImpl.getFileData`, `decodeData` e `encodeData`.

O envelope inicia com dois inteiros de 32 bits little-endian: tipo de
armazenamento (0 bruto, 1 zlib) e tamanho do conteúdo descomprimido. O conteúdo
começa com outro inteiro little-endian indicando o tamanho de seu cabeçalho,
que inclui flags/extensão UTF-16. O arquivo é o restante após esse cabeçalho.

`decodeAttachmentFileData` remove esse envelope e descomprime somente quando
necessário. Verifica tipo, limites e comprimentos antes de aceitar o resultado.
O sink da descompressão rejeita saída que ultrapasse o tamanho declarado.
Também verifica o Adler32 do stream zlib: o teste de entrada truncada revelou
que o inflater Dart pode devolver todos os bytes mesmo sem o trailer, portanto
comprimento correto sozinho não bastava.

`decodeAttachmentRow` copia a linha e altera somente FileData. FileName,
FileType, timestamps, flags, vínculos e outras colunas binárias permanecem
intactos. Erros de formato são explícitos; não existe fallback para o envelope.

A operação é aplicada na materialização semântica de anexos do analyzer e no
carregamento completo das linhas de migração para tabelas marcadas
`syntheticKind: attachment`. O TableReader genérico continua retornando bytes
armazenados; OLE/LongBinary comuns não são reinterpretados como anexos. Isso
mantém a distinção entre leitura física e arquivo original, também existente
na API Jackcess.

Análises novas passam a conter payloads decodificados. Snapshots antigos não
são reescritos implicitamente; a migração completa relê os arquivos Access e
aplica a decodificação nesse carregamento.

## Prova de integração

- Seis testes do decoder: bruto/comprimido, arquivo vazio, imutabilidade,
  preservação de metadados e casos malformados/truncados/limites/checksum.
- Regressão existente de materialização de anexo no analyzer.
- Quatro testes reais com SHA256 e comprimento iguais aos arquivos exportados
  pelo DAO, mantendo também os hashes físicos anteriores.
- Teste CLI/PostgreSQL: cria banco temporário com TEMPLATE template0, migra as
  quatro tabelas reais por `migrate --mode schema-and-data --seed-format copy`
  e verifica cada BYTEA via `encode(file_data, 'hex')`. Os quatro hashes e
  comprimentos coincidem exatamente com o DAO. Banco e arquivos temporários
  são removidos ao término.

Resultado: **12 testes passaram**. Os 11 testes de decoder/analyzer/fonte levaram
16 segundos; o gate CLI→BYTEA levou 35 segundos. Logs locais:
`build/codex-attachment-tests-final.log` e
`build/codex-attachment-migration-test.log`.

Essa prova cobre os quatro anexos presentes na fixture e os formatos bruto/zlib
exercitados. Não substitui a auditoria integral de valores de todas as tabelas,
que é registrada separadamente no documento 29.
