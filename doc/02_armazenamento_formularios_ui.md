# Armazenamento e Recuperação de Formulários (UI)

O design de interface do Microsoft Access e o armazenamento de propriedades de UI não são salvos em texto legível (como HTML ou JSON), mas numa árvore hierárquica severamente otimizada contida na infraestrutura OLE do `MSysAccessStorage`. 

## 1. O Container `MSysAccessStorage`

Para objetos complexos e hierárquicos, o Access cria um mapeamento entre os IDs presentes em sua tabela do mundo real (`MSysObjects`) e o mundo do "armazenamento virtual OLE".

Baseado na investigação de `MSACCESS.EXE`, as árvores de streams principais para manter a GUI são representadas pelas referências chaves em memória:
- `MSysAccessStorage_ROOT`
- `MSysAccessStorage_SCRATCH`
- Sub-pasta OLE: `Forms`
- Sub-pasta OLE: `Reports`

## 2. A Hierarquia "Numeric Slots" e a decodificação de Diretórios

Ao inspecionar o ramo `Forms` do `MSysAccessStorage`, **não** encontraremos pastas nomeadas como os formulários reais (ex: `Form_Login`), mas sim identificadores numéricos chamados de *slots*.

Para relacionar um nome de formulário do catálogo principal a um *slot numérico* binário:
1. O Access cria streams anexos chamados **`DirData`**.
2. O conteúdo deste arquivo `DirData` possui cabeçalhos específicos que mapeiam inteiros para strings de catálogo através do formato **UTF-16LE** (identificado em nossas próprias varreduras binárias customizadas provadas com Jackcess).
3. Após encontrar o slot correspondente em `DirData`, a ferramenta direciona para outro sub-stream de armazenamento associado a esse formulário, frequentemente em streams nomeados como `TypeInfo`, ou em outros streams OLE menores (`PropData` e Blobs diretos).

## 3. O Campo `LvProp` e a renderização do Container

Quando o Formulário é aberto no Access, três conjuntos de dados se encontram:
- A entrada na Tabela Padrão (onde o nome existe, e algumas macros estão associadas).
- Propriedades salvas localmente ou referenciadas (frequentemente contidas na coluna `LvProp` em OLE na `MSysObjects`).
- O desenho do formulário e dos botões extraídos nativamente como objetos OLE de dentro do binário contido no respectivo ramo numérico em `MSysAccessStorage/Forms`. 

Assim, a Engenharia Reversa para extrair um Form requer cruzar a decodificação de `DirData` para amarrar o texto legível ao `Id` binário, e então dissecar o BLOB encontrado no slot correspondente.