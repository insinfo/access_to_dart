# 52 — Preservação de apresentação de relatórios e oráculo nativo de `prontuario16`

## Lacuna identificada no parser de relatórios

A inspeção de `fixtures/SIGAsul.accdb.src/reports/prontuario16-REGISTRO-SINTETICO-FR-VERSO.bas`
identificou dois controles que o parser `.bas` descartava porque `_collectControls`
coletava apenas controles de formulários e ignorava elementos gráficos de relatório:

- `Imagem96` (`Image`, `PictureType=2`, `Picture="logo-SUAS-ICON"`);
- `Caixa65` (`Rectangle`).

Além disso, o parser não preservava:

- propriedades do bloco raiz `Report` (`Width`, `FitToPage`, `GrpKeepTogether`, etc.);
- blocos padrão de controles (`controlDefaults`, como `Image.SizeMode=3` e `Label.FontName=Calibri`);
- propriedades individuais das seções (`KeepTogether`, etc.);
- configurações de impressão do arquivo companheiro `reports/<nome>.json` (`printSettings` e `printSettingsSha256`);
- vínculo e integridade de imagens compartilhadas da galeria (`images/<stem>.json` e imagem correspondente).

## Alterações em `AccessSrcModel`, `AccessSrcReader` e `AnalysisOverlayMerger`

- `lib/src/access_src_model.dart`:
  - `AccessSrcReport` passa a registrar `sourceSha256`, `properties`, `controlDefaults`,
    `printSettings`, `printSettingsSha256` e `images` (`List<AccessSrcReportImage>`).
  - `AccessSrcReportSection` passa a registrar `properties`.
  - `AccessSrcReportImage` modela `controlName`, `picture`, `pictureType`, `status`,
    `sourcePath`, `sha256`, `metadataPath` e `metadataSha256`.
- `lib/src/access_src_reader.dart`:
  - `_collectControls(..., reportGraphics: true)` inclui `Image`, `Rectangle`, `Line` e `PageBreak` em relatórios.
  - `_readReports` indexa `images/*.json`, verifica existência e SHA-256 do arquivo de imagem associado e lê `<nome>.json` de configurações de impressão.
  - `_parseReport` coleta `controlDefaults`, propriedades de seções/controles e resolve cada `Image` com status explícito (`resolved`, `missing-gallery-file`, `missing-or-ambiguous-gallery-item` ou `unsupported-picture-storage`).
- `lib/src/analysis_overlay_merger.dart`:
  - `_mergeReportRecords` preserva os novos metadados e as listas mescladas de seções, controles e agrupamentos mantendo `id` e metadados binários sem equivalente textual.

## Oráculo nativo controlado em sessão interativa

A exportação direta para PDF (`DoCmd.OutputTo`) via sessão SSH não interativa (Session 0)
falhava no Access. Para isolar a verificação sem abrir ou alterar os bancos SIGAsul
originais, foram criados dois scripts exclusivamente com dados e tabelas sintéticos:

- `tools/audit_report16_native.ps1`: cria um `.accdb` temporário descartável com
  `SyntheticFamilies`, `TbPessoa`, `TbUnidade`, consulta `CSPRONT1`, imagem compartilhada
  `logo-SUAS-ICON.png` e tema `Tema do Office.thmx` gravado em `MSysResources` e
  vinculado nas propriedades DAO `Theme Resource Name = "Tema do Office"` e
  `Themed Form Controls = 1`.
- `tools/run_report16_interactive_oracle.ps1`: executa o oráculo via Task Scheduler na
  sessão interativa do usuário (`SessionId=1`), valida exclusividade de processo
  (`owned-process.json`) e remove tarefa agendada e diretório temporário ao final.

Resultados reproduzidos em `build/codex-report16-interactive/presentation.json`
(contrato `report16-native-presentation-v1`):

- `accessVersion`: `16.0`, `accessSessionId`: `1`, `syntheticOnly`: `true`, `originalDatabaseOpened`: `false`;
- `databaseThemeResourceName`: `Tema do Office`;
- `queryFields`: `CodFam`, `TbPessoa.NOME`, `TbUnidade.NOME`;
- 38 controles (`34 Label`, `2 TextBox`, `1 Image`, `1 Rectangle`) com `FontName=Calibri`
  resolvido pelo tema, coordenadas, cores, bordas e margens em twips
  (`LeftMargin=454`, `RightMargin=240`, `TopMargin=240`, `BottomMargin=792`,
  `ItemSizeWidth=11022`, `ItemSizeHeight=15285`, `Orientation=1`, `PaperSize=9`);
- `pdfExported`: `true`, `nativePdfSha256`: `1e7dbeb543e55e9e5af85a8d65bd10fd2e2ac3e15fb7f473a52aad71f9f3409f`.

## Verificação e escopo

- `dart analyze lib/src/access_src_model.dart lib/src/access_src_reader.dart lib/src/analysis_overlay_merger.dart test/access_report_presentation_source_test.dart test/access_src_reports_test.dart`: sem problemas.
- `dart test test/access_report_presentation_source_test.dart test/access_src_reports_test.dart --reporter expanded`: 3 testes passaram, confirmando os 38 controles, layout, `printSettings`, imagem compartilhada resolvida e diagnóstico `missing-gallery-file`, mantendo `renderer_generated: false` enquanto não há renderer compilado.

Esta etapa estabelece o contrato de apresentação e o oráculo PDF nativo de
`prontuario16-REGISTRO-SINTETICO-FR-VERSO`; ainda não habilita o renderer de
relatórios no aplicativo web gerado.
