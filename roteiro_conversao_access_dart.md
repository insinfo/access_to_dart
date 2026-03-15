# Roteiro Unificado de Conversão: MS Access (`.accdb`) para Dart Web 🚀

## Status Atual em 14/03/2026
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
  - `query_reconciliation` entre binário e overlay `.src`, com resumo de match/mismatch/ausências e cobertura por cláusula (`JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`)
  - reconciliação extraída do CLI para módulo dedicado com tokenizer/parser próprio de cláusulas SQL (`SELECT`/`FROM`/`WHERE`/`GROUP BY`/`HAVING`/`ORDER BY`) sem regex como núcleo
  - forms/reports/macros/modules detectados no catálogo
- A CLI agora também materializa a esteira pós-análise a partir de `analysis.json`:
  - `doctor --analysis ...` valida cobertura e gaps estruturais
  - `migrate --analysis ...` gera `schema.sql`, `seed.sql` e `migration_manifest.json`
  - `generate --analysis ...` cria scaffold inicial em `/core`, `/backend`, `/frontend` e `conversion-report.md`
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
  - `sass_builder ^2.4.0+1` com `build.yaml` e geração de `.scss` junto do `.css`
- O backend gerado começou a sair do modo estático:
  - `backend/lib/src/modules/<tabela>/repositories`
  - `backend/lib/src/modules/<tabela>/controllers`
  - `backend/lib/src/modules/<tabela>/services`
  - `backend/lib/src/modules/<tabela>/routes`
  - esqueleto de conexão PostgreSQL em `shared/database.dart`
  - contexto compartilhado de repositório em `shared/repository_context.dart`
  - endpoints já preparados para consultar repositórios por tabela antes do fallback estático
  - `bin/public_backend.dart` com bootstrap próprio
  - `lib/src/public/api/{controllers,routes,middleware,extension,utils}`
  - `lib/src/modules/api/di/dependency_injector.dart`
  - `lib/src/shared/dependencies/log_requests_custom.dart`
  - middleware `with_database_shelf.dart` agora injeta conexão PostgreSQL por request em `Request.context`
  - CRUD REST básico por módulo (`list`, `show`, `create`, `update`, `delete`)
- O mapeamento financeiro do migrador foi endurecido para PostgreSQL sem perda de precisão:
  - `Currency/Money` do Access -> `NUMERIC(19,4)`
  - `Numeric` -> `NUMERIC(precision, scale)` quando os metadados existem
  - `DOUBLE PRECISION` deixou de ser usado para tipos monetários
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
- A reconciliação real do frontend `SIGAsul.accdb` contra `SIGAsul.accdb.src` já foi exercitada com números concretos:
  - 426 queries binárias
  - 409 queries no overlay `.src`
  - 136 `matched_normalized`
  - 19 `matched_relaxed` após normalização estrutural baseada em tokens e fallback via `.bas`
  - 71 `matched_structural` quando `SELECT`/`WHERE`/`GROUP BY`/`HAVING`/`ORDER BY` coincidem mesmo com divergência residual de `FROM`
  - 48 `matched_order_equivalent` quando a divergência remanescente é só `ORDER BY` exportado ou `DISTINCT` redundante em consulta já agrupada
  - 22 `matched_join_graph` após normalização estrutural de `FROM/JOIN` por tokenizer/parser dedicado
  - 0 `matched_from_omitted` no parser novo; essa heurística ficou obsoleta frente ao tier estrutural de join
  - 1 `matched_set_operation` quando o binário ainda só reconstrói `SELECT *`, mas o overlay traz a `UNION` real
  - 32 `mismatch`
  - 80 `missing_in_binary`
  - 97 `missing_in_source`
  - cobertura binária detectada: `JOIN=251`, `WHERE=246`, `GROUP BY=75`, `HAVING=33`, `ORDER BY=85`
  - cobertura do overlay detectada: `JOIN=291`, `WHERE=258`, `GROUP BY=61`, `HAVING=45`, `ORDER BY=80`
  - o parser já aproveita `semanticSql` reconstruído do `.bas` para reduzir falsos positivos causados por diferenças de formatação/quoting do exportador, inclusive resíduos literais do formatter VBA
- A rodada validada com o parser refatorado em `build/SIGAsul_parser_refactor2/analysis.json` confirmou os mesmos tiers estruturais esperados:
  - 136 `matched_normalized`
  - 19 `matched_relaxed`
  - 71 `matched_structural`
  - 48 `matched_order_equivalent`
  - 22 `matched_join_graph`
  - 0 `matched_from_omitted`
  - 1 `matched_set_operation`
  - 32 `mismatch`
- O exportador Access/VCS mostrou falha real no formatter VBA (`clsSqlFormatter.GetNextWords`, erro 6 / overflow) durante export de queries; por isso o `.bas` passou a ser tratado como fallback semântico de primeira classe para reconciliação e saneamento de SQL exportado.
- O backend vinculado principal `fixtures/SIGA2021-SUL_be_senha_4462.accdb` agora abre nativamente com senha:
  - criptografia Agile Office 4.4 detectada (`AES-256`, `SHA512`, `spinCount=100000`)
  - `inspect-accdb --password 4462` já lê `40` tabelas reais do backend
  - `analyze --password 4462` já gera `build/SIGA2021-SUL/analysis.json`
  - o `TableDef` encadeado de `CadResidencia` já é lido corretamente, eliminando o warning anterior de `RangeError`
  - `analysis.json` do backend agora inclui `34` relacionamentos reais
  - o backend real já expõe `114` índices lógicos no total, incluindo `40` chaves primárias

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
1. Reduzir o delta remanescente da reconciliação real de `MSysQueries` no frontend `SIGAsul.accdb`, priorizando os `32` casos ainda classificados como `mismatch` e os gaps `missing_in_binary` / `missing_in_source`, com foco especial em:
   - normalização semântica de `JOIN`
   - equivalência de `WHERE`
   - `GROUP BY` / `HAVING`
   - diferenças de quoting, aliases e layout SQL
   - suporte semântico para `UNION`, `TRANSFORM`, queries de ação e casos `bas-only`
   - reconciliação semântica dos `32` casos que sobraram mesmo após tokenizer/parser estrutural
   - `GROUP BY` / `HAVING` quando o overlay perde tabelas ou agregações intermediárias
   - joins aninhados com `ON` parcialmente truncado no export
  - canonização de expressões agregadas em `SELECT`
  - árvore canônica de `GROUP BY`
  - normalização semântica de `HAVING`
  - integração dessas normalizações ao tier estrutural para atacar os `32` casos restantes
2. Expandir os metadados ricos de coluna no backend real:
   - required/nullability real
   - default value
   - expression de coluna calculada
   - enriquecer/validar `precision/scale`
3. Descomprimir e extrair a lógica e código fonte final em texto plano originários de dentro dos blocos de compressão VBA (`MS-OVBA`), implementando um descompressor dedicado para MS-OVBA no OLE stream.
4. Integrar o resultado do compilador recém-criado (o pipeline transpilador em `vba_parser`) capaz de cuspir controllers de negócio, juntando as peças nas saídas automatizadas do AngularDart.
5. Decodificar blobs complexos da UI visual (Formulários, Relatórios) de propriedades de tela legada.
6. Usar scripts opcionais via COM/`win32` para gerar bases `.accdb` mínimas, reprodutíveis e comparáveis, úteis para validar como o Access grava tabelas, formulários e VBA no binário sem acoplar isso ao runtime principal.



## 1. Visão Geral e Objetivo
Construir uma ferramenta de linha de comando (CLI) profissional (sem gambiaras e regex) e nativa em Dart capaz de realizar a **engenharia reversa profunda e direta de arquivos `.accdb`**, extraindo nativamente componentes fundamentais como **Tabelas, Consultas (Queries), Formulários (Forms), e Macros, VB... etc** diretamente da estrutura binária, **sem depender de instalações locais do Microsoft Access** (eliminando a necessidade do `win32com` ou do export manual para `.accdb.src`).

Observação de escopo: o uso de COM/Access via `win32` é permitido apenas para scripts auxiliares de laboratório voltados à geração controlada de fixtures e comparação binária. Esse caminho não faz parte do pipeline obrigatório de conversão nem do runtime do produto final.

regras importantes, implementação tem que ser modular organizada e manutenivel orientada a objetos
regra sem porcaria de regex sepre prefira implementação de parser AST
regra evite arquivos gigantes prefira arquivos menores com menos de 4 mil linhas sempre que possivel
organização em pastas/modulos
regra sempre implemente e execute  testes

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
Status: parcialmente concluído. O comando `generate --analysis ...` já cria scaffold funcional inicial de `core/backend/frontend`, incluindo frontend modular em `modules/.../pages` e `services`, mas ainda falta elevar esse scaffold para o nível final de aplicação completa com persistência PostgreSQL real, rotas mais ricas e frontend AngularDart pronto para produção.
4. Quando entrarmos na pasta `/backend/` e rodarmos localmente `dart run bin/server.dart` associado à pasta `/frontend/` no Webdev (AngularDart), conseguirmos consultar visualmente de fato uma "Folha de Contatos".
Status: parcialmente concluído. O backend e o frontend gerados já possuem estrutura modular, serviços HTTP e esqueleto de repositórios PostgreSQL, mas ainda falta fechar a integração ponta a ponta com banco real, build do frontend AngularDart e navegação/telas mais completas.
