
## O Mapeamento de Memoria de Propriedades OLE
Na função começando ao redor da linha 1405ba3c8 no pseudocódigo, fica cristalino como o Access aloca em memória as referências que ele puxou daquela query gigante na `MSysObjects`:
```c
sub_14083cec0(rsi_2, L"Name", &var_f50, 0x1c, 0, (uint32_t)var_1000);
sub_14083cec0(rsi_2, L"Type", &var_f30, 0x1c, 0, (uint32_t)var_1000);
sub_14083cec0(rsi_2, L"Lv", &var_ed0, 0x1c, 0, (uint32_t)var_1000);
sub_14083cec0(rsi_2, L"LvExtra", &var_ef0, 0x1c, 0, (uint32_t)var_1000);
sub_14083cec0(rsi_2, L"LvModule", &var_f10, 0x1c, 0, (uint32_t)var_1000);
sub_14083cec0(rsi_2, L"Flags", &var_f70, 0x1c, 0, (uint32_t)var_1000);
```

## A Classe CDBIDHelper e Descompactação OLE
Nas rotinas de carregamento de Formulário ao redor da linha `14079f481`, nos deparamos com chamadas que inicializam um helper vital do C++ do MS Access:
```c
struct CDBIDHelper::VTable** rax_15 = sub_1400918c0(&var_620, L"LvExtra");
struct CDBIDHelper::VTable** rax_19 = sub_1400918c0(&var_620, L"Lv");
```
Esse `CDBIDHelper` é a classe de virtual table que parece atuar como ponte intermediária (wrapper da COM OLE e DB Access) usada para mapear o recordset para a camada de extração binária, entregando os fragmentos `LvExtra` à engine superior que vai criar os botões na tela e as TextBox.


## A Criptografia Base do MS Access e Hashes API MS
Ao verificarmos as rotinas `sub_140657000` descobrimos que o MS Access aloca chaves encripadas e checa passwords através do provedor raiz clássico do Windows API Crypt32. A chamada é feita literalmente assim:
```c
CryptAcquireContextW(&phProv, nullptr, L"Microsoft Base Cryptographic Provider v1.0", 1, 0xf0000000);

// Seguida por chamadas para injetar Hashes de bloco
CryptCreateHash(hProv, 0x8004, 0, 0, phHash);
CryptHashData(arg3, &data_140e1a540, dwDataLen, 0);
```
O algorítimo `0x8004` (CALG_SHA) prova que as verificações e criptografias dos bancos com senha injetam sal de forma clássica usando Hashing SHA-1 da CryptoAPI. Essa evidência será crucial se formos precisar portar lib bcrypt para o Dart simulando a engine C.## Análise da Função sub_1400b8d3c

Esta é uma das primeiras funções do MSACCESS.EXE a referenciar especificamente o \MSysAccessStorage_ROOT\ e \MSysAccessStorage_SCRATCH\.

Pelo pseudocódigo, a função compara valores \
cx_1 == *(uint32_t*)((char*)rax + 0x18)\ para ver qual ponteiro de nome de stream associar ao processo atual. A existência do _SCRATCH indica que o Access possui um fluxo auxiliar na infraestrutura OLE para modificações efêmeras ou rascunhos de interface
## Análise da Função sub_1400f548c e Constantes

Nesta rotina localizada por volta do offset 1400f5516, o MS Access realiza a definição constante do nome do fluxo vital OLE. O interessante é a checagem 'rdi == 5 || rdi == 0x8002'.

Quando esse objeto bate uma certas flags (
di provável enumerador de tipo - possivelmente Type=5 que é Report/Consulta em alguns contextos de flag base, ou 1 para Tables), ele inicializa \
14 = u\
MSysAccessStorage\;\. Além disso, percebe-se um erro ou tratamento alternativo jogado num Log de \xceptionObject\ e atado ao \BaselineAXL\ logo após.
## Descobertas de Queries Hardcoded Pelo Motor ACE
Ao observar o offset '1405b7688', o executavel constroi magicamente a query SQL:
\\\sql
SELECT Name, Type, LvModule FROM MSysObjects WHERE Type IN (-32768, -32764, -32761, -32)
\\\`nEsta checagem valida que o mapeamento 'Forms' e 'Modules' tem correspondencia direta com a coluna 'LvModule'.

Outra query extraída do motor (1405ba383):
\\\sql
SELECT Name, Type, Lv, LvExtra, LvModule, Flags FROM MSysObjects WHERE ...
\\\`nDescobrimos mais três colunas que guardam Blobs binários e configurações que são puxados juntos do banco Jet interno: **Lv**, **LvExtra** e **LvModule**.
## O Mapeamento de Memoria de Propriedades OLE
Na função começando ao redor da linha 1405ba3c8 no pseudocódigo, fica cristalino como o Access aloca em memória:
\\\c
sub_14083cec0(rsi_2, u'Name', &var_f50);
sub_14083cec0(rsi_2, u'Type', &var_f30);
sub_14083cec0(rsi_2, u'Lv', &var_ed0);
sub_14083cec0(rsi_2, u'LvExtra', &var_ef0);
sub_14083cec0(rsi_2, u'LvModule', &var_f10);
sub_14083cec0(rsi_2, u'Flags', &var_f70);
\\\`nO Access chama de leitura em sequencia para associar as colunas SQL em variaveis de ponteiros da stack. Isso solidifica que tudo nos forms é lido pelo JET via recordset binario nas varias colunas.

## A Classe CDBIDHelper e Descompactação OLE
Nas rotinas de carregamento de Formulário ao redor da linha '14079f481', nos deparamos com chamadas que inicializam um helper vital do C++ do MS Access:
\\\c
struct CDBIDHelper::VTable** rax_15 = sub_1400918c0(&var_620, u'LvExtra');
struct CDBIDHelper::VTable** rax_19 = sub_1400918c0(&var_620, u'Lv');
\\\`nEsse \CDBIDHelper\ é a classe de virtual table que parece atuar como ponte intermediária (wrapper da COM OLE e DB Access) usada para descompactar o binário de \LvExtra\ ou \Lv\ diretamente numa virtual memory da árvore COM/OLE da engine Access. O método no offset '0x58' da struct lida com passar os bytes base da jet para a stack.


## Constantes OLE e Projetos VBA
Observamos a string interna AcessVBAData mapeada (offset 1400dc328). Isso difere do MS-OVBA estrito (_VBA_PROJECT), validando a hipotese de que as extensoes residem em estruturas exclusivas do ACE.

## Classe e Inicializacao do Jet Engine
Varias passagens mapeiam os wrappers C++ para banco antigo:
CJetTable RTTI Type Descriptor
CJetDB RTTI Type Descriptor
CJetSession RTTI Type Descriptor
IJetESBindContext

Mesmo no ACCDB, padroes JetTable/JetBindContext persistem.
