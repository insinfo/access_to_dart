# Terceira Passada Cirurgica no `.accdb`

Este documento faz uma leitura mais cirurgica de quatro temas especificos no `MSACCESS.EXE_pseudo_c.txt`:

1. `MSysObjects`, `Lv`, `LvExtra`, `LvModule` e `Flags`
2. reports e ordem estrutural de secoes
3. VBA, `MSysModules`, `MSysModules2` e `AcessVBAData`
4. tabelas vinculadas, relacoes e schema (`Database`, `Connect`, `ForeignName`)

O objetivo aqui nao e resumir o Access inteiro, mas registrar o que o executavel evidencia com mais forca.

## 1. `MSysObjects`, `Lv`, `LvExtra`, `LvModule` e `Flags`

### 1.1 `MSysObjects` e a fonte principal do catalogo

O Access escolhe explicitamente `MSysObjects` como tabela base, com fallback/alternancia para `MSysNavPaneObjectIDs` em alguns fluxos de navegacao.

### Evidencias

- Bloco `20001-30000`, em torno de `14001ab2e`: `u"MSysObjects"`
- Bloco `20001-30000`, em torno de `14001ab37`: `u"MSysNavPaneObjectIDs"`

### Inferencia forte

`MSysObjects` e o catalogo estrutural do banco. `MSysNavPaneObjectIDs` parece complementar a camada de navegacao/UI do Access, nao substituir o catalogo primario.

## 1.2 As duas queries mais importantes encontradas

### Query 1: trilha de modulo

No bloco `1190001-1200000`, em torno de `1405b7688`, aparece:

```sql
SELECT Name, Type, LvModule FROM MSysObjects WHERE Type IN (-32768, -32764, -32761, -32)
```

### Query 2: trilha completa de objeto complexo

No bloco `1190001-1200000`, em torno de `1405ba383`, aparece:

```sql
SELECT Name, Type, Lv, LvExtra, LvModule, Flags FROM MSysObjects WHERE ...
```

### Inferencia forte

O runtime usa duas leituras diferentes:

- uma leitura mais leve para localizar modulo associado
- uma leitura mais completa para objetos que exigem desserializacao total

Isso praticamente confirma que `Lv`, `LvExtra`, `LvModule` e `Flags` sao o coracao da persistencia logica de forms/reports/modules/macros.

## 1.3 Leitura campo a campo

No mesmo bloco, em torno de `1405ba449-1405ba4b2`, o Access chama sequencialmente:

- `sub_14083cec0(..., u"Lv", ...)`
- `sub_14083cec0(..., u"LvExtra", ...)`
- `sub_14083cec0(..., u"LvModule", ...)`
- `sub_14083cec0(..., u"Flags", ...)`

E, no fluxo de modulo por objeto, em torno de `1405b772c`, le:

- `sub_14083cec0(..., u"LvModule", ...)`

### Inferencia forte

Essas chamadas mostram que os campos nao sao apenas metadados decorativos. Eles sao lidos ativamente, campo por campo, por funcoes dedicadas do runtime.

## 1.4 Papel operacional de cada coluna

### `Lv`

Parece ser o blob principal do objeto.

### `LvExtra`

Parece ser um blob complementar, muito provavelmente com propriedades adicionais, extensoes, layout auxiliar ou informacoes que nao cabem no payload principal.

### `LvModule`

Parece ser o elo entre o objeto do catalogo e o artefato de codigo/modulo.

### `Flags`

Parece controlar estado, versao, capacidade, seguranca ou comportamento do objeto.

### Observacao importante

Nao foi possivel, nesta passada, reconstruir o layout binario exato desses blobs. Mas a evidencia do executavel e forte o bastante para afirmar que:

- o Access trata esses campos como primeira classe;
- a desserializacao do objeto depende deles;
- qualquer gerador fiel precisa carregalos, nao apenas ignoralos.

## 2. Reports e ordem estrutural

## 2.1 Secoes nomeadas encontradas

No bloco `710001-720000`, em torno de `140369de4-140369e6a`, o executavel resolve nomes de secao:

- `Detail`
- `FormHeader`
- `FormFooter`
- `LReportHeader`
- `ReportFooter`
- `PageHeaderSection`
- `PageFooterSection`
- `GroupHeader`
- `GroupFooter`

### Inferencia forte

O Access tem uma taxonomia estrutural explicita para secoes de report. Isso confirma que report nao e apenas uma tela achatada de controles.

## 2.2 Ordem estrutural implicita

Pela lista de nomes e pelo mapeamento observado, a ordem semantica mais plausivel e:

1. `ReportHeader`
2. `PageHeaderSection`
3. `GroupHeader`
4. `Detail`
5. `GroupFooter`
6. `PageFooterSection`
7. `ReportFooter`

### Observacao

O executavel nao mostrou, nesses trechos, um array textual com a ordem montada de ponta a ponta. Mas o conjunto de nomes de secao e a forma como o runtime os resolve indicam fortemente que a serializacao de report preserva hierarquia e ordem de secoes.

## 2.3 Modelo interno rico para reports

No bloco `1260001-1270000`, aparecem tipos como:

- `RDLReport`
- `RDLSection`
- `RDLRow`
- `RDLTable`
- `RDLTablixMember`
- `RDLSortOrderProperty`

### Evidencias

- `140615ae0`: `RDLReport`
- `140615b20`: `RDLSection`
- `140615b00`: `RDLRow`
- `140615b60`: `RDLTable`
- `140615b80`: `RDLTablixMember`
- `140615b40`: `RDLSortOrderProperty`
- `140616044+`: `RDLReportElement`

### Inferencia forte

Mesmo que o armazenamento nativo do `.accdb` nao seja literalmente um arquivo `.rdl`, o runtime do Access tem um modelo interno de report suficientemente rico para representar:

- secoes
- regioes tabulares
- linhas
- membros de tablix
- ordenacao

Isso e um sinal importante para o projeto: a trilha de reports deve nascer no gerador com um modelo proprio, nao como adaptacao de formularios.

## 3. VBA, `MSysModules`, `MSysModules2` e `AcessVBAData`

## 3.1 `AcessVBAData`

O nome `AcessVBAData` aparece explicitamente como container consultado pelo runtime.

### Evidencias

- Bloco `200001-210000`, em torno de `1400dc328`
- Bloco `200001-210000`, em torno de `1400dd9a7`
- Bloco `200001-210000`, em torno de `1400dda3d`

### Inferencia forte

Existe um container dedicado para dados de VBA. Isso reforca que o VBA nao esta guardado apenas como texto em uma coluna comum nem apenas no storage visual do form/report.

## 3.2 `MSysModules` e `MSysModules2`

O runtime cria, abre e valida tanto `MSysModules` quanto `MSysModules2`.

### Evidencias

- Bloco `460001-470000`, em torno de `14021e463-14021e475`: criacao/abertura de `MSysModules`
- Bloco `460001-470000`, em torno de `14021e429-14021e43b`: criacao/abertura de `MSysModules2`
- Bloco `460001-470000`, em torno de `140221a03-140221a4a`: validacao de `MSysModules` e `MSysModules2`
- Bloco `460001-470000`, em torno de `1402230d1` e `1402230ee`: `MSysModules2` e `MSysScripts`

### Inferencia forte

O Access mantem pelo menos duas trilhas de tabela/sistema para modulos:

- uma mais antiga ou principal: `MSysModules`
- uma alternativa/versao adicional: `MSysModules2`

Isso sugere compatibilidade entre versoes, formatos ou estados de projeto.

## 3.3 `LvModule` como ponte

No bloco `700001-710000`, em torno de `14035a830`, e tambem no fluxo SQL de `MSysObjects`, `LvModule` e lido explicitamente.

### Inferencia forte

O modelo mais plausivel e:

1. o objeto vive em `MSysObjects`
2. `LvModule` aponta para ou encapsula o vinculo com o modulo
3. o runtime cruza isso com `MSysModules`/`MSysModules2`
4. `AcessVBAData` fornece o container de dados de projeto VBA

## 3.4 Mais sinais de infraestrutura VBA

Tambem apareceram:

- `VBAProject`
- `IVbaProjectSite`
- `IVbaProvideStorage`
- `IGetVBAObject`
- `VBAMacroBlockedAndAlerted`
- `VBAMacroSigned`

### Inferencia forte

Ha uma infraestrutura extensa de:

- projeto VBA
- provedor de storage
- seguranca e assinatura de macro
- ligacao de objetos ao projeto

Portanto, a trilha de VBA no `.accdb` e muito mais que um dump de texto.

## 4. Tabelas vinculadas, relacoes e schema

## 4.1 `Database`, `Connect` e `ForeignName`

A funcao em torno de `1400852a8` le explicitamente tres propriedades:

- `Database`
- `Connect`
- `ForeignName`

### Evidencias

- `140085391`: `Database`
- `140085401`: `Connect`
- `14008546b`: `ForeignName`

### Inferencia forte

Esse trio e um dos melhores indicios de como o Access modela objetos vinculados ou relacionais:

- `Database`: origem ou banco-alvo
- `Connect`: string/parametros de conexao
- `ForeignName`: nome do objeto remoto, vinculado ou referenciado

## 4.2 Filtros e condicoes com `ForeignName`

Aparecem expressoes como:

- `Not IsNull(ForeignName) AND ForeignName <> Name`
- `Database = "" ... AND ForeignName = ""`

### Evidencias

- `140288270`
- `14050dd7c`
- `14050dda1`

### Inferencia forte

`ForeignName` nao e um detalhe isolado. Ele participa de filtros e validacoes logicas, sugerindo uso forte em:

- tabelas vinculadas
- relacoes
- diferenca entre nome local e nome externo

## 4.3 `Connect` e prefixos de conexao

No bloco em torno de `14070e428+`, o runtime:

- le `Connect`
- monta ou inspeciona prefixos `DATABASE=`
- le `Database`
- le `ForeignName`

### Inferencia forte

Isso mostra um fluxo concreto de montagem/normalizacao de conexao:

1. ler `Connect`
2. normalizar/inspecionar `DATABASE=`
3. combinar com `Database`
4. resolver `ForeignName`

Para tabelas vinculadas, esse fluxo parece central.

## 4.4 Schema e colecoes logicas

As categorias abaixo aparecem explicitamente no runtime:

- `Databases`
- `Relationships`
- `Schema`
- `StoredProcedures`
- `Triggers`
- `Functions`
- `InlineFunctions`
- `ScalarFunctions`
- `TableFunctions`

### Evidencias

- Mapeamento de categoria em `140085520`
- Checagens adicionais em `1408768bb-1408769ba`
- Rotas de UI/metadata em `140899c81+` e `14084403c+`

### Inferencia forte

O Access/ACE expõe internamente um universo de colecoes de schema mais amplo que o modelo simplificado "tabela e consulta". Isso vale especialmente para integracao com fontes externas, objetos SQL e metadados de provider.

## 4.5 Metadados de coluna

Continuam aparecendo:

- `TABLE_NAME`
- `DBCOLUMN_BASECOLUMNNAME`

### Evidencias

- `14001ca64`
- `14001cb74`
- `140845872`
- `140845dd0`
- `14085a45b`
- `14085a556`
- `14085bdf7`
- `14085bef2`
- `1408a1a93`
- `1408a1b5d`

### Inferencia forte

O runtime consulta schema de coluna e tabela em multiplos pontos, o que indica uma camada formal de introspeccao de metadados, nao apenas acesso direto a campos por nome textual.

## 5. Conclusoes praticas para o projeto

## 5.1 O que agora esta bem sustentado

- `MSysObjects` e o catalogo principal.
- `Lv`, `LvExtra`, `LvModule` e `Flags` sao lidos explicitamente e fazem parte da desserializacao real.
- Reports tem secoes nomeadas e modelo estrutural proprio.
- A trilha de VBA passa por `LvModule`, `MSysModules`, `MSysModules2` e `AcessVBAData`.
- Tabelas vinculadas e relacoes usam explicitamente `Database`, `Connect` e `ForeignName`.

## 5.2 O que ainda nao esta resolvido

- layout binario exato de `Lv`, `LvExtra`, `LvModule`
- semantica completa de `Flags`
- formato fisico de pagina/registro de dados no arquivo
- layout binario detalhado das estruturas de VBA/macros

## 5.3 Impacto direto no gerador

Se quisermos fidelidade alta no scaffold, o gerador precisa:

- tratar `MSysObjects` como catalogo de verdade, nao so como lista de nomes
- capturar e propagar `Lv`, `LvExtra`, `LvModule` e `Flags`
- modelar reports com secoes e ordem estrutural
- manter uma trilha propria de VBA/modulos
- interpretar objetos vinculados usando `Database`, `Connect` e `ForeignName`

Em resumo: o executavel reforca a regra de ouro do repositorio. Se a perda de fidelidade aparece no app gerado, a correcao precisa nascer no gerador e no parser dessas camadas internas.
