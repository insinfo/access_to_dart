# Estrutura Geral e Formato ACCDB

Este documento serve como introdução à arquitetura interna dos arquivos do Microsoft Access no formato atualizado (`.accdb`), que é o formato padrão introduzido após a versão Access 2007 (abandonando o clássico `.mdb`).

## 1. O Mecanismo de Banco de Dados ACE (Access Connectivity Engine)

Essencialmente, o arquivo `.accdb` atua como um container que hospeda tanto dados relacionais puros (Tabelas) quanto objetos do próprio aplicativo cliente (Formulários, Relatórios, Macros e Código VBA). 

Diferente de bancos de dados modernos baseados em servidor único (como PostgreSQL), o `.accdb` trabalha localmente integrando todo o "Front-End" e o "Back-End" num mesmo arcabouço através do pacote ACE.

## 2. Tabelas e Metadados do Sistema (`MSysObjects`)

A espinha dorsal invisível de qualquer banco de dados Access são suas tabelas de sistema, todas começando com o prefixo `MSys`. A tabela de entrada mais importante é a `MSysObjects`.

A tabela `MSysObjects` contém metadados para cada componente guardado no arquivo:
- **Id**: Identificador único.
- **ParentId**: ID do objeto pai (indica a hierarquia e organização).
- **Name**: Nome lido pelo usuário, como `Formulário_Login` ou `Tabela_Clientes`.
- **Type**: Inteiro identificador de tipo (ex: 1 para Tabelas Locais, 5 para Consultas, -32768 para Formulários, etc).
- **LvProp**: Campo OLE, onde as propriedades adicionais (como descrições) são depositadas.

## 3. Integração com OLE/COM

Em vez de armazenar o design dos Formulários, Relatórios e o código VBA como simples texto plano numa coluna de tabela, a arquitetura do Access utiliza um sofisticado container OLE embutido dentro do `.accdb`. Este container assemelha-se a um "mini sistema de arquivos" dentro do banco de dados, governado pela árvore OLE de armazenamento (CFB - Compound File Binary format).

O ponto central nesse mini sistema de arquivos chama-se **`MSysAccessStorage`**. Este stream virtual atua como o diretório-raiz para salvar e gerenciar de forma binária todos os artefatos de UI e código, isolando a engine de tabelas (Jet/ACE) do motor lógico da interface.