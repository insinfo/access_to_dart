# Arquitetura OLE e Descompressão Interna do Access

## Delegacao de Storage do VBA (VBEProject)
Em diversas passagens (como 1405b37cd e 14079dfec), o executavel Access implementa a interface IVbaProvideStorage, contendo a classe CVbeProvideStorage.
Ele passa as tags e streams OLE usando identificadores C++ de ponteiros como VBEProject.
Isso significa que o banco .accdb nao executa o VBA: ele extrai o Storage Object e delega a ponte inteira de runtime para as DLLs nativas do Office VBE (be7.dll), agindo apenas como um Storage Provider passivo para o motor Visual Basic Editor.

## Propriedades e Compressao de Texto OLE
Para colunas memo longas e blobs internos em recordsets associados a UI, nota-se a flag constante UnicodeCompression mapeada via UTF-16 arrays (140b3ae08). O Access Jet 4.0 empacota strings repetitivas dentro de sessoes OLE compactadas pelo motor MS nativo (LZNT1 / MSZIP), sendo essa constante a flag do schema principal.

## Relatorio Final de Parse C++
A arquitetura principal mapeia as MSysObjects nao como texto de layout, mas como meta-propriedades para a virtual table CDBIDHelper, e entao essas tabelas reagem via COM aos requests do VBE e do renderizador de Formulario e Ribbon (usando DOM de XML).
