# Roteiro Unificado de Conversão: MS Access (`.accdb`) para Dart Web 🚀

## continue melhorando a extração de informações do arquivo binario para geraçãode SQL e exportação para postgresql e melhorias de geração de codigo para aproximar cada vez mais do objetivo de conseguir tranforma a aplicação C:\MyDartProjects\access_to_dart\fixtures\SIGAsul.accdb em uma aplicação dart fullstack funcional e conseguir C:\MyDartProjects\access_to_dart\fixtures\SIGAsul.accdb  exportar para postgresql a base de dados da forma mais fiel possivel

##  Portar um leitor completo de PropertyMap binário no jackcess_dart para extrair campos de tabelas locais


dart run access_to_dart migrate --accdb fixtures\SIGAsul.accdb --backend-accdb fixtures\SIGA2021-CENTRAL_be_2026_senha_4461.accdb --backend-password 4461 --output build\migration_access_siga_codex_schema_and_data_fix3 --mode schema-and-data --pg "postgresql://postgres:s1sadm1n@localhost:5432/access_siga_codex_20260329_fix3?sslmode=disable" --identifier-style snake_ascii

## Status Atual em 28/03/2026

## Status Atual em 29/03/2026

Correcao importante no backend de analise e na trilha PostgreSQL:

- O modo padrao de `AutoNumber` no migrador passou a ser `plain-int`, preservando os IDs do Access e nao emitindo sequence por padrao.
- O modo padrao de `NOT NULL` no migrador passou a ser `relax-not-null`, para evitar que colunas obrigatorias inconsistentes no Access bloqueiem a conversao logo no schema PostgreSQL.
- Os modos alternativos continuam disponiveis no CLI:
  - `sequence`
  - `force-sequence`
- A escolha do padrao `plain-int` ficou alinhada ao dump de referencia `fixtures/access_siga_struture.sql`, que nao emite `CREATE SEQUENCE`, `SERIAL` nem `nextval(...)`.

- Fechei a origem das 5 tabelas faltantes no backend `fixtures/SIGA2021-CENTRAL_be_2026_senha_4461.accdb`.
- A causa estava em rows de `MSysObjects` marcadas como `overflow` e tambem como `deleted`; o leitor seguia o ponteiro, mas descartava o payload final por causa do bit `deleted`.
- A correcao foi aplicada no leitor binario em `packages/jackcess_dart/lib/src/row_reader.dart`, preservando o payload resolvido dessas entradas de overflow.
- A ferramenta de inspeção em `tools/inspect_access_catalog.dart` confirmou o diagnostico na pagina `11230`, nos slots `12`, `19`, `26`, `32` e `40`.
- Depois da correcao, o catalogo do backend passou a bater `49/49` com `fixtures/access_siga_struture.sql`, zerando o diff de tabelas contra o dump do Full Convert.
- A analise unificada com `fixtures/SIGAsul.accdb` + backend central agora sai com:
  - `Tables: 49`
  - `Linked: 45`
- A trilha PostgreSQL local foi validada com a senha correta `s1sadm1n`; a senha digitada anteriormente `slsadm1n` reproduzia o erro `FormatException: Missing extension byte` ja na autenticacao.
- O executor PostgreSQL foi alinhado ao pacote `postgres` 3.x para usar `connection.runTx(...)` em vez de `BEGIN` / `COMMIT` manualmente.
- Regra importante confirmada em pratica: dentro de `connection.runTx((session) async { ... })`, so pode ser usado o `TxSession session` recebido pelo callback para executar statements transacionais.
- Para criacao de bancos locais de validacao PostgreSQL, deve-se preferir `TEMPLATE template0`, porque `template1` local pode falhar com incompatibilidade de `collation version`.
- Com a conexao local funcionando e o banco criado via `template0`, o `migrate` passou da fase de conexao e falhou em `pre-data`, revelando o proximo bloqueio real no SQL gerado:
  - `timestamp without time zone + integer`
  - isso ocorre em expressao calculada emitida para `tb_gest_det`, no trecho equivalente a `("dpp" + 180)`
- Conclusao do estado atual:
  - conexao local PostgreSQL validada
  - autenticacao isolada e corrigida
  - catalogo/backend unificado corrigido
  - proximo defeito raiz do migrador esta na traducao de expressoes calculadas de data do Access para PostgreSQL

Implementei a promoção das famílias geométricas tipadas no analisador, filtrei queries temporárias do Access no pipeline analítico e fechei o experimento complementar para CommandButton e Label.

Arquivos alterados:

access_analysis.dart
accdb_analyzer.dart
form_export_probe_filters_temporary_queries_test.dart
13_experimentos_diff_layout_vba.md
O que mudou:

O parser do Blob agora escolhe a família geométrica preferida por tipo de controle.
O mapeamento promovido ficou assim:
Label: 282..285
CheckBox: 293..296
CommandButton: 293..296
TextBox: 302..305
ComboBox: 310..313
Queries temporárias como ~sq_, ~tmp e ~tmpclp passaram a ser ignoradas:
no canonical_analysis
no analysis.json top-level
na contagem de summary.queries
Adicionei um teste longo que gera a fixture com mutação de layout e valida:
ausência de queries temporárias
preservação do VBA do formulário
layout mutado de txtAssunto
leitura correta de cmdProbeVba e lblTitulo
Experimento complementar fechado:

CommandButton independente confirmou a família 293..296.
Label independente confirmou a família 282..285.
Esses achados foram consolidados em 13_experimentos_diff_layout_vba.md.
Validação executada:

dart analyze lib
layout_probe_fixture_extracts_blob_layout_test.dart
form_export_probe_filters_temporary_queries_test.dart
Resultado:

análise estática sem issues
2 testes longos passaram
Próximos passos naturais:

Repetir o mesmo fechamento empírico para ListBox, OptionGroup e TabControl, se você quiser continuar ampliando o mapa tipado do Blob.
Aplicar o mesmo filtro de ruído temporário a outros tipos de objeto efêmero do Access, se aparecerem novas famílias além de ~sq_.

- O núcleo `jackcess_dart` já abre `.accdb` nativamente e detecta o formato ACE/Jet (`VERSION_14` validado na fixture `fixtures/teste1/teste1.accdb`).
- A leitura binária de `MSysObjects` já funciona sem Access instalado, incluindo navegação via `UsageMap` e varredura das páginas de dados do catálogo.
- A base alvo real `fixtures/SIGAsul.accdb` já é inspecionada com sucesso como frontend Access com tabelas vinculadas:
  - 0 tabelas locais
  - 38 linked tables
  - 426 queries
  - 85 forms
  - 147 reports
  - 1 macro
  - 2 modules
- A CLI `inspect-accdb` já lista objetos binários reais da fixture:
  - 1 tabela (`Contatos`)
  - 5 queries
  - 3 forms
  - 3 reports
  - 1 macro
  - 1 módulo
- O parser de TDEF já extrai:
  - nomes e tipos de colunas
  - offsets fixos/variáveis
  - flags de coluna
  - marcação de `AutoNumber`
  - marcação de campos calculados
  - índices reais por tabela (`primary key`, `foreign key`, `unique`, colunas indexadas, cascatas e referências cruzadas)
  - `precision/scale` bruto para colunas `Numeric`
- O `analysis.json` já inclui:
  - esquema de tabelas
  - índices por tabela
  - relacionamentos reais do backend via `MSysRelationships`
  - DDL PostgreSQL preliminar
  - amostras de linhas (`sampleRows`)
  - SQL semântico reconstruído para queries `SELECT` já detectadas em `MSysQueries`, incluindo `ORDER BY` inline já decodificado na fixture
  - reconstrutor estrutural testado para `JOIN`, `WHERE`, `GROUP BY` e `HAVING` a partir de linhas sintéticas compatíveis com `MSysQueries`
  - AST de expressões Access para expressões textuais já decodificadas
  - merge dos metadados do overlay `.accdb.src` diretamente nas colunas principais do modelo analisado, evitando que `required`, `caption`, `maxLength`, `defaultValue` e `calculatedExpression` fiquem presos apenas em `source_overlay`
  - `query_reconciliation` entre binário e overlay `.src`, com resumo de match/mismatch/ausências e cobertura por cláusula (`JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`)
  - reconciliação extraída do CLI para módulo dedicado com tokenizer/parser próprio de cláusulas SQL (`SELECT`/`FROM`/`WHERE`/`GROUP BY`/`HAVING`/`ORDER BY`) sem regex como núcleo
  - forms/reports/macros/modules detectados no catálogo
- A CLI agora também materializa a esteira pós-análise a partir de `analysis.json`:
  - `doctor --analysis ...` valida cobertura e gaps estruturais
  - `migrate --analysis ...` gera `schema.sql`, `seed.sql` e `migration_manifest.json`
  - `generate --analysis ...` cria scaffold inicial em `/core`, `/backend`, `/frontend` e `conversion-report.md`
- O `doctor` deixou de ser apenas um checklist superficial e agora já classifica a prontidão do material extraído:
  - `readinessLevel` em `blocked` / `partial` / `ready`
  - sinais como `analysis.linked_only`, `analysis.hybrid_topology`, `analysis.no_preview_data`
  - sinais de reconciliação e cobertura como `query.reconciliation_clean`, `query.coverage_gap` e `query.coverage_summary`
  - sinalização explícita para catálogo de formulários sem corpo visual em `forms.catalog_only`
- O `conversion-report.md` gerado passou a refletir readiness real de conversão e próximos passos acionáveis:
  - seções `Readiness`, `Inventory`, `Findings` e `Next Steps`
  - resumo de cobertura e reconciliação de queries
  - recomendações coerentes com o perfil analisado
- O scaffold gerado agora normaliza contrato de persistência e DTOs:
  - nomes de tabelas e colunas em `snake_case`
  - modelos Dart com constantes de coluna
  - `fromMap/toMap` em vez de `fromJson/toJson`
  - sem coerção genérica com `?.toString()` nos campos `String`
- O frontend gerado evoluiu para estrutura modular orientada a objetos:
  - `frontend/lib/src/modules/<tabela>/pages`
  - `frontend/lib/src/modules/<tabela>/services`
  - `frontend/lib/src/shared/services`
  - `http` centralizado em service compartilhado
  - `ngdart 8.0.0-dev.4`, `ngforms 5.0.0-dev.3` e `ngrouter 4.0.0-dev.3` no `pubspec`
  - layout base com assets CDN do `Limitless 4.0`
  - `sass_builder ^2.2.1`, `build_web_compilers ^4.0.9` e `webdev ^3.7.1` com `build.yaml`
  - `styleUrls` dos componentes apontando para `.css` gerado pelo Sass, sem conflito entre arquivos-fonte `.scss` e artefatos emitidos no build
  - shell raiz completo com `frontend/lib/app_component.dart`, `frontend/lib/app_component.html`, `frontend/lib/app_component.scss`, `frontend/web/main.dart` e `frontend/web/index.html`
  - wrappers de página por módulo em `frontend/lib/src/modules/<tabela>/pages/<tabela>_page_component.*`
  - validação do frontend gerado já exercitada com `dart analyze lib` e `dart run webdev build` em fixture gerada end-to-end
- O backend gerado começou a sair do modo estático:
  - `backend/lib/src/modules/<tabela>/repositories`
  - `backend/lib/src/modules/<tabela>/controllers`
  - `backend/lib/src/modules/<tabela>/services`
  - `backend/lib/src/modules/<tabela>/routes`
  - `backend/lib/src/db/database_service.dart` e `backend/lib/src/db/with_database_shelf.dart` com conexão PostgreSQL por request via `Request.context`
  - `backend/lib/src/shared/app_config.dart` para parametrização base da aplicação
  - fallback inicial de preview em `backend/lib/src/generated_data.dart` a partir de `sampleRows`
  - `bin/public_backend.dart` com bootstrap próprio
  - `lib/src/public/api/{controllers,routes}`
  - `lib/src/modules/api/di/dependency_injector.dart`
  - rotas públicas e CRUD REST básico por módulo (`list`, `show`, `create`, `update`, `delete`)
- A validação da geração foi fatiada para feedback mais rápido:
  - `test/generation/fast` cobre `doctor`, `migrate` e smoke checks do scaffold gerado
  - `test/generation/long` cobre cenários E2E, fixtures via COM e compilação do projeto gerado
  - `test/generation/support/generation_test_utils.dart` centraliza `dart pub get`, `dart analyze`, compilação do backend e `dart run webdev build` do frontend
- O mapeamento financeiro do migrador foi endurecido para PostgreSQL sem perda de precisão:
  - `Currency/Money` do Access -> `NUMERIC(19,4)`
  - `Numeric` -> `NUMERIC(precision, scale)` quando os metadados existem
  - `DOUBLE PRECISION` deixou de ser usado para tipos monetários
- O port do `PropertyMap` binário avançou de forma material no `jackcess_dart` e já sobe no `analysis.json`, no migrador e no codegen metadados reais como:
  - `validationRule`, `validationText`, `format`, `inputMask`, `allowZeroLength`
  - `defaultValue`, `caption`, `description`, `decimalPlaces`
  - `displayControl`, `textFormat`, `IMEMode`, `IMESentenceMode`, `resultType`, `GUID`
  - `allowMultipleValues`, `rowSourceType`, `rowSource`, `WSSFieldID`
  - `propertyMaps` brutos por tabela/coluna para investigação semântica adicional de propriedades ainda não promovidas
- Foi criado um fixture controlado específico para validar `PropertyMap` real via COM (`tools/create_access_property_map_fixture.dart`) e a esteira ponta a ponta já está coberta por teste longo.
- Foi criado um fixture COM dedicado para combos/listas (`tools/create_access_combo_fixture.dart`) cobrindo `RowSourceType`, `RowSource`, `DisplayControl` e `AllowMultipleValues` com asserts fim a fim no `analysis.json`.
- Foi criado um segundo fixture de laboratório (`tools/create_access_numeric_calculated_fixture.dart`) que agora combina:
  - uma tabela local `FinanceiroMetricas` gerada via COM, cobrindo `DefaultValue`, `Description`, `DecimalPlaces` e `Format` em tipos numéricos
  - uma tabela calculada importada de fixture Access real do repositório, cobrindo `Expression`, `ResultType`, `DisplayControl`, `IMEMode` e `IMESentenceMode`
  - variantes nativas estáveis `CalcNativeCurrency` e `CalcNativeDouble`, criadas via COM/ACE local, cobrindo cálculos numéricos adicionais com `caption`, `format` e `decimalPlaces`
  - variantes físicas `NumericPrecisaoEscala` e `CalcNativeNumeric` para medir como o ACE local realmente persiste `dbNumeric` no binário
- Um experimento COM dedicado (`tools/experiment_access_numeric_calculated_native.dart`) confirmou no Access local um caminho reproduzível para campo calculado numérico nativo sem importação auxiliar:
  - definir a propriedade `Expression` antes do `Fields.Append` da coluna
  - a variante `CalcBeforeAppendNumeric` foi persistida como `isCalculated=true` no binário e já sai no `postgres_ddl` como `GENERATED ALWAYS AS (...) STORED`
  - as variantes que tentam aplicar `Expression`/`ResultType` depois do append não reproduzem o comportamento correto no ACE local
  - no ambiente ACE local desta esteira, colunas físicas `Numeric` criadas via COM ficaram persistidas como `typeName = Numeric`, mas com `precision = 38` e `scale = 0`, mesmo quando `Precision/Scale` explícitos foram configurados; isso foi refletido na fixture estável e no `postgres_ddl`
- O `postgres_ddl` embutido no `analysis.json` foi sincronizado com o `MigrationStatementBuilder`, eliminando divergência entre o JSON de análise e o caminho real de migração PostgreSQL:
  - `DEFAULT` agora respeita metadados promovidos do Access
  - colunas calculadas passam a sair como `GENERATED ALWAYS AS (...) STORED` quando a tradução da expressão é suportada
  - o seed deixa de inserir colunas calculadas
- O codegen frontend passou a consumir esse enriquecimento de schema com mais fidelidade:
  - campos `AutoNumber` e calculados ficam `readonly`
  - hints exibem `description` e propriedades relevantes do Access (`DisplayControl`, `TextFormat`, `IMEMode`, `IMESentenceMode`)
  - campos booleanos já podem virar `checkbox` no IR gerado
  - `RowSourceType = Value List` e `RowSourceType = Table/Query` agora passam a sugerir `dropdown` no frontend gerado em vez de cair sempre em `input text`
  - listas literais vindas de `RowSource` em `Value List` já viram opções estáticas no HTML gerado
- O pipeline de colunas ficou semanticamente mais fiel ao Access para exportação SQL/PostgreSQL e codegen:
  - `isRequired` do overlay agora participa do `postgres_ddl` e gera `NOT NULL` real em vez de depender de heurística por posição de coluna
  - `defaultValue` do overlay já é propagado até o migrador, com emissão segura de `DEFAULT` para casos suportados (`NULL`, números, booleanos, literais quoted e funções simples como `Now()`, `Date()` e `Time()`)
  - `caption` e `maxLength` agora entram no `analysis.json` principal e passam a alimentar o gerador
  - o frontend gerado agora usa labels vindos de `caption`, adiciona `required`, `maxlength` e `placeholder` nos inputs do formulário
  - a validação gerada no `core` já injeta regras obrigatórias derivadas do schema quando o formulário VBA não traz uma regra equivalente, ignorando `AutoNumber`
- A invalidação dos fixtures rápidos de teste foi reforçada para forçar regeneração quando metadados enriquecidos de coluna ainda não estiverem presentes no `analysis.json` cacheado.
- A refatoração da reconciliação de queries foi consolidada em módulos dedicados:
  - `lib/src/query_reconciliation/query_reconciliation.dart` centraliza a reconciliação por tiers
  - `lib/src/query_reconciliation/sql_tokenizer.dart` implementa o tokenizer SQL dedicado
  - `lib/src/query_reconciliation/sql_clause_parser.dart` implementa o parser estrutural top-level de cláusulas
  - `lib/access_to_dart.dart` ficou reduzido à orquestração da CLI e delegação para `QueryReconciliationBuilder`
  - `test/query_clause_parser_test.dart` cobre o parser estrutural em testes dedicados
- O Modelo Canônico centralizado (`AccessAnalysis`) foi acoplado definitivamente à orquestração do analisador na CLI, injetando uma estrutura desacoplada em `analysis.json`.
- O núcleo binário expandiu suas leituras avançadas com sucesso, construindo nativamente em Dart um leitor OLE MS-CFB (`CompoundFileReader`) que permite a extração de diretórios, FAT e mini-sectors, expondo o caminho de recuperação dos MS-OVBA macros.
- Foi implementado um poderoso e modular Motor de Transpilação VBA para Dart (`lib/src/vba_parser`), responsável por portar lógica de negócio legado (como de formulários) orientando o desenvolvimento de templates AngularDart. Criado estritamente com lógica baseada em AST (Abstract Syntax Tree) e sem o uso engessado de Regex:
  - `VbaLexer` estruturando tokens.
  - `VbaParser` consumindo e validando árvores de instruções de VBA.
  - `VbaCompiler` mapeando e traduzindo para Dart (`Sub` para Métodos, `If` e Tipos, convertendo strings, chamadas isoladas e operadores como `&` em `+` com sucesso demonstrável através do conjunto unificado de testes).
  - O motor recebeu a primeira expansão modular de controle de fuxo do Access, transpondo blocos repetitivos como `For ... To ... Step`, `Do While ... Loop` e inícios de captura com `On Error`.
- Campos calculados da fixture `Contatos` já estão sendo desempacotados no leitor binário:
  - `NomeDoContato` -> `dfs sdf`
  - `ArquivoComo` -> `sdf, dfs`
- O parser de `.accdb.src` segue funcionando em paralelo para comparação e validação semântica.
- O workspace root agora pode usar automação COM do Windows apenas como ferramental auxiliar de desenvolvimento para gerar fixtures controladas de `.accdb`:
  - `win32` fica restrito a dependência de desenvolvimento no pacote raiz
  - no SDK atual do workspace (`3.6.2`), a faixa compatível foi fixada em `win32 5.10.1`, que ja possui `Dispatcher` para COM Automation
  - scripts COM ficam isolados em `scripts/`
  - o produto final e o runtime principal continuam sem depender de Access instalado ou `win32`
- O parser de `fixtures/SIGAsul.accdb.src` já cobre o layout exportado pelo add-in de versionamento para essa base:
  - linked tables em `tbldefs/*.json`
  - queries em `queries/*.sql`
  - AST textual de query em `queries/*.bas`
  - fallback para queries `bas-only` quando o `.sql` não existe
  - normalização de escapes literais do exportador VBA (`\015\012`, `\"`) no `semanticSql`
  - imagens compartilhadas em `images/*`
- O comando `analyze --accdb fixtures/SIGAsul.accdb --src fixtures/SIGAsul.accdb.src` já gera `build/SIGAsul/analysis.json` com overlay de source para linked tables e SQL.
- A reconciliação real do frontend `SIGAsul.accdb` contra `SIGAsul.accdb.src` já foi exercitada com números concretos e depois endurecida até zerar o delta semântico relevante:
  - 426 queries binárias
  - 409 queries no overlay `.src`
  - o pipeline passou por reduções progressivas de `32 -> 18 -> 13 -> 12 -> 10 -> 3 -> 0 mismatch`
  - o estado validado em `build/SIGAsul_work_after10/analysis.json` chegou a `0 mismatch`
  - o reconciliador agora tolera `;` terminal, `SELECT *` misturado com projeções explícitas, `tabela.*` equivalente a `*`, reordenação de projeções simples, `DISTINCT` residual junto de `ORDER BY`, `FROM` truncado com tabelas ainda referenciadas e falso `UNION` em nomes de query
  - 80 `missing_in_binary`
  - 97 `missing_in_source`
  - cobertura binária detectada: `JOIN=251`, `WHERE=246`, `GROUP BY=75`, `HAVING=33`, `ORDER BY=85`
  - cobertura do overlay detectada: `JOIN=291`, `WHERE=258`, `GROUP BY=61`, `HAVING=45`, `ORDER BY=80`
  - o parser já aproveita `semanticSql` reconstruído do `.bas` para reduzir falsos positivos causados por diferenças de formatação/quoting do exportador, inclusive resíduos literais do formatter VBA
- A reconstrução semântica do `.bas` também foi fortalecida para preservar `TOP`, `RowCount`, `Begin OrderBy` e `InputTables`, reduzindo falsos negativos em queries exportadas pelo add-in.
- O exportador Access/VCS mostrou falha real no formatter VBA (`clsSqlFormatter.GetNextWords`, erro 6 / overflow) durante export de queries; por isso o `.bas` passou a ser tratado como fallback semântico de primeira classe para reconciliação e saneamento de SQL exportado.
- O backend vinculado principal `fixtures/SIGA2021-SUL_be_senha_4462.accdb` agora abre nativamente com senha:
  - criptografia Agile Office 4.4 detectada (`AES-256`, `SHA512`, `spinCount=100000`)
  - `inspect-accdb --password 4462` já lê `40` tabelas reais do backend
  - `analyze --password 4462` já gera `build/SIGA2021-SUL/analysis.json`
  - o `TableDef` encadeado de `CadResidencia` já é lido corretamente, eliminando o warning anterior de `RangeError`
  - `analysis.json` do backend agora inclui `34` relacionamentos reais
  - o backend real já expõe `114` índices lógicos no total, incluindo `40` chaves primárias
  - `sampleRows` agora são serializados de forma segura para JSON, inclusive quando trazem `DateTime` ou payload binário, permitindo análises e scaffolds mais estáveis

## Refatoração da Reconciliação em 14/03/2026
- O fluxo de reconciliação agora segue a arquitetura:
  - tokenizar SQL
  - parsear cláusulas top-level
  - serializar estrutura canônica
  - reconciliar binário vs `.src` por níveis
- O núcleo novo não usa regex como base de parsing.
- A validação executada para essa refatoração foi:
  - `dart analyze`
  - `dart test test/query_clause_parser_test.dart test/access_to_dart_cli_test.dart test/access_src_reader_test.dart`
  - `dart run bin/access_to_dart.dart analyze --accdb fixtures/SIGAsul.accdb --src fixtures/SIGAsul.accdb.src --output build/SIGAsul_parser_refactor2`

## Backlog Técnico Imediato
1. Elevar o scaffold gerado de "funcional de bootstrap" para "produção real":
  - fechar integração ponta a ponta entre backend Shelf, PostgreSQL e frontend AngularDart
  - trocar fallbacks de preview por acesso real persistente e smoke tests do app gerado
  - enriquecer rotas públicas, tratamento de erro, configuração e bootstrap do frontend
2. Expandir os metadados ricos de coluna no backend real:
   - priorizar extração binária nativa desses metadados mesmo quando não existir `.accdb.src`
  - fechar lacunas restantes de `defaultValue` não literal, `validationRule`, `validationText`, `format`, `inputMask`, `decimalPlaces` e semântica de `AllowZeroLength`
  - validar em bases reais a promoção de `DisplayControl`, `TextFormat`, `IMEMode`, `IMESentenceMode`, `ResultType`, `GUID`, `WSSFieldID`, `RowSourceType`, `RowSource` e `AllowMultipleValues`
  - tratar `GUID_PROP` como identificador estável de campo e manter `NameMap` como blob interno/opaco até existir semântica confiável
   - enriquecer/validar `precision/scale` e o mapeamento de tipos complexos/attachments no backend real
3. Descomprimir e extrair a lógica e código fonte final em texto plano originários de dentro dos blocos de compressão VBA (`MS-OVBA`), implementando um descompressor dedicado para MS-OVBA no OLE stream.
4. Integrar o resultado do compilador recém-criado (o pipeline transpilador em `vba_parser`) às saídas do gerador, produzindo controllers e regras de negócio reais a partir de módulos/form events.
5. Decodificar blobs complexos da UI visual de Formulários e Relatórios, indo além do catálogo atual e permitindo scaffolding visual fiel.
6. Reduzir o gap de cobertura de queries que ainda aparecem como `missing_in_binary` / `missing_in_source`, agora com foco secundário e não mais bloqueante para a reconciliação semântica principal do `SIGAsul`.
7. Usar scripts opcionais via COM/`win32` para gerar bases `.accdb` mínimas, reprodutíveis e comparáveis, úteis para validar como o Access grava tabelas, formulários e VBA no binário sem acoplar isso ao runtime principal.
  - status: já existem fixtures controlados para `PropertyMap` e para cenário numérico/calculado; o caminho COM local para cálculo numérico nativo já foi validado quando `Expression` é configurada antes do append da coluna, e o próximo passo é transformar isso em fixture estável cobrindo mais `resultType` e formatos numéricos
8. Para atingir o alvo `fixtures/SIGAsul.accdb -> app Dart fullstack funcional + export PostgreSQL fiel`, os bloqueios principais restantes são:
  - converter linked tables e queries do frontend Access em módulos realmente executáveis contra um backend PostgreSQL materializado
  - cruzar forms/reports do catálogo com layout/controles/eventos reais para gerar telas e fluxos próximos do comportamento original
  - transportar regras de negócio hoje embutidas em VBA/macros para backend/frontend gerados
  - executar smoke tests ponta a ponta em uma aplicação gerada a partir do `SIGAsul` completo, e não apenas em fixtures menores



## 1. Visão Geral e Objetivo
Construir uma ferramenta de linha de comando (CLI) profissional (sem gambiaras e regex) e nativa em Dart capaz de realizar a **engenharia reversa profunda e direta de arquivos `.accdb`**, extraindo nativamente componentes fundamentais como **Tabelas, Consultas (Queries), Formulários (Forms), e Macros, VB... etc** diretamente da estrutura binária, **sem depender de instalações locais do Microsoft Access** (eliminando a necessidade do `win32com` ou do export manual para `.accdb.src`).

Observação de escopo: o uso de COM/Access via `win32` é permitido apenas para scripts auxiliares de laboratório voltados à geração controlada de fixtures e comparação binária. Esse caminho não faz parte do pipeline obrigatório de conversão nem do runtime do produto final.

regras importantes, implementação tem que ser modular organizada e manutenivel orientada a objetos
regra sem porcaria de regex sepre prefira implementação de parser AST
regra evite arquivos gigantes prefira arquivos menores com menos de 4 mil linhas sempre que possivel
organização em pastas/modulos
regra sempre implemente e execute  testes
regra nunca deixe o codigo quebrado; toda vez que alterar codigo rode `dart analyze` e corrija os erros antes de seguir

 implementar a ferramenta de converção de access para dart se necssario implemente um parse de VBA e um conversos de VBA para codigo dart para as regras de negocio de formularios access para os formularios angularDart (ngdart 8....) como referencia veja C:\MyDartProjects\access_to_dart\referencias\vbconverter-master  C:\MyDartProjects\access_to_dart\referencias\ViperMonkey-master C:\MyDartProjects\access_to_dart\referencias\vb8-parser-master C:\MyDartProjects\access_to_dart\referencias\jackcess-master C:\MyDartProjects\access_to_dart\referencias\jackcess-encrypt-4.0.3-sources C:\MyDartProjects\access_to_dart\referencias\ensemble-main\packages\parsejs_null_safety C:\MyDartProjects\access_to_dart\referencias\drift-develop\drift-develop\sqlparser C:\MyDartProjects\access_to_dart\referencias\ensemble-main\packages\ensemble_ts_interpreter

 se necessario você pode analizar o binario C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE com o  C:\tools\radare2-6.1.0-w64\bin ou o C:\tools\BinaryNinja  ou C:\tools\ghidra_12.0.4_PUBLIC  ou C:\tools\IDA Professional 9.3

O objetivo é que, ao apontar a ferramenta unicamente para um arquivo bruto como `teste1.accdb`, o processamento produza automaticamente um projeto completo ("Full-Stack") rodando Dart moderno sob uma arquitetura de três camadas:

```text
/teste1_app_generated
  |-- /core       (Modelos OOP, classes estruturais, serialização JSON e DTOs cruzados)
  |-- /backend    (API REST usando servidor `shelf` 1.4.2 com rotas e Controllers/Repositories/Services (se precisar) manuais com `eloquent` 3.4.3 para PostgreSQL conectando script de migrando esquema)
  |-- /frontend   (SPA em AngularDart `ngdart` 8.0.0-dev.4, construindo telas visuais baseadas em componentes ricos e Bootstrap CSS)
  |-- conversion-report.md (Warning logs e registros do motor)
```

## 2. Bases Técnicas e Referências Locais Curadas
A ferramenta baseia-se num parser profundo e cross-platform em fase de construção (`jackcess_dart`). Para garantir parsers avançados com Tokenizers e analisadores sintáticos sólidos (ASTs) e evitar gambiarras com Regex brutas, o time utilizará como inspiração os seguintes ativos já disponíveis em `C:\MyDartProjects\access_to_dart\referencias\`:

- **A Trilha Jackcess (Análise Binária Pura do Access)**: O repositório Java `jackcess-master` (e seu JAR `jackcess-4.0.10-sources.jar`) fornecem o guia arquitetônico e os algoritmos exatos de OLE, FileBlocks, ACE / JetFormat, etc. Este núcleo será traduzido linha por linha para Dart e mantido internamente isolado no pacote em `packages/jackcess_dart` focando primordialmente nas engrenagens de "Ler Dados" e "Decodificar Páginas" binárias.
- **A Trilha Parser AST (Para código gerado)**: O pacote `sqlparser-0.44.2` serve de forte inspiração de boas práticas na criação de compiladores utilizando tokens em contraposto a quebras inseguras de string.
- **Estruturas de Árvore VBA e Layouts (Aces VCS)**: O formato da pasta `.accdb.src` é decodificado baseando-se em ferramentas como `vbs_access_export-master` e `msaccess-vcs-addin-main`, usando o pacote nativo Dart `xml`. 
- **Estudos Avançados**: A documentação não-oficial de `Microsoft Access ACCDB File Format Family.html` e a arquitetura do projeto C `mdbtools-dev` complementam gaps documentais sobre decodificação de senhas ou formatos obscuros do binário ACCDB.

## 3. Escopo de Camadas (Arquitetura)
O sistema terá no final uma modularidade robusta e pura orientada ao binário, reduzindo drasticamente o acoplamento:

1. **`accdb_reader` / `jackcess_dart`**: A fundação central (Motor de Engenharia Reversa). Lê os fluxos binários e não apenas extrai o esquema relacional, mas **navega intensivamente pelas tabelas de sistema do Access (como `MSysObjects`, `MSysQueries`, e blobs OLE)**. É a responsabilidade principal deste núcleo decifrar **Formulários (conteúdo binário UI), Macros compiladas, Módulos VBA e Relatórios**, traduzindo esses dados opacos em estruturas semânticas, resolvendo de vez a dependência do MS Access para resgatar lógicas embarcadas.
2. **`access_analysis` / Modelo Canônico (`access_model`)**: Uma AST que unifica o "Esquema" Binário ACCDB lido em uma camada de tradução intermediária rica e universal, exportando um superarquivo unificado de metadados interpretáveis como `analysis.json`.
3. **`postgres_migrator`**: Consegue instanciar consultas de transação em PostgreSQL ativo no sistema via DDLs extraídas para criar e formatar automaticamente o DataPump inicial vazio e sem dados legados, carregando os registros extraídos em disco rígido pelo `accdb_reader`.
4. **`dart_codegen`**: Scaffold final contendo templates (ejs/string/mustache styles) capaz de materializar Controllers, Repositories manuais, Modelos e os Componentes AngularDart responsivos e consistentes.

## 4. O CLI Alvo 🛠️ 
A aplicação Dart CLI implementará comandos precisos baseando-se no escopo traçado acima:
```bash
access_to_dart inspect-accdb --accdb fixtures/teste1/teste1.accdb
access_to_dart inspect-accdb --accdb fixtures/SIGA2021-SUL_be_senha_4462.accdb --password 4462
access_to_dart read-src --src fixtures/teste1/teste1.accdb.src
access_to_dart analyze --accdb fixtures/teste1/teste1.accdb --src fixtures/teste1/teste1.accdb.src
access_to_dart analyze --accdb fixtures/SIGA2021-SUL_be_senha_4462.accdb --password 4462 --output build/SIGA2021-SUL
access_to_dart migrate --analysis build/teste1/analysis.json --pg <connection-string>
access_to_dart generate --analysis build/teste1/analysis.json --output generated/teste1_app
access_to_dart doctor --analysis build/teste1/analysis.json
```

## 5. Mapeamentos Críticos 
Regras base de transformação dos tipos de Access primitivos que o código portado via Jackcess precisará refletir dentro das abstrações de UI e Postgres:
- Auto-Numerações / Autoincrement 👉 Vira `postgresql sequence ( database object used to generate a unique series of numbers,)` e `int` ou `BigInt` Dart.
- Tabela do `.accdb` onde o Tipo de LongText/Memo 👉 Vira `String` rica e o PG migra com dados.
- Módulos / Complexos / Attachments 👉 O sistema separa como Relational Data "File_Path/Data".
- Forms e Macros binárias nativas 👉 Serão extraídas do formato OLE/Blob das tabelas dinâmicas do Access em `MSysObjects` servindo apenas por semântica. Telas Access são orientadas ao input; A Web pede telas responsivas CRUD que consomem "Detalhes do Contato" baseado via JSON REST.
- Calculated Expressions Internas 👉 O Access guarda as expressões como fields calculados de texto encapsulados ou AST nativo. Transformam-se em `Computed fields` na View SQL ou Domain Model.

## 6. Marcos da Fase de Projeto (Definition of Done)
1. Extração bem sucedida de schemas `MSysObjects` usando portagens parciais das rotinas Java Jackcess de catálogos via código local interno do projeto.
Status: parcialmente concluído. O catálogo binário, tabelas, queries, forms, reports, macros e modules já são detectados na fixture `.accdb`.
Observação: queries `SELECT` da fixture `teste1.accdb` já saem com colunas, aliases, `FROM` e `ORDER BY` reconstruídos a partir de `MSysQueries`. No frontend real `SIGAsul.accdb`, a leitura binária já enumera 426 queries e o overlay `.src` já disponibiliza SQL/Ast textual para validação cruzada, incluindo `query_reconciliation` extraído para módulo próprio com tokenizer/parser de cláusulas SQL e tiers `matched_normalized`, `matched_relaxed`, `matched_structural`, `matched_order_equivalent`, `matched_join_graph`, `matched_from_omitted` e `matched_set_operation`, `semanticSql` reconstruído de `.bas`, saneamento de escapes literais do exportador e fallback para query `bas-only`. No backend real `SIGA2021-SUL_be_senha_4462.accdb`, a leitura criptografada já abre e enumera 40 tabelas com senha, além de 34 relacionamentos e 114 índices lógicos, incluindo `CadResidencia`.
2. Capacidade da CLI iterar propriedades cruciais dentro e fora das hierarquias DOM via XML parse limpo da pasta `.accdb.src`, gerando um JSON abstrato do mapa do sistema.
Status: concluído para `teste1.accdb.src` e adaptado para o layout específico de `SIGAsul.accdb.src` no caso de linked tables e queries. Ainda não há export estruturado de forms/reports nesse layout do add-in.
3. Geração limpa e assíncrona da pasta `/generated/teste1_app_generated`.
Status: parcialmente concluído. O comando `generate --analysis ...` já cria scaffold funcional inicial de `core/backend/frontend`, incluindo `conversion-report.md`, shell frontend completo, wrappers de página, service HTTP compartilhado, backend com `repositories/services/controllers/routes`, `generated_data.dart`, `public_backend.dart`, DI e middleware de banco. O scaffold gerado já passa por `dart analyze`, build do frontend com `dart run webdev build` e compilação representativa em testes de geração. O codegen já passou a consumir `caption`, `isRequired` e `maxLength` do schema enriquecido para melhorar labels e inputs HTML. Ainda falta elevar esse scaffold para o nível final de aplicação completa com persistência PostgreSQL real, rotas mais ricas e frontend AngularDart pronto para produção.
4. Quando entrarmos na pasta `/backend/` e rodarmos localmente `dart run bin/server.dart` associado à pasta `/frontend/` no Webdev (AngularDart), conseguirmos consultar visualmente de fato uma "Folha de Contatos".
Status: parcialmente concluído. O backend e o frontend gerados já possuem estrutura modular, serviços HTTP, esqueleto de repositórios PostgreSQL e build validado do frontend AngularDart. Ainda falta fechar a integração ponta a ponta com banco real, fluxo HTTP real do frontend contra o backend gerado e navegação/telas mais completas.

## Atualização Recente do Incremento
- O merge do overlay `.accdb.src` com o modelo principal de análise foi consolidado para colunas, não apenas para um bloco auxiliar de `source_overlay`.
- O `postgres_ddl` é recalculado depois desse merge, evitando perder `NOT NULL` e `DEFAULT` descobertos fora do binário puro.
- A exportação PostgreSQL ficou mais fiel para defaults simples e para nulabilidade obrigatória de campos não `AutoNumber`.
- O frontend gerado começou a refletir melhor a intenção original do Access em formulários simples, aproveitando `caption` e `maxLength` já presentes no overlay.
- A cobertura de testes foi ampliada para:
  - parsing sintético de `caption`, `required`, `maxLength` e `defaultValue` no leitor `.accdb.src`
  - merge de overlay enriquecido e regeneração do DDL PostgreSQL
  - emissão de `DEFAULT` no migrador
  - scaffold HTML com `required` e `maxlength`
