# Contrato v2 de auditoria escalar

Data: 2026-11-21.

O contrato `typed-column-pk-v2` amplia o oráculo para todas as colunas escalares das 45 tabelas físicas: 887 colunas no snapshot analisado. Os nove campos ComplexType ficam explicitamente fora deste contrato; seus vínculos, coleções e payloads têm auditorias separadas. O contrato v1, seus artefatos e o resultado delimitado do doc32 permanecem preservados.

`audit_dao_value_hashes.ps1 -Contract v2` abre a fonte somente leitura e verifica seu SHA256 antes/depois. Mantém a ordenação numérica da PK e usa seu tipo real no framing (`primaryKeyType`), NULL distinto de vazio, texto exato, Currency com quatro casas e componentes civis de DateTime com microssegundos. Acrescenta:

- Double: os oito bytes IEEE754 em hexadecimal big-endian, sem conversão decimal; distingue zero negativo e valores adjacentes.
- Integer: inteiro assinado de 16 bits, com limites verificados.
- OLE: tamanho e SHA256 dos bytes originais, preservando NULL e conteúdo vazio distintos.

Os auditores Dart exigem cobertura de todas as tabelas físicas e de todas as colunas escalares de cada tabela. PostgreSQL usa `float8send` para Double e `encode(bytea, 'hex')` para OLE; o tipo de armazenamento precisa corresponder. Não se converte NUMERIC para Double para esconder perda. No contrato v2, `attachmentsAudited=false` explicita que a aprovação escalar não valida coleções aninhadas.

Validação sintética: quatro testes unitários passaram; sete testes PostgreSQL reais passaram, incluindo a regressão v1 e o contrato v2 nos dois estilos de identificadores. Foram cobertos Double adjacente/zero negativo, Int16, OLE vazio/NULL/bytes, corrupção detectada e recusa de cobertura incompleta. As bases de teste usam TEMPLATE template0 e são removidas em finally. Analyze dos arquivos Dart novos/alterados ficou limpo.

A execução do oráculo real ampliado e sua comparação com o leitor concluíram; o resultado está registrado abaixo. Relatórios reais permanecem em build privado; este documento não inclui hashes de colunas, credenciais ou valores da fonte.

## Boolean adicionado após uma linha antiga

Uma fixture sintética independente DAO criou tabela com PK, inseriu a chave 256 e só depois adicionou um campo YESNO. DAO retornou false, e não NULL. O leitor descartava a coluna por ela exceder o número de colunas registrado na máscara antiga da linha. A regressão falhou antes da correção e passou depois: ausência de bit equivale a bit zero, portanto false para Boolean simples; valores calculados e outros tipos continuam NULL/ausentes. Os dez testes RowReader passaram. A regra também está documentada em [Jackcess NullMask.isNull](https://jackcess.sourceforge.io/xref/com/healthmarketscience/jackcess/impl/NullMask.html), combinada com ColumnImpl.readFromNullMask. Commit separado: `3415766`.

## Compatibilidade v1 verificada com o inventário ampliado

O oráculo separado `dao-value-hashes-54.json`, gerado contra a análise de 54 tabelas, manteve exatamente os mesmos 188 hashes escalares, contagens e NULLs do oráculo v1 original. Os quatro payloads anteriores permaneceram idênticos e o total passou a cinco. O arquivo original não foi substituído. A validação PostgreSQL desse novo inventário é independente do PASS delimitado de 50 tabelas do doc32.

## Correção da premissa sobre o tipo da chave

A primeira tentativa de comparação ampliada recusou uma chave Double convertida implicitamente para Long pelo auditor. Quatro tabelas físicas têm PK Double, incluindo CADUNICO; a premissa de que todas as 45 chaves eram Long estava incorreta. O rascunho privado foi preservado como `dao-value-hashes-v2-rejected-long-pk.json` e não é evidência de paridade. O contrato v2 agora exige `primaryKeyType` e usa a canonicalização IEEE754 também no framing dessas chaves. A ordenação continua numérica, sem arredondar a chave para inteiro.

Quatro testes PostgreSQL cobrem PK Long e Double fracionária nos dois estilos de identificadores. Todos passaram. Os 188 hashes históricos do contrato v1 não são afetados; o oráculo v2 completo foi regenerado com o tipo correto das chaves.

## Resultado final DAO → TableReader

A comparação com `analysis-integrated-803634a/analysis.json` passou: 45 tabelas físicas, 887/887 colunas, 123.862 registros e 4.694.077 células; zero hashes divergentes. Os quatro casos de PK Double usam framing IEEE754, e os 188 hashes históricos permaneceram idênticos. Não houve Currency fora da escala quatro nem componentes DAO abaixo de microssegundos neste conjunto. O código de saída foi zero.

O campo `attachmentsAudited=false` permanece explícito. Este resultado valida os escalares físicos; os nove campos complexos, os cinco payloads e os 55 valores multivalorados têm gates próprios. A comparação PostgreSQL ampliada será registrada no doc45 após sua execução integrada; o PASS do leitor não substitui essa etapa.

Evidências privadas em `build/codex-sigasul-goal/value-audit/`:

| Artefato | SHA256 do arquivo |
| --- | --- |
| dao-value-hashes-v2.json | `824ce64161a382a2906162484f963ede298c063ec147608b85c10e9ebcdd5d9e` |
| reader-value-comparison-v2.json | `09fc7a488759686a4a69be407d7f9eb6a39e60b0e566485867fdf8bd9c666978` |

A regressão final executou 11 testes: quatro unitários e sete PostgreSQL reais, cobrindo contratos v1/v2, dois estilos de identificadores, PK Long e Double fracionária, perda temporal, corrupção de payload e cobertura incompleta/duplicada. Todos passaram; log privado `build/codex-value-contract-final-tests.log`. Nenhum valor ou hash de coluna da fonte foi incluído neste documento.
