# Export e Configurações Visuais Internas do MS Access

## Painel de Navegação (Navigation Pane)
O painel principal lateral é reconstruído através de um subconjunto de tabelas virtuais atreladas diretamente ao motor do MS Access (e não são propriamente planilhas do Jet).
O pseudo-codigo varre através destas categorias internas: MSysNavPaneGroupCategories, MSysNavPaneGroups, MSysNavPaneGroupToObjects, e MSysNavPaneObjectIDs. Através do offset 1404e2c79, a engine aloca vetores contínuos com sub_1400a05d4 e monta as instâncias atreladas ao schema do sistema antes de injetar graficamente o painel esquerdo da aplicação.

## Exportação de Relacionamentos (XML/UI Map)
Uma coisa extremamente valiosa sobre tabelas do tipo Type=8 ou mapeadas na base de UI é a manipulação do mapa relacional. O executável usa rotinas C++ como em 14073e3f0 para estruturar layouts usando dumps de XML literais: <MSysRelationships>
<ccolumn> [0x...] </ccolumn>
<grbit> etc.

Essa é a pista central de de como os templates Modernos (pós Office 2007) foram empacotados por cima do container OLE legadão! As conexões de interface, macros de interface ou mapas de gráficos operam frequentemente através de serializações puras de XML.


## Customizacao de Ribbon (USysRibbons)
A tabela USysRibbons e checada no processo de inicio de instanciacao de views. Ela e tratada como uma tabela padrao (Type=1) que retorna ponteiros para parsers secundarios onde o Blob XML de layout da Ribbon e injetado. Isso completa o cenario: Todo modulo moderno visual que nao e Formulario OLE, o MS Access resolve lendo Strings XML nas tabelas de sistema.
