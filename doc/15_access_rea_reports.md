# Access: evidência estática e preservação de reports (2026-11-21)

## Executável e método

Análise somente leitura de `C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE`, copiado para diretório temporário fora do repositório. Nenhuma execução do binário, mudança da instalação ou envio externo.

- FileVersion: `16.0.17932.20638`; tamanho: 20.736.248 bytes.
- SHA-256: `2368c960d2b70cb51b54c12c27b47f106c55d377ece75ef55c0a988a481ad00f`.
- PE32+, AMD64; image base `0x140000000`.
- REA 6.5.0, Ghidra 12.1.4, Java 21; ferramentas de `/Volumes/ssd_dock/tools/rea/env.zsh`.
- `rea inspect-with-objdump ... section_headers --format json`: exit 0; hash antes/depois igual; `artifact_changed=false`; evidence id `ev_5f910d9f6359855c8cb0c7aa0d512c51333234d9bbd8943a6c19d8f940375fba`.
- Import Ghidra com `-noanalysis`, disassembly e decompilação apenas de três intervalos delimitados por `.pdata`; dois CPUs, timeout de decompilação de 20 segundos por função.

RVA é relativo à image base; não é offset do arquivo. Os endereços de pseudo-C em documentos anteriores não identificam automaticamente as funções desta versão: a inspeção do antigo endereço `0x140085520` encontrou código diferente. Nunca reutilizar endereços sem conferir hash e instruções.

## Observações verificadas

| Evidência | Localização nesta versão |
|---|---|
| String UTF-16 `Forms` | RVA `0xc78228`, offset `0xc77428` |
| String UTF-16 `Reports` | RVA `0xc781c0`, offset `0xc773c0` |
| String UTF-16 `Modules` | RVA `0xc781d0`, offset `0xc773d0` |
| Rotina escolhe nomes por enum interno: 0 Forms, 1 Reports, 2 Modules, 3 Scripts | RVA `[0x442cc,0x44352)` |
| Rotina compara nomes: Forms retorna `0x8000`, Reports `0x8004`, Scripts `0x8002`, Modules `0x8007` | RVA `[0x8ec2e8,0x8ec4fe)`; instruções de retorno Forms/Reports em `0x8ec34d`/`0x8ec36e` |
| Chamadas com pares tipo/nome para a mesma rotina | RVA `[0x12ae44,0x12af47)` |

No último call site, `1/6/4/5` usam o ponteiro `Tables`, enquanto `0x8000/0x8004/0x8002/0x8007` usam Forms/Reports/Scripts/Modules. Isso **não** é um mapeamento universal de MSysObjects: o tipo 5 é usado por queries no catálogo, e o contexto dessas chamadas não foi estabelecido. Não confundir enum interno, tipo de objeto de catálogo e categoria de navegação/exportação.

Também foi observada, em UTF-16 no offset `0xc5b7d0`, a consulta interna:

```sql
SELECT Name, Type, Lv, LvExtra, LvModule, Flags FROM MSysObjects WHERE Type IN (-32768, -32764, -32766, -32761)
```

Isso corrobora o tratamento separado das famílias de objetos; não decodifica `Lv`/`LvExtra`, layouts, agrupamentos ou comportamento de impressão. A decompilação é uma interpretação das instruções sem símbolos completos, não código-fonte oficial.

## Bug reproduzido e correção

O leitor `.accdb.src` carregava tables/queries/forms, mas ignorava `reports/*.bas`. O catálogo binário continha quatro reports de `teste1`, porém o overlay não entregava caption, RecordSource, seções ou controles. Os dois testes novos falharam antes da correção: caption do report e altura da seção eram null. O achado de código/fixture demonstra o bug; a evidência REA acima apenas corrobora a separação das famílias.

`AccessSrcProject.reports` agora preserva nome, caption, RecordSource, macros, controles conhecidos e seções na ordem do SaveAsText. Seções incluem FormHeader/FormFooter, ReportHeader/ReportFooter, PageHeader/PageFooter, BreakHeader/BreakFooter e Section. `height` mantém o valor original do Access em **twips**, não pixels.

O overlay agrega reports mesmo quando não há tabelas. Nomes são comparados sem diferença de caixa; IDs, metadados binários, controles e seções não presentes no export são preservados. Propriedades ausentes/null no texto não apagam valores binários; propriedades explícitas do texto prevalecem. A ordem do export vem primeiro, seguida dos elementos apenas binários.

Em `ListaDeContatos`, o teste preserva seis seções ordenadas, `Caption=Contact List`, `RecordSource=Contatos` e o controle `txtEmailAddress` ligado a `EndereçoDeEmail`. Controles de layout vazios `zecEmptyCell*` continuam filtrados conforme a política de forms. O teste executa CLI `analyze --src` e `generate`, verificando também que o inventário gerado contém o report.

**Limites:** não foi criado renderer de reports. Inventário no `conversion-report.md` não comprova fidelidade de impressão. Imagens, linhas, BoundObjectFrame, propriedades completas de layout, BreakLevel/ordenação/agrupamento e paginação ainda não têm representação completa. O parser usa os tipos de controle já suportados em forms. Nenhuma descoberta estática justifica inventar essas semânticas.

## Reprodução

Os scripts `tools/rea/scan_access_catalog.py` e `tools/rea/AccessCatalogProbe.java` não incluem binários nem dumps. O primeiro lê PE x64 e produz candidatos de referências RIP-relative LEA a strings UTF-16; não é disassembler completo. Confirme os candidatos no Ghidra/objdump. O segundo recusa hashes diferentes e limita o trabalho aos intervalos acima.

No Mac, com a cópia autorizada do executável em `$binary` e um diretório externo `$out`:

```sh
source /Volumes/ssd_dock/tools/rea/env.zsh
python3 tools/rea/scan_access_catalog.py "$binary" > "$out/catalog-candidates.json"
rea inspect-with-objdump "$binary" section_headers --format json > "$out/sections.json"
"$GHIDRA_INSTALL_DIR/support/analyzeHeadless" "$out" AccessCatalog \
  -import "$binary" -noanalysis -scriptPath "$PWD/tools/rea" \
  -postScript AccessCatalogProbe.java "$out/catalog.txt" -max-cpu 2
```

Usar diretório novo de projeto Ghidra ou `-process MSACCESS.EXE` no lugar de `-import` para repetir a análise. Não versionar projeto Ghidra, executável ou saídas brutas. O scanner foi executado sobre o hash acima, e o probe foi compilado/executado com sucesso no Ghidra, incluindo seu bloqueio por hash.

Validação no Windows:

```text
dart test test/access_src_reports_test.dart test/access_src_continuation_test.dart test/access_src_scaffold_test.dart test/analysis_overlay_merger_test.dart
7 testes passaram.
dart analyze lib/src/access_src_model.dart lib/src/access_src_reader.dart lib/src/analysis_overlay_merger.dart test/access_src_reports_test.dart
No issues found!
```

O merger também fixa explicitamente `MigrationNotNullMode.strict`, coordenado com a correção equivalente no analisador; essa escolha preserva o contrato de DDL existente e não depende da análise do executável.
