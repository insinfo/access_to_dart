# 55 — Renderer compilado somente leitura para `prontuario16`

## Escopo e critérios de elegibilidade

`lib/src/project_generator/report_renderer_generator.dart` (`compileEligibleReports`) compila exclusivamente relatórios cuja apresentação exportada e fonte de dados atendem integralmente ao contrato estrito, mantendo os demais relatórios como `inventory-only` em `access-reports.json` com diagnóstico explícito:

- export textual verificado (`sourceSha256` SHA-256 de 64 hexadecimais) e `properties.Width > 0`;
- `printSettings` válido (`Margins` e `Printer` com orientação/papel suportados);
- ausência de módulo VBA (`hasModule`, `rawVbaCode`, `HasModule`), eventos (`On[A-Z]*`, `events`), macros (`macros`, `macroDefinitions`) e agrupamentos (`groupLevels`);
- seções restritas a `PageHeader`, `Section` e `PageFooter`, exigindo `PageHeader`/`PageFooter` com altura zero e sem controles e `Section` (`Detalhe`) com altura positiva;
- `RecordSource` vinculado a uma consulta já validada e compilada em `query_backend_generator.dart` (nesta entrega, `CSPRONT1` -> rota `cspront1`);
- controles restritos a `Label`, `TextBox`, `Rectangle` e `Image` com geometria inteira explícita (`Left`, `Top`, `Width`, `Height`), `TextBox` ligado diretamente a coluna de saída da consulta compilada (formato vazio ou `>`) e `Image` com recurso compartilhado `PictureType=2` (`status: resolved`) verificado em disco pelo SHA-256 antes de embutir o binário.

Relatórios com módulo VBA, eventos, agrupamentos, imagem ausente ou `RecordSource` sem contrato compilado são recusados para `inventory-only` com motivo explícito em `report_diagnostics`. Projetos sem nenhum relatório elegível mantêm `renderer_generated: false` e `status: inventory_only` em `access-reports.json`.

## Resolução de apresentação e oráculo nativo

`compileEligibleReports` resolve propriedades efetivas combinando as propriedades individuais de cada controle com `controlDefaults` do relatório e semântica Access de tema/borda/cores (`BGR -> #RRGGBB`, `BackStyle`, `BorderStyle`/`OldBorderStyle`, `BorderColor`/`BorderThemeColorIndex`, `FontName`, `FontSize`, `FontWeight`, `TextAlign`, `SizeMode`).

Em `test/access_report16_renderer_test.dart`:

- os 38 controles de `prontuario16-REGISTRO-SINTETICO-FR-VERSO` (`34 Label`, `2 TextBox`, `1 Image` `Imagem96`, `1 Rectangle` `Caixa65`) foram conferidos integralmente contra o oráculo nativo `build/codex-report16-interactive/presentation.json` (`Left`, `Top`, `Width`, `Height`, `ControlType`, `BackStyle`, `BackColor`, `BorderStyle`, `BorderColor`, `ForeColor`, `FontName`, `FontSize`, `FontWeight`, `TextAlign`);
- a imagem compartilhada `images/logo-SUAS-ICON.png` teve seu SHA-256 conferido antes de ser incorporada;
- quatro cenários inválidos (`ReportComModule`, `ReportComEvento`, `ReportComGrupo`, `ReportQueryDesconhecida`) e ausência do arquivo `logo-SUAS-ICON.png` foram recusados como `inventory-only`.

## Backend gerado (`/api/v1/access-reports`)

- `query_backend_generator.dart` expõe `_compileQuerySpecifications` e `AccessQueryController.executeDescriptor` para reutilizar exatamente a mesma validação estrita de parâmetros HTTP e bindings da consulta compilada.
- `_generateReportBackend` gera `lib/src/shared/access_reports.dart` (`AccessReportController`) e `lib/src/shared/access_reports.json`, montados em `api_routes.dart` e `public_api_routes.dart`:
  - `GET /api/v1/access-reports`: lista descritores compilados (`readOnly: true`);
  - `GET /api/v1/access-reports/<key>?parameters=...`: executa a consulta vinculada, aplica `Format=">"` (maiúsculas em `Nome`) e retorna páginas e valores somente leitura;
  - `GET /api/v1/access-reports/<key>/assets/<asset>`: entrega o asset verificado em tempo de geração (`image/png`).

## Frontend NgDart (`<access-report-viewer>`)

- `frontend_shared_generator.dart`, `frontend_shell_generator.dart`, `frontend_dart_emitters.dart`, `frontend_template_emitters.dart` e `app_component.html.mustache` geram `AccessReportViewer` (`access_report_viewer.{dart,html,scss}`) e a rota `#/access-report/<key>` / aba `Relatórios` quando há relatórios compilados.
- Todas as posições, dimensões em twips convertidos para CSS (`twips / 15.0` px em 96 dpi), margens A4, cores, bordas e tipografia são emitidas como classes SCSS estáticas em `access_report_viewer.scss` (`.access-report-paper-<key>`, `.access-report-sheet-<key>`, `.access-report-ctrl-<key>-<i>`), sem `[style]` e usando `[attr.data-access-*]` conforme `AGENTS.md`.
- No template HTML, sequências de dois ou mais espaços em `Label` são preservadas com `\u00A0` para manter o alinhamento horizontal de opções (`|__| Sim ... |__| Parcialmente ... |__| Não`).

## Validação ponta a ponta (PostgreSQL, Release NgDart e Chrome/Playwright)

`test/generation/long/report16_postgres_browser_test.dart` e `tools/verify_report16_browser.mjs` validaram o pipeline completo em banco PostgreSQL temporário (`TEMPLATE template0`) com esquema `TbUnidade`/`CadResidencia`/`TbPessoa`, consulta `CSPRONT1` e dados exclusivamente sintéticos:

- `dart analyze lib` aprovado sem erros tanto no backend quanto no frontend gerado (com schema sintético sem `maxLength` fixo, espelhando as tabelas vinculadas do `SIGAsul`; cabe notar que `incluir_page.html.mustache` mantém `maxlength="<%maxLength%>"` pré-existente exigido por `generate_emits_scaffold_test.dart`);
- compilação AOT `server.exe` e build de release frontend `dart run tool/build_release.dart` aprovados;
- HTTP na mesma origem: `/api/v1/access-reports` (`200`), `/api/v1/access-reports/prontuario_16_registro_sintetico_fr_verso?parameters={"p0":"4242"}` (`rowCount=1`, `CadResidencia.CodFam="4242"`, `Nome="FAMILIA SINTETICA - TESTE DE FIDELIDADE"`, `38` controles), filtro `p0="4243"` desligado retornando `rowCount=0`, `400` para parâmetros ausentes e `/assets/logo-SUAS-ICON.png` com SHA-256 idêntico ao fixture;
- Playwright em Chrome headless via túnel SSH: `38` controles renderizados com geometria não nula, `Caixa65` com borda `solid`, `Imagem96` carregada (`complete=true`, `naturalWidth=380`, `naturalHeight=429`), espaçamento preservado em `Rótulo103`, `0` requisições de escrita e `0` erros de página;
- inspeção visual de `browser-report16.png` confirmou o layout da página, cores, bordas, logo e caixas; pequenas quebras de linha em três rótulos de uma linha ocorrem apenas quando o sistema operacional do navegador (macOS) não possui a fonte `Calibri` e recorre ao fallback `Arial`, enquanto o CSS emitido preserva `'Calibri'` prioritariamente para ambientes Windows.

Limitações mantidas explicitamente: esta entrega valida um único relatório sem agrupamento, sem sub-relatórios, sem cabeçalhos/rodapés paginados não nulos, sem expressões VBA/calculadas e sem exportação PDF nativa no servidor; os outros 164 relatórios do catálogo `SIGAsul` permanecem como inventário.
