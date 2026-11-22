# 57 — Expansão do renderer compilado para os 14 relatórios `CSPRONT1` elegíveis

## Escopo e diagnósticos

Dos 15 relatórios `prontuario*` em `fixtures/SIGAsul.accdb.src/reports/` com
`RecordSource = "CSPRONT1"`, todos são livres de módulos VBA, eventos, macros e
agrupamentos (`BreakLevel`), e apresentam `PageHeader` e `PageFooter` de altura zero:

- **14 relatórios elegíveis compilados** (`1.806` controles no total):
  `prontuario3-composicao-texto` (48), `prontuario4-Condi-Habit` (169),
  `prontuario5-Condi-TRAB-RENDA-TEXTO` (48), `prontuario6-Condi-SAUDE-TEXTO` (48),
  `prontuario7-Beneficios-FRENTE-VERSO` (225), `prontuario8-Condi-Educ-TEXTO` (48),
  `prontuario9-ConvFamilComun-frente-verso` (142),
  `prontuario10-serv-progr-projetos-fr-verso` (221),
  `prontuario11-violenc-violacoes-fr-verso` (252),
  `prontuario12-mse-frente-verso` (267), `prontuario13-planej-evolu-frente-verso` (125),
  `prontuario14-planej-evolu-frente-verso-2` (87),
  `prontuario15-planej-evol-IMPRIMIR-FR-VERSO` (88) e
  `prontuario16-REGISTRO-SINTETICO-FR-VERSO` (38).
- **1 relatório mantido como `inventory-only`**: `prontuario1`, recusado
  explicitamente com `unsupported-control-type:ComboBox` por conter o combo
  `CodResid` com `RowSource` SQL próprio.

## Regras acrescentadas ao compilador e fidelidade ao oráculo nativo

Em `lib/src/project_generator/report_renderer_generator.dart`:

1. **Coordenadas omitidas e `LayoutCached*`**:
   - Controles na origem zero que omitem `Left` ou `Top` no `SaveAsText` (ex.:
     `Rótulo91` em `prontuario4`, `Imagem96` em `prontuario6`, `Rótulo56` em
     `prontuario11`) são resolvidos para `0` quando `LayoutCachedWidth == Width`
     ou `LayoutCachedHeight == Height`.
   - `Width` e `Height` omitidos (ex.: 30 `CheckBox` de `prontuario4-Condi-Habit`)
     são calculados por `LayoutCachedWidth - Left` e `LayoutCachedHeight - Top`.
2. **Default de `Rectangle.BackStyle`**:
   - O oráculo nativo revelou que `Rectangle` sem `BackStyle` explícito no `.bas`
     adota `BackStyle = 1` (opaco) no Access (`prontuario4` e `prontuario11`),
     enquanto `Caixa65` de `prontuario16` declara `BackStyle = 0`. A resolução de
     default foi corrigida para `1` em `Rectangle`.
3. **`TextBox` sem vínculo e `CheckBox` booleano (`ControlType = 106`)**:
   - `TextBox` sem `ControlSource` (verso sem vínculo de `prontuario11` e
     `prontuario12`) permanece somente leitura com texto vazio.
   - `CheckBox` exige `ControlSource` ligado a coluna booleana (`daoType = 1`)
     da consulta compilada; `AccessReportController` entrega `'true'`/`'false'` e
     `<access-report-viewer>` renderiza `<input type="checkbox" disabled [checked]="pageChecked(...)">`
     sem `[style]` inline e com `[attr.data-access-checked]`.

## Verificação

- **Oráculo nativo interativo (`tools/audit_cspront1_reports_native.ps1` via
  `tools/run_report16_interactive_oracle.ps1`)**: executado em `SessionId = 1`
  apenas com tabelas e dados sintéticos descartáveis; exportou
  `cspront1-multi-presentation.json` (507 controles em `prontuario4`,
  `prontuario6`, `prontuario11` e `prontuario16`) e `report4.pdf`.
- **`test/access_report16_renderer_test.dart`**: confirmou compilação dos 14
  relatórios (`1.806` controles), recusa de `prontuario1` (`unsupported-control-type:ComboBox`)
  e igualdade **507/507** dos controles contra `cspront1-multi-presentation.json`.
- **`test/generation/long/report16_postgres_browser_test.dart` +
  `tools/verify_report16_browser.mjs`**: validou `prontuario16` (`38` controles)
  e `prontuario4-Condi-Habit` (`169` controles, `30` checkboxes, `Nº Comodos=5`,
  `Rótulo91` em `left: 0px`) em PostgreSQL temporário, servidor AOT, release
  NgDart (`build_release.dart` com `maxLength`) e Chrome/Playwright (`writes: 0`,
  `errors: []`).
