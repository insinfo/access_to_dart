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
