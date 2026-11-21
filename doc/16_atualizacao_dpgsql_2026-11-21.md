# Atualização do dpgsql e preservação da política SSL — 21/11/2026

O conversor passou de `dpgsql` 1.0.2, obtido pela pasta irmã `../dpgsql`, para a
versão publicada `^1.3.1`. O `pubspec.lock` fixa 1.3.1, com origem hosted em
`https://pub.dev` e hash SHA-256
`9b1c8cb95fe326dae99601ab57a58ed03c0d108303a6311ad36e6319788bb1a5`.
A resolução alterou somente essa dependência. Não é mais necessário manter uma
cópia local do driver ao lado do conversor. O SDK mínimo do driver permanece
`^3.6.0`; as verificações foram executadas com Dart 3.6.2 no Windows.

## Versão mais recente verificada

- A [API oficial do pub.dev](https://pub.dev/api/packages/dpgsql), consultada em
  21/11/2026, informou `latest.version = 1.3.1`, publicada em
  `2026-11-05T20:17:24.413412Z`.
- `git fetch` e `git ls-remote --tags` do
  [repositório oficial](https://github.com/insinfo/dpgsql) confirmaram que a tag
  [`v1.3.1`](https://github.com/insinfo/dpgsql/releases/tag/v1.3.1) e `origin/main`
  apontam para `1e947eda14b5b506298720e0b8a1f2b621b155a3`.
- A cópia de desenvolvimento em `C:\MyDartProjects\dpgsql` foi mantida no `main`
  original; o conversor usa a distribuição publicada e fixada pelo lockfile.

## Correção na criação automática do banco

O wrapper `_openAdminConnection` reconectava com `SSL Mode=Disable` quando o
servidor recusava TLS, inclusive após uma solicitação explícita de `Require`,
`VerifyCA` ou `VerifyFull`. Isso anulava a política escolhida pelo usuário.

A reconexão permissiva foi removida: o driver decide a negociação conforme o
modo solicitado. Falhas de abertura fecham a conexão e preservam o erro original.
Os modos permissivos explícitos `Disable`, `Allow` e `Prefer` continuam aceitos.

O parser agora reconhece `verify-ca`, `verify_ca` e `verifyca` em URI e em
`key=value`, propagando `VerifyCA` à conexão administrativa. Um modo desconhecido
provoca `FormatException`, em vez de retornar silenciosamente ao padrão.
A ausência do parâmetro continua usando o padrão do driver.

## Evidência de validação

1. `dart test test/postgres_database_ssl_test.dart test/postgres_connection_options_test.dart --reporter expanded --concurrency=1`
   — **14 testes aprovados**. O servidor TCP local de teste recusa TLS e verifica
   que os três modos estritos não reconectam nem enviam startup sem criptografia.
   Antes da correção, os três casos estritos falhavam porque havia a reconexão.
   Os modos permissivos também foram exercitados. Nenhum servidor remoto é usado.
2. `dart analyze lib/src/postgres_database_ensurer.dart lib/src/postgres_connection_options.dart test/postgres_database_ssl_test.dart test/postgres_connection_options_test.dart`
   — **nenhum problema encontrado**.
3. Com `ACCESS_TO_DART_TEST_PG_USER` e `ACCESS_TO_DART_TEST_PG_PASSWORD` configurados
   somente na sessão, sem gravar credenciais:
   `dart test test/migration_postgres_e2e_test.dart test/generation/long/generated_backend_autonumber_postgres_test.dart --reporter expanded --concurrency=1`
   — **4 testes reais aprovados em cerca de 30 segundos**, contra PostgreSQL 17:
   migração da fixture Access; leitura HTTP dos dados migrados pelo backend gerado;
   e CRUD com PK autonumérica customizada nos estilos `snake_ascii` e `original`.
   O smoke do backend executa `pub get`, `analyze` e compila `bin/server.dart` em
   executável. Este comando não compila o frontend.
4. O CRUD confirmou IDs automáticos 1 e 2, preservação da chave explícita 99,
   leitura, atualização, listagem e exclusão pelo repository realmente gerado.
5. As bases sintéticas foram criadas com `TEMPLATE template0` e removidas no
   teardown. Uma consulta independente ao catálogo confirmou **zero bases** com
   os prefixos `access_autonumber_` e `access_e2e_` restantes.
6. `git diff --check` passou.

As verificações de SSL cobrem a recusa de TLS e a política de fallback; não
substituem os testes do driver sobre cadeias de certificados em servidores TLS.
Nenhuma configuração global de autenticação PostgreSQL foi alterada nesta etapa.
