# Experimentos Controlados de Layout e VBA no `.accdb`

Este documento registra uma bateria pequena de experimentos controlados executados com os scripts em `tools/` para entender melhor onde o Access grava:

- layout de controles de formulario;
- propriedades visuais;
- codigo VBA associado ao formulario;
- metadados do projeto VBA.

## 1. Ferramentas criadas

### Gerador de fixture parametrizado

Arquivo:

- `tools/create_access_layout_diff_fixture.dart`

Uso:

- cria um `.accdb` com o formulario `frmDiffProbe`;
- permite variar `Left`, `Top`, `Width`, `Height`;
- permite trocar o tipo principal entre `textbox` e `combo`;
- permite alterar a mensagem do VBA embutido no evento do botao.

### Comparador de variantes

Arquivo:

- `tools/compare_access_form_variants.dart`

Uso:

- compara dois `.accdb`;
- destaca diferencas em `MSysAccessStorage`;
- resume `MSysObjects` para o objeto foco;
- verifica `MSysModules` e `MSysModules2`.

## 2. Arquivos de prova gerados

Diretorio:

- `scratch/reverse_forms/`

Variantes criadas:

- `baseline.accdb`
- `left.accdb`
- `top.accdb`
- `width.accdb`
- `height.accdb`
- `combo.accdb`
- `vba.accdb`

Relatorios gerados:

- `left_diff.md`
- `top_diff.md`
- `width_diff.md`
- `height_diff.md`
- `combo_diff.md`
- `vba_diff.md`
- `baseline_layout.md`
- `vba_layout.md`

## 3. Inventario bruto relevante de `MSysAccessStorage`

No `baseline.accdb`, o dump mostrou:

- `Blob` em indice `19`, tamanho `14988`
- `TypeInfo` em indice `20`, tamanho `0`
- `PropData` em indice `23`, tamanho `22`
- `AcessVBAData` em indice `24`, tamanho `12`
- stream aleatoria `UVSLFZEXWTOSDEZAWBXVFHHRAWBG` em indice `25`, tamanho `1963`
- `_VBA_PROJECT` em indice `26`, tamanho `2554`
- `dir` em indice `27`, tamanho `609`
- `PROJECTwm` em indice `28`, tamanho `56`
- `PROJECT` em indice `29`, tamanho `386`
- outro `PropData` em indice `30`, tamanho `15`

### Conclusao forte

Para este fixture, a trilha mais importante nao passou por `MSysModules` ou `MSysModules2`. Ela ficou toda concentrada em `MSysAccessStorage`.

## 4. Onde o layout visual aparece

### 4.1 O `Blob` e a melhor pista de layout de formulario

No `baseline.accdb`, o stream `Blob` contem strings como:

- `LayoutProbe`
- `CampoAlpha`
- `Diff Probe`
- `cmdProbe`
- `Executar`
- `[Event Procedure]`

Isso mostra que o `Blob` contem nomes de controles, captions e referencias do formulario.

### 4.2 Registros binarios ao redor do controle `ctlProbe`

Ao analisar `ctlProbe` no `Blob`, apareceram dois blocos muito claros de quatro inteiros:

- `propertyId 282..285`
- `propertyId 302..305`

No `baseline`, os valores do segundo bloco foram:

- `302 = 1200`
- `303 = 900`
- `304 = 3400`
- `305 = 1230`

Esses numeros batem exatamente com:

- `Left = 1200`
- `Top = 900`
- `Right = Left + Width = 3400`
- `Bottom = Top + Height = 1230`

No mesmo controle, o bloco `282..285` bateu com o retangulo do label associado:

- `282 = 1200`
- `283 = 600`
- `284 = 2400`
- `285 = 860`

Esses valores correspondem ao label `lblProbe`, criado em:

- `Left = 1200`
- `Top = 600`
- `Width = 1200`
- `Height = 260`

### Conclusao forte

Para este tipo de formulario, o `Blob` guarda retangulos de controles como quads:

- `left`
- `top`
- `right`
- `bottom`

e nao apenas como `left`, `top`, `width`, `height` isolados.

## 5. Mapeamento empirico dos `propertyId`s de layout

Com base nas variantes:

### Caixa de texto `ctlProbe`

No baseline:

- `302 = 1200`
- `303 = 900`
- `304 = 3400`
- `305 = 1230`

Na variante `left=1800`:

- `302 = 1800`
- `303 = 900`
- `304 = 4000`
- `305 = 1230`

Na variante `top=1400`:

- `302 = 1200`
- `303 = 1400`
- `304 = 3400`
- `305 = 1730`

Na variante `width=3000`:

- `302 = 1200`
- `303 = 900`
- `304 = 4200`
- `305 = 1230`

Na variante `height=500`:

- `302 = 1200`
- `303 = 900`
- `304 = 3400`
- `305 = 1400`

### Inferencia forte

Para o controle principal do tipo textbox:

- `302` parece ser `Left`
- `303` parece ser `Top`
- `304` parece ser `Right`
- `305` parece ser `Bottom`

### Label associado

O mesmo padrao apareceu em `282..285`, mas para o label associado ao textbox.

### Conclusao forte

O Access persiste geometria de layout no `Blob` com ids numericos e coordenadas absolutas em twips.

## 6. O que muda quando o controle vira `ComboBox`

Na variante `combo.accdb`, o grupo do `ctlProbe` mudou bastante:

- o bloco de retangulo passou a usar `310..313`;
- `221` continuou apontando para `CampoAlpha`;
- `222` passou a conter `Value List`;
- `223` passou a conter `A;B;C;D`.

### Conclusao forte

Ao trocar o tipo do controle:

- o Access muda a familia de `propertyId`s do retangulo;
- `RowSourceType` e `RowSource` passam a aparecer explicitamente no `Blob`;
- a serializacao do controle nao e apenas um campo "DisplayControl" isolado, ela altera o shape binario do bloco do controle.

## 7. Onde o VBA aparece de fato

### 7.1 A stream aleatoria grande contem o codigo do formulario

No baseline, a stream aleatoria `UVSLFZEXWTOSDEZAWBXVFHHRAWBG` continha strings como:

- `Probe v1`
- `Probe`
- `left=1200;top=900;width=2200;height=330;kind=textbox`
- `Attribute VB_Name = "Form_frmDiffProbe"`
- `Sub cmdProbe_Click()`
- `MsgBox`
- `ProbeSummary`

### Conclusao forte

O texto do modulo VBA do formulario esta nessa stream aleatoria grande, nao em `AcessVBAData`.

### 7.2 `_VBA_PROJECT` funciona como indice/metadado do projeto

No baseline, `_VBA_PROJECT` continha:

- `Form_frmDiffProbe`
- `cmdProbe`
- `cmdProbe_Click`
- `ProbeSummary`
- referencias COM/VBA como `VBE7.DLL`, `MSACC.OLB`, `ACEDAO.DLL`
- o nome da stream aleatoria grande: `UVSLFZEXWTOSDEZAWBXVFHHRAWBG`

### Conclusao forte

`_VBA_PROJECT` parece ser a tabela/indice estrutural do projeto VBA, apontando para o modulo real do formulario.

### 7.3 `PROJECT` guarda metadados do projeto e da janela

O stream `PROJECT` continha:

- `DocClass=Form_frmDiffProbe/&H00000000`
- `Name="baseline"`
- `Form_frmDiffProbe=26, 26, 1614, 703`

### Conclusao forte

`PROJECT` guarda:

- nome/identidade do projeto;
- `DocClass` do formulario;
- coordenadas de workspace/editor do objeto VBA;
- mas nao o corpo principal do codigo.

### 7.4 `dir` e `PROJECTwm`

`dir` e `PROJECTwm` tambem mudaram em toda alteracao de VBA e layout.

### Inferencia forte

- `dir` parece fazer parte da infraestrutura padrao de projeto VBA/OVBA;
- `PROJECTwm` parece guardar estado adicional de workspace/metadados.

## 8. O que `AcessVBAData` parece ser neste experimento

No baseline, `AcessVBAData` tinha apenas `12` bytes:

```text
01 00 00 00 01 00 00 00 01 00 00 00
```

### Observacao importante

Nas variantes executadas, inclusive a que alterou so a mensagem VBA, `AcessVBAData` nao apareceu como principal ponto de diferenca.

### Conclusao provisoria

Para este fixture simples:

- `AcessVBAData` existe;
- mas o codigo detalhado do formulario nao ficou ali;
- o payload de VBA relevante apareceu principalmente em:
  - stream aleatoria grande do modulo;
  - `_VBA_PROJECT`;
  - `dir`;
  - `PROJECT`.

## 9. O que nao mudou

Nas comparacoes:

- `MSysObjects` para `frmDiffProbe` permaneceu com o mesmo resumo externo;
- `MSysModules` nao existiu;
- `MSysModules2` nao existiu.

### Conclusao forte

Nestes `.accdb` de prova:

- as mudancas de form/layout/VBA nao passaram por tabelas `MSysModules*`;
- a persistencia efetiva ficou em `MSysAccessStorage`.

## 10. Sintese operacional para a especificacao

Com base nesses experimentos, o modelo mais plausivel e:

### Formularios e layout

- vivem principalmente em `MSysAccessStorage`;
- `Blob` contem nomes, captions, event hooks e retangulos de controles;
- os retangulos aparecem como `left/top/right/bottom`;
- familias de `propertyId`s variam conforme o tipo do controle.

### VBA de formulario

- o texto do modulo fica em uma stream grande de nome pseudoaleatorio;
- `_VBA_PROJECT` referencia modulos, simbolos e bibliotecas;
- `PROJECT` guarda metadados do projeto e da classe do formulario;
- `dir` participa da infraestrutura padrao do projeto VBA;
- `AcessVBAData` existe, mas nao carregou o texto principal neste fixture.

## 11. Implicacao para o projeto

Para reconstruir formularios com fidelidade, a trilha recomendada e:

1. ler `MSysObjects` para catalogo;
2. abrir `MSysAccessStorage`;
3. localizar o `Blob` do formulario;
4. mapear os `propertyId`s geometricos por tipo de controle;
5. usar `_VBA_PROJECT`, `dir`, `PROJECT` e a stream aleatoria do modulo para reconstruir VBA;
6. tratar `MSysModules*` como trilha secundaria, nao como fonte principal para esses `.accdb` de prova.

## 12. Experimento complementar com `create_access_form_export_probe.dart`

Depois dos experimentos de `frmDiffProbe`, foi criada uma fixture adicional focada em tres pontos:

- `SaveAsText` nativo em duas rodadas;
- modulo VBA real no formulario;
- tentativa de exportacao via add-in `Version Control / MSAccessVCS`.

Arquivos gerados em `build/form_export_probe_v2/`:

- `baseline.accdb`
- `mutated.accdb`
- `vcs_try.accdb`
- `baseline_export/frmDespachoAutomatico.txt`
- `mutated_export/frmDespachoAutomatico.txt`
- `mutated_export/frmDespachoAutomatico_mutated.txt`
- `baseline_vs_mutated.md`

### 12.1 O modulo VBA voltou a produzir stream pseudoaleatoria

Ao adicionar `HasModule = true` e um evento simples `cmdProbeVba_Click` no formulario `frmDespachoAutomatico`, a persistencia voltou a exibir a mesma assinatura estrutural observada nos experimentos anteriores com VBA real.

Na variante `baseline.accdb` apareceram:

- `Blob` em indice `19`, tamanho `17075`
- `AcessVBAData` em indice `24`, tamanho `12`
- stream pseudoaleatoria `SCUELIECZGNDWDOVBOCZLNNTJPJF` em indice `25`, tamanho `1967`
- `_VBA_PROJECT` em indice `26`, tamanho `2731`
- `dir` em indice `27`, tamanho `632`
- `PROJECTwm` em indice `28`, tamanho `83`
- `PROJECT` em indice `29`, tamanho `400`

### Conclusao forte

Quando o formulario realmente tem modulo VBA:

- a stream pseudoaleatoria volta a aparecer em `MSysAccessStorage`;
- `_VBA_PROJECT`, `dir`, `PROJECT` e `PROJECTwm` crescem/mudam junto;
- `AcessVBAData` continua pequeno e nao carrega o corpo principal do codigo.

### 12.2 O analisador canônico recuperou o VBA do formulario

Na `baseline_analysis/analysis.json`, o campo `rawVbaCode` de `frmDespachoAutomatico` passou a conter o modulo do formulario com:

- `Attribute VB_Name = "Form_frmDespachoAutomatico"`
- `Private Sub cmdProbeVba_Click()`
- `Private Function ProbeSummary() As String`

Isso confirmou na pratica que a trilha de leitura de VBA por `MSysAccessStorage` continua valida tambem para esta fixture.

### 12.3 A assinatura correta do add-in veio do projeto de referencia

Usando `referencias/msaccess-vcs-addin-main` como contrato do add-in, a chamada correta nao era `MSAccessVCS.HandleRibbonCommand`.

O codigo de referencia mostrou dois pontos importantes:

- o Ribbon COM chama `App.Path & "\\Version Control.HandleRibbonCommand"`;
- o modulo `modAPI.bas` fornece o exemplo:
  - `Application.Run Environ$("AppData") & "\\MSAccessVCS\\Version Control.HandleRibbonCommand", "btnExport"`

Com base nisso, a fixture passou a tentar alvos de `Application.Run` derivados desse formato.

Na maquina de teste, a variante `vcs_try.accdb` executou com sucesso:

- `Run("C:\Users\pmro\AppData\Roaming\MSAccessVCS\Version Control.HandleRibbonCommand", "btnExport")`

### Conclusao forte

Para automacao COM do add-in `Version Control`, a forma correta e:

- tornar o Access visivel;
- ligar `UserControl = true`;
- chamar `Application.Run` com o caminho da biblioteca do add-in sem a extensao `.accda`, seguido de `.HandleRibbonCommand`.

Ou seja, neste ambiente o formato funcional foi:

- `%APPDATA%\\MSAccessVCS\\Version Control.HandleRibbonCommand`

e nao:

- `MSAccessVCS.HandleRibbonCommand`

### 12.4 Segunda exportacao com pequenas mutacoes de layout

A fixture passou a gerar uma segunda exportacao `SaveAsText` apos reabrir o formulario em design e aplicar pequenas mutacoes:

- `txtAssunto`: `left 600 -> 720`, `top 1650 -> 1710`, `width 4200 -> 4560`
- `chkRequerAssinatura`: `left 3300 -> 3450`, `top 2360 -> 2440`
- `lblTitulo`: `width 5000 -> 5360`

No `Compare-Object` entre `frmDespachoAutomatico.txt` e `frmDespachoAutomatico_mutated.txt`, apareceram exatamente as linhas esperadas:

- `Width =5000 -> 5360`
- `Left =600 -> 720`
- `Top =1650 -> 1710`
- `Width =4200 -> 4560`
- `Left =3300 -> 3450`
- `Top =2360 -> 2440`

Tambem mudaram os campos `LayoutCached*`, como esperado no texto exportado.

### 12.5 O `Blob` acompanhou a mutacao de layout

Na comparacao `baseline.accdb` vs `mutated.accdb`:

- `MSysObjects` de `frmDespachoAutomatico` nao mudou externamente;
- `MSysModules` e `MSysModules2` continuaram ausentes;
- `MSysAccessStorage` mudou em `Blob`, `_VBA_PROJECT`, `PROJECT`, `PROJECTwm`, `dir`, `TypeInfo` e stream pseudoaleatoria.

O relatorio `baseline_vs_mutated.md` mostrou:

- `Blob`: mudou mantendo o mesmo tamanho `17075 -> 17075`
- stream pseudoaleatoria: `SCUELIECZGNDWDOVBOCZLNNTJPJF -> EJNDNCBFKYDIUDJHPSSTGJXSSYCK`
- `_VBA_PROJECT`: `2731 -> 2730`
- `PROJECTwm`: `83 -> 0`
- `PROJECT`: `400 -> 399`
- `TypeInfo`: `0 -> 320`

### Conclusao forte

As mutacoes de layout mexem no `Blob`, mas tambem repercutem em metadados de projeto e, neste caso, na identidade da stream pseudoaleatoria do modulo.

### 12.6 O JSON canônico refletiu a mutacao do layout

Na baseline, o analisador emitiu:

- `txtAssunto`: `left=600`, `top=1650`, `width=4200`
- `chkRequerAssinatura`: `left=3300`, `top=2360`

Na variante mutada, passou a emitir:

- `txtAssunto`: `left=720`, `top=1710`, `width=4560`
- `chkRequerAssinatura`: `left=3450`, `top=2440`

### Conclusao forte

O pipeline atual consegue refletir as pequenas mutacoes de layout no `canonical_analysis`, nao apenas no `SaveAsText`.

### 12.7 Efeito colateral observado na automacao de design

Na analise da variante mutada apareceu tambem um objeto adicional:

- `~sq_ffrmDespachoAutomatico`

### Conclusao provisoria

O ciclo de abrir o formulario em design, alterar layout e salvar pode induzir a criacao de artefatos temporarios de consulta/estado interno do Access. Isso precisa ser tratado como ruido potencial ao interpretar diffs de automacao COM.

### 12.8 Mapeamento empirico de `propertyId`s para `TextBox` e `CheckBox`

Ao inspecionar o contexto bruto do `Blob` em torno de `txtAssunto` e `chkRequerAssinatura`, apareceram dois blocos geometricos consistentes.

#### `txtAssunto`

Na baseline:

- `302 = 600`
- `303 = 1650`
- `304 = 4800`
- `305 = 1980`

Na variante mutada:

- `302 = 720`
- `303 = 1710`
- `304 = 5280`
- `305 = 2040`

Esses valores batem com:

- `Left`
- `Top`
- `Right = Left + Width`
- `Bottom = Top + Height`

para um `TextBox` comum.

#### `chkRequerAssinatura`

Na baseline:

- `293 = 3300`
- `294 = 2360`
- `295 = 3600`
- `296 = 2660`

Na variante mutada:

- `293 = 3450`
- `294 = 2440`
- `295 = 3750`
- `296 = 2740`

Esses valores tambem batem com:

- `Left`
- `Top`
- `Right = Left + Width`
- `Bottom = Top + Height`

mas em uma familia diferente de `propertyId`s.

### Conclusao forte

Na fixture `frmDespachoAutomatico`, a geometria continua persistida como `left/top/right/bottom`, mas a familia numerica varia por tipo de controle:

- `TextBox`: `302..305`
- `CheckBox`: `293..296`

Isso reforca que o parser nao deve assumir um unico quarteto fixo para todos os controles.

### 12.8.1 Fechamento complementar com `CommandButton` e `Label` independente

Usando a fixture controlada `frmLayoutProbe`, foi repetido o dump do `Blob` ao redor de dois controles independentes:

- `cmdApplyProbe`
- `lblBanner`

#### `cmdApplyProbe`

O quarteto persistido no `Blob` apareceu em `293..296`:

- `293 = 5555`
- `294 = 3333`
- `295 = 6666`
- `296 = 3710`

Isso bate exatamente com:

- `Left = 5555`
- `Top = 3333`
- `Right = 5555 + 1111 = 6666`
- `Bottom = 3333 + 377 = 3710`

Ou seja, nesta fixture o `CommandButton` reutiliza a mesma familia geometrica observada antes para `CheckBox`.

#### `lblBanner`

O quarteto persistido no `Blob` apareceu em `282..285`:

- `282 = 333`
- `283 = 177`
- `284 = 2444`
- `285 = 454`

Isso bate exatamente com:

- `Left = 333`
- `Top = 177`
- `Right = 333 + 2111 = 2444`
- `Bottom = 177 + 277 = 454`

Ou seja, o `Label` independente confirmou a mesma familia `282..285` ja observada anteriormente para labels associados.

### Conclusao complementar

Com as fixtures atuais, o mapeamento geometrico mais estavel fica assim:

- `Label`: `282..285`
- `CheckBox`: `293..296`
- `CommandButton`: `293..296`
- `TextBox`: `302..305`
- `ComboBox`: `310..313`

### 12.9 Observacao de compatibilidade COM ao resolver controles

Foi testado o acesso aos controles em design por dois caminhos:

- via colecao `Controls.Item("NomeDoControle")`
- via acesso direto no objeto de formulario ativo

Neste ambiente especifico, `Controls.Item(...)` retornou `Erro 0x80020003: Membro nao encontrado`, enquanto o acesso direto ao controle no formulario ativo funcionou.

### Conclusao provisoria

Para automacao COM tardia com Access, a resolucao de controles deve ter fallback:

1. tentar `Controls.Item(nome)`;
2. se falhar, tentar o acesso direto no formulario ativo.

Ou seja, a compatibilidade COM aqui se mostrou sensivel ao caminho de binding, mesmo para controles que existem e podem ser alterados com sucesso na mesma sessao.
