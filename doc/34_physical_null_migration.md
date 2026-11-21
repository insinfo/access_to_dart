# NULL físico do Access não deve ativar DEFAULT PostgreSQL

O gate de valores encontrou células NULL que viraram zero em três colunas de CadResidencia (`Nº Comodos`, `Nº Dormitorios`, `Nº pessoas/Dormitorio`) e duas colunas Money de TbPessoa (`Renda sem programas sociais`, `Renda per capita`). A auditoria identificou respectivamente 2, 1, 5, 5 e 2 células; este documento não contém valores pessoais.

`TableReader.readAllRows` representa NULL físico omitindo a chave no mapa. `_mergeMigrationRowsFromSource` repassava o mapa esparso ao exportador; INSERT/COPY só incluíam as colunas presentes. PostgreSQL, corretamente, aplicava o DEFAULT às colunas omitidas, alterando o dado original.

A correção fica na fronteira da leitura física: para cada tabela lida, `TableReader.readSchema` fornece os nomes das colunas reais. Cada linha recebe essas chaves, com valor NULL quando ausente. Valores presentes são preservados, e o processamento de anexos continua após essa materialização. Não se preenchem mapas sintéticos nem se muda o contrato genérico do statement builder. O tratamento de colunas calculadas e autonuméricas permanece no exportador existente.

## Regressão reproduzível

`test/generation/long/migration_physical_null_postgres_test.dart` usa a fixture física `teste1.accdb`, cuja coluna Contatos.Empresa é NULL nas duas linhas e está ausente nos mapas do leitor. A análise de teste define um DEFAULT não nulo no destino para expor o erro. A CLI real exporta e aplica INSERT e COPY em bancos PostgreSQL temporários com TEMPLATE template0.

Antes do patch, ambos os formatos falharam: o PostgreSQL continha a sentinela do DEFAULT em vez de NULL. Depois do patch:

- as duas células continuam NULL, mantendo IDs e nomes presentes;
- INSERT novo que realmente omite Empresa ainda recebe o DEFAULT;
- o modo sequence preserva as chaves importadas e avança a próxima chave;
- uma análise sintética com Empresa ausente não ganha NULL artificial: o seed continua omitindo a coluna, em ambos os formatos.

Com `ACCESS_TO_DART_TEST_PG_*` configurado:

```text
dart test test/generation/long/migration_physical_null_postgres_test.dart test/migration_source_integrity_test.dart test/migration_statement_builder_test.dart --reporter expanded
```

Resultado: 23 testes aprovados. O gate completo SIGAsul deve ser reexecutado para confirmar todas as células, separadamente das descobertas de complex fields ainda em investigação.
