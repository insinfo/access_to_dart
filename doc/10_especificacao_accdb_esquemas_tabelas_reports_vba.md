# Especificacao Operacional do `.accdb` para Esquemas, Tabelas, Dados, Reports e VBA

Este documento amplia a leitura do arquivo `referencias/MSACCESS.EXE_pseudo_c.txt`, focando em como o Access parece organizar:

- catalogo de objetos
- esquemas e colecoes logicas
- tabelas e relacoes
- propriedades de conexao e dados externos
- reports
- VBA, modulos e macros/scripts

Assim como o documento anterior, isto nao e uma especificacao oficial. E uma leitura operacional inferida do executavel.

## Escopo da leitura complementar

Blocos e areas mais relevantes revisitados nesta etapa:

- `20001-30000`
- `120001-130000`
- `200001-210000`
- `460001-470000`
- `700001-710000`
- `710001-720000`
- `1190001-1200000`
- `1260001-1270000`

## 1. Catalogo central: `MSysObjects`

O executavel mostra que `MSysObjects` continua sendo o catalogo principal do banco.

### Evidencias

- No bloco `20001-30000`, em torno da linha `25687`, aparece a string `MSysObjects`.
- No bloco `20001-30000`, em torno de `25690-25737`, a rotina escolhe entre `MSysObjects` e `MSysNavPaneObjectIDs`, indicando que o Access usa o primeiro como catalogo base e o segundo como apoio de navegacao/UI.
- No bloco `1190001-1200000`, em torno de `1196073-1197557`, aparecem rotinas que reabrem objetos em `Forms`, `Reports`, `Scripts` e `Modules` e depois leem colunas de `MSysObjects`.

### O que isso sugere

O `.accdb` nao depende apenas da arvore `MSysAccessStorage`. O Access primeiro usa o catalogo `MSysObjects` para descobrir:

- nome do objeto
- tipo
- blobs associados
- flags

e so depois resolve o payload visual, de modulo ou de report.

## 2. Colunas de metadados importantes em `MSysObjects`

As colunas mais importantes encontradas nesta leitura foram:

- `Name`
- `Type`
- `Lv`
- `LvExtra`
- `LvModule`
- `Flags`

### Evidencias

- No bloco `1190001-1200000`, em torno de `1196073-1197557`, o Access:
  - abre o objeto pela categoria (`Forms`, `Reports`, `Scripts` ou `Modules`);
  - chama `sub_14083cec0` para ler `Lv`;
  - chama `sub_14083cec0` para ler `LvExtra`;
  - chama `sub_14083cec0` para ler `LvModule`.
- Na busca ampla tambem aparecem referencias a `Flags` e a `MSysNavPaneObjectIDs`.

### Interpretacao operacional

Essas colunas parecem funcionar como ponte entre o catalogo relacional e os blobs especializados.

Leitura pratica:

- `Lv`: payload principal do objeto
- `LvExtra`: payload complementar
- `LvModule`: payload ou referencia ao modulo associado
- `Flags`: controles de estado, versao ou comportamento

Para o gerador, isso reforca que formularios, reports e modulos nao devem ser interpretados apenas pela categoria do objeto. E preciso ler os blobs corretos.

## 3. Mapa de colecoes e pseudo-esquemas internos

O executavel retorna explicitamente diversos nomes de colecoes internas.

### Colecoes encontradas

- `Tables`
- `Databases`
- `Relationships`
- `Forms`
- `Reports`
- `Modules`
- `TDForms`
- `Scripts`
- `DataAccessPages`
- `Schema`
- `StoredProcedures`
- `Triggers`
- `CustomGroups`
- `CSQueries`
- `Functions`
- `InlineFunctions`
- `ScalarFunctions`
- `TableFunctions`
- `SysRel`

### Evidencias

- Bloco `120001-130000`, em torno de `129601-129686`, na funcao `sub_140085520`.
- Bloco `20001-30000`, em torno de `28382-28501`, numa rotina equivalente de resolucao de categoria.

### Interpretacao operacional

Mesmo que nem todas essas categorias sejam expostas ao usuario comum como objetos "classicos" do Access, o runtime organiza o `.accdb` como um espaco com varias colecoes logicas.

Isso aponta para um modelo mais rico do que:

- tabela
- consulta
- formulario
- relatorio

Ha evidencias de namespaces para schema, funcoes, triggers e procedures, provavelmente relacionados a camadas ACE/Access Data Projects, recursos de importacao/exportacao ou recursos legados/compatibilidade.

## 4. Tabelas e relacionamentos

### Evidencias diretas

- `Tables` aparece como categoria base no mapeamento.
- `Relationships` aparece como categoria base no mapeamento.
- No bloco `120001-130000`, a rotina `sub_1400852a8` le propriedades `Database`, `Connect` e `ForeignName`.

### Interpretacao operacional

O Access parece tratar relacionamentos e vinculacoes externas como objetos com propriedades nomeadas, nao apenas como linhas opacas.

As propriedades achadas sugerem pelo menos este modelo:

- `Database`: banco ou origem relacionada
- `Connect`: string de conexao ou metadado de binding
- `ForeignName`: nome do objeto remoto/relacionado

Isso e coerente com:

- tabelas vinculadas
- relacoes entre tabelas
- objetos importados ou espelhados

## 5. Esquema relacional e metadados de coluna

Encontramos nomes tipicos de introspeccao de schema:

- `TABLE_NAME`
- `DBCOLUMN_BASECOLUMNNAME`
- `ACCESS_COLUMN_NAME`

### Evidencias

- Bloco `20001-30000`, linhas em torno de `27435` e `27501`.
- A busca ampla tambem encontrou `ACCESS_COLUMN_NAME`.

### Interpretacao operacional

O runtime do Access/ACE usa uma camada de metadados por coluna e tabela durante resolucao de schema.

Isso sugere uma pipeline onde:

1. o objeto tabela/consulta e aberto;
2. o schema e lido por nomes de propriedade/coluna padronizados;
3. o resultado e combinado com metadados do catalogo e, possivelmente, com `MSysDb`.

## 6. Dados e camada `MSysDb`

`MSysDb` apareceu repetidamente em varios trechos.

### Evidencias

- Diversos blocos trazem `sub_14001f100(..., u"MSysDb")`.
- No bloco `460001-470000`, o Access usa `MSysDb` ao abrir ou validar estruturas auxiliares.
- A funcao `sub_140221cc4` faz chamadas com `MSysDb` ao validar `MSysModules` e `MSysModules2`.

### Interpretacao operacional

`MSysDb` parece ser um ponto central de infraestrutura interna do banco, provavelmente usado para:

- abrir conteineres internos
- validar estrutura
- resolver objetos auxiliares
- criar/atualizar tabelas de sistema complementares

Nao encontrei, nos blocos lidos, uma especificacao binaria direta de pagina de dados ou B-tree. Entao a conclusao segura e:

- o executavel mostra bem a camada de catalogo e objetos;
- nao mostra, nesses trechos, o layout fisico de pagina de dados com nivel de detalhe suficiente para documentar formato on-disk de registros.

## 7. Reports

### Evidencias fortes

- `Reports` aparece como categoria de primeira classe no mapeamento.
- No bloco `710001-720000`, em torno de `714361-714373`, aparecem nomes de secoes de report:
  - `LReportHeader`
  - `ReportFooter`
  - `PageHeaderSection`
  - `PageFooterSection`
  - `GroupHeader`
  - `GroupFooter`
- No mesmo trecho aparece tambem `Detail`, alem de `FormHeader` e `FormFooter`.
- Em blocos mais altos aparecem classes e tipos ligados a `RDLReport`, `RDLSection`, `RDLTable`, `RDLRow`, `RDLSortOrderProperty` e `RDLTablixMember`.

### Interpretacao operacional

Os reports do Access nao sao apenas "formularios impressos". O runtime distingue explicitamente:

- secoes de cabecalho e rodape do report
- secoes de pagina
- secoes de grupo
- detalhe

Isso e especialmente importante para o projeto porque confirma a regra do repositorio de abrir uma trilha propria para reports com:

- inventario de controles
- secoes
- ordem estrutural

### Observacao importante

A presenca de tipos `RDL*` nao prova que o `.accdb` armazena reports nativamente como RDL puro. Mas prova que o runtime possui uma camada interna de modelo de report rica o suficiente para representar:

- secoes
- linhas
- tabelas/tablices
- ordenacao
- propriedades textuais

## 8. Reports e storage

Mesmo sem uma rotina tao detalhada quanto a de formularios, o mapeamento mostra que `Reports` passa pela mesma familia de mecanismos:

- resolucao da categoria via `sub_140085520`
- abertura por nome na colecao correspondente
- leitura de blobs como `Lv`, `LvExtra` e potencialmente `LvModule`

### Evidencias

- Bloco `1190001-1200000`, em torno de `1196073-1197557`, quando o Access decide entre `Forms`, `Reports`, `Scripts` e `Modules`.
- Bloco `200001-210000`, em torno de `205357-205363`, com branchs para `Forms`, `Reports` e `Modules`.

### Interpretacao operacional

Para o gerador, a melhor hipotese de trabalho e:

- reports usam a mesma arquitetura geral de catalogo + storage + blobs;
- mas com um modelo semantico proprio de secoes e grupos.

## 9. VBA e modulos

### Evidencias fortes

- No bloco `200001-210000`, em torno de `206073` e `207620-207634`, aparece explicitamente `AcessVBAData`.
- No bloco `460001-470000`, em torno de `461422-461433`, o runtime cria/abre `MSysModules` e `MSysModules2`.
- No bloco `460001-470000`, em torno de `464257-464286`, e tambem `480527-480531`, o Access tenta abrir `MSysModules` e `MSysModules2` e validar os conteineres.
- No bloco `700001-710000`, em torno de `703867`, o runtime le `LvModule`.

### Interpretacao operacional

Isso sugere uma arquitetura em camadas para codigo:

1. `LvModule` conecta um objeto a seu modulo associado.
2. `MSysModules` e `MSysModules2` armazenam estruturas de modulo em variantes de versao/compatibilidade.
3. `AcessVBAData` funciona como container de dados de VBA.

### O que isso significa

O codigo VBA associado a formulario ou report provavelmente nao esta apenas na arvore visual do objeto. Ele passa por:

- metadado no catalogo
- coluna `LvModule`
- tabelas ou conteineres de modulo
- container `AcessVBAData`

Isso casa bem com a separacao pratica entre design do objeto e codigo.

## 10. Scripts e macros

### O que foi confirmado

- `Scripts` e uma categoria interna explicita.
- O mapeamento entre tipo e colecao trata `Scripts` no mesmo nivel de `Forms`, `Reports` e `Modules`.
- Em rotinas de reabertura de objeto, o Access escolhe entre `Forms`, `Reports`, `Scripts` e `Modules`.

### O que isso sugere

Macros e scripts parecem seguir trilha separada de:

- formulario
- report
- modulo VBA

Isso e consistente com a existencia de macros independentes e, possivelmente, macros embutidas ou containers especializados.

### Limite da evidencia atual

Nesta passada nao encontrei, com a mesma clareza, um nome textual de stream equivalente a `PropData` para macro pura. Entao a conclusao segura e:

- `Scripts` existe como categoria real;
- o payload exato de macro ainda precisa de leitura adicional direcionada para XML, blobs ou containers dessa categoria.

## 11. Fluxo operacional inferido de abertura de objeto

Juntando os trechos revisados, o fluxo mais plausivel para objetos complexos do `.accdb` e:

1. localizar a entrada do objeto em `MSysObjects`;
2. ler `Name`, `Type`, `Lv`, `LvExtra`, `LvModule`, `Flags`;
3. resolver a colecao interna correta:
   - `Tables`
   - `Relationships`
   - `Forms`
   - `Reports`
   - `Scripts`
   - `Modules`
   - outras;
4. abrir o payload correspondente;
5. desserializar propriedades, estrutura e modulo associado;
6. para reports e forms, combinar isso com secoes, controles e layout;
7. para VBA, seguir para `MSysModules`, `MSysModules2` e `AcessVBAData`.

## 12. Conclusoes praticas para `access_to_dart`

### O que vale assumir com seguranca

- O `.accdb` usa `MSysObjects` como catalogo central.
- `Lv`, `LvExtra` e `LvModule` sao fundamentais para objetos complexos.
- `Reports` tem modelo proprio com secoes nomeadas.
- `MSysModules`, `MSysModules2` e `AcessVBAData` fazem parte da trilha de VBA/modulos.
- `Tables`, `Relationships` e metadados como `Database`, `Connect` e `ForeignName` indicam suporte interno robusto a relacoes e objetos vinculados.

### O que ainda nao esta comprovado o suficiente

- formato fisico exato de paginas de dados on-disk;
- serializacao completa de macros puras;
- layout binario detalhado de registros de tabela;
- significado exato de todas as combinacoes de `Flags`.

### Direcao recomendada para o gerador

- Modelar separadamente:
  - catalogo (`MSysObjects`)
  - blobs (`Lv`, `LvExtra`, `LvModule`)
  - colecao interna (`Forms`, `Reports`, `Scripts`, `Modules`, `Tables`)
  - modulo/codigo (`MSysModules`, `MSysModules2`, `AcessVBAData`)
- Para reports:
  - preservar secoes
  - ordem estrutural
  - grupos e cabecalhos/rodapes
- Para objetos de dados:
  - carregar metadados de tabela, relacao e conexao como primeira classe
  - nao reduzir tudo a uma unica leitura de nome e tipo
