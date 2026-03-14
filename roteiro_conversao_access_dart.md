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
- O `analysis.json` já inclui:
  - esquema de tabelas
  - DDL PostgreSQL preliminar
  - amostras de linhas (`sampleRows`)
  - SQL semântico reconstruído para queries `SELECT` já detectadas em `MSysQueries`, incluindo `ORDER BY` inline já decodificado na fixture
  - reconstrutor estrutural testado para `JOIN`, `WHERE`, `GROUP BY` e `HAVING` a partir de linhas sintéticas compatíveis com `MSysQueries`
  - AST de expressões Access para expressões textuais já decodificadas
  - forms/reports/macros/modules detectados no catálogo
- Campos calculados da fixture `Contatos` já estão sendo desempacotados no leitor binário:
  - `NomeDoContato` -> `dfs sdf`
  - `ArquivoComo` -> `sdf, dfs`
- O parser de `.accdb.src` segue funcionando em paralelo para comparação e validação semântica.
- O parser de `fixtures/SIGAsul.accdb.src` já cobre o layout exportado pelo add-in de versionamento para essa base:
  - linked tables em `tbldefs/*.json`
  - queries em `queries/*.sql`
  - AST textual de query em `queries/*.bas`
  - imagens compartilhadas em `images/*`
- O comando `analyze --accdb fixtures/SIGAsul.accdb --src fixtures/SIGAsul.accdb.src` já gera `build/SIGAsul/analysis.json` com overlay de source para linked tables e SQL.
- O backend vinculado principal `fixtures/SIGA2021-SUL_be_senha_4462.accdb` agora abre nativamente com senha:
  - criptografia Agile Office 4.4 detectada (`AES-256`, `SHA512`, `spinCount=100000`)
  - `inspect-accdb --password 4462` já lê `40` tabelas reais do backend
  - `analyze --password 4462` já gera `build/SIGA2021-SUL/analysis.json`
  - o `TableDef` encadeado de `CadResidencia` já é lido corretamente, eliminando o warning anterior de `RangeError`

## Backlog Técnico Imediato
1. Validar e reconciliar em binário real a reconstrução semântica de `MSysQueries` do frontend `SIGAsul.accdb` contra os `.sql` e `.bas` exportados em `SIGAsul.accdb.src`, incluindo queries com `JOIN`, `WHERE`, `GROUP BY` e `HAVING`.
2. Expandir a leitura do backend real para relacionamentos, índices e metadados ricos de coluna:
   - required/nullability real
   - default value
   - expression de coluna calculada
   - precision/scale
3. Começar a materializar a camada canônica `access_analysis` para separar leitura binária de geração de código.
4. Decodificar blobs mais profundos de objetos não-tabulares:
   - formulários
   - relatórios
   - macros
   - módulos VBA

## 1. Visão Geral e Objetivo
Construir uma ferramenta de linha de comando (CLI) profissional (sem gambiaras e regex) e nativa em Dart capaz de realizar a **engenharia reversa profunda e direta de arquivos `.accdb`**, extraindo nativamente componentes fundamentais como **Tabelas, Consultas (Queries), Formulários (Forms), e Macros, VB... etc** diretamente da estrutura binária, **sem depender de instalações locais do Microsoft Access** (eliminando a necessidade do `win32com` ou do export manual para `.accdb.src`).

O objetivo é que, ao apontar a ferramenta unicamente para um arquivo bruto como `teste1.accdb`, o processamento produza automaticamente um projeto completo ("Full-Stack") rodando Dart moderno sob uma arquitetura de três camadas:

```text
/teste1_app_generated
  |-- /core       (Modelos OOP, classes estruturais, serialização JSON e DTOs cruzados)
  |-- /backend    (API RESTful usando servidor `shelf` 1.4.2 com rotas e Repositories manuais com `eloquent` 3.4.3 para PostgreSQL conectando script de migrando esquema)
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
Observação: queries `SELECT` da fixture `teste1.accdb` já saem com colunas, aliases, `FROM` e `ORDER BY` reconstruídos a partir de `MSysQueries`. No frontend real `SIGAsul.accdb`, a leitura binária já enumera 426 queries e o overlay `.src` já disponibiliza SQL/Ast textual para validação cruzada. No backend real `SIGA2021-SUL_be_senha_4462.accdb`, a leitura criptografada já abre e enumera 40 tabelas com senha, incluindo `CadResidencia`.
2. Capacidade da CLI iterar propriedades cruciais dentro e fora das hierarquias DOM via XML parse limpo da pasta `.accdb.src`, gerando um JSON abstrato do mapa do sistema.
Status: concluído para `teste1.accdb.src` e adaptado para o layout específico de `SIGAsul.accdb.src` no caso de linked tables e queries. Ainda não há export estruturado de forms/reports nesse layout do add-in.
3. Geração limpa e assíncrona da pasta `/generated/teste1_app_generated`.
Status: pendente.
4. Quando entrarmos na pasta `/backend/` e rodarmos localmente `dart run bin/server.dart` associado à pasta `/frontend/` no Webdev (AngularDart), conseguirmos consultar visualmente de fato uma "Folha de Contatos".
Status: pendente.


o próximo passo natural agora é atacar relações/índices reais do backend e reconciliar as queries do SIGAsul.accdb com o overlay 