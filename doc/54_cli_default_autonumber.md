# 54 — AutoNumber funcional no pipeline CLI padrão

## Reprodução

O default de `migrate` era `plain-int`, enquanto o backend gerado omite uma chave AutoNumber não informada no POST e espera um DEFAULT no PostgreSQL. O teste real executou CLI migrate sem `--auto-number-mode`, importou IDs sintéticos 5 e 42, gerou/analisou/compilou o backend e chamou POST sem ID. A migração terminava com sucesso, mas o POST retornava **400**. Log preservado: `build/codex-cli-auto-baseline.log`.

## Alteração delimitada

O CLI agora usa `sequence` como default e fallback do parser, com help atualizado. Esse modo só atribui sequência às colunas identificadas como AutoNumber na origem; não promove toda chave primária. `force-sequence` continua uma escolha explícita. NOT NULL, UNIQUE, seed e demais políticas não mudaram.

`--auto-number-mode plain-int` continua disponível como opt-out explícito, documentado no README. Esse modo não cria o DEFAULT necessário para inserts automáticos; quem o escolhe deve fornecer IDs ou configurar a estratégia de geração separadamente. Os defaults das APIs de biblioteca MigrationStatementBuilder/MigrationWriter permanecem inalterados para preservar compatibilidade de chamadas diretas. O CLI passa o modo escolhido explicitamente a ambas as etapas de exportação/aplicação.

## Validação

`test/generation/long/cli_default_autonumber_postgres_test.dart` usa banco temporário TEMPLATE template0 e dados exclusivamente sintéticos. Ele executa o comando migrate real com aplicação PostgreSQL, sem flag de autonumeração, e testa o backend gerado por HTTP:

- IDs importados 5/42 preservados; primeiro POST sem ID retorna 200 e ID43.
- INSERT rejeitado por CHECK não deixa registro44; POST posterior recebe45, respeitando a semântica não transacional da sequência PostgreSQL.
- Tabela com PK comum continua sem DEFAULT de sequência e aceita ID explícito.
- Opt-out plain-int gera schema sem CREATE SEQUENCE/nextval.
- Servidor encerrado, conexão fechada, banco e diretório temporários removidos no finally.

Teste PostgreSQL/HTTP: **passou** (log `build/codex-cli-auto-final.log`). Seis testes rápidos de migrate passaram, incluindo entrada `.accdb`, estilos de identificadores e Money. Analyze do CLI e teste novo: sem problemas.

A sequência inicializada a partir do máximo importado não reproduz necessariamente o contador histórico do Access após exclusões. Por exemplo, uma origem que já consumiu IDs maiores e os excluiu pode continuar de outro número no Access. Preservar esse estado interno é uma validação separada, não uma propriedade demonstrada por este teste. Esta alteração também não exige nem executou nova migração integral SIGA.
