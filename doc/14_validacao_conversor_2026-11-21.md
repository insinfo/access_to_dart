# Correções e validação do conversor — 21/11/2026

Trabalho feito em `C:\MyDartProjects\access_to_dart`, no Windows, usando o
`new_sali` como referência de formulários, modelos compartilhados e repositórios.
O projeto `02` do Mac foi consultado como referência de engenharia reversa; não foi
necessário executar suas ferramentas de OCR para reproduzir estes defeitos.

## Correções na origem

- **Exports Access multilinha:** o parser de formulários reutiliza a junção dos segmentos
  de `SaveAsText`, preservando `Caption`, `RecordSource` e `ControlSource`. A regressão
  inclui o formulário real de ajuda do SIGAsul e SQL com `=` e aspas.
- **Overlay de formulários:** `analyze --src` passa os formulários e controles exportados
  para a análise consumida por `generate`. Preserva identidade e metadados binários,
  aplica propriedades presentes no export e mantém controles exclusivos do binário.
- **Chave autonumérica do backend:** `insertGetId` recebe a coluna real da PK e omite a
  chave nula para permitir a sequência do banco. IDs explicitamente fornecidos são preservados.
  Segue a prática do repository do `new_sali`, sem presumir uma coluna chamada `id`.
- **Bindings Angular:** nomes originais e opções são escapados nos contextos Angular e HTML,
  incluindo apóstrofos, barras, caracteres HTML e `$`.
- **Constantes do core:** nomes originais de colunas usam o emissor de literais Dart existente.
  O build real descobriu esse erro adicional, que a análise apenas do frontend não detectava.
- **API dpgsql:** adaptadores de migração e testes usam os tipos atuais `DpgsqlConnection`,
  `DpgsqlTransaction` e `DpgsqlException` da dependência local 1.0.2. O lockfile agora reflete
  o caminho relativo já declarado no pubspec, sem atualizar as demais dependências.

## Evidência

- `dart analyze lib test`: sem problemas.
- Testes rápidos de geração: 16 passaram após as correções de geração.
- Testes unitários selecionados: 62 passaram (excluídos CLI amplo, overlay legado e PostgreSQL).
- Parser e overlay: quatro cenários de regressão falharam antes e passaram depois, incluindo
  fluxo real `analyze --accdb --src` → `analysis.json` → `generate` → HTML com caption e binding.
- Frontend: scaffold com nomes originais e opções especiais passou análise do core e frontend
  e `dart run webdev build`, produzindo JavaScript. Não houve teste de interação em navegador.
- Backend: dois testes de execução do repository gerado com Eloquent e conexão simulada,
  mais dois testes com PostgreSQL real, nos estilos `snake_ascii` e `original`.
  Os testes reais verificaram IDs automáticos 1/2, ID explícito 99, leitura, atualização,
  listagem e exclusão. As bases temporárias usaram `TEMPLATE template0` e foram removidas.

- Migração completa: dois E2E adicionais passaram com PostgreSQL real, incluindo criação
  de fixture via Microsoft Access, migração dos registros e backend gerado compilado em
  executável servindo esses registros por HTTP. O harness foi corrigido para usar o nome
  normalizado correto, criar o diretório de build e encerrar o servidor diretamente,
  evitando bloquear a remoção dos arquivos temporários no Windows.

Não somar estes números como testes independentes: há sobreposição entre execuções.
Logs locais em `build/codex-*.log`; os logs e os scaffolds temporários não são versionados.

## Operação e pendências

O serviço `postgresql-x64-17` estava parado e desabilitado. Com autorização do dono, foi
habilitado para início manual e iniciado via `gsudo`. Não se alterou a autenticação do servidor.
Credenciais de teste foram aplicadas somente às sessões de execução, sem gravação no projeto.

A suíte ampla da raiz (sem PostgreSQL) registrou **67 aprovações e 6 falhas**:

- expectativas de catálogo/contagem nas fixtures `teste1` e SIGAsul, incluindo consultas
  binárias esperadas 426 e observadas 540, tabelas vinculadas e backend criptografado;
- duas expectativas de `NOT NULL` no DDL do overlay, divergentes da política atual de
  relaxamento. Os metadados `isRequired` continuam sendo verificados separadamente.

Esses casos ainda precisam de reconciliação com as fixtures e a política de migração.
Não foram alteradas as contagens esperadas apenas para tornar a suíte verde.
Nos testes rápidos que exigem `NOT NULL`, foi selecionado explicitamente o modo `strict`;
o teste de nomes originais agora distingue colunas físicas de campos calculados, que
não devem ser incluídos em INSERT.

Para repetir os testes reais, configurar `ACCESS_TO_DART_TEST_PG_USER` e
`ACCESS_TO_DART_TEST_PG_PASSWORD` na sessão, com conta local autorizada a criar bancos de teste:

```text
dart test test/generation/long/generated_backend_autonumber_postgres_test.dart --concurrency=1 --reporter=expanded
dart test test/migration_postgres_e2e_test.dart --concurrency=1 --reporter=expanded
```

Os defeitos corrigidos não demonstram conversão integral de todo VBA, relatórios e interfaces
Access. A continuidade deve preservar os testes diferenciais e corrigir sempre o gerador,
nunca apenas o aplicativo emitido.
