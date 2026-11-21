# Release e API na mesma origem; isolamento de requisições

## Problemas reproduzidos

O frontend usa `/api/v1`, mas o servidor gerado servia apenas API. Publicar o release em outra porta exigia configuração externa não emitida pelo scaffold.

O middleware também mantinha uma pilha GetIt global com `pushNewScope`, `await connect`, `registerSingleton<Connection>` e `popScope`. Dez requisições sobrepostas no backend gerado falharam com `Type Connection is already registered` e `Connection is not registered`. O problema é de estado global entre awaits, não de PostgreSQL indisponível.

Além disso, Eloquent 3.4.3 (`capsule/manager.dart:getConnection` e `database_manager.dart:connection`) só preenche seu cache após `await makeConnection`. Um probe frio com dez `DatabaseService.connect()` simultâneos produziu **dez wrappers de conexão**, em vez de um. O probe fechou todos os wrappers que criou.

## Correções no gerador

- `bin/server.dart` e `bin/public_backend.dart` aceitam `--frontend-dir`. O diretório deve conter manifest, todos os arquivos nele declarados e `index.html`/`main.dart.js` não vazios. Caminhos externos/relativos inseguros são recusados.
- `shelf_static` serve somente arquivos declarados no manifest, com MIME, GET/HEAD e sem listagem de diretório. Não há fallback de HTML para rotas desconhecidas. `/api` e `/api/...` sempre passam para API, e 404 de router é JSON.
- Assets ficam fora do middleware de banco. Um servidor com porta PostgreSQL propositalmente indisponível continua servindo HTML e JS.
- A factory de `Connection` lê a conexão da Zone da requisição. Services e repositories continuam factories; não existe push/pop do escopo global entre requisições. Resolver conexão fora da Zone falha explicitamente. Exceções não poluem a requisição seguinte.
- `DatabaseService` memoiza o **Future de inicialização** por nome e remove a entrada se a inicialização falhar. O serviço/Manager mantém a propriedade do pool compartilhado; não há fechamento do pool no finally de cada request. Eloquent 3.4.3 implementa `Connection.transaction` criando um novo wrapper para o contexto transacional entregue ao callback. O probe executa duas transações sobrepostas com esse `ctx`: uma confirma e outra lança exceção/rollback; somente a linha confirmada permanece. Operações dentro de transações devem usar o `ctx` recebido, nunca resolver novamente a conexão raiz. Os repositories gerados atuais não emitem transações explícitas.

## Execução

Após migração do banco e configuração de `ACCESS_TO_DART_DB_*`, execute em `frontend`:

```text
dart run tool/build_release.dart
```

Em `backend`:

```text
dart pub get
dart run bin/server.dart --address 127.0.0.1 --port 8080 --frontend-dir ../frontend/build
```

Acesse `http://127.0.0.1:8080/`. O README gerado contém esse fluxo. Sem a opção o modo API permanece disponível.

## Validação reproduzível

`test/generation/long/generated_same_origin_postgres_test.dart` gera scaffold mínimo real, cria banco temporário com TEMPLATE template0 e remove-o ao terminar. Configure `ACCESS_TO_DART_TEST_PG_*` e execute:

```text
dart test test/generation/long/generated_same_origin_postgres_test.dart --reporter expanded
```

O gate analisa lib/bin gerados; testa HTTP index/JS/MIME, arquivo fora do manifest, rota ausente, 404 JSON tanto no router raiz quanto em router de módulo, dez listagens concorrentes PostgreSQL, recuperação após request inválido, assets com banco indisponível e recusa de JS vazio no startup. O probe `test/generation/support/backend_request_scope_probe.dart.txt` também testa dez requests HTTP com conexões distintas, identidade antes/depois de await, handler que lança exceção, próxima request e resolução fora de request. Um probe PostgreSQL frio confirma uma única conexão inicializada para dez chamadas concorrentes e testa commit/rollback de duas transações simultâneas com uma barreira entre as inserções. Gate completo aprovado em 34 s.

Os dados desse gate são sintéticos; ele não demonstra equivalência das regras VBA/macros do SIGAsul, autenticação, autorização ou publicação externa.

## Integração real do frontend com PostgreSQL

O browser completo, sem interceptação/mocks de API, expôs três divergências de
rota que os testes isolados não detectavam: os serviços frontend, a propriedade
`module` do painel de subform e o registry de descritores backend usavam kebab
(`cad-residencia`), enquanto o router backend usava snake (`cad_residencia`).
Os serviços agora usam o nome normalizado que também origina a rota backend;
painel e registry usam `tableRouteName`. O nome kebab continua apropriado para
componentes HTML e navegação de módulos, sem ser usado como endpoint de API.

`test/frontend_backend_route_contract_test.dart` gera uma tabela de nome composto
com subform e verifica os nove caminhos de CRUD/lookup/anexos, a rota backend,
a chave decodificada do registry, o atributo module do painel e a manutenção do
nome separado do componente HTML.

O release completo foi recompilado e verificado: **381 arquivos**. O backend
regenerado foi analisado e compilado em executável. O teste
`tools/verify_same_origin_browser.mjs URL` abriu Chrome no frontend servido por
esse backend na mesma origem, via loopback/túnel SSH. O PostgreSQL usado era uma
cópia temporária da base aprovada pelo gate anterior de 50 tabelas, 188 colunas e
quatro payloads; isto não amplia esse oráculo às novas coleções complexas.

Resultado observado: **2.869 registros de CadResidencia listados**, editor aberto,
**16 linhas relacionadas em dois painéis**, cinco respostas API bem-sucedidas,
zero requisições de escrita, zero exceções JavaScript e zero falhas API. O probe
aguarda explicitamente as duas respostas de subform e o fim do carregamento,
pois o estado `networkidle` de uma navegação anterior não comprova prontidão
após clicar no editor. Não foram persistidos nomes, conteúdo das linhas ou
screenshots pessoais. Browser, servidor próprio e túnel foram encerrados antes
de liberar a remoção da base temporária.
