# 57 — Renderer genérico: temas `.thmx`, múltiplas seções, `Line`, `ComboBox`, macros cosméticas e relatórios sem vínculo (`19` relatórios / `2.255` controles)

## Escopo e diagnósticos

- **15/15 relatórios `CSPRONT1` compilados** (`1.965` controles no total):
  `prontuario1` (159), `prontuario3-composicao-texto` (48),
  `prontuario4-Condi-Habit` (169), `prontuario5-Condi-TRAB-RENDA-TEXTO` (48),
  `prontuario6-Condi-SAUDE-TEXTO` (48), `prontuario7-Beneficios-FRENTE-VERSO` (225),
  `prontuario8-Condi-Educ-TEXTO` (48), `prontuario9-ConvFamilComun-frente-verso` (142),
  `prontuario10-serv-progr-projetos-fr-verso` (221),
  `prontuario11-violenc-violacoes-fr-verso` (252),
  `prontuario12-mse-frente-verso` (267), `prontuario13-planej-evolu-frente-verso` (125),
  `prontuario14-planej-evolu-frente-verso-2` (87),
  `prontuario15-planej-evol-IMPRIMIR-FR-VERSO` (88) e
  `prontuario16-REGISTRO-SINTETICO-FR-VERSO` (38).
- **4 relatórios impressos sem `RecordSource`, com múltiplas seções, `Line` ou macro cosmética** (`290` controles):
  `PROSPECTO DE BUSCA ATIVA IMPRIMIR` (`115` controles: `PageHeader`, `Detalhe` com `7` `Line`, `PageFooter`),
  `PLANO SOCIO FAMILIAR` (`71` controles: `Section` + `PageFooter`, `OnOpenEmMacro: Maximize`),
  `PLANO SOCIO FAMILIAR MEDIAÇÃO` (`49` controles: `FormHeader` + `Detalhe`, `OnOpenEmMacro: Maximize`) e
  `PLANO SOCIO FAMILIAR-CONTINUAÇÃO` (`55` controles: `FormHeader` + `Detalhe`, `OnOpenEmMacro: Maximize`).
- **Total compilado na geração integral (`SIGAsul` — `45` tabelas vinculadas, `54` tabelas de migração, `165` relatórios)**: **19 relatórios compilados (`2.255` controles)** e `146` mantidos em `inventory-only` (`85` por `record-source-not-compiled-query`, `59` por `unsupported-group-levels`, `1` por `missing-source-export-sha256` e `1` por `missing-record-source`).
- Controles `ComboBox` com lookup multicoluna ou ocultação de chave (`ColumnCount != 1`, `BoundColumn != 1` ou largura inicial `<= 0`) continuam recusados com `unsupported-combobox-lookup:<controle>`. Relatórios sem `RecordSource` que possuam qualquer controle ligado são recusados com `missing-record-source`.

## Regras acrescentadas ao compilador e fidelidade ao oráculo nativo

Em `lib/src/project_generator/report_renderer_generator.dart`:

1. **Resolvedor genérico de cores de tema Office `.thmx` (`_OfficeThemePalette`)**:
   - Carrega `<sourceRoot>/dbs-properties.json` (`Theme Resource Name`) e lê o arquivo `.thmx` ativo em `<sourceRoot>/themes/`, extraindo `theme/theme/theme1.xml` (`<a:clrScheme>`) via diretório central ZIP + `ZLibCodec(raw: true)` + `XmlDocument`.
   - Resolve `ForeColor`, `BackColor` e `BorderColor` em um caminho único (`_resolveControlThemeColor`) combinando `*ThemeColorIndex`, `*Tint` e `*Shade` no espaço HLS do Office, eliminando completamente constantes mágicas de cor em `lib/`.
2. **Múltiplas seções e posicionamento vertical (`FormHeader`/`ReportHeader`, `PageHeader`, `Section`, `FormFooter`/`ReportFooter`, `PageFooter`)**:
   - Ordena seções válidas na ordem de impressão, preserva `section` (`0..4`) e `top` relativo à seção (idênticos ao COM do Access) e calcula `sheetTop` acumulado e `sheetHeightTwips` para a folha CSS.
3. **Controle `Line` (`ControlType = 102`)**:
   - Resolve dimensões omitidas via `LayoutCached*`, permite altura ou largura `0` em linhas horizontais/verticais (exigindo ao menos uma dimensão `> 0`) e gera bordas CSS (`border-top` / `border-left`) com `BorderColor` resolvido pelo tema.
4. **Macro cosmética de janela e relatórios sem vínculo**:
   - Permite `OnOpenEmMacro` apenas quando contém exclusivamente `Maximize` (sem condições, argumentos ou ações adicionais), registrando `onOpenWindowAction = 'Maximize'` em `pageSetup`; macros/eventos arbitrários seguem rejeitados (`has-vba-macros-or-events`).
   - Relatórios sem `RecordSource` e sem controles ligados recebem `queryKey = ''` e retornam 1 página estática em `AccessReportController.run`.
5. **Coordenadas omitidas, `TextBox`/`CheckBox`/`ComboBox` e CLI `--dao-query-shape`**:
   - Mantidos `LayoutCached*` na origem zero, default `BackStyle = 1` em `Rectangle`/`ComboBox`, `CheckBox` booleano (`106`), `ComboBox` somente leitura de 1 coluna (`111`) e `--dao-query-shape` em `lib/access_to_dart.dart`.

## Verificação

- **Oráculo nativo interativo (`tools/audit_cspront1_reports_native.ps1` via
  `tools/run_report16_interactive_oracle.ps1`)**: executado em `SessionId = 1`
  apenas com dados sintéticos descartáveis; exportou `cspront1-multi-presentation.json`
  (**852 controles** em **7 relatórios**: `prontuario1` [159], `prontuario4-Condi-Habit` [169],
  `prontuario6-Condi-SAUDE-TEXTO` [48], `prontuario11-violenc-violacoes-fr-verso` [252],
  `prontuario16-REGISTRO-SINTETICO-FR-VERSO` [38], `PROSPECTO DE BUSCA ATIVA IMPRIMIR` [115]
  e `PLANO SOCIO FAMILIAR` [71]), `report1.pdf` e `report4.pdf`.
- **`test/access_report16_renderer_test.dart`**: confirmou **19** relatórios compilados
  (`2.255` controles), igualdade **852/852** dos controles contra `cspront1-multi-presentation.json`
  (incluindo `Section`), parsing dinâmico de `.thmx` customizado, ausência de constantes mágicas
  de cor em `report_renderer_generator.dart` e rejeição de `ComboBox` multicoluna, controle
  ligado em relatório sem `RecordSource` e macro não cosmética.
- **`test/access_to_dart_cli_test.dart`**: validou `--dao-query-shape` (códigos 66, 65 e validação do contrato).
- **`test/generation/long/report16_postgres_browser_test.dart` + `tools/verify_report16_browser.mjs`**:
  validou `prontuario_1` (`159`), `prontuario_4_condi_habit` (`169`), `prontuario_16_registro_sintetico_fr_verso` (`38`)
  e `prospecto_de_busca_ativa_imprimir` (`115` controles, `7` `Line`, `PageHeader`/`Detalhe`/`PageFooter`)
  em PostgreSQL temporário, servidor AOT, `build_release.dart` e Chrome/Playwright (`writes: 0`, `errors: []`).
- **Compilação integral do `SIGAsul` via CLI**:
  `analyze --dao-query-shape cspront1-shape.json` + `generate` +
  `dart analyze lib` (`core`, `backend`, `frontend`: sem apontamentos) +
  `dart compile exe bin/server.dart` + `dart run tool/build_release.dart`
  (`471` arquivos, `4.963.760` caracteres JS, `COMPILED=19`, `CONTROLS=2255`).
