# Roteiro de Conversão: MS Access (`.accdb`) para Aplicação Modern Web Dart 🚀

Premissa obrigatória: no estado final a ferramenta não pode depender de nada em `C:\MyDartProjects\access_to_dart\referencias`. Tudo o que for necessário para Dart precisa ser portado ou internalizado no próprio repositório. O alvo técnico é fazer engenharia reversa do `.accdb` para não depender de Microsoft Access instalado no computador.

Este documento descreve o plano estratégico e arquitetural para portar as bibliotecas `jackcess` e `Access-Tool` para a linguagem Dart, criando em seguida uma poderosa ferramenta de CLI/Geradora de Código.

O objetivo da ferramenta é ler localmente arquivos `.accdb` (banco de dados e estruturas visuais do Microsoft Access) e gerar de maneira automatizada um projeto completo Dart *Full-Stack* moderno: Backend (`shelf` + `eloquent` + PostgreSQL) e Frontend (`ngdart` + Bootstrap CSS), juntamente com um pacote `core` de models OOP compartilhado.

---

## 1. Visão Geral da Solução (O que será construído)

Ao apontar a nova ferramenta para o arquivo `teste1.accdb`, ela deverá produzir uma estrutura tripla:

```text
/teste1_app_generated
  |-- /core       (Modelos de dados, serialização, DTOs compartilhados)
  |-- /backend    (API RESTful via `shelf` 1.4.2, conectando ao PGSQL via `eloquent` 3.4.3 e `postgres`)
  |-- /frontend   (SPA em AngularDart `ngdart` 8.0.0-dev.4, estilizada com Bootstrap CSS)
```

Além disso, a ferramenta executará uma rotina de conexão direta com um banco em PostgreSQL vazio, refletindo a arquitetura do Access, e populando os registros automaticamente (Migração dos Dados).

---

## 2. Passo a Passo Técnico (O Roteiro)

### Fase 1: Portando o Motor Base (O "Dartcess")
A essência do Java `jackcess-master` deve ser adaptada para Dart. Devido ao volume do repositório, não converteremos a interface gráfica do Access-Tool (Java Swing), mas focaremos no Core (parser binário `Jet` e `ACE`).

1. **Mapeamento do Formato OLE/ACE**:
   - Portar classes básicas para manipulação binária. Substituir o uso de `ByteBuffer` e `FileChannel` do Java pelo `RandomAccessFile` de disco (e `ByteData`) em `dart:io` e `dart:typed_data`.
2. **Leitura de Páginas Binárias (Pages)**:
   - Traduzir a inteligência de paginação (tamanho de 4KB por página).
   - Implementar suporte à decodificação padrão (Jet 4 / Access 2000+) e propriedades de tabelas.
3. **Extração da Estrutura (Schema)**:
   - Ler tabelas de sistema do Access (ex: `MSysObjects`, `MSysQueries`).
   - Mapear Tabelas, Colunas, Tipos de Dados (Text, Memo, Long Integer, Boolean, Ole/Attachments) relativas.
   - Extrair Relacionamentos (Chaves Estrangeiras, 1-N).
4. **Leitura dos Dados (Rows)**:
   - Decodificar e descompactar os dados de linha que persistem em "data pages". Extratores diretos.

### Fase 2: Construção da Ferramenta Analisadora / Geradora de Metadados
Após obter acesso ao DOM do esquema `.accdb`, construímos o motor de scaffolding:

1. **Parser de Formulários (`teste1.accdb` "Detalhes do Contato")**:
   - Analisar o layout ou simplesmente gerar um mapeamento Master-Detail moderno. Se as propriedades UI (controles, labels, textboxes) não puderem ser totalmente lidas por estarem em OLE Blob, a ferramenta irá *deduzir formulários CRUD elegantes* a partir das tabelas relacionais extraídas (Ex: Tabela Pai de "Contatos", e Tabela Filha em grid).
2. **Abstract Syntax Tree do Schema**:
   - Representação interna da conversão:
     - `Access Object Table` ➡️ `Postgres Table` + `Dart Dart Model` + `REST Controller`.
     - `Access Object Relationship` ➡️ `Eloquent Join / Constraints`.

### Fase 3: Scaffolding (A Geração do Projeto Destino)

A ferramenta usará sub-rotinas de geradores de templates String/Mustache.

#### 3.1 Geração de `Core`
- Geração de classes limpas.
  ```dart
  class Contato {
    int id; // Mapeado de AutoNúmero (Access)
    String nome;
    String sobrenome;
    String empresa;
    // ...
  }
  ```

#### 3.2 Geração de `Backend` (Shelf API + Eloquent)
- O Gerador emite um `pubspec.yaml` local.
- Criação de um `server.dart` contendo gerenciador central:
  ```dart
  var manager = Manager();
  manager.addConnection({...}); // Gerado baseado na config local enviada no CLI
  ```
- Roteamento Shelf (`shelf_router`): Geração de endpoints `/api/contatos`.
- **Controllers**: Implementação automática dos métodos CRUD, substituindo Queries Access para Eloquent Query Builder:
  ```dart
  final db = await manager.connection();
  var map = await db.table('contatos').get();
  ```

#### 3.3 Geração de `Frontend` (Angular Dart + Bootstrap)
- Instalação no `pubspec.yaml`: `ngcompiler: ^8.0.0-dev.4`, `ngdart: ^8.0.0-dev.4`.
- **Design Web System**: Aplicação do CSS import do `Bootstrap` (ex: `https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css`).
- **Páginas**:
  - `ListaDeContatosComponent`: Template de "DataGrid" Bootstrap, chamando `http.get` para `/api/contatos`.
  - `DetalhesDoContatoComponent`: Tela rica (exibindo foto e abas), recriando visualmente a interface Access. Input fields mapeados perfeitamente pelo NgModel.

### Fase 4: Tool de Migração de Dados Automática
O utilitário CLI interliga os pontos finais da aplicação lendo em loop do arquivo `.accdb`:
1. Gera chaves/instruções DDL (ou executa o script do Eloquent `execute(CREATE TABLE...)`) localmente na instância ativa do Postgres (usando as configs fornecidas via Navicat/local pelo dev).
2. Executa a extração, transformando Access Rows em `Map<String, dynamic>`.
3. Chama a função `await db.table("nome_da_tabela").insert(mapDeLinhas)`.

---

## 3. Marcos de Validação do Caminho Feliz

Para considerarmos a missão completa:
- [ ] Port inicial em Dart consegue ler os contatos no Java Jackcess de `teste1.accdb` em um console.
- [ ] Consegue se conectar ao banco no schema `postgres` da imagem via código Dart (`Navicat 5432 / localhost / postgres / postgres / s1sadm1n`).
- [ ] Execução da CLI resulta na raiz do disco gerando a pasta de workspaces `backend`, `frontend`, `core`.
- [ ] `cd backend && dart pub get && dart run bin/server.dart` liga o backend na porta sem erros.
- [ ] `cd frontend && dart pub get && webdev serve` abre a aplicação angular refletindo as abas contidas no layout da UI do Access original.

## Próximos Passos
1. Investigar a pasta `C:\MyDartProjects\access_to_dart\referencias\` na máquina para importar o motor base do `jackcess-master` para transpilação Dart lógica.
2. Iniciar criação do pacote subjacente portado `jackcess_dart`.
