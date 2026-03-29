# Especificacao Operacional do `.accdb` para Formularios, Controles e Automacao

Este documento resume o que foi possivel inferir a partir da leitura do arquivo `referencias/MSACCESS.EXE_pseudo_c.txt`, inspecionado em blocos de 10.000 linhas, sobre como o Microsoft Access organiza no `.accdb` os formularios, controles, layout, eventos, macros e metadados relacionados.

Nao e uma especificacao oficial da Microsoft. E uma especificacao operacional inferida do executavel, util para orientar o gerador em `lib/src/project_generator/**`.

## Escopo e metodo

- Arquivo analisado: `C:\MyDartProjects\access_to_dart\referencias\MSACCESS.EXE_pseudo_c.txt`
- Tamanho aproximado: `3.029.373` linhas
- Leitura orientada por blocos de `10.000` linhas
- Blocos mais relevantes revisados:
  - `1-10000`
  - `20001-30000`
  - `120001-130000`
  - `170001-180000`
  - `200001-210000`
  - `220001-230000`
  - `560001-570000`
  - `620001-630000`

## Visao geral

O desenho de formularios do Access nao aparece no `.accdb` como HTML, JSON ou texto simples. Pelo que o executavel indica, o Access usa uma composicao em camadas:

1. Catalogo logico de objetos.
2. Armazenamento hierarquico em `MSysAccessStorage`.
3. Streams especializados como `PropData`, `TypeInfo`, `BlobCopy`, `BlobDelta` e `DisplayControl`.
4. Mapeamento de tipo de objeto para arvores como `Forms`, `Reports` e `Modules`.
5. Serializacao de propriedades e de tipo de controle em estruturas binario-textuais internas.

## 1. Arvores principais dentro do banco

Os nomes internos mais relevantes encontrados foram:

- `MSysAccessStorage_ROOT`
- `MSysAccessStorage_SCRATCH`
- `MSysAccessStorage`
- `Forms`
- `Reports`
- `Modules`
- `TDForms`

### Evidencias

- No bloco `170001-180000`, linhas em torno de `175436` e `175438`, o binario referencia explicitamente `MSysAccessStorage_ROOT` e `MSysAccessStorage_SCRATCH`.
- No bloco `20001-30000`, linhas em torno de `28395-28405`, o codigo mapeia categorias para nomes de armazenamento: `Reports`, `Modules`, `TDForms` e `Forms`.
- No bloco `120001-130000`, linhas em torno de `129591-129636`, a funcao `sub_140085520` retorna os nomes de pasta por tipo de objeto, incluindo `Forms`, `Reports`, `Modules` e `TDForms`.

### Implicacao pratica

O `.accdb` persiste objetos complexos de interface em arvores internas, nao em tabelas normais apenas. Para reconstruir formularios de forma fiel, o gerador precisa considerar que a definicao visual e de propriedades esta espalhada entre catalogo e storage interno.

## 2. Mapeamento entre tipo de objeto e pasta interna

Foi identificado um mapeamento interno entre codigos numericos e nomes de colecoes:

- `0x8000 -> Forms`
- `0x8004 -> Reports`
- `0x8007 -> Modules`
- `0x8008 -> TDForms`

### Evidencias

- Bloco `120001-130000`, linhas em torno de `129591-129636`.
- Bloco `200001-210000`, linhas em torno de `205357-205363`, com verificacoes de `Forms`, `Reports` e `Modules`.

### Implicacao pratica

Isso reforca que formularios, relatorios e modulos seguem pipelines de persistencia paralelos, mas separados. O bug que aparece no scaffold gerado de formularios provavelmente nasce na leitura incorreta dessa camada de classificacao ou no mapeamento posterior de propriedades.

## 3. Streams de persistencia dos objetos

Os nomes de stream mais importantes encontrados foram:

- `PropData`
- `PropDataCopy`
- `TypeInfo`
- `TypeInfoCopy`
- `BlobCopy`
- `BlobDelta`
- `BlobDeltaCopy`
- `BaselineAXL`

### Evidencias

- Bloco `200001-210000`, linhas em torno de `205524-205532`: procura explicita por `PropData` e `PropDataCopy`.
- Bloco `220001-230000`, linhas em torno de `223535-225169`: manipulacao de `TypeInfo` e `TypeInfoCopy`.
- Bloco `220001-230000`, linhas em torno de `223535-224000`: liberacao e troca de `BlobCopy`, `TypeInfoCopy` e `BlobDeltaCopy`.
- Bloco `220001-230000`, linhas em torno de `228247-230142`: uso de `BaselineAXL`.

### Interpretacao operacional

- `PropData` parece guardar o pacote principal de propriedades do objeto.
- `TypeInfo` parece guardar metadados de tipagem e estrutura necessarios para interpretar o objeto e seus controles.
- `Blob*` sugere snapshots e deltas binarios do desenho ou estado serializado.
- `BaselineAXL` indica um baseline serializado em formato AXL, usado como representacao intermediaria ou de intercambio interno.

## 4. Como o Access representa formularios e controles

O termo mais importante para os controles foi `DisplayControl`.

### Evidencias

- Bloco `220001-230000`, linhas em torno de `230298-230337`: leitura repetida da propriedade `DisplayControl`.
- Bloco `220001-230000`, linhas em torno de `230246-230270`: propriedades `WebDesignMode` e `Theme Resource Name` aparecem no mesmo fluxo do formulario.
- Bloco `560001-570000`, linhas em torno de `568366-568372`: manipulacao de `ControlType` e comando `DeleteControl`.
- Bloco `620001-630000`, linhas em torno de `624778-624866`: comando `CreateNewControl` e serializacao de `ControlType`.

### Interpretacao operacional

O desenho do formulario parece ser composto por uma lista de controles serializados, e cada item possui pelo menos:

- Tipo de controle (`ControlType`)
- Bloco de apresentacao (`DisplayControl`)
- Propriedades textuais/binarias anexadas

Isso combina com a necessidade do gerador de preservar o tipo real do controle do Access, em vez de reduzir tudo a textbox generica.

## 5. Tipos de controle identificados

Foram encontrados pelo menos os seguintes identificadores:

- `CheckBox`
- `DisplayControl`
- `ControlType`
- funcoes auxiliares como `getIDsOfControls` e `getNamesOfSelectedControls`

### Evidencias

- Bloco `1-10000`, linha em torno de `3339`: registro de `CheckBox`.
- Bloco `220001-230000`, linhas em torno de `230298-230337`: leitura de `DisplayControl`.
- Bloco `560001-570000` e `620001-630000`: `ControlType`, `DeleteControl`, `CreateNewControl`.

### Implicacao pratica

O Access de fato distingue o tipo real do controle no armazenamento. Para o gerador, isso valida a regra do repositorio de propagar textbox, combobox, listbox, checkbox, textarea e afins com fidelidade, em vez de inferir apenas pela fonte de dados.

## 6. Layout, posicao e tamanho dos controles

Nao encontrei no pseudo-C, nos blocos revisados, nomes literais como `Left`, `Top`, `Width` e `Height` associados diretamente a propriedades de formulario do Access. Mas encontrei evidencias fortes de que o layout e processado como retangulos e blobs de `DisplayControl`.

### Evidencias

- O pseudo-C contem grande quantidade de operacoes com `left`, `top`, `right`, `bottom`, especialmente em areas de renderizacao da UI.
- No bloco `220001-230000`, o fluxo de `DisplayControl` extrai comprimento de buffer a partir de offsets como `+0xb0` e `+0xb8`, sinal de que o layout e atributos visuais ficam serializados num bloco binario.
- O proprio template interno do executavel mostra placeholders como `%POSSTYLE%`, `%ID%`, `%CONTROLTYPE%` e `%CONTROLSOURCE%` em torno da linha `856020`, reforcando que o Access converte posicao e estilo para uma representacao separada.

### Interpretacao operacional

A posicao e o tamanho dos controles parecem ficar dentro do payload de `DisplayControl` e/ou em propriedades serializadas derivadas de `PropData`, nao como colunas planas facilmente legiveis.

Para o gerador isso significa:

- A leitura do layout precisa partir do blob do controle, nao apenas de nomes de propriedade textuais.
- Ordem estrutural de secoes e controles e tao importante quanto as coordenadas absolutas.
- Qualquer heuristica atual baseada so em campos ou captions provavelmente esta perdendo fidelidade do Access.

## 7. Eventos, macros embutidas e automacao

O executavel expoe diversos nomes de evento diretamente:

- `OnLoad`
- `AfterUpdate`
- `AfterInsert`
- `OnValidationError`
- `BeforeUpdate`
- `BeforeInsert`
- `BeforeDelConfirm`
- `OnUnload`
- `OnClick`
- `OnDblClick`
- `OnChange`
- `OnNotInList`
- `OnCurrent`

### Evidencias

- Bloco `1-10000`, linhas em torno de `3027-3053`.

### Interpretacao operacional

Os eventos de formulario e controle fazem parte do modelo de propriedades persistidas. O pseudo-C nao prova sozinho se cada handler aponta para:

- macro embutida
- macro nomeada
- rotina VBA
- expressao

Mas prova que esses nomes de evento sao propriedades de primeira classe no runtime do Access.

Para o gerador, isso sugere que qualquer extração de eventos precisa preservar:

- nome do evento
- tipo do binding
- payload associado

## 8. VBA e modulos

O executavel separa `Modules` dos formularios.

### Evidencias

- Blocos `20001-30000`, `120001-130000` e `200001-210000`: referencias repetidas a `Modules`.
- O mapeamento interno mostra `Modules` como pasta distinta de `Forms`.

### Interpretacao operacional

O codigo VBA nao esta simplesmente "dentro do formulario" como texto solto. O banco parece manter:

- definicao visual e propriedades do formulario na arvore de storage
- codigo em `Modules` e estruturas correlatas

Isso e consistente com a arquitetura classica do Access e com a documentacao ja reunida no projeto sobre `MS-OVBA`.

## 9. Mascaras, validacao, regras e metadados de campo

### O que foi confirmado

- Existe pelo menos o evento `OnValidationError` no runtime.
- `PropData` e `DisplayControl` sao pontos fortes candidatos para persistencia das propriedades detalhadas dos controles.

### O que nao apareceu nominalmente nos blocos revisados

- `InputMask`
- `ValidationRule`
- `ValidationText`
- `ControlSource`
- `RecordSource`
- `RowSource`

### Interpretacao operacional

A ausencia desses nomes no pseudo-C revisado nao prova ausencia no `.accdb`. O mais provavel e que:

- essas propriedades estejam serializadas em blobs de propriedade, sem nomes legiveis em todo o fluxo;
- ou aparecam em outra parte do executavel fora dos blocos revisados;
- ou sejam resolvidas por tabelas de propriedade genericamente tipadas, interpretadas via `TypeInfo`.

Para o gerador, a conclusao segura e:

- nao assumir que a falta de string literal no executavel signifique falta de persistencia no arquivo;
- tratar `PropData` e `TypeInfo` como fontes candidatas para mascara, validacao e binding;
- validar no scaffold real antes de ajustar teste e documentacao.

## 10. O que isso significa para `access_to_dart`

### Direcoes seguras para o gerador

- Ler e preservar o tipo real do controle a partir da estrutura de controle, nao apenas da origem do dado.
- Modelar separadamente:
  - tipo do objeto (`Form`, `Report`, `Module`)
  - tipo do controle (`ControlType`)
  - payload visual (`DisplayControl`)
  - propriedades serializadas (`PropData`)
  - metadados estruturais (`TypeInfo`)
- Criar trilha especifica para eventos do Access, em vez de achatar tudo em handlers genericos.
- Considerar que layout e estilo surgem de blobs internos e nao de um conjunto plano de propriedades texto.

### Riscos de uma implementacao simplificada demais

- trocar `ComboBox` por textbox e perder comportamento real;
- perder ordem e agrupamento visual;
- ignorar secoes e hierarquia do formulario;
- descartar eventos e macros embutidas;
- perder mascara, validacao ou bindings por depender apenas de nomes de propriedades legiveis.

## 11. Resumo executivo

Pelo que o `MSACCESS.EXE_pseudo_c.txt` mostra, o `.accdb` armazena formularios de forma composta:

- o objeto pertence a uma arvore como `Forms` dentro de `MSysAccessStorage`;
- as propriedades principais ficam em streams como `PropData`;
- metadados estruturais e de interpretacao ficam em `TypeInfo`;
- o desenho e os controles usam estruturas como `DisplayControl`;
- o tipo real do controle e preservado via `ControlType`;
- eventos como `OnLoad`, `OnClick`, `OnCurrent` e `OnValidationError` fazem parte do modelo persistido;
- VBA e modulos seguem trilha separada em `Modules`.

Em outras palavras: a forma correta de corrigir bugs de fidelidade do app gerado nao e editar o scaffold final, mas melhorar o pipeline do gerador para ler e propagar essas camadas de storage e propriedade.
