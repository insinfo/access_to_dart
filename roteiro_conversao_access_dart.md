# Roteiro de Conversão de Microsoft Access para Dart Web

## 1. Objetivo 

Construir uma ferramenta em Dart capaz de:

Premissa obrigatória: no estado final a ferramenta não pode depender de nada em `C:\MyDartProjects\access_to_dart\referencias`. Tudo o que for necessário para Dart precisa ser portado ou internalizado se for arquivos de coisas como fixtures ou assets no próprio repositório. O alvo técnico é fazer engenharia reversa do `.accdb` para não depender de Microsoft Access instalado no computador.

1. Ler um arquivo Access `.accdb`, com foco inicial em `C:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb`.
2. Aproveitar, quando existir, um export textual do Access em pasta `.accdb.src`, como `C:\MyDartProjects\access_to_dart\fixtures\teste1\teste1.accdb.src`. gerado pelo plugin C:\MyDartProjects\access_to_dart\referencias\Version_Control_v4.1.2\Version Control.accda 
C:\MyDartProjects\access_to_dart\referencias\msaccess-vcs-addin-main\msaccess-vcs-addin-main
 
3. Gerar uma aplicação web moderna em Dart com esta estrutura:

```text
/nome_app
  /core
  /backend
  /frontend
  conversion-report.md
```

4. Produzir:
   - `core`: entidades, DTOs, contratos, mapeamentos, validações e metadados compartilhados.
   - `backend`: API HTTP com `shelf`, acesso a PostgreSQL e rotas CRUD. usando MVC like Controllers, Repositories etc
   - `frontend`: SPA em `ngdart` com Bootstrap CSS.
   - scripts e arquivos de configuração suficientes para instalar, migrar, subir e testar a aplicação gerada.

## 2. Conclusão da Revisão do Roteiro Atual

O roteiro atual está bom como visão geral, mas ainda não está completo nem está suficientemente alinhado ao que as referências locais realmente entregam.

Pontos fortes do roteiro atual:

- define bem o objetivo final;
- já separa `core`, `backend` e `frontend`;
- escolhe uma stack coerente com o objetivo;
- identifica `jackcess` como base para leitura do `.accdb`.

Lacunas que precisam ser corrigidas:

- mistura duas frentes diferentes: leitura binária de `.accdb` e conversão de UI/objetos do Access;
- trata `Access-Tool` como algo a ser "portado", mas ele não é um parser binário de `.accdb`: ele usa automação do Access para exportar objetos;
- não diferencia claramente MVP, fase intermediária e automação avançada;
- não define um modelo intermediário canônico para a conversão;
- não define estratégia para macros, VBA, consultas complexas, anexos e campos calculados;
- não define critérios de aceite por etapa;
- não explicita riscos e itens fora do escopo do MVP.

## 3. O Que as Referências Locais Mostram

### 3.1 `jackcess-master`

`jackcess` é uma biblioteca Java para ler e escrever bancos Access. Ele é a base correta para o parser binário do `.accdb`, principalmente para:

- schema;
- tipos;
- índices;
- relacionamentos;
- leitura de linhas;
- colunas complexas.

### 3.2 `Access-Tool-main`

`Access-Tool` não é um parser direto de `.accdb`. Ele usa Access/COM para exportar:

- forms;
- queries;
- reports;
- propriedades;
- imagens;
- partes do projeto VBA.

Portanto, a decisão correta é "portar o Access-Tool inteiro". A decisão correta é usando win32 https://pub.dev/packages/win32

1. reaproveitar o formato de saída dele como fonte textual de alto valor;
2. reimplementar em Dart tudo que for útil para consumir esse material;
3. manter opcionalmente um adaptador externo para gerar `.accdb.src` quando o usuário tiver Access no Windows.

### 3.3 `teste1.accdb.src`

O export já mostra que existe material suficiente para orientar uma conversão rica:

- `tbldefs/Contatos.sql` e `tbldefs/Contatos.xml` trazem schema, índices, captions, required, expressões e campo complexo de anexos;
- `queries/ContatosEstendidos.sql` traz SQL exportável;
- `forms/*.bas` trazem layout, nomes de controles, `ControlSource`, captions e macros embutidas;
- `reports/*` e `images/*` trazem metadados úteis para relatórios e assets.

Conclusão prática:

- o `.accdb` é a melhor fonte para dados e estrutura binária;
- o `.accdb.src` é a melhor fonte para UI, consultas exportadas, captions, expressões e metadados visuais.

## 4. Decisão Arquitetural Central

Observação de repositório:

- `fixtures/` é o corpus interno de testes e regressão;
- `third_party/` contém o subconjunto curado das fontes upstream necessário para o port;
- `referencias/` passa a ser apenas origem histórica de pesquisa, não base operacional do projeto.

A ferramenta deve trabalhar com duas entradas complementares:

1. `input.accdb`
   - fonte principal para schema e dados;
2. `input.accdb.src`
   - fonte preferencial para forms, queries, reports, imagens, captions e parte dos eventos.

Se o `.accdb.src` existir, ele deve ter prioridade para a camada de apresentação.

Se o `.accdb.src` não existir, a ferramenta ainda deve gerar uma aplicação funcional baseada apenas em schema e dados, usando telas CRUD padrão.

## 5. Escopo do MVP

O MVP deve converter bem o caso `teste1.accdb`, mesmo que ainda não cubra 100% do Access.

### 5.1 O que o MVP deve fazer

- ler tabelas, colunas, PKs, índices e dados do `.accdb`;
- importar o export textual de `teste1.accdb.src`;
- gerar tabela PostgreSQL equivalente;
- migrar os registros para PostgreSQL;
- gerar backend `shelf` com CRUD;
- gerar frontend `ngdart` com:
  - listagem;
  - tela de detalhes/edição;
  - suporte básico a pesquisa;
  - suporte básico a anexos;
- gerar relatório de conversão informando:
  - itens convertidos;
  - itens parcialmente convertidos;
  - itens não suportados.

### 5.2 O que o MVP não precisa fazer

- converter VBA arbitrário para Dart automaticamente;
- reproduzir pixel a pixel todos os forms do Access;
- converter relatórios complexos para impressão idêntica;
- suportar todos os tipos exóticos e todos os dialetos de expressão Access;
- recriar integralmente macros de Access que dependem do runtime do Office.

## 6. Modelo Canônico de Conversão

Antes de gerar código, a ferramenta deve normalizar tudo em um modelo intermediário próprio.

Sugestão de pacotes:

```text
/packages
  /access_model
  /access_src_reader
  /accdb_reader
  /access_to_dart_cli
  /dart_codegen
  /postgres_migrator
```

### 6.1 Estruturas mínimas do modelo

- `AccessProject`
- `AccessTable`
- `AccessColumn`
- `AccessIndex`
- `AccessRelationship`
- `AccessQuery`
- `AccessForm`
- `AccessControl`
- `AccessMacro`
- `AccessReport`
- `AccessAttachmentSpec`
- `ConversionWarning`

### 6.2 Regra importante

Nenhum gerador deve ler diretamente o `.accdb` ou o `.accdb.src`.

Todo gerador deve receber apenas o modelo intermediário.

Isso reduz acoplamento e permite:

- testar geração sem reprocessar o Access;
- suportar novas origens depois;
- inspecionar a conversão em JSON.

## 7. Estratégia de Conversão por Fonte

### 7.1 Leitura binária do `.accdb`

Responsabilidade do futuro port parcial de `jackcess`:

- páginas;
- catalog;
- tabelas;
- colunas;
- tipos;
- índices;
- relacionamentos;
- leitura de linhas;
- colunas complexas, com foco inicial em attachments.

### 7.2 Leitura da pasta `.accdb.src`

Responsabilidade do leitor textual Dart:

- `tbldefs/*.sql` e `tbldefs/*.xml`;
- `queries/*.sql` e `queries/*.bas`;
- `forms/*.bas`;
- `reports/*.bas` e `reports/*.json`;
- `images/*.json`;
- propriedades em `*.json`.

### 7.3 Regra de precedência

- tipos físicos e dados: preferir `.accdb`;
- captions, labels, layout e hints de UI: preferir `.accdb.src`;
- SQL exportado de queries: preferir `.accdb.src`;
- campos calculados: combinar `tbldefs/*.xml` com queries exportadas.

## 8. Mapeamentos Obrigatórios

### 8.1 Tipos Access para PostgreSQL/Dart

Mapa inicial mínimo:

- `AUTOINCREMENT` -> `bigserial` ou `generated by default as identity` -> `int`
- `VARCHAR(n)` -> `varchar(n)` -> `String`
- `LONGTEXT`/`memo` -> `text` -> `String`
- `datetime` -> `timestamp` -> `DateTime`
- `boolean` -> `boolean` -> `bool`
- `longinteger` -> `integer` -> `int`
- `hyperlink` -> `text` -> `String`
- `attachment/complex` -> tabela filha + metadados -> objeto/lista

### 8.2 Campos calculados

O exemplo local já exige suporte a campos calculados, como:

- `NomeDoContato`
- `ArquivoComo`
- `Pesquisável`

Regra do MVP:

- quando a expressão for simples e conhecida, gerar:
  - coluna computada em camada de domínio; ou
  - `VIEW` no PostgreSQL; ou
  - campo derivado no backend.
- quando a expressão não puder ser convertida com segurança, gerar TODO explícito no `conversion-report.md`.

### 8.3 Anexos

O arquivo `tbldefs/Contatos.xml` mostra um campo complexo de anexos. No Dart/PostgreSQL isso deve virar:

- tabela filha, por exemplo `contatos_anexos`;
- colunas como:
  - `id`
  - `contato_id`
  - `file_name`
  - `content_type`
  - `file_size`
  - `file_data` ou caminho externo
  - `created_at`

O backend deve expor upload, download e listagem de anexos.

### 8.4 Forms

Os arquivos `forms/*.bas` mostram:

- `RecordSource`;
- `Caption`;
- `ControlSource`;
- nomes de controles;
- macros em `OnClickEmMacro` e `OnLoadEmMacro`.

Regra do MVP:

- mapear forms para telas web sem tentar preservar o motor visual do Access;
- usar os controles apenas como guia de layout e semântica;
- converter ações simples de macro para comportamento web quando houver equivalente claro;
- emitir TODO para eventos não convertidos.

### 8.5 Queries

Consultas devem ser classificadas em:

- selecionáveis;
- agregações;
- ação (`INSERT`, `UPDATE`, `DELETE`);
- auxiliares de pesquisa;
- não convertíveis automaticamente.

Para o MVP:

- suportar bem `SELECT`;
- gerar repository/query service com SQL parametrizado ou `eloquent`;
- manter SQL original em comentário ou arquivo de referência.

## 9. Arquitetura da Ferramenta

### 9.1 CLI principal

Comandos sugeridos:

```text
access_to_dart inspect --accdb fixtures/teste1/teste1.accdb
access_to_dart import-src --src fixtures/teste1/teste1.accdb.src
access_to_dart analyze --accdb fixtures/teste1/teste1.accdb --src fixtures/teste1/teste1.accdb.src
access_to_dart migrate --analysis build/teste1/analysis.json --pg <connection-string>
access_to_dart generate --analysis build/teste1/analysis.json --output generated/teste1_app
access_to_dart doctor --analysis build/teste1/analysis.json
```

### 9.2 Artefatos intermediários

A ferramenta deve gerar:

```text
/build/teste1
  analysis.json
  schema.sql
  data-summary.json
  ui-map.json
  conversion-report.md
```

### 9.3 Projeto gerado

```text
/generated/teste1_app
  /core
  /backend
  /frontend
  README.md
  docker-compose.yml
  conversion-report.md
```

## 10. Estrutura do Projeto Gerado

### 10.1 `core`

Responsabilidades:

- entidades;
- DTOs;
- enums;
- serialização;
- validações comuns;
- metadados de tela e campo;
- contratos compartilhados.

### 10.2 `backend`

Stack alvo:

- `shelf: ^1.4.2`
- `shelf_router`
- `eloquent`
- driver PostgreSQL compatível com a estratégia escolhida

Responsabilidades:

- CRUD;
- filtros;
- paginação;
- busca;
- anexos;
- rotas derivadas de queries suportadas;
- scripts de migração e bootstrap.

### 10.3 `frontend`

Stack alvo:

- `ngdart`
- Bootstrap CSS

Responsabilidades:

- telas CRUD;
- formulários reativos ou equivalentes;
- componentes reutilizáveis;
- rotas;
- serviços HTTP;
- tratamento de erro;
- upload/download de anexos.

## 11. Fases de Implementação

## Fase 0. Base técnica e corpus de testes

Entregáveis:

- workspace Dart organizado em pacotes;
- fixture oficial interno com `fixtures/teste1/teste1.accdb` e `fixtures/teste1/teste1.accdb.src`;
- script de comparação entre artefatos extraídos e esperados;
- documento de mapeamento de tipos.

Critério de aceite:

- rodar a suíte local e validar que os fixtures internos estão sendo lidos corretamente, sem depender de `referencias/`.

## Fase 1. Leitor de `.accdb.src`

Objetivo:

Entregar valor rápido sem depender do parser binário completo.

Entregáveis:

- parser de `tbldefs/*.sql`, `tbldefs/*.xml`, `queries/*.sql`, `forms/*.bas` e `*.json`;
- construção do `AccessProject`;
- export para `analysis.json`.

Critério de aceite:

- `analysis.json` precisa conter ao menos:
  - tabela `Contatos`;
  - query `ContatosEstendidos`;
  - forms `ListaDeContatos`, `DetalhesDoContato` e `FolhaDeDadosDoContato`.

## Fase 2. Port parcial de `jackcess` para leitura de `.accdb`

Objetivo:

Cobrir o necessário para schema e dados do caso real.

Entregáveis:

- abertura do `.accdb`;
- leitura de catálogo;
- leitura de tabelas e colunas;
- leitura de linhas;
- leitura mínima de anexos ou fallback controlado.

Critério de aceite:

- conseguir listar registros de `Contatos` diretamente do `teste1.accdb`.

## Fase 3. Consolidação do modelo canônico

Entregáveis:

- merge do que veio do `.accdb` e do `.accdb.src`;
- resolução de precedência;
- warnings estruturados;
- `conversion-report.md`.

Critério de aceite:

- relatório explícito de tudo que foi convertido, parcial ou ignorado.

## Fase 4. Migração para PostgreSQL

Entregáveis:

- gerador de DDL PostgreSQL;
- criação de tabelas;
- carga de dados;
- carga de anexos;
- validação de contagem por tabela.

Critério de aceite:

- número de registros em PostgreSQL igual ao extraído do Access para o escopo suportado.

## Fase 5. Geração do backend

Entregáveis:

- projeto `backend` funcional;
- config de conexão;
- repositórios e controllers;
- rotas CRUD;
- busca para `Contatos`;
- endpoints de anexos.

Critério de aceite:

- `dart run` sobe sem erro;
- endpoints respondem para leitura, criação, edição e exclusão.

## Fase 6. Geração do frontend

Entregáveis:

- app `ngdart` funcional;
- páginas de lista e detalhe;
- busca;
- formulários com validação;
- navegação coerente com os forms exportados.

Critério de aceite:

- o usuário consegue listar contatos, abrir detalhes, editar e manipular anexos.

## Fase 7. Conversão assistida de macros e eventos

Entregáveis:

- suporte a um subconjunto de macros simples;
- mapeamento de ações comuns para frontend/backend;
- geração de TODOs quando não houver conversão segura.

Critério de aceite:

- eventos simples, como foco inicial, abrir detalhe e salvar, ficam operacionais.

## Fase 8. Empacotamento e experiência final

Entregáveis:

- CLI consistente;
- templates refinados;
- README da aplicação gerada;
- `docker-compose.yml` para PostgreSQL;
- relatório final de conversão.

Critério de aceite:

- um terceiro consegue gerar a aplicação a partir do input e executá-la localmente.

## 12. Estratégia de Testes

### 12.1 Testes de parser

- validar leitura de schema;
- validar tipos;
- validar campos calculados;
- validar forms e controles extraídos.

### 12.2 Testes de geração

- snapshot de arquivos gerados;
- validação de nomes, imports e estrutura.

### 12.3 Testes de integração

- gerar projeto;
- subir PostgreSQL;
- aplicar schema;
- importar dados;
- subir backend;
- executar fluxo mínimo via HTTP.

### 12.4 Testes de regressão

Cada bug de conversão deve virar fixture nova e teste automatizado.

## 13. Riscos Reais

- parser completo de `.accdb` é trabalho grande; o ideal é port parcial orientado a caso de uso;
- macros e VBA não têm equivalência direta em Dart web;
- attachments e tipos complexos exigem modelagem própria;
- queries Access usam funções e sintaxe próprias;
- `ngdart` em versão dev exige cuidado extra com compatibilidade e tooling;
- forms do Access têm muita informação visual, mas nem toda ela faz sentido em uma UI web moderna.

## 14. Regras de Produto

- a ferramenta deve preferir gerar uma aplicação funcional a tentar replicar o Access literalmente;
- toda perda semântica deve aparecer no `conversion-report.md`;
- toda conversão incerta deve ser marcada explicitamente;
- a UI gerada deve usar os forms como referência, não como obrigação de clone visual.

## 15. Definição de Pronto

O objetivo será considerado atingido quando o fluxo abaixo funcionar:

1. ler `teste1.accdb`;
2. ler `teste1.accdb.src`, quando presente;
3. gerar `analysis.json`;
4. criar schema PostgreSQL;
5. migrar dados;
6. gerar projeto `core/backend/frontend`;
7. subir backend com `shelf`;
8. abrir frontend `ngdart`;
9. listar, pesquisar, visualizar e editar contatos;
10. registrar no relatório o que ainda não foi convertido integralmente.

## 16. Próximos Passos Imediatos

1. Implementar primeiro o leitor de `teste1.accdb.src`, porque ele entrega valor mais rápido e reduz incerteza.
2. Definir o formato de `analysis.json`.
3. Mapear completamente a tabela `Contatos`, a query `ContatosEstendidos` e os forms principais.
4. Em paralelo, iniciar o port parcial de `jackcess` apenas para schema e rows.
5. Só depois disso começar o codegen de `backend` e `frontend`.

## 16.1 Status atual da implementação

- `inspect-accdb` já abre `fixtures/teste1/teste1.accdb` sem depender de `referencias/`;
- `read-src` já lê `fixtures/teste1/teste1.accdb.src` em Dart puro;
- o parser atual de `.accdb.src` já extrai:
  - tabela `Contatos`;
  - índices `PrimaryKey` e `ZIP_PostalCode`;
  - campo complexo `Anexos` com subcampos;
  - campos calculados `NomeDoContato` e `ArquivoComo`;
  - query `ContatosEstendidos`;
  - forms `DetalhesDoContato`, `ListaDeContatos` e `FolhaDeDadosDoContato`;
- o próximo passo técnico é sair de inspeção de páginas no `.accdb` e entrar em catálogo, tabelas e colunas do binário.

## 17. Resumo Executivo

O caminho mais seguro não é tentar portar `jackcess` e `Access-Tool` por inteiro. O caminho certo é:

1. portar parcialmente `jackcess` para leitura do `.accdb`;
2. criar em Dart um leitor do formato exportado em `.accdb.src`;
3. consolidar tudo em um modelo intermediário;
4. gerar uma aplicação Dart web moderna funcional;
5. tratar macros, relatórios complexos e fidelidade visual total como evolução posterior.

Esse plano é mais completo, tecnicamente viável e alinhado ao material já internalizado em `fixtures/` e `third_party/`.
