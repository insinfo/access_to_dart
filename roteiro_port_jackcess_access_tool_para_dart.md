# Roteiro de Port de `jackcess` + `Access-Tool` para Dart e Geração de Aplicações Web

## 1. Parecer sobre o roteiro atual

Premissa obrigatória: no estado final a ferramenta não pode depender de nada em `C:\MyDartProjects\access_to_dart\referencias`. Tudo o que for necessário para Dart precisa ser portado ou internalizado no próprio repositório. O alvo técnico é fazer engenharia reversa do `.accdb` para não depender de Microsoft Access instalado no computador.

O arquivo `roteiro_conversao_access_dart.md` está bom como roteiro de produto.
Ele já define bem:

- o objetivo final;
- a arquitetura `core/backend/frontend`;
- o uso de `.accdb` e `.accdb.src` como fontes complementares;
- o foco inicial no caso real `fixtures/teste1/teste1.accdb`;
- a necessidade de gerar `conversion-report.md`.

O que ainda faltava para ele ficar forte como roteiro de execução técnica era:

- separar claramente `port do parser binário` de `reimplementação do export textual`;
- transformar `jackcess-master` e `Access-Tool-main` em trilhas de trabalho distintas;
- definir o que será portado literalmente, o que será apenas compatibilizado e o que será adiado;
- explicitar os pacotes Dart alvo;
- definir critérios de aceite por pacote e por fase;
- definir um caminho de baixo risco para o Windows, já que a extração textual depende de Access/COM.

Também há uma correção factual importante no `roteiro1.md`: `Access-Tool-main` não é Java/Swing. O repositório observado aqui é Python e usa `win32com`/`pyodbc`.

Este documento é o roteiro complementar que faltava.

## 2. Objetivo do programa

Construir uma ferramenta em Dart que:

- leia `C:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb`;
- leia, quando existir, `C:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb.src`;
- consolide tudo em um modelo canônico;
- gere uma aplicação Dart web com PostgreSQL, `shelf: ^1.4.2`, `eloquent: ^3.4.3`, `ngdart` e Bootstrap CSS;
- produza `core`, `backend`, `frontend`, scripts de migração, configuração de ambiente, assets e `conversion-report.md`.

## 3. Premissas obrigatórias

- Não fazer port 1:1 cego dos repositórios.
- Tratar `jackcess` como fonte do parser binário.
- Tratar `Access-Tool` como referência para export/import textual e automação com Access.
- Não depender de `referencias/` no resultado final.
- Tratar `fixtures/` como corpus interno de regressão e `third_party/` como base curada de engenharia reversa.
- Fazer primeiro o que reduz risco e entrega valor: leitura de `.accdb.src`.
- Fazer port parcial do `jackcess`, orientado ao caso `teste1.accdb`.
- Manter um adaptador Windows opcional para extração textual quando houver Access instalado.
- Fazer todos os geradores consumirem apenas o modelo canônico, nunca os arquivos brutos.

## 4. O que as referências locais realmente entregam

### 4.1 `jackcess-master`

O repositório originalmente observado em `referencias/jackcess-master/jackcess-master` e agora internalizado de forma curada em `third_party/jackcess` mostra:

- API pública em `Database.java`, `Table.java`, `Column.java`, `Index.java`, `Relationship.java`, `Row.java`;
- núcleo binário em `impl/DatabaseImpl.java`, `impl/PageChannel.java`, `impl/JetFormat.java`, `impl/TableImpl.java`, `impl/ColumnImpl.java`, `impl/PropertyMaps.java`, `impl/RelationshipCreator.java`;
- suporte a queries em `impl/query/*.java`;
- suporte a colunas complexas em `impl/complex/*.java`, incluindo `AttachmentColumnInfoImpl.java`;
- suporte a expressões e colunas calculadas em `expr/*` e `impl/CalculatedColumnUtil.java`.

Conclusão:

- `jackcess` é a base correta para schema, tipos, índices, relacionamentos, rows, memo/long values, attachments e queries binárias;
- o port deve começar pelo miolo `impl`, não pela superfície completa da API.

### 4.2 `Access-Tool-main`

O repositório originalmente observado em `referencias/Access-Tool-main/Access-Tool-main` e agora internalizado de forma curada em `third_party/access_tool` mostra:

- wrapper COM em `src/access/access.py`;
- export/import de forms via `SaveAsText` e `LoadFromText` em `src/access/form.py`;
- export/import de módulos em `src/access/module.py`;
- export/import de queries em `src/access/query.py`;
- dump de schema e dados via ODBC em `src/access/database.py`;
- orquestração CLI em `src/kraken.py`.

Conclusão:

- isso não é parser binário de `.accdb`;
- isso é uma ferramenta Windows para materializar a aplicação Access em arquivos de texto;
- o que precisa ser portado para Dart é o comportamento útil, não cada script Python.

### 4.3 `teste1.accdb.src`

O material agora internalizado em `fixtures/teste1/teste1.accdb.src` confirma que já existe valor suficiente para um MVP forte:

- `tbldefs/Contatos.sql` define a tabela principal;
- `tbldefs/Contatos.xml` contém tipos, captions, required, índices, anexos e expressões calculadas;
- `queries/ContatosEstendidos.sql` contém SQL exportável;
- `forms/DetalhesDoContato.bas`, `forms/ListaDeContatos.bas` e `forms/FolhaDeDadosDoContato.bas` contêm `RecordSource`, `Caption`, `ControlSource` e macros;
- `reports/*.json` contêm metadados de impressão e layout;
- as macros observadas usam ações concretas como `GoToControl`, `RunCommand`, `GoToRecord`, `OpenForm`, `Requery`, `RefreshRecord`, `SetTempVar`, `RemoveTempVar` e `MsgBox`.

Conclusão:

- a leitura de `.accdb.src` deve ser a primeira entrega funcional;
- o motor de conversão não precisa esperar o parser binário completo para começar a gerar valor.

## 5. Decisão arquitetural principal

O sistema deve ser dividido em cinco camadas:

1. `accdb_reader`
   Lê o arquivo binário `.accdb` e extrai schema, dados e metadados suportados.

2. `access_src_reader`
   Lê a pasta `.accdb.src` e extrai forms, queries, reports, imagens, captions e macros.

3. `access_analysis`
   Faz merge, precedência, normalização, warnings e serialização do modelo canônico.

4. `postgres_migrator`
   Traduz o modelo para PostgreSQL e carrega dados.

5. `dart_codegen`
   Gera `core`, `backend`, `frontend`, scripts e documentação.

## 6. Mapeamento dos repositórios de origem para pacotes Dart

| Origem | Arquivos observados | Pacote Dart alvo | Estratégia |
|---|---|---|---|
| `jackcess` API pública | `Database.java`, `Table.java`, `Column.java` | `jackcess_dart_api` | Port seletivo, apenas APIs necessárias ao CLI e testes |
| `jackcess` núcleo binário | `DatabaseImpl.java`, `PageChannel.java`, `JetFormat.java`, `TableImpl.java`, `ColumnImpl.java` | `accdb_reader` | Port parcial orientado a leitura |
| `jackcess` queries | `impl/query/*.java` | `accdb_query_reader` | Port parcial, depois do schema/rows |
| `jackcess` colunas complexas | `impl/complex/*.java` | `accdb_complex_reader` | Port parcial com foco inicial em attachments |
| `jackcess` expressões | `expr/*`, `CalculatedColumnUtil.java` | `access_expr` | Não portar inteiro no MVP; suportar subset |
| `Access-Tool` COM wrapper | `access.py` | `access_windows_adapter` | Reimplementar em Dart ou encapsular via processo externo no início |
| `Access-Tool` export de forms/modules/queries | `form.py`, `module.py`, `query.py` | `access_windows_adapter` | Compatibilizar comportamento, não copiar literalmente |
| `Access-Tool` dump via ODBC | `database.py` | `access_windows_adapter` ou `legacy_bridge` | Opcional no MVP |
| `.accdb.src` reader | estrutura exportada observada | `access_src_reader` | Implementação Dart nativa desde o início |

## 7. Licenças e estratégia de port

Os repositórios observados usam licença Apache 2.0.

Regras para o projeto Dart:

- preservar créditos e notices dos projetos de origem quando houver tradução direta de comportamento ou estrutura;
- preferir port semântico a tradução literal linha por linha;
- evitar copiar código desnecessariamente quando uma API Dart mais limpa resolver o mesmo problema;
- manter um arquivo de rastreabilidade dizendo quais classes Dart nasceram de quais referências.

## 8. Estrutura de workspace proposta

```text
/packages
  /access_model
  /access_src_reader
  /access_windows_adapter
  /accdb_reader
  /accdb_query_reader
  /accdb_complex_reader
  /access_expr
  /access_analysis
  /postgres_migrator
  /dart_codegen_core
  /dart_codegen_backend
  /dart_codegen_frontend
  /access_to_dart_cli
/templates
  /backend
  /frontend
  /core
/build
/generated
/fixtures
/third_party
```

## 9. Modelo canônico obrigatório

O modelo canônico precisa carregar semântica, origem e nível de confiança.

### 9.1 Entidades mínimas

- `AccessProject`
- `AccessSourceInfo`
- `AccessTable`
- `AccessColumn`
- `AccessIndex`
- `AccessRelationship`
- `AccessRowSample`
- `AccessQuery`
- `AccessQueryKind`
- `AccessForm`
- `AccessControl`
- `AccessMacro`
- `AccessMacroAction`
- `AccessReport`
- `AccessImageAsset`
- `AccessAttachmentSpec`
- `ConversionWarning`
- `ConversionTodo`

### 9.2 Campos transversais obrigatórios

Todas as entidades relevantes devem ter:

- `origin`: `accdb`, `accdb_src`, `merged`, `derived`;
- `confidence`: `exact`, `high`, `medium`, `low`;
- `supported`: `true` ou `false`;
- `notes`;
- `rawSourceRef`, com caminho do arquivo de origem quando existir.

### 9.3 Exemplo de `analysis.json`

```json
{
  "project": {
    "name": "teste1",
    "sources": ["accdb", "accdb_src"]
  },
  "tables": [],
  "queries": [],
  "forms": [],
  "reports": [],
  "warnings": [],
  "todos": []
}
```

## 10. Regra de precedência entre fontes

- schema físico, tipos, rows e relacionamentos: preferir `.accdb`;
- captions, labels, layout, hints de UI e nomes amigáveis: preferir `.accdb.src`;
- SQL exportado de queries: preferir `.accdb.src`;
- expressões calculadas: combinar `.accdb` e `.accdb.src`, preferindo a forma textual do XML quando existir;
- em conflito não resolvido automaticamente: registrar warning estruturado e manter os dois valores no modelo.

## 11. Trilha A: port parcial do `jackcess`

### 11.1 Objetivo

Entregar um leitor Dart de `.accdb` suficiente para:

- abrir `teste1.accdb`;
- listar tabelas;
- ler schema da tabela `Contatos`;
- ler rows;
- ler campos longos;
- ler attachments ou cair em fallback controlado;
- expor queries e relacionamentos quando possível.

### 11.2 Ordem correta de port

#### Fase A1. Infraestrutura binária

- portar leitura de arquivo, buffers, endianness e offsets;
- criar equivalente de `PageChannel`;
- detectar `JetFormat`;
- abrir páginas e validar cabeçalho do banco.

Critério de aceite:

- `accdb_reader inspect-file` identifica formato do `teste1.accdb` e lista páginas básicas sem erro.

#### Fase A2. Catálogo e tabela-def

- portar leitura de catálogo e objetos principais;
- localizar tabelas do usuário;
- portar leitura de `TableDefinition`;
- mapear nomes, object ids e propriedades principais.

Critério de aceite:

- listar a tabela `Contatos` e seus metadados diretamente do binário.

#### Fase A3. Colunas e propriedades

- portar `ColumnImpl` no recorte necessário;
- mapear tipos Access;
- ler tamanho, nulabilidade, autonumber, caption, default e expression quando disponível;
- portar `PropertyMaps` no recorte necessário.

Critério de aceite:

- extrair todas as colunas de `Contatos` com tipo, required e flags básicas.

#### Fase A4. Rows, memo e long values

- portar leitura de rows;
- portar `LongValueColumnImpl` no recorte necessário;
- ler texto longo e conteúdo binário associado.

Critério de aceite:

- conseguir listar registros reais de `Contatos` e comparar contagem com o esperado.

#### Fase A5. Índices e relacionamentos

- portar `IndexData`, `IndexImpl` e `RelationshipCreator` no recorte necessário;
- mapear PKs, índices secundários e relacionamentos.

Critério de aceite:

- capturar `PrimaryKey` e o índice em `CEP` do caso de teste.

#### Fase A6. Colunas complexas e anexos

- portar o recorte mínimo de `ComplexColumnSupport`;
- portar `AttachmentColumnInfoImpl` no que for necessário para leitura;
- registrar fallback quando o conteúdo bruto existir, mas a decodificação completa ainda não existir.

Critério de aceite:

- o campo `Anexos` aparece no modelo com semântica correta e estratégia clara de migração.

#### Fase A7. Queries binárias

- portar `QueryImpl` e subclasses apenas depois de o pipeline textual já existir;
- usar isso como complemento, não como dependência inicial.

Critério de aceite:

- classificar ao menos queries `SELECT` e sinalizar tipos não suportados.

## 12. Trilha B: reimplementação compatível do `Access-Tool`

### 12.1 Objetivo

Transformar o que hoje está em Python em dois produtos separados:

- um leitor cross-platform de `.accdb.src`;
- um exportador opcional para Windows com Access instalado.

### 12.2 Subtrilha B1. `access_src_reader`

Implementar em Dart:

- parser de `tbldefs/*.sql`;
- parser de `tbldefs/*.xml`;
- parser de `queries/*.sql`;
- parser de `forms/*.bas`;
- parser de `reports/*.bas` e `reports/*.json`;
- parser de `images/*.json`;
- parser de arquivos de projeto `*.json`.

Critério de aceite:

- `analysis.json` contém `Contatos`, `ContatosEstendidos`, `DetalhesDoContato`, `ListaDeContatos` e `FolhaDeDadosDoContato`.

### 12.3 Subtrilha B2. `access_windows_adapter`

Implementar um adaptador Windows para gerar `.accdb.src` quando o usuário tiver Access.

Estratégia recomendada:

- fase 1: encapsular o comportamento via processo externo, se isso acelerar a entrega;
- fase 2: reimplementar em Dart usando COM no Windows;
- fase 3: consolidar um CLI único com fallback automático.

O adaptador precisa cobrir:

- abrir `.accdb`;
- exportar forms via equivalente de `SaveAsText`;
- exportar modules;
- exportar queries;
- exportar metadados necessários para a estrutura `.accdb.src`.

Critério de aceite:

- no Windows, o comando `export-src` gera uma pasta compatível com o leitor Dart.

### 12.4 O que não precisa entrar no MVP dessa trilha

- import completo de volta para Access;
- round-trip perfeito de forms;
- paridade total com todos os comandos de `kraken.py`;
- suporte completo a módulos VBA.

## 13. Trilha C: conversão de forms, macros e reports

### 13.1 Forms

Regra:

- forms do Access são fonte de intenção, não contrato de fidelidade visual;
- `RecordSource`, `ControlSource`, captions e agrupamentos devem orientar a UI web;
- coordenadas e detalhes visuais entram como hints, não como obrigação.

### 13.2 Subset inicial de macros

Suportar primeiro apenas ações observadas no caso real:

- `GoToControl`
- `RunCommand` com foco inicial em salvar registro
- `GoToRecord`
- `OpenForm`
- `Requery`
- `RefreshRecord`
- `SetTempVar`
- `RemoveTempVar`
- `SetLocalVar`
- `MsgBox`
- `Close`

Regra:

- quando houver equivalente claro, converter;
- quando não houver, gerar `TODO` estruturado e manter a macro original anexada ao modelo.

### 13.3 Reports

No MVP:

- ler metadados de `reports/*.json`;
- registrar `reports/*.bas`;
- gerar documentação e, quando possível, uma tela web de consulta/exportação simples;
- não prometer fidelidade de impressão.

## 14. Mapeamentos mínimos de dados

### 14.1 Access -> PostgreSQL -> Dart

- `AUTOINCREMENT` -> `bigint generated by default as identity` -> `int`
- `text`/`varchar` -> `varchar(n)` -> `String`
- `LONGTEXT`/`memo` -> `text` -> `String`
- `datetime` -> `timestamp` -> `DateTime`
- `boolean` -> `boolean` -> `bool`
- `longinteger` -> `integer` -> `int`
- `hyperlink` -> `text` -> `String`
- `attachment/complex` -> tabela filha + metadados -> objeto/lista

### 14.2 Campos calculados observados

No caso real já existem:

- `NomeDoContato`
- `ArquivoComo`
- `Pesquisável`

Regra do MVP:

- expressões simples viram campo derivado no backend ou `VIEW` PostgreSQL;
- expressões não convertidas viram warning e `TODO`.

### 14.3 Anexos

`Anexos` deve virar estrutura relacional separada, por exemplo:

```text
contatos_anexos
  id
  contato_id
  file_name
  content_type
  file_size
  storage_kind
  file_data_or_path
  created_at
```

## 15. Arquitetura do projeto gerado

```text
/generated/teste1_app
  /core
  /backend
  /frontend
  README.md
  docker-compose.yml
  conversion-report.md
```

### 15.1 `core`

- entidades;
- DTOs;
- contratos de API;
- serialização;
- validações;
- enums;
- metadados de UI gerados.

### 15.2 `backend`

- `shelf: ^1.4.2`;
- `shelf_router`;
- `eloquent: ^3.4.3`;
- configuração PostgreSQL;
- controllers;
- repositories;
- services;
- queries suportadas;
- endpoints de anexos;
- scripts de migração e bootstrap.

### 15.3 `frontend`

- `ngdart`;
- Bootstrap CSS;
- telas CRUD;
- rotas;
- serviços HTTP;
- validação;
- listagem, detalhe, busca e anexos.

## 16. CLI alvo

```text
access_to_dart inspect-accdb --accdb fixtures/teste1/teste1.accdb
access_to_dart read-src --src fixtures/teste1/teste1.accdb.src
access_to_dart export-src --accdb fixtures/teste1/teste1.accdb --out build/teste1/src
access_to_dart analyze --accdb fixtures/teste1/teste1.accdb --src fixtures/teste1/teste1.accdb.src
access_to_dart migrate --analysis build/teste1/analysis.json --pg <connection-string>
access_to_dart generate --analysis build/teste1/analysis.json --output generated/teste1_app
access_to_dart convert --accdb fixtures/teste1/teste1.accdb --src fixtures/teste1/teste1.accdb.src --pg <connection-string> --output generated/teste1_app
access_to_dart doctor --analysis build/teste1/analysis.json
```

## 17. Fases do programa

### Fase 0. Base do workspace

Entregáveis:

- workspace Dart organizado;
- fixtures oficiais;
- documento de mapeamento de tipos;
- snapshots básicos.

### Fase 1. Leitor de `.accdb.src`

Entregáveis:

- `access_src_reader`;
- `analysis.json` inicial;
- warnings de forms/macros/queries.

### Fase 2. Modelo canônico e merge

Entregáveis:

- `access_model`;
- `access_analysis`;
- `conversion-report.md` inicial.

### Fase 3. Port parcial do `jackcess`

Entregáveis:

- `accdb_reader`;
- leitura de schema;
- leitura de rows;
- attachments em nível suportado.

### Fase 4. Migração PostgreSQL

Entregáveis:

- DDL;
- carga;
- validação de contagem;
- estratégia de anexos.

### Fase 5. Codegen do backend

Entregáveis:

- projeto `backend`;
- CRUD;
- busca;
- endpoints de query;
- anexos.

### Fase 6. Codegen do frontend

Entregáveis:

- projeto `frontend`;
- listagem;
- detalhe;
- edição;
- busca;
- anexos.

### Fase 7. Adaptador Windows

Entregáveis:

- `export-src` funcional no Windows;
- estrutura gerada compatível com `access_src_reader`.

### Fase 8. Macros assistidas

Entregáveis:

- subset de macros convertido;
- `TODOs` estruturados para o restante.

### Fase 9. Empacotamento final

Entregáveis:

- comando `convert`;
- README final;
- `docker-compose.yml`;
- templates refinados.

## 18. Critérios de aceite do MVP

O MVP estará pronto quando:

1. `read-src` extrair corretamente `Contatos`, `ContatosEstendidos` e os três forms principais.
2. `inspect-accdb` listar `Contatos` diretamente do binário.
3. `analyze` gerar `analysis.json` com merge e warnings.
4. `migrate` criar schema PostgreSQL compatível e importar os dados suportados.
5. `generate` produzir `core`, `backend`, `frontend` e `conversion-report.md`.
6. o backend subir com `dart run`.
7. o frontend subir com `webdev serve`.
8. o usuário conseguir listar, pesquisar, abrir e editar contatos.
9. anexos aparecerem como funcionalidade suportada ou parcialmente suportada, sempre com transparência no relatório.

## 19. Estratégia de testes

- testes unitários de parser para SQL, XML, forms e macros;
- testes unitários do port binário por página, catálogo, coluna e row;
- testes de snapshot dos arquivos gerados;
- testes de integração com PostgreSQL;
- teste ponta a ponta no caso `teste1`;
- cada bug novo vira fixture e teste de regressão.

## 20. Riscos reais

- port completo do `jackcess` é grande; o escopo precisa continuar orientado ao caso real;
- Access/COM prende parte do fluxo ao Windows;
- attachments e colunas complexas exigem modelagem própria;
- funções de query e expressões Access não têm equivalência direta em PostgreSQL/Dart;
- `ngdart` em versão dev exige disciplina de compatibilidade;
- forms e reports do Access carregam muita informação visual que não deve ser convertida cegamente.

## 21. Fora do escopo do MVP

- converter VBA arbitrário para Dart;
- recriar a UI do Access pixel a pixel;
- round-trip completo de volta para Access;
- cobrir todos os tipos exóticos do Access;
- compatibilidade total com todas as queries de ação e macros;
- impressão idêntica aos reports originais.

## 22. Próximos passos imediatos

1. Criar os pacotes `access_model`, `access_src_reader`, `access_analysis` e `access_to_dart_cli`.
2. Definir o schema exato de `analysis.json`.
3. Implementar leitura de `tbldefs/Contatos.sql` e `tbldefs/Contatos.xml`.
4. Implementar leitura de `queries/ContatosEstendidos.sql`.
5. Implementar leitura de `forms/DetalhesDoContato.bas`, `forms/ListaDeContatos.bas` e `forms/FolhaDeDadosDoContato.bas`.
6. Só depois iniciar o port parcial do `jackcess` começando por `JetFormat`, `PageChannel`, catálogo, `TableDefinition` e rows.
7. Adiar o adaptador Windows puro Dart até o leitor textual e o gerador já estarem funcionando.

## 22.1 Status atual da implementação

- o corpus necessário já foi internalizado em `fixtures/` e `third_party/`;
- `jackcess_dart` já detecta o formato do `.accdb` e lê páginas por caminho informado;
- o CLI raiz já expõe `inspect-accdb`;
- o leitor Dart de `.accdb.src` já está implementado no workspace e o CLI raiz já expõe `read-src`;
- o parser atual já cobre o caso real `teste1` para:
  - `tbldefs/Contatos.sql`;
  - `tbldefs/Contatos.xml`;
  - `queries/ContatosEstendidos.sql`;
  - `forms/DetalhesDoContato.bas`;
  - `forms/ListaDeContatos.bas`;
  - `forms/FolhaDeDadosDoContato.bas`;
- a próxima entrega deve ser a leitura do catálogo binário do `.accdb`, porque a trilha textual mínima já deixou de ser bloqueadora.

## 23. Resumo executivo

O seu roteiro atual está bom como visão de produto, mas ainda não era suficiente como plano de execução do port.

O caminho tecnicamente mais seguro é:

1. ler `.accdb.src` primeiro;
2. consolidar um modelo canônico;
3. portar parcialmente o `jackcess` apenas no necessário;
4. tratar `Access-Tool` como referência de compatibilidade e como adaptador Windows opcional;
5. gerar a aplicação web funcional antes de perseguir fidelidade total ao Access.

Esse é o plano com maior chance de sair do papel sem explodir escopo.
