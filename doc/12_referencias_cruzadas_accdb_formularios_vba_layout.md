# Referencias Cruzadas para Especificacao do `.accdb`

Este documento cruza quatro fontes locais para montar uma especificacao mais util do arquivo do Microsoft Access:

1. `referencias/MSACCESS.EXE_pseudo_c.txt`
2. `referencias/jackcess-master`
3. `referencias/jackcess-encrypt-4.0.3-sources`
4. `referencias/mdbtools-dev`

O objetivo aqui nao e fingir que existe uma especificacao publica completa do `.accdb`. Ao contrario: a ideia e separar com clareza:

- o que as referencias abertas realmente confirmam;
- o que o pseudo-C do `MSACCESS.EXE` evidencia com boa forca;
- o que ainda permanece como inferencia para formularios, layout, macros e VBA.

## 1. Visao geral: o que cada referencia ajuda a explicar

### `MSACCESS.EXE_pseudo_c.txt`

E a melhor fonte local para objetos de aplicacao do Access, especialmente:

- `MSysAccessStorage`
- `PropData`, `TypeInfo`, `BlobCopy`, `BlobDelta`, `BaselineAXL`
- `DisplayControl`, `ControlType`, criacao e exclusao de controles
- secoes de reports
- `AcessVBAData`, `MSysModules`, `MSysModules2`
- `Database`, `Connect`, `ForeignName`

Em outras palavras: e a referencia mais forte para o que o Access guarda alem de tabelas e dados.

### `jackcess-master`

E a melhor referencia local para:

- estrutura fisica paginada do banco
- catalogo e metadados de tabelas
- propriedades nomeadas em `LvProp`
- tabelas vinculadas

Ela fortalece bastante a parte "dados, esquema e propriedades", mas nao oferece um parser completo para formularios/reports/VBA.

### `jackcess-encrypt-4.0.3-sources`

Ajuda a confirmar que a base continua sendo um arquivo paginado com codec de leitura/escrita por pagina, inclusive com leitura de chave no cabecalho.

E importante para seguranca e criptografia, mas quase nao ajuda na semantica de forms, reports ou VBA.

### `mdbtools-dev`

E a melhor referencia local para:

- `MSysObjects` como catalogo
- `LvProp` como blob de propriedades
- formato `KKD` e `MR2`
- `MSysRelationships`
- tipos de objeto como `Form`, `Report`, `Macro`, `Module`, `Relationship`

Para propriedades e catalogo, `mdbtools` e uma das evidencias mais concretas.

## 2. Camada fisica do arquivo

### 2.1 O `.accdb` continua sendo um banco paginado

Em `jackcess-master/src/main/java/com/healthmarketscience/jackcess/impl/PageChannel.java`, aparecem sinais bem claros:

- leitura e escrita de paginas individuais;
- ordem de bytes `LITTLE_ENDIAN`;
- `PAGE_GLOBAL_USAGE_MAP = 1`;
- `ROW_GLOBAL_USAGE_MAP = 0`;
- uso de `JetFormat` e `UsageMap`.

### Conclusao forte

O `.accdb` nao e um simples contenedor de arquivos soltos. Ele preserva a tradicao Jet/ACE de armazenamento por paginas, com mapa global de uso e estruturas fisicas internas.

### 2.2 Confirmacao externa local sobre ACE

No arquivo salvo `referencias/Microsoft Access ACCDB File Format Family.html`, aparecem pontos importantes:

- a Microsoft nao forneceu especificacao publica completa do formato ACCDB;
- o formato usa ACE em vez de Jet classico;
- ha paginas fixas de `4096` bytes;
- a assinatura inclui `Standard ACE DB`.

### Conclusao forte

Mesmo sem spec publica completa, ha evidencia suficiente para tratar o `.accdb` como uma evolucao paginada do ecossistema Jet/ACE, nao como um formato XML puro.

## 3. Catalogo, objetos e esquema

### 3.1 `MSysObjects` e o catalogo principal

As tres fontes convergem aqui:

- o pseudo-C consulta `MSysObjects` explicitamente;
- `mdbtools` abre `MSysObjects` diretamente na pagina de tabela `2`;
- `jackcess` define colunas de catalogo como `Name`, `Type`, `Flags`, `LvProp`, `Database`, `ForeignName` e `Connect`.

### Evidencias fortes

Em `mdbtools-dev/src/libmdb/catalog.c`:

- `msysobj.table_pg = 2;`
- `snprintf(..., "MSysObjects");`
- bind de `Id`, `Name`, `Type`, `Flags` e `LvProp`

Em `jackcess-master/.../DatabaseImpl.java`:

- `CAT_COL_PROPS = "LvProp"`
- `CAT_COL_DATABASE = "Database"`
- `CAT_COL_FOREIGN_NAME = "ForeignName"`
- `CAT_COL_CONNECT_NAME = "Connect"`

No pseudo-C, ja foram observadas queries como:

```sql
SELECT Name, Type, Lv, LvExtra, LvModule, Flags FROM MSysObjects WHERE ...
```

### Conclusao forte

`MSysObjects` e o ponto de entrada para descobrir os objetos do banco e parte relevante do seu payload binario ou de propriedades.

### 3.2 Tipos de objeto que importam para esta trilha

Em `mdbtools-dev/src/libmdb/catalog.c`, a tabela de nomes inclui:

- `Form`
- `Table`
- `Macro`
- `System Table`
- `Report`
- `Query`
- `Linked Table`
- `Module`
- `Relationship`
- `User Info`
- `Database`

### Conclusao forte

Isso e uma boa confirmacao de que forms, reports, macros e modules sao objetos de catalogo de primeira classe, nao apenas "anexos" invisiveis.

## 4. Propriedades: `LvProp`, `KKD/MR2` e vocabulario funcional

### 4.1 `LvProp` e um blob de propriedades

Em `mdbtools-dev/HACKING.md`:

- definicoes de design view sao armazenadas em `LvProp` de `MSysObjects`;
- o campo e tratado como OLE;
- comecam com `KKD\0` em Jet3 e `MR2\0` em Jet4.

Em `mdbtools-dev/src/libmdb/props.c`, o comentario e ainda mais direto:

- `That function takes a raw KKD/MR2 binary buffer`
- `typically read from LvProp in table MSysObjects`

### Conclusao forte

Existe um mecanismo binario formal de propriedades de objeto no catalogo, e ele passa por `LvProp`.

### 4.2 Estrutura parcial do `KKD/MR2`

Ainda em `mdbtools-dev/HACKING.md` e `props.c`, aparecem duas ideias-chave:

- chunk `0x0080` contem nomes de propriedades;
- chunks `0x0000`, `0x0001` e `0x0002` contem blocos de valores;
- `0x0000` tende a representar o objeto principal;
- `0x0001` tende a representar objetos filhos, como colunas.

### Conclusao forte

O Access usa um formato de property bag binario com:

- dicionario de nomes;
- blocos de valores tipados;
- possibilidade de varios mapas por objeto.

### 4.3 O vocabulorio das propriedades bate com Access real

Em `jackcess-master/src/main/java/com/healthmarketscience/jackcess/PropertyMap.java`, aparecem nomes muito relevantes:

- `DefaultValue`
- `Required`
- `AllowZeroLength`
- `DecimalPlaces`
- `Format`
- `InputMask`
- `Caption`
- `ValidationRule`
- `ValidationText`
- `Description`
- `Expression`
- `RowSourceType`
- `RowSource`
- `DisplayControl`
- `TextFormat`
- `IMEMode`
- `IMESentenceMode`

### Conclusao forte

Mesmo que `jackcess` use isso com foco em tabelas e colunas, o vocabulorio confirma que o ecossistema Access persiste propriedades que sao exatamente as que interessam para mascaras, validacao, apresentacao e escolha de controle visual.

## 5. Controles, tipo visual e indicios de layout

### 5.1 `DisplayControl` e um elo importante entre dado e UI

Em `PropertyMap.java`, o enum `DisplayControl` inclui:

- `TEXT_BOX(109)`
- `COMBO_BOX(111)`
- `LIST_BOX(110)`
- `CHECK_BOX(106)`
- `LABEL(100)`
- `COMMAND_BUTTON(104)`
- `OPTION_GROUP(107)`
- `SUB_FORM(112)`
- `TAB_CTL(123)`
- `PAGE(124)`

Em `PropertiesTest.java`, o valor `109` aparece associado a `DisplayControl`, e o teste salva e recarrega essa propriedade.

### Conclusao forte

O tipo de controle nao e so um detalhe de renderizacao temporaria. Ele e persistido como propriedade e reaparece quando o banco e relido.

### 5.2 Onde o layout de formulario fica menos claro nas libs abertas

Nem `jackcess` nem `mdbtools` mostram um parser aberto e completo para:

- ordem de controles no formulario;
- coordenadas exatas;
- largura e altura;
- secoes de formulario;
- ancoragem, empilhamento e hierarquia de layout;
- eventos completos do objeto de UI.

### Conclusao forte

As libs abertas ajudam a explicar o catalogo e o sistema de propriedades, mas nao fecham a historia do layout de forms/reports.

### 5.3 Onde o pseudo-C entra com mais valor

No `MSACCESS.EXE_pseudo_c.txt`, ja foram vistos explicitamente:

- `MSysAccessStorage`
- `MSysAccessStorage_ROOT`
- `MSysAccessStorage_SCRATCH`
- `Forms`
- `Reports`
- `Modules`
- `TDForms`
- `PropData`
- `PropDataCopy`
- `TypeInfo`
- `TypeInfoCopy`
- `BlobCopy`
- `BlobDelta`
- `BaselineAXL`
- `DisplayControl`
- `ControlType`
- `CreateNewControl`
- `DeleteControl`

### Inferencia forte

O modelo mais plausivel e que o Access divide a persistencia de UI em pelo menos duas camadas:

1. catalogo e propriedades em `MSysObjects` e blobs relacionados;
2. storage especializado de objetos de aplicacao em `MSysAccessStorage`, com streams como `PropData` e `TypeInfo`.

### Consequencia pratica

Se quisermos reconstruir formularios com fidelidade, nao basta ler apenas `MSysObjects` e `LvProp`. Sera preciso abrir uma trilha dedicada para o conteudo de `MSysAccessStorage`.

## 6. Reports e ordem estrutural

O pseudo-C continua sendo a melhor fonte local para reports.

Ja apareceram nomes de secoes como:

- `Detail`
- `FormHeader`
- `FormFooter`
- `LReportHeader`
- `ReportFooter`
- `PageHeaderSection`
- `PageFooterSection`
- `GroupHeader`
- `GroupFooter`

Tambem apareceram tipos internos como:

- `RDLReport`
- `RDLSection`
- `RDLRow`
- `RDLTable`
- `RDLTablixMember`
- `RDLSortOrderProperty`

### Conclusao forte

O Access nao trata report como um formulario generico. Existe um modelo estrutural proprio de secoes e regioes tabulares.

### Inferencia forte

Para o projeto, isso sugere modelar reports com entidade propria, incluindo:

- secoes ordenadas;
- grupos;
- detalhe;
- elementos tabulares;
- propriedades de ordenacao.

## 7. VBA, modulos e macros

### 7.1 Trilha de VBA

No pseudo-C, ja foram identificados:

- `AcessVBAData`
- `MSysModules`
- `MSysModules2`
- `LvModule`
- `VBAProject`
- `IVbaProjectSite`
- `IVbaProvideStorage`
- `IGetVBAObject`
- sinais de seguranca e assinatura de macro

### Conclusao forte

O VBA nao parece ficar guardado apenas como texto cru em uma coluna simples. A evidencia aponta para uma combinacao de:

- catalogo em `MSysObjects`;
- ligacao por `LvModule`;
- tabelas auxiliares como `MSysModules` e `MSysModules2`;
- container dedicado `AcessVBAData`.

### 7.2 O que as libs abertas conseguem e o que nao conseguem

`jackcess` e `mdbtools` ajudam pouco a desserializar VBA ou macros de Access.

Elas explicam:

- pagina;
- catalogo;
- propriedades;
- relacoes;
- tabelas vinculadas.

Mas nao oferecem uma trilha equivalente e madura para:

- projeto VBA completo;
- formularios com codigo por evento;
- macros de objeto;
- serializacao completa de modulo de aplicacao Access.

### Conclusao forte

Para VBA e macros, o pseudo-C continua sendo a principal fonte local de evidencia estrutural.

## 8. Tabelas vinculadas e relacionamentos

### 8.1 Tabelas vinculadas

O pseudo-C ja mostrou a leitura de:

- `Database`
- `Connect`
- `ForeignName`

`jackcess` confirma isso no catalogo com:

- `CAT_COL_DATABASE`
- `CAT_COL_FOREIGN_NAME`
- `CAT_COL_CONNECT_NAME`

e ainda expone `LinkedTableInfo`, `getLinkedDbName`, `getLinkedTableName` e `getConnectionName`.

### Conclusao forte

Aqui existe convergencia muito boa entre runtime e bibliotecas abertas. Tabelas vinculadas sao um caso bem compreendido.

### 8.2 Relacionamentos

Em `mdbtools-dev/src/libmdb/backend.c`, `MSysRelationships` e lida explicitamente com colunas:

- `szColumn`
- `szObject`
- `szReferencedColumn`
- `szReferencedObject`
- `grbit`

O proprio comentario documenta o significado de cada uma.

### Conclusao forte

A camada de relacoes entre tabelas e uma das partes mais abertas e reconstituiveis do ecossistema Access.

## 9. O que ja da para afirmar sobre layout, mascara e validacao

### Confirmado com boa seguranca

- o banco tem catalogo central em `MSysObjects`;
- propriedades binarios existem em `LvProp`;
- essas propriedades usam formatos `KKD/MR2`;
- o vocabulario inclui `InputMask`, `ValidationRule`, `ValidationText`, `Caption`, `Format`, `DisplayControl` e `RowSource`;
- o tipo visual do controle e persistido;
- ha um storage especializado para objetos Access em `MSysAccessStorage`;
- ha streams como `PropData` e `TypeInfo` ligados a formularios/reports;
- VBA/modulos usam uma trilha propria com `LvModule`, `MSysModules*` e `AcessVBAData`.

### Ainda nao fechado com prova suficiente

- layout binario exato de um formulario completo;
- coordenadas exatas e algoritmo de posicionamento final de todos os controles;
- serializacao integral de macros de Access nao-VBA;
- mapeamento byte a byte entre `PropData` e propriedades semanticas de UI;
- relacao exata entre `BaselineAXL` e um modelo XML reaproveitavel dentro do `.accdb`.

## 10. Modelo de especificacao operacional para este projeto

Com base nas referencias cruzadas, a estrategia mais realista para o projeto e:

### Camada A: fisica do banco

- paginas ACE/Jet;
- leitura de cabecalho;
- codec/criptografia quando necessario.

### Camada B: catalogo e esquema

- `MSysObjects`;
- `MSysRelationships`;
- tipos de objeto;
- `Flags`;
- linked tables com `Database`, `Connect`, `ForeignName`.

### Camada C: property bags

- `LvProp`;
- `KKD/MR2`;
- propriedades nomeadas como `InputMask`, `ValidationRule`, `DisplayControl`, `RowSource`.

### Camada D: objetos de aplicacao Access

- `MSysAccessStorage`;
- streams `PropData`, `TypeInfo`, `Blob*`, `BaselineAXL`;
- formularios;
- reports;
- macros de objeto.

### Camada E: codigo e projeto VBA

- `LvModule`;
- `MSysModules`;
- `MSysModules2`;
- `AcessVBAData`.

## 11. Sintese final

As referencias abertas `jackcess` e `mdbtools` ajudam muito a especificar:

- estrutura fisica paginada do `.accdb`;
- catalogo e objetos;
- propriedades binarios em `LvProp`;
- tabelas, relacoes e links externos.

Mas elas nao fecham sozinhas a parte mais importante para este projeto: como o Access guarda layout de formularios, estrutura de reports, macros e VBA.

Para essa trilha, o melhor mapa local continua sendo o `MSACCESS.EXE_pseudo_c.txt`, que mostra um subsistema proprio com:

- `MSysAccessStorage`;
- streams `PropData` e `TypeInfo`;
- controle visual via `DisplayControl` e `ControlType`;
- containers e tabelas para VBA como `AcessVBAData`, `MSysModules` e `MSysModules2`.

Portanto, a especificacao mais fiel do `.accdb` para o projeto deve ser hibrida:

- usar `jackcess` e `mdbtools` para a base fisica, catalogo e property bags;
- usar o pseudo-C para orientar a camada de UI, reports e VBA;
- registrar explicitamente, em cada topico, o que e evidencia direta e o que ainda e inferencia.
