# SIGAsul: auditoria integral de valores e correção Boolean

Data: 2026-11-21. Complementa contagens DAO/PostgreSQL; contagens iguais não garantem valores iguais.

## Gate independente

Ferramentas versionáveis:

- `tools/audit_dao_value_hashes.ps1 -Source <accdb> -Analysis <analysis.json> -Output <oracle.json>`
- `dart run tools/audit_reader_value_hashes.dart <accdb> <analysis.json> <oracle.json> <comparison.json>`

Ambas usam `ACCESS_DAO_PASSWORD` somente no ambiente. A primeira abre o Access via DAO read-only; a segunda usa diretamente TableReader do decoder Dart, sem PostgreSQL. O SHA256 do arquivo-fonte deve permanecer igual antes/depois e ser o mesmo do oráculo.

Cobertura integral: TbPessoa (7.040 linhas × 59 colunas), CadResidencia (2.869 × 81), TbAtend (9.776 × 48): **1.116.997 células, 188 colunas**. Não é amostragem. O hash de cada coluna incorpora a PK e o valor de cada linha em ordem de PK; duplicidade de chave falha. Somente hashes e contagens são gravados em `build/codex-sigasul-goal/value-audit/`, fora do Git. Não há exportação dos valores pessoais.

Contrato `typed-column-pk-v1`: prefixos de tipo, enquadramento pelo comprimento UTF-16 e SHA256 UTF-8. NULL é diferente de texto vazio; strings mantêm espaços, caixa e composição Unicode, sem trim/NFC. Inteiros e Boolean exigem o tipo correspondente. Datas usam componentes civis com seis casas de microssegundos, sem converter fuso; submicrossegundos DAO são contados e impedem aprovação. Currency usa as quatro casas do tipo Access; resíduos de ponto flutuante são reportados e só a representação binária inevitável é tolerada. Valores fora da escala além dessa tolerância ou inteiros escalados não seguros impedem aprovação. Nesta fonte: zero casos fora da escala e zero datas submicrossegundo; maior resíduo escalado de moeda: 2,3283064365386963e-10.

## Defeito detectado e correção de origem

Antes da correção, todas as **117 colunas Boolean** divergiam (24/54/39 por tabela). As outras 71 colunas já coincidiam, incluindo textos Unicode, dinheiro, datas e inteiros. O leitor tinha 646.260 células Boolean ausentes/NULL onde DAO retornava valores Boolean.

O bit de máscara de um Boolean comum é o próprio valor. O decoder tratava bit zero como NULL e, para bit um, lia um byte do offset fixo. Na fonte, esse offset podia ser zero, fazendo o valor depender do byte baixo da PK. Portanto converter NULL para false depois da leitura seria insuficiente.

A correção em `packages/jackcess_dart/lib/src/row_reader.dart` obtém Boolean comum diretamente da máscara antes do ramo genérico de NULL. Boolean calculado é excluído dessa regra e continua lendo o payload encapsulado.

Referências primárias: [Jackcess TableImpl.getRowColumn](https://github.com/jahlborn/jackcess/blob/master/src/main/java/com/healthmarketscience/jackcess/impl/TableImpl.java), [ColumnImpl.readFromNullMask](https://github.com/jahlborn/jackcess/blob/master/src/main/java/com/healthmarketscience/jackcess/impl/ColumnImpl.java) e [CalculatedColumnUtil.CalcBooleanColImpl](https://github.com/jahlborn/jackcess/blob/master/src/main/java/com/healthmarketscience/jackcess/impl/CalculatedColumnUtil.java). O último distingue explicitamente Boolean calculado de Boolean armazenado na máscara. Não foi ampliado o tratamento de payloads calculados vazios nesta entrega.

## Resultado após correção

O mesmo oráculo DAO, sem alterar normalização nem trocar hashes esperados, agora coincide em **188/188 colunas** das três tabelas. A fonte Access permaneceu inalterada. Os artefatos preservam a trilha:

- `dao-value-hashes.json`: oráculo independente.
- `reader-value-comparison.json`: baseline anterior, 117 divergências Boolean.
- `reader-value-comparison-after-boolean.json`: zero divergências escalares após correção.

Testes do RowReader: nove passaram, incluindo combinações dos bits Boolean em PKs 255, 256 e 257, false presente em vez de NULL, NULL inteiro independente e payloads calculados false/true. Dois testes adicionais verificam o contrato de hashes (tipos, texto exato e microssegundos). A suíte completa do pacote teve 29 casos aprovados e uma expectativa antiga de 40 tabelas; ela foi corrigida para as 45 tabelas já confirmadas pelo oráculo antes desta mudança, e o único caso afetado passou na reexecução. Assim, os 30 casos do pacote foram validados; analyze do decoder, teste e ferramentas ficou limpo.

## Anexos e limites do gate

DAO exportou os quatro payloads de anexos para arquivos temporários com nomes aleatórios, calculou hashes e removeu os temporários. A comparação inicial com FileData bruto detectou quatro divergências: três blobs têm 28 bytes adicionais e o anexo Ata tem tamanho comprimido distinto. Esses hashes não foram apagados nem tratados como equivalentes; o decoder de envelopes/anexos tem trilha separada.

O comando de comparação retorna código 1 enquanto existir divergência escalar ou entre FileData bruto e payload DAO; `allScalarColumnsMatch` distingue o gate escalar completo. A validação acima não comprova ainda os valores já migrados para PostgreSQL: é necessário migrar novamente usando o decoder corrigido e auditar o resultado. Também não afirma fidelidade integral das demais tabelas fora destas três.
