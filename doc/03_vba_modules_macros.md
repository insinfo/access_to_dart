# Código Visual Basic (VBA) e Macros

O código VBA e as Macros operam nas "costas" das rotinas de interface de usuário. Diferente dos objetos de interface do `MSysAccessStorage/Forms`, a arquitetura do MS-OVBA (Microsoft Office Visual Basic for Applications) é o que governa a compilação do código.

## 1. VBA via OLE / MS-OVBA

O projeto VBA de todo o banco de dados é salvo compactado na clássica estrutura documentada sob a especificação [MS-OVBA].
As pastas embutidas de projeto para isso normalmente aparecem nos ramos:
- `_VBA_PROJECT` 
- E também na correlação com os sub-diretórios `Modules`.

Apesar do código fonte estar empacotado, ele nunca está solto em `.txt` original. Ele consiste de:
1. **Performance Cache / P-Code (Performance Code)**: Quando você roda o banco de dados, o Access não compila o VBA no momento da chamada; isso acontece antecipadamente. O P-Code compilado está sempre guardado junto à unidade do módulo.
2. **Compressed Source Code**: O código legível que você vê pressionando `Alt + F11` sofre um algoritmo específico de compressão Microsoft proprietário do MS-OVBA. É por meio de uma descompressão que ferramentas externas e o descompilador tiram esse conteúdo textual.

## 2. O Ramo `Modules`

Assim como em `Forms`, a pasta `Modules` no interior de `MSysAccessStorage` ou na raiz OLE mapeia as entradas da `MSysObjects` usando numericais (numeric slots).
O `DirData` dos `Modules` decodifica de forma semelhante, oferecendo o caminho UTF-16LE para que o container interno saiba que a string de catálogo *"MeuBlocoDeCodigo"*, na verdade, reside no Slot numérico 8 da árvore OLE.

## 3. Diferença de Macros Modernas

Com o Access 2010+, Macros tornaram-se entidades separadas do VBA tradicional, focadas em segurança e abstração visual.
Enquanto o VBA continua atrelado ferrenhamente ao P-Code/OLE, as macros puras do Access hoje costumam ser serializadas em **XML bruto** e guardadas em certas colunas ocultas no plano de dados ACE ou referenciadas. Macros embarcadas (`Embedded Macros` conectadas a botões de relatório) são freqüentemente salvas como propriedades serializadas em XML dentro de blocos atados à lógica do Formulário dentro de sua respectiva posição na tabela ou OLE Property.