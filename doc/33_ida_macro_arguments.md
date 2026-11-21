# IDA 9.3: argumentos de macros e navegação pendente

## Evidência reproduzida em 2026-11-21

Foi usado o IDA instalado em `/Volumes/ssd_dock/apps/IDA Professional 9.3.app`, pelo `idalib/python` desse aplicativo, no perfil já configurado. Kernel observado: **9.3**; versão da API `idapro`: **(9, 0, 260421)**. São identificadores diferentes. Nenhuma licença ou configuração do usuário foi alterada.

Alvo: cópia de `MSACCESS.EXE` 16.0.17932.20638, SHA-256 `2368c960d2b70cb51b54c12c27b47f106c55d377ece75ef55c0a988a481ad00f`, base `0x140000000`. O probe confere esse hash antes e depois, não executa Access e não salva a base IDA. Autoanálise geral desativada; leitura de quatro intervalos pequenos de metadados e uma função delimitada por `.pdata`.

Execução (usar cópia do executável, não arquivo original do Office):

```sh
IDADIR='/Volumes/ssd_dock/apps/IDA Professional 9.3.app/Contents/MacOS' \
PYTHONPATH='/Volumes/ssd_dock/apps/IDA Professional 9.3.app/Contents/MacOS/idalib/python' \
python3 tools/rea/ida_behavior_probe.py /copia/MSACCESS.EXE /saida/ida-behavior.json
python3 tools/rea/summarize_record_navigation.py build/codex-sigasul-goal/analysis-corrected/analysis.json
```

O probe é específico deste hash, não um detector universal de versões Office. Texto interpretado a partir de ponteiros é candidato UTF-16: ponteiros para código também podem produzir caracteres sem significado. As linhas abaixo foram verificadas como strings legíveis; os qwords vizinhos não recebem semântica inferida.

## Resultados observados

Todos os endereços abaixo são RVAs, relativos à base.

| Metadado | Slot do ponteiro | Conteúdo observado |
|---|---:|---|
| ObjectType | `0xba1dc8` | `ObjectType` |
| Opções de tipo | `0xba1e00` | `;-1;Table;0;Query;1;Form;2;Server View;7;Stored Procedure;9;Function;10` |
| ObjectName | `0xba1e18` | `ObjectName` |
| Record | `0xba1e68` | `Record` |
| Opções de registro | `0xba1ea0` | `Previous;Next;First;Last;Go To;New` |
| Offset | `0xba1eb8` | `Offset` |
| FormName | `0xba21d8` | `FormName` |
| View | `0xba2228` | `View` |
| FilterName | `0xba2278` | `FilterName` |
| WhereCondition | `0xba22c8` | `WhereCondition` |
| DataMode | `0xba2318` | `DataMode` |
| Opções de dados | `0xba2350` | `Add;Edit;Read Only` |
| WindowMode | `0xba2368` | `WindowMode` |
| Opções de janela | `0xba23a0` | `Normal;Hidden;Icon;Dialog` |
| OpenArgs | `0xba23b8` | `OpenArgs` |

Os quatro primeiros parâmetros aparecem em slots com distância `0x50`; o bloco de abertura inclui sete parâmetros. Isso corrobora a distinção entre alvo, filtro, modo e argumentos extras. Não prova que a estrutura interna seja o formato serializado `.src`, nem que cada opção sem número explícito tenha ordinal igual à posição.

Foram criadas **206 instruções** e obtido pseudocódigo Hex-Rays da função `[0x9a7e3c, 0x9a8193)`. As referências à string `WhereCondition` (`0xbffbb8`) estão em `0x9a8003` e `0x9a804c`. O pseudocódigo confirma comparação desse nome em ramificações diferentes e retorno de valores internos. Não identifica sozinho o significado dos retornos, o compilador de filtros ou o executor de `OpenForm`; não implementar tradução SQL a partir dessa inferência.

## Lacuna concreta no SIGAsul

No `source_overlay.forms` da análise corrigida: **97 formulários e 149 ações GoToRecord**. Todas têm três argumentos, com primeiro token `-1`, segundo vazio e terceiro distribuído assim:

| Token Record preservado | Ocorrências |
|---|---:|
| `0` | 30 |
| `1` | 30 |
| `2` | 30 |
| `3` | 30 |
| `5` | 29 |

Não há quarto argumento nessas ocorrências; ausência não deve virar offset arbitrário. O inventário é contado uma vez no overlay, sem duplicar `canonical_analysis` ou formas principais. O script só imprime tokens numéricos reconhecidos e contagens, ocultando nomes e expressões.

A navegação `OpenForm` implementada abre módulo; não implementa cursor/registro atual dessas 149 ações. Próximo incremento funcional precisa confirmar os códigos por oráculo Access e testar primeiro/último/próximo/anterior/inclusão, extremos, registro alterado não salvo e alvo ativo. **Nenhuma dessas ações passou a ser executada neste lote.**

O consumidor atual de `OpenForm` aceita somente seis argumentos e modos/filtros específicos. O `OpenArgs` observado reforça manter rejeição explícita dos demais formatos; não truncar argumentos adicionais. Relatórios continuam sendo lacuna separada de renderização, não resolvida por conhecer parâmetros.

## REA executado e limite do bridge

Foi executado `rea inspect-with-objdump /copia/MSACCESS.EXE file_headers`, operação limitada a cabeçalhos. Resultado: `exit_code=0`, `completion_status=complete`, `output_truncated=false`, `artifact_changed=false`, saída do provider `coff-x86-64` / `x86_64`. Evidence ID: `ev_f7993747bdd174e99bb39fe15dafdc9ecf5524eec3a93854ddd281bb4a3e2f05`. O envelope deixa versão do provider/formato normalizado desconhecidos; não preencher por suposição. A saída default é texto estruturado, não JSON apesar do nome usado no arquivo local.

O bridge de decompilação REA/ida-pro-mcp documentado em [18](18_ida_reports.md) continua sem resultado válido: timeout/`unreadable_output`, `success expected true`, `session expected object received undefined`. Não foi repetido sem mudança de hipótese. **O pseudocódigo desta rodada veio diretamente de IDAPython/Hex-Rays, não do bridge REA.** O comando REA de cabeçalhos não prova semântica de macros.

Artefatos locais: `/Volumes/ssd_dock/tmp/access-rea-20261121/behavior/` (`ida-behavior.json`, `ida-behavior.log`, `navigation-summary.json`, `rea-headers.json`, `rea-headers.log`). SHA-256 do resultado IDA: `e63460987bf167a5e51604c367882f6ab753277927af548bf1492a78c972a2f7`; análise contada: `28b1de45eb738614413e03cf464ae16d247a85ec394eb972b83f56c2e9641570`. Binário e pseudocódigo integral não adicionados ao Git. Validação: probe real concluído, hash inalterado, agregação das 149 ações, `py_compile` dos dois scripts. Nenhum template alterado; build frontend não é parte desta investigação.
