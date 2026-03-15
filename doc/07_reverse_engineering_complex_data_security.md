# Temas, Controle de Acesso e Data Macros

## Controle de Acesso (MSysACEs)
O mecanismo do MS Access mantem uma tabela de relacao chamada MSysACEs. As rotinas C++ (sub_14083baa0) fazem checagens pesadas ao cruzar as entradas (Admins, Users) para resolver a flag de seguranca local. Apesar do .accdb contemporaneo nao mostrar mais o workgroup MDW de forma obvia, a velha arquitetura Jet Workgroup de Access Control Entries resiste via MSysACEs que define as politicas binarias do backend para metodos de password encripados ou permissoes do OLE.

## Engine de Interface Moderna e OART Themes
Alem dos OLE blobs dos Forms de 1997, o painel injeta um framework interno batizado em C++ de OART Themes (Office Art). 
Exemplo no offset 1404facb4: o kernel chama o injetor de ThemeColorGallerySite para injetar os temas modernizados do Access via XML e metadados. Isso significa que botoes e controles modernos reagem a pacotes globais OART assim como Powerpoint, bypassando a configuracao legada dos formularios PropData.

## Storage de Data Macros (AXL)
A serializacao final mapeada eh o DataMacros. As rotinas a partir de 14074189f apontam que Macros nativas vinculadas em tabelas disparam gatilhos isolados em um XML separado de extensao .axl (Access Extensible Markup Language), na virtual path dataMacros/. Isso descola a execucao autonoma e cloud-friendly da parte restrita do VBA.
