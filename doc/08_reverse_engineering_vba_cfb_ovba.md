# Engenharia Reversa do MS-OVBA via OLE no Access (MSysAccessStorage)

## Paradigma do `MSysAccessStorage`
Até o Access 2003, o formato VBA era guardado principalmente em blobos OLE dentro do `MSysObjects`. Porém, a partir do formato ACCDB (ACE), o Access serializa o projeto VBA dentro de uma container interno especial chamado `MSysAccessStorage`.
Cada linha desta tabela oculta cujo nome é uma propriedade chave (ex: `dir`, nomes estanhos em caixa alta) guarda um pedaço do projeto.

## A Estrutura MS-OVBA
O formato VBA nos binários da Microsoft segue a especificação `MS-OVBA`.
Aqui estão as descobertas cruciais do laboratório feitas para a ferramenta `jackcess_dart`:

1. **Streams Comprimidos**: Blobs de VBA no `Lv` (Long Value) de `MSysAccessStorage` começam com o byte `0x01` (Signature Compressão) seguindo a codificação padrão de compressão baseada em *Chunk Tokens* via Lempel-Ziv condensado (CopyToken/LiteralToken).

2. **A Stream \`dir\`**:
   A stream `dir`, quando descomprimida, contém um array sequencial de metadados binários descritos por *Records*.
   As TAGs (IDs) essenciais em short-endian são:
   - `0x0019` - MODULESTREAMNAME: Define o nome do módulo macro (ex: `Form_frmCadastroCPF`).
   - `0x001A` - MODULESTREAMNAMEUNICODE: Uma variação em unicode do mesmo.
   - `0x0031` - MODULEOFFSET: Contém um inteiro de 4 bytes indicando o *offset* sequencial na stream de armazenamento individual do próprio módulo, onde o texto fonte legível do VBA na verdade começa (após pular o cache compilado de P-Code).

3. **Extração do Código-Fonte Nativo**:
   O Access salva o módulo sob um nome hash / base64 (geralmente uma string randômica em caixa alta mapeada na stream `dir`) dentro de `MSysAccessStorage`.
   - Recuperamos a stream específica desse módulo.
   - Usando o `MODULEOFFSET` recuperado do `dir`, avançamos no array de bytes (offset de P-Code).
   - O array após esse offset começa novamente com o bit magico `0x01`.
   - Ao executar a operação de descompressão `MS-OVBA` apenas a partir desse byte, ganhamos o plain-text legível de macros e das regras de validação.

4. **Desacoplamento do COM**:
   Muitas ferramentas apelam para COM/Win32 `IDispatch` e a dependência local dolorosa do motor VBE que detém restrições severas de segurança do Office (como limite de inteiros e bugs com `Runtime Error 6 (Overflow)` ao exportar Queries - vide issue #689 do Addin).
   O `jackcess_dart` agora ignora completamente o IDispatch COM. Ele implementa na raça o descompressor e o parser no arquivo `packages/jackcess_dart/lib/src/ole/vba_project_reader.dart` que navega no record loop direto para buscar esses offsets sem qualquer lock de arquivo `.laccdb`.
