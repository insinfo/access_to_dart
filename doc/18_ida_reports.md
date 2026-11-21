# IDA 9.3: seções e agrupamento de reports (2026-11-21)

## Execução e identidade

Usado o IDA instalado em `/Volumes/ssd_dock/apps/IDA Professional 9.3.app/Contents/MacOS`, com cópia privada de MSACCESS.EXE no SSD, fora do Git. Nenhum código do executável foi executado; nenhum arquivo de licença foi lido ou alterado e nenhum aceite de termos foi automatizado.

- Executável: FileVersion `16.0.17932.20638`, 20.736.248 bytes.
- SHA-256: `2368c960d2b70cb51b54c12c27b47f106c55d377ece75ef55c0a988a481ad00f` (igual antes/depois).
- Image base: `0x140000000`.
- `ida_kernwin.get_kernel_version()` retornou **9.3**.
- `idapro.get_library_version()` retornou **(9, 0, 260421)**. As duas respostas foram registradas; não se substituiu uma pela outra nem se deduziu versão somente do nome do app.
- Python 3.15.2 e módulo `idapro` fornecido na instalação local (0.0.7) foram suficientes para a execução direta.

Com `IDAUSR` temporário vazio, abrir o banco terminou com `License not yet accepted, cannot run in batch mode`. Repetiu-se com o perfil já existente, omitindo IDAUSR, sem aceitar termos nem mudar configurações de licença. Esse segundo caminho abriu a cópia com sucesso (`open_database` retornou 0).

`tools/rea/ida_report_probe.py` desabilita autoanálise, cria instruções somente no intervalo RVA `[0x32bbc0,0x32bf4c)`, coleta xrefs e lê ponteiros de strings. Foram produzidas **235 instruções**. O script fecha a base sem salvar, inclusive em erro; o hash do binário é conferido novamente. Não roda uma autoanálise global do Access.

## Evidência observada no IDA

A função contém uma sequência de comparações que seleciona nomes de seção; não foi estabelecido o papel completo do chamador.

| Instrução (RVA) | Observação |
|---|---|
| `0x32bd02` | referência a `Detail` |
| `0x32bd13` | referência a `FormHeader` |
| `0x32bd27` | referência a `FormFooter` |
| `0x32bd38` | referência a `LReportHeader` (grafia observada) |
| `0x32bd49` | referência a `ReportFooter` |
| `0x32bd5a` / `0x32bd6b` | `PageHeaderSection` / `PageFooterSection` |
| `0x32bd7c` | `lea r8, ...GroupHeader`, string UTF-16 RVA `0xc2d1d8` |
| `0x32bd8d` | `lea r8, ...GroupFooter`, string UTF-16 RVA `0xc2d218` |

As duas últimas referências constam também em `idautils.XrefsTo`. As comparações anteriores usam constantes `0xa553003d`/`0xa553003e`, mas **não** se presume que sejam enums públicos de seções, IDs SaveAsText ou valores de GroupHeader. Não foram portadas para o conversor.

Há ainda strings e ponteiros absolutos no arquivo, corroborados pela leitura de qwords da imagem carregada pelo IDA:

| String | RVA da string | RVA do ponteiro | Qword lido no IDA |
|---|---|---|---|
| BreakLevel | `0xc5b490` | `0xe40828` | `0x140c5b490` |
| BreakLevel (segunda ocorrência) | `0xc654a0` | `0xc66010` | `0x140c654a0` |
| SortOrder | `0xc5b1e8` | `0xe408b0` | `0x140c5b1e8` |
| GroupHeader | `0xc5b1d0` | `0xe408b8` | `0x140c5b1d0` |
| GroupOn | `0xc5b1a8` | `0xe408c8` | `0x140c5b1a8` |
| GroupInterval | `0xc5b188` | `0xe408d0` | `0x140c5b188` |

São candidatos de tabela de nomes/propriedades, não uma prova do formato binário completo. Autoanálise desligada significa que xrefs não criados permanecem desconhecidos. A ausência de xrefs em BreakLevel não demonstra ausência de uso. O scanner não encontrou a string literal terminada `SaveAsText` em ASCII/UTF-16LE neste EXE; isso não exclui implementação em outras DLLs, type libraries ou chamadas indiretas.

## Relação com a correção do parser

O export real `fixtures/teste1/teste1.accdb.src/reports/ListaDeContatos.bas` contém três `Begin BreakLevel`, na ordem: expressão `=Left([Sobrenome],1)` (com `GroupHeader=NotDefault`), campo `Sobrenome` e campo `Nome`. A versão anterior do parser preservava as seções, mas perdia esses blocos de agrupamento.

A correção de `groupLevels` deve derivar do export e seus testes, preservando ordem e valores originais. A análise IDA corrobora nomes distintos para agrupamento e seções; não determina semântica de `NotDefault`, direções de sort, enums, agregação, layout ou paginação. Não foi implementado renderer de relatórios nesta investigação.

## Integração REA: configurada, mas operação não concluída

Foi lido `dist/ida/IdaConfiguration.js` do REA **6.5.0 instalado**. Ele aceita registro MCP headless com command/args/env/workspaceRoot; seu `IdaSessionClient` abre uma cópia própria com `run_auto_analysis:true`. Isso difere de capacidades novas presentes na documentação upstream atual: não se assumiu suporte a todos os perfis novos.

Consultados [guia upstream do REA](https://github.com/morluto/rea/blob/main/docs/providers/ida-provider.md) e [ida-pro-mcp fixado em c133c3853faa111a9b00ee615c013b720d0c4acd](https://github.com/mrexodia/ida-pro-mcp/tree/c133c3853faa111a9b00ee615c013b720d0c4acd). O bridge foi instalado em venv temporário (ida-pro-mcp 2.0.0, idapro 0.0.12, tomli-w 1.2.0), sem instalar plugin na aplicação nem atualizar REA.

Registro local: modo headless, `idalib-mcp --stdio --max-workers 1`, workspace isolado, `IDA_MCP_OPEN_TIMEOUT=75`, `IDA_MCP_WORKER_CALL_TIMEOUT=90`, REA timeout 110000 ms. Foram tentados perfis temporário e existente. A operação solicitada foi:

```sh
REA_IDA_MCP_CONFIG="$out/rea-ida.json" rea decompile "$binary" 0x14032bbc0 --provider ida --format json
```

As duas tentativas terminaram com `code=unreadable_output`, operação `procedure_pseudo_code`, motivo:

```text
IDA MCP returned malformed or unsupported producer data: success: Invalid input: expected true; session: Invalid input: expected object, received undefined
```

O caminho de perfil existente iniciou o worker e consumiu CPU até o limite de abertura configurado; não houve pseudocódigo válido retornado pelo REA. Não foi obtido diagnóstico interno mais específico do upstream, portanto não se afirma que a mensagem normalizada comprove uma causa única. Nenhum resultado direto do IDA é apresentado como sucesso REA. Não se ampliaram limites nem se alterou o bridge para esconder a falha. Os processos próprios REA/supervisor/worker encerraram; não foram interrompidos processos do usuário.

## Reprodução delimitada

Usar uma cópia privada do executável, nunca o original nem uma base aberta na GUI. O script recusa hashes diferentes; para outro build, primeiro derive novos intervalos. O perfil IDA precisa já estar configurado pelo usuário.

```sh
export IDADIR='/Volumes/ssd_dock/apps/IDA Professional 9.3.app/Contents/MacOS'
export PYTHONPATH="$IDADIR/idalib/python"
python3 tools/rea/ida_report_probe.py "$copy" "$out/ida-report.json"
```

Para recriar somente o registro da tentativa REA, há `tools/rea/ida_headless_registration.example.json`. Substituir caminhos do venv, workspace e IDADIR. Instalar o bridge fixado em venv isolado, sem executar seu instalador de plugins. O registro documenta a tentativa, **não uma integração validada**. Saídas, bancos IDA, binários e venv permanecem fora do Git.
