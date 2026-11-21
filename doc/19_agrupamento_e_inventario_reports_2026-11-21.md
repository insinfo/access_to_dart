# Agrupamento e inventário completo de reports — 21/11/2026

O caminho de análise e geração agora preserva os metadados dos reports até o
scaffold final. Antes, o Markdown listava apenas os primeiros 25 nomes, enquanto
seções, controles e outras propriedades presentes no analysis não eram
exportados como um artefato próprio do projeto gerado.

## Agrupamento e ordenação dos exports Access

Blocos `BreakLevel`, antes ignorados, são lidos como `groupLevels` na ordem do
export. Cada nível mantém `controlSource`, `sortOrder`, `groupHeader`,
`groupFooter`, `groupOn`, `groupInterval`, `keepTogether` e `properties`, que
preserva as propriedades originais. `orderBy`, `orderByOn` e `orderByOnLoad`
também são preservados no report.

Os valores continuam crus: strings como `NotDefault` e valores de enum não são
convertidos por suposição; propriedades ausentes ficam nulas. O merge de overlay
associa níveis sem nome por posição, preserva IDs e propriedades binárias que
não vieram do export; uma lista fonte vazia não apaga os níveis binários.

Evidências nas fixtures:

- `teste1`, `ListaDeContatos`: três níveis, `=Left([Sobrenome],1)`, `Sobrenome` e
  `Nome`, preservados de analysis até o scaffold gerado.
- Export SIGAsul, `FICHA CADASTRO OU ATUALIZACAO BENEFICIO`: `SortOrder=NotDefault`
  e `GroupOn=3`.
- Export SIGAsul, `RLT SISC SCFV EXTERNO-GERAL`: `OrderByOn=NotDefault` e a
  expressão de `OrderBy` permanecem disponíveis.

## Artefato gerado

`access-reports.json`, na raiz do scaffold, contém:

- `reports`: os objetos completos de `analysis.reports`, sem limite de quantidade;
- `source_overlay_reports` e `canonical_reports`: listas originais separadas,
  sem misturar nem descartar propriedades ainda desconhecidas pelo modelo tipado;
- origem, versão do analysis e identificação do artefato;
- `status: inventory_only` e `renderer_generated: false`;
- contagens de `sections`, `controls` e `groupLevels`, com a quantidade de reports
  principais em que cada lista estava disponível.

As contagens usam apenas as listas diretas dos reports principais. Não somam de
novo os controles dentro de seções, nem misturam cópias do overlay/canônico.
Uma lista ausente é distinta de uma lista vazia: o Markdown diz “não informados”
quando nenhum report fornece aquele metadado.

`conversion-report.md` passa a ter um link relativo para o JSON e as contagens.
A prévia de nomes no Markdown continua limitada a 25, mas o JSON contém todos;
um teste com 30 reports verifica também o último registro e a igualdade completa
das estruturas e campos desconhecidos.

**Limite:** este trabalho preserva inventário e estrutura, não gera um renderer,
PDF nem paginação fiel dos reports. Não foi acrescentada uma tela Angular de
reports. Esses dados permitem uma etapa posterior de renderização com evidência
mais completa, sem afirmar que ela já existe.

## Verificação

- `dart test test/generation/fast/generate_preserves_report_inventory_test.dart --reporter expanded --concurrency=1`:
  **3/3 aprovados**, cobrindo 30 reports com estrutura, catálogo sem detalhes e
  overlay sem catálogo principal. Todos executam o comando `generate` real.
- `dart test test/access_src_reports_test.dart test/access_src_report_grouping_test.dart --concurrency=1 --reporter expanded`:
  **4/4 aprovados**, incluindo o fluxo real de `teste1` analysis → generate e a
  igualdade dos agrupamentos e seções no novo artefato.
- Suíte `test/generation/fast`: **19/19 aprovados**, incluindo os três testes
  acima (não somar como se fossem testes distintos).
- `dart analyze lib test`: nenhum problema encontrado nesta rodada.
- `git diff --check`: sem erros. Nenhum template Angular foi alterado para
  introduzir o inventário, portanto não foi necessário um novo build web nesta
  parte do trabalho.

Logs de validação locais em `build/codex-ida-analyze.log`,
`build/codex-ida-fast.log` e `build/codex-report-grouping-tests.log`.
