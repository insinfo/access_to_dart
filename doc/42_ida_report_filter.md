# IDA 9.3: filtros e parâmetros de relatório

Nova inspeção estática do executável MSACCESS.EXE 16.0.17932.20638 pelo IDA
instalado em `/Volumes/ssd_dock/apps/IDA Professional 9.3.app`. Kernel 9.3,
API idapro `(9, 0, 260421)`. SHA-256 verificado antes/depois:
`2368c960d2b70cb51b54c12c27b47f106c55d377ece75ef55c0a988a481ad00f`.
O executável não foi iniciado, a autoanálise foi desabilitada e a base IDA não
foi salva. Apenas o intervalo de função `[0x2f34c0, 0x2f3c5c)` identificado
pela seção `.pdata` foi disassemblado: 498 instruções, com pseudocódigo Hex-Rays.

Na ramificação observada, `Filter` e `OrderBy` são passados separadamente a
uma chamada virtual, com buffers de saída diferentes. Há também caminhos que
copiam strings de estado interno. Isso demonstra que os dois nomes não são
intercambiáveis; não identifica sozinho a gramática do filtro, os tipos dos
objetos nem a precedência entre filtros persistentes e argumentos de macro.
Nenhum ordinal de objeto foi deduzido desses caminhos para implementação.

## Metadados vizinhos do nome ReportName

Todos os endereços são RVAs relativos à base `0x140000000`. O probe lê os
ponteiros e candidatos UTF-16 diretamente via IDAPython:

| Slot | Texto observado |
|---|---|
| `0xba2ea8` | ReportName |
| `0xba2ef8` | View |
| `0xba2f30` | Print;0;Design;1;Print Preview;2;Report;5;Layout;6 |
| `0xba2f48` | FilterName |
| `0xba2f98` | WhereCondition |
| `0xba2fe8` | WindowMode |
| `0xba3020` | Normal;Hidden;Icon;Dialog |
| `0xba3038` | OpenArgs |

Os números de View estão explícitos na string; WindowMode não contém códigos
numéricos explícitos. Esses metadados orientam os casos a confirmar com o
Access, mas não provam o formato serializado da macro. Em particular, Print
não deve ser convertido automaticamente em visualização web e filtros não
podem ser concatenados como SQL PostgreSQL bruto.

Foram também localizados ponteiros para RecordSource, BeforeInsert, DCount e
DMax. A presença desses nomes não comprova o comportamento de suas funções;
a regra de família tem seu oráculo independente no doc40.

## Reprodução e impacto

```sh
IDADIR='/Volumes/ssd_dock/apps/IDA Professional 9.3.app/Contents/MacOS' \
PYTHONPATH='/Volumes/ssd_dock/apps/IDA Professional 9.3.app/Contents/MacOS/idalib/python' \
python3 tools/rea/ida_query_filter_probe.py /copia/MSACCESS.EXE /saida/query-filter.json
```

Resultado privado: `/Volumes/ssd_dock/tmp/access-rea-20261121/ida/query-filter.json`,
SHA-256 `3cea5267824ed07398f8ced3e97b966a603f78fdbb40f9305768535e202535c5`.
Pseudocódigo integral e binário não são versionados. O script é específico do
hash acima; outra versão exige novos intervalos. Candidatos UTF-16 podem ser
sufixos de strings maiores; somente o bloco legível acima foi interpretado.

Esta rodada usou IDAPython/Hex-Rays diretamente. Não é uma nova validação do
bridge REA/IDA, cujo limite continua descrito no doc33. A próxima prova
funcional é executar CSPRONT1 com parâmetro de família e comparar suas 134
colunas com DAO. Renderização dos relatórios, filtros e eventos de seção
continuam pendentes; nenhum relatório foi declarado funcional nesta inspeção.
