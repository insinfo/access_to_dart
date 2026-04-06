# Roteiro Unificado de Conversão: MS Access (`.accdb`) para Dart Web 🚀

## continue melhorando a extração de informações do arquivo binario para geraçãode SQL e exportação para postgresql e melhorias de geração de codigo para aproximar cada vez mais do objetivo de conseguir tranforma a aplicação C:\MyDartProjects\access_to_dart\fixtures\SIGAsul.accdb em uma aplicação dart fullstack funcional e conseguir C:\MyDartProjects\access_to_dart\fixtures\SIGAsul.accdb  exportar para postgresql a base de dados da forma mais fiel possivel

se existe de fato restrição no esquema no lado access e esta dando erro ao tentar importar o dump gerado no postgresql pode esta havendo um erro de leitura dos dados do .accdb, compare com os dados lidos pelo C:\Full Convert full convert para ver pois pode ter  bugs na leitura do arquivo binario veja o C:\MyDartProjects\access_to_dart\fixtures\access_siga_struture_end_data.sql gerado pelo full convert
veja tambem as referencias como elas lidam com a leitura  C:\MyDartProjects\access_to_dart\referencias\jackcess-master e C:\MyDartProjects\access_to_dart\referencias\mdbtools-dev

dart run access_to_dart migrate --accdb fixtures\SIGAsul.accdb --backend-accdb fixtures\SIGA2021-CENTRAL_be_2026_senha_4461.accdb --backend-password 4461 --output build\migration_access_siga_codex_schema_and_data_fix3 --mode schema-and-data --pg "postgresql://postgres:s1sadm1n@localhost:5432/access_siga_codex_20260329_fix3?sslmode=disable" --identifier-style snake_ascii

## Atualizacao recente sobre fidelidade de leitura versus Full Convert

- A comparacao direta entre o dump de referencia do Full Convert em `fixtures/access_siga_struture_end_data.sql` e o `seed.sql` gerado localmente confirmou que o bloqueio original de `tb_atend.cod_atend` nao era uma restricao falsa do Access, mas um bug real do leitor binario.
- O probe dedicado de `TbAtend` mostrou que todas as rows lixo com `CodAtend = 0` vinham de slots marcados ao mesmo tempo como `deleted` e `overflow`.
- A correcao raiz foi aplicada em `packages/jackcess_dart/lib/src/row_reader.dart`: row deletada agora e descartada sempre, mesmo quando carrega ponteiro de overflow.
- A leitura foi comparada com as referencias em `referencias/jackcess-master` e `referencias/mdbtools-dev`; ambas sustentam que row deletada nao deve ser materializada como linha valida so porque existe overflow.
- A trilha de offsets de row tambem foi alinhada ao contrato do Jackcess, trocando a mascara de offset para `0x1FFF` em `data_page_reader.dart`, `usage_map.dart` e `row_reader.dart`.
- Depois da correcao, o probe de `TbAtend` passou de duplicidade real para `duplicates=0` e `suspicious=0`.
- A migracao real do SIGA voltou a aplicar com sucesso no PostgreSQL local, com `Tables created: 55`, `Foreign keys: 25`, `Indexes created: 79` e `Rows inserted: 213053`.
- Foi criado o probe generico `tools/probe_missing_access_rows.dart` para comparar leitura direta do ACCDB versus Full Convert por tabela e chave.
- Com esse probe e com a regeneracao do seed, `tb_atend` e `tb_pessoa` passaram a bater exatamente com o Full Convert: `missingInSeed=0` e `extraInSeed=0`.
- O aviso `Page 41 is not a TableDef page` no merge de rows do `SIGAsul.accdb` foi eliminado ao separar corretamente as tabelas locais do frontend das tabelas resolvidas no backend durante a carga de rows para migracao.

Divergencias reais que foram zeradas nesta rodada:

- `tb_pessoa`: agora bate `16403/16403`
- `tb_atend`: agora bate `19952/19952`

Diferencas remanescentes que continuam visiveis no comparador, mas ja nao indicam perda real de row nas tabelas criticas:

- normalizacao ou encoding de nome de tabela, como `tb_recepcao` versus `tb_recepã§ã£o`
- variacoes de nome como `tb_scfv_ext_*` versus `tb_scfvext_*`
- tabelas sinteticas de attachment emitidas so no pipeline local, como `tb_unidade_logo_attachment`, `tb_unidade_rodape_attachment` e afins
- a classificacao automatizada do comparador agora fecha com `unexplained=0`, ou seja: nao restou nenhum caso remanescente apontando bug fisico novo de leitura nas diferencas atuais

Classificacao objetiva das diferencas remanescentes nesta rodada:

- `nameOnly`: `tb_recepã§ã£o => tb_recepcao` com `55` rows
- `nameOnly`: `tb_scfv_ext_atualiz => tb_scfvext_atualiz` com `831` rows
- `nameOnly`: `tb_scfv_ext_detalhe => tb_scfvext_detalhe` com `340` rows
- `attachmentOnly`: `tb_reuniao_ata_attachment` com `8` rows
- `attachmentOnly`: `tb_unidade_img_cartao_suas_attachment` com `1` row
- `attachmentOnly`: `tb_unidade_logo_attachment` com `1` row
- `attachmentOnly`: `tb_unidade_rma1_attachment` com `1` row
- `attachmentOnly`: `tb_unidade_rodape_attachment` com `1` row

Ferramentas de apoio criadas ou ampliadas nesta trilha:

- `tools/probe_tb_atend_zero.dart` para inspecionar rows suspeitas com metadados fisicos de pagina e slot
- `tools/compare_fullconvert_dump.dart` para comparar contagens e amostras de chaves entre o Full Convert e o seed local, agora parametrizavel por `--seed-sql`
- `tools/probe_missing_access_rows.dart` para comparar diretamente ACCDB versus Full Convert por tabela e coluna-chave
- `tools/compare_fullconvert_dump.dart` agora tambem classifica automaticamente os deltas em `nameOnly`, `attachmentOnly` e `unexplained`

Proximo passo tecnico recomendado:

- expandir o mesmo fechamento empirico para outras tabelas com diferencas pequenas no comparador e confirmar, uma a uma, se sao naming drift, tabela sintetica ou novo bug fisico de leitura
- continuar endurecendo o merge frontend + backend para que a exportacao PostgreSQL do `SIGAsul.accdb` use sempre a origem correta de cada tabela e preserve a fidelidade estrutural do Access

## Status Atual em 03/04/2026

Criei dois probes em probe_access_complex_columns.dart e probe_access_ole_columns.dart. Eles foram inspirados diretamente no comportamento observado em Jackcess e MDBTools, e validados com análise estática sem issues.

A execução real na TbUnidade fechou o diagnóstico sem gambiarra:

CODBARRAS é OLE puro e sai como blob real Uint8List com 1689163 bytes. Para PostgreSQL, o contrato correto é BYTEA.
LOGO, RODAPE, imgCartaoSuas e RMA1 não são blobs inline. Eles são ComplexType e foram classificados como attachment via MSysComplexColumns.
Cada um aponta para uma tabela flat auxiliar com estrutura do tipo FileURL, FileName, FileType, FileData, FileTimeStamp e FileFlags.
O FileData dessas tabelas auxiliares é OLE real, então o contrato correto não é INTEGER escalar nem TEXT. O correto é tratar isso como relação auxiliar de anexos e mapear o payload para BYTEA.
Em outras palavras, o que o probe provou é:

CODBARRAS deve virar coluna binária real.
LOGO, RODAPE, imgCartaoSuas e RMA1 devem sair da tabela principal como attachment/child table, preservando metadados e FileData.
Comandos úteis para repetir a validação:
dart run probe_access_complex_columns.dart --accdb SIGA2021-CENTRAL_be_2026_senha_4461.accdb --password 4461 --table TbUnidade

dart run probe_access_ole_columns.dart --accdb SIGA2021-CENTRAL_be_2026_senha_4461.accdb --password 4461 --table TbUnidade

Próximo passo natural:

Corrigir o gerador/migrador para mapear OLE como BYTEA.
Abrir uma trilha formal para ComplexType attachment gerar tabela auxiliar no PostgreSQL em vez de cair como INTEGER.
Rerodar o migrate real do SIGA depois dessa correção estrutural.

Correcao importante na trilha PostgreSQL e na sanitizacao de texto do pipeline de migracao:

- O workspace root deixou de depender do pacote `postgres`; o nucleo de aplicacao PostgreSQL agora usa apenas `dpgsql`.
- O entrypoint em `bin/access_to_dart.dart` passou a usar `exit(await run(arguments));`, garantindo encerramento explicito do processo quando houver erro.
- O helper de conexao administrativa e os testes E2E foram migrados para a API real do `dpgsql`, eliminando residuos de `Connection.open`, `Sql(...)` e tipos do driver antigo.
- A trilha de conexao local continua validada com a senha correta `s1sadm1n`; a senha digitada anteriormente `slsadm1n` reproduzia erro ja na autenticacao e atrapalhava o diagnostico.
- A criacao de bancos locais de validacao continua devendo preferir `TEMPLATE template0`, porque `template1` local pode falhar com incompatibilidade de `collation version`.
- O leitor binario e a geracao SQL passaram a sanitizar melhor texto invalido vindo do Access, removendo `NUL`, controles indevidos e sequencias quebradas que contaminavam `seed.sql`.
- A geracao real do seed para o caso SIGA foi revalidada sem bytes `NUL` nem controles proibidos no SQL emitido.
- O proximo bloqueio tecnico relevante na trilha de migracao continua sendo a traducao correta de expressoes calculadas de data do Access para PostgreSQL, incluindo casos como `("dpp" + 180)`.

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
- Na evolucao mais recente do workspace root, a aplicacao PostgreSQL deixou de usar o pacote `postgres` e ficou centralizada apenas em `dpgsql`.
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
  - campos `AutoNumber` e calculados ficam `readonly`
  - hints exibem `description` e propriedades relevantes do Access (`DisplayControl`, `TextFormat`, `IMEMode`, `IMESentenceMode`)
  - campos booleanos já podem virar `checkbox` no IR gerado
  - `RowSourceType = Value List` e `RowSourceType = Table/Query` agora passam a sugerir `dropdown` no frontend gerado em vez de cair sempre em `input text`
  - listas literais vindas de `RowSource` em `Value List` já viram opções estáticas no HTML gerado
  - campos `DateTime` sem `Format`/`InputMask` explicitos agora tambem podem herdar semantica observacional de `date-only` a partir das rows amostradas, alinhando melhor o scaffold e a serializacao auxiliar com casos reais como `DPP`
  - campos `ComplexType/attachment` deixaram de virar modulo CRUD isolado no scaffold e passaram a aparecer como subrecurso do modulo pai, com rota aninhada backend (`/<id>/attachments/<fieldKey>`) e carregamento dedicado no formulario gerado
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



