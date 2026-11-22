# 57 — Expansão do renderer compilado para todos os 15 relatórios `CSPRONT1`

## Escopo e diagnósticos

Todos os **15 relatórios `prontuario*`** em `fixtures/SIGAsul.accdb.src/reports/`
com `RecordSource = "CSPRONT1"` são livres de módulos VBA, eventos, macros e
agrupamentos (`BreakLevel`), e apresentam `PageHeader` e `PageFooter` de altura
zero:

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
- Na geração integral do `SIGAsul` (`45` tabelas vinculadas, `54` tabelas de migração e `165` relatórios no catálogo), os demais `150` relatórios permanecem em `inventory-only` (`53` por `record-source-not-compiled-query`, `50` por `unsupported-group-levels`, `45` por `has-vba-macros-or-events`, `1` por `missing-source-export-sha256` e `1` por `missing-record-source`).
- Controles `ComboBox` com lookup multicolor/multicolumnado ou ocultação de chave (`ColumnCount != 1`, `BoundColumn != 1` ou largura inicial `<= 0`) continuam explicitamente recusados com `unsupported-combobox-lookup:<controle>`.

## Regras acrescentadas ao compilador e fidelidade ao oráculo nativo

Em `lib/src/project_generator/report_renderer_generator.dart`:

1. **Coordenadas omitidas e `LayoutCached*`**:
   - Controles na origem zero que omitem `Left` ou `Top` no `SaveAsText` (ex.:
     `Rótulo91` em `prontuario4`, `Imagem96` em `prontuario6`, `Rótulo56` em
     `prontuario11`) são resolvidos para `0` quando `LayoutCachedWidth == Width`
     ou `LayoutCachedHeight == Height`.
   - `Width` e `Height` omitidos (ex.: 30 `CheckBox` de `prontuario4-Condi-Habit`)
     são calculados por `LayoutCachedWidth - Left` e `LayoutCachedHeight - Top`.
2. **Default de `Rectangle.BackStyle` e `ComboBox.BackStyle`**:
   - O oráculo nativo confirmou `BackStyle = 1` como default para `Rectangle` e
     `ComboBox` quando omitido no `.bas` (`Caixa65` de `prontuario16` declara
     explicitamente `BackStyle = 0`).
3. **`TextBox` sem vínculo e `CheckBox` booleano (`ControlType = 106`)**:
   - `TextBox` sem `ControlSource` (verso sem vínculo de `prontuario11` e
     `prontuario12`) permanece somente leitura com texto vazio.
   - `CheckBox` exige `ControlSource` ligado a coluna booleana (`daoType = 1`)
     da consulta compilada; `AccessReportController` entrega `'true'`/`'false'` e
     `<access-report-viewer>` renderiza `<input type="checkbox" disabled [checked]="pageChecked(...)">`
     sem `[style]` inline e com `[attr.data-access-checked]`.
4. **`ComboBox` de exibição direta (`ControlType = 111`) e cores de tema**:
   - `ComboBox` de 1 coluna exibindo diretamente o valor ligado (`ColumnCount = 1`,
     `BoundColumn = 1`, `ColumnWidths > 0`, ex.: `CodResid` em `prontuario1` com
     `ControlSource = "CodFam"`) é compilado em modo somente leitura preservando
     `controlType = 111`, `data-access-control-type="ComboBox"` e tipografia.
   - `_resolveReportForeColor` resolve `ForeThemeColorIndex` + `ForeShade`
     conferidos no oráculo nativo (`4/75.0 -> 9917743` e `9/50.0 -> 2316088`).
5. **CLI `--dao-query-shape` em `access_to_dart analyze` (`lib/access_to_dart.dart`)**:
   - Aceita múltiplos shapes JSON verificados por DAO (validando arquivo, mapa
     JSON e SHA-256 de origem contra `--accdb` / `--backend-accdb` antes de
     abrir os bancos e anexando o contrato via `attachDaoQueryContract`).

## Verificação

- **Oráculo nativo interativo (`tools/audit_cspront1_reports_native.ps1` via
  `tools/run_report16_interactive_oracle.ps1`)**: executado em `SessionId = 1`
  apenas com tabelas e dados sintéticos descartáveis; exportou
  `cspront1-multi-presentation.json` (**666 controles** em `prontuario1` [159],
  `prontuario4-Condi-Habit` [169], `prontuario6-Condi-SAUDE-TEXTO` [48],
  `prontuario11-violenc-violacoes-fr-verso` [252] e
  `prontuario16-REGISTRO-SINTETICO-FR-VERSO` [38]), `report1.pdf` e `report4.pdf`.
- **`test/access_report16_renderer_test.dart`**: confirmou compilação de todos os
  **15/15** relatórios `CSPRONT1` (`1.965` controles), recusa de `ComboBox`
  multicoluna (`unsupported-combobox-lookup:ComboMultiCol`) e igualdade
  **666/666** dos controles contra `cspront1-multi-presentation.json`.
- **`test/access_to_dart_cli_test.dart`**: validou pré-checagem e rejeição de
  shape ausente (código 66), SHA-256 divergente (código 65) e invocação de
  `attachDaoQueryContract`.
- **`test/generation/long/report16_postgres_browser_test.dart` +
  `tools/verify_report16_browser.mjs`**: validou `prontuario_1` (`159` controles,
  `CodResid` `ComboBox` = `'4242'`, `CRAS` `CheckBox` marcado, `Nº UNIDADE` =
  `'UNIDADE-01'`), `prontuario_4_condi_habit` (`169` controles, `30` checkboxes)
  e `prontuario_16_registro_sintetico_fr_verso` (`38` controles) em PostgreSQL
  temporário, servidor AOT, release NgDart (`build_release.dart`) e
  Chrome/Playwright (`writes: 0`, `errors: []`).
- **Compilação integral do `SIGAsul` via CLI**:
  `analyze --dao-query-shape cspront1-shape.json` + `generate` +
  `dart analyze lib` (`core`, `backend`, `frontend`: sem apontamentos) +
  `dart compile exe bin/server.dart` + `dart run tool/build_release.dart`
  (`471` arquivos, `4.808.671` caracteres JS, `COMPILED=15`, `CONTROLS=1965`).
