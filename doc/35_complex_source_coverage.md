# Cobertura das coleções Access: além das 50 tabelas anteriores

## Oráculo independente (21/11/2026)

`tools/audit_dao_complex_counts.ps1` abre o backend SIGAsul com DAO em modo
somente leitura, percorre os campos complexos de todas as tabelas físicas da
análise e conta os registros filhos. Não exporta valores, nomes de arquivos ou
conteúdo. O SHA-256 é conferido antes e depois:
`49da020eb4f0aa40118cff541a0365a03b9d6a7f05c84f68268ed16531a7c1f3`.

Resultado privado: `build/codex-sigasul-goal/value-audit/dao-complex-counts.json`.

| Tabela/campo | Tipo DAO dos filhos | Registros filhos |
|---|---|---:|
| TbAcaoComun.ListagemAnexa | Attachment | 0 |
| TbDemandaReprimida.Demanda SCFV-CRAS | Value/Text | 0 |
| TbDemandaReprimida.Outra demanda | Value/Text | 1 |
| TbEncaminhamento.MotivoNão | Value/Text | 54 |
| TbUnidade.LOGO | Attachment | 1 |
| TbUnidade.RODAPE | Attachment | 1 |
| TbUnidade.imgCartaoSuas | Attachment | 1 |
| TbUnidade.rma1 | Attachment | 1 |
| TbReuniao.Ata | Attachment | 1 |

Portanto, há **nove coleções**, seis campos de anexos com cinco arquivos e três
campos multivalorados com 55 valores. Os quatro payloads já comparados byte a byte
representam um subconjunto dos cinco arquivos. A migração anterior de 50 tabelas
cobria 45 tabelas físicas e cinco coleções de anexos; deixou quatro coleções de
fora, inclusive a vazia, cujo schema também precisa ser conservado.

## Causa observada para rma1

A leitura binária confirmou `ComplexID=32`, `FlatTableID=11125` e
`ComplexTypeObjectID=39` para `TbUnidade.rma1`. O shape de tipo contém os seis
campos de Attachment. A tabela física filha mantém `_imgRma` como vínculo e
`TbUnidade_imgRma` como autonumeração, embora o campo pai tenha sido renomeado.
O analisador exigia o nome `_rma1` e descartava a coleção quando não o encontrava.

A correção precisa resolver o vínculo pela estrutura, distinguindo coluna de
vínculo, autonumeração e campos do payload. Um nome diferente não autoriza
escolher qualquer coluna Long. Ambiguidade deve permanecer explícita.

## Pendências de aceitação

- Recuperar o anexo renomeado e comparar seu payload com DAO SaveToFile.
- Representar e migrar as três coleções multivaloradas, inclusive a vazia, com
  vínculo ao registro pai e comparação dos valores completos com DAO.
- Ampliar os oráculos de contagem e anexos após a nova análise. A contagem anterior
  123.866 não inclui os 56 registros filhos descobertos nesta auditoria.
- Validar leitura e edição dessas coleções no app gerado. Migrar a tabela filha
  não comprova a funcionalidade do controle Access correspondente.

Não há conclusão de fidelidade integral baseada somente nas 50 tabelas anteriores.

## Correção confirmada: anexo renomeado rma1

O analisador agora usa o shape de payload e o sinalizador `isAutoNumber` físico:
remove os campos pertencentes ao tipo Attachment (inclusive `FileFlags`) e a
chave autonumérica da tabela filha; aceita somente um candidato Long restante.
O vínculo `_imgRma` é preservado mesmo que o campo pai seja `rma1`. Zero ou dois
candidatos não são resolvidos por posição ou semelhança do nome.

O teste real confirmou `TbUnidade_rma1_attachment`, TDEF 11125, vínculo `_imgRma`,
um registro e o payload decodificado correto. O oráculo independente
`tools/audit_single_dao_attachment.ps1` abriu DAO em modo somente leitura,
executou `FileData.SaveToFile`, calculou hash e removeu o arquivo temporário,
conferindo o SHA-256 da fonte antes/depois. O quinto payload tem 1.895.077 bytes e
SHA-256 `152a7834868c930fed9b386f50d1567f580a90bf352f5acef38431a9bbb1fbc9`.
O envelope físico tem 1.895.105 bytes; seu hash também está no manifest de teste.

`test/fixtures/sigasul_attachment_dao_hashes.json` agora cobre os cinco arquivos.
Os testes `sigasul_attachment_payload_test`, `attachment_link_resolver_test` e
`accdb_analyzer_attachment_test` passaram: dez casos, incluindo ambiguidade,
ausência de vínculo, fixture pequena e os cinco hashes DAO (2 min 31 s).

Isso conclui a recuperação e prova do payload rma1. As pendências de multivalue,
recontagem/migração completa e edição dos controles acima continuam abertas.

## Multivalores: correspondência lógica e armazenamento órfão

O analisador agora materializa os três campos `Value/Text` como coleções
`syntheticKind=multivalue`, com metadados explícitos de pai, coluna do pai,
vínculo e valor. O linker promove as coleções mesmo quando vazias; o gerador SQL
emite a relação pelo identificador complexo físico, sem confundi-lo com a PK do
registro pai. Coleções de outros tipos ainda não foram validadas nesta etapa.

A auditoria DAO ganhou `sorted-parent-pk-text-v1`: cada valor é enquadrado por
comprimento, associado à PK do pai e ordenado ordinalmente antes do SHA-256.
Duplicatas são mantidas, texto não é aparado e NULL difere de string vazia. Os
hashes das três coleções, incluindo a vazia, coincidem com os 55 valores lógicos
lidos do arquivo real. Fixture de evidência contém apenas esquema, contagens e
hashes, sem valores.

A tabela física de `TbEncaminhamento.MotivoNão` contém **55** registros, mas um
não possui pai e não aparece nos Recordset2 do DAO. O conjunto lógico tem 54;
somado ao outro campo, são 55 valores visíveis no Access. Esse registro físico
adicional não é associado a um pai por suposição nem descartado silenciosamente.

- A análise separa `physicalRowCount`, `rowCount` lógico e `orphanRowCount`.
- A leitura para migração aplica o mesmo vínculo aos dados completos.
- Linhas órfãs são preservadas sem alterar seus valores em
  `orphaned_complex_rows.json`, dentro da saída privada da migração.
- O manifesto informa `quarantinedRowCount`, o arquivo separado,
  `logicalDataIncluded=true` e `fullDataIncluded=false` quando há linhas em
  quarentena. Não se afirma que todo armazenamento físico entrou nas tabelas
  lógicas PostgreSQL.
- Donos ambíguos ou chaves físicas inválidas falham explicitamente.

Validação: teste real de análise confirmou 54 tabelas (45 físicas, seis coleções
de anexos e três multivaloradas), os hashes DAO dos 55 valores e o órfão; passou em
2m18. Cinco testes adicionais passaram, incluindo preservação dos dados da
quarentena, recusa de vínculo ambíguo e regressão PostgreSQL de NULL/default nos
dois formatos de seed. A migração completa das novas coleções e seus controles
no navegador continuam pendentes até validação própria.
