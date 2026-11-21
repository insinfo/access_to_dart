# Dependências vinculadas e formulários com SELECT no SIGAsul

## Falhas demonstradas

A análise combinada inicial tinha somente **26 tabelas**, embora o backend
fornecesse **45**. `AnalysisBackendLinker` escolhia dependências pelos nomes
literais de `RecordSource` dos formulários. `TbPessoa`, usada por
`COMPOSIÇÃO FAMILIAR SUBFORM` através de um SELECT, não chegava ao scaffold.
Consultas, relatórios e macros também podem depender de tabelas sem formulário
ligado diretamente ao nome da tabela.

O gerador também associava controles a tabelas somente quando `RecordSource`
era exatamente o nome da tabela. Perdia assim a ordem e os tipos dos controles
em fontes SQL simples, mesmo quando o esquema estava disponível.

A primeira execução de regressão também revelou cinco tabelas auxiliares de
anexos no backend analisado. Elas não constam dos vínculos originais: agora são
incluídas quando a tabela pai foi materializada. O total esperado é **50 tabelas
(45 originais + 5 anexos)** e **32 relações públicas**, preservando a distinção em testes.

## Correções

- Materializar os vínculos declarados no catálogo e no `.accdb.src` que possuam
  esquema no backend fornecido, independentemente de formulário direto.
  Incluir também dependências sintéticas de anexos desses pais.
- Preservar tabelas locais, evitar duplicatas e conservar relações locais junto
  das relações do backend cujos dois extremos foram materializados. Deduplicar
  somente registros de relações idênticos; nomes/flags distintos permanecem.
- Reutilizar metadados dos controles para `SELECT campos FROM tabela` puro,
  incluindo identificadores com colchetes e projeção parcial. Os campos restantes
  do esquema, defaults e validações continuam no CRUD da tabela.
- Recusar correspondência SQL com WHERE, ORDER BY, joins, aliases, agregações,
  DISTINCT, TOP, UNION, qualificadores de outra tabela e campos inexistentes.
  Essa associação não executa consultas nem implementa vínculos mestre/detalhe.

## Cobertura e limites observados

O export contém 97 formulários: 26 com fonte direta disponível, 19 com SQL
inline, 12 com consultas nomeadas, 39 sem fonte e um nome de tabela não
resolvido. Dos 19 SQL inline, 16 são projeções puras; 13 encontram esquema no
backend disponível. Os 45 vínculos usam nomes idênticos aos nomes de origem;
os nomes ausentes também não possuem declaração de vínculo no export.
Os outros três referenciam `TbAcodet`,
`TbDiarioExternoDet` e `TbViolacoesSubF`, ausentes desse backend. Os três SELECT
com ORDER BY continuam fora da associação conservadora.

A validação dos nomes de colunas recusa mais dois exports com esquema divergente:
`OFICINASOCEDUC SUBFORM` usa `CodOfSEduc`, ausente no backend; `SCFVExterno
SubForm` usa 12 campos ausentes, incluindo `CodSCDVEDet` e `CodSCFVExterno`.
Nessas tabelas existem formulários diretos alternativos. A seleção de metadados
fica em **37 formulários por tabela: 26 diretos + 11 SQL**; não são 97 telas.

As 11 tabelas que ganham associação SQL são `CadResidAtualizacao`,
`TbAcoRetorno`, `TbAtColetivoDet`, `TbAtualSCFV`, `TbBenfMunDet`,
`TbBuscaAtivaDet`, `TbGestDet`, `TbOfSocioEduAtualiz`, `TbPessoa`,
`TbRegSint` e `TbReuniaoDet`.

Esta mudança não equivale à conversão funcional integral: continuam pendentes
as consultas nomeadas e filtradas, ordenação SQL, relacionamento mestre/detalhe,
eventos/VBA e comportamento específico dos formulários. Tipos de controles
recuperados também dependem da disponibilidade de suas fontes de opções.

## Regressões

- `analysis_backend_linker_dependencies_test.dart`: vínculos sem formulário,
  fonte somente no overlay, relação local preservada e duplicatas evitadas.
- `generate_uses_projection_forms_test.dart`: três projeções aceitas e onze
  casos recusados; projeção parcial preserva campo obrigatório/default.
- `sigasul_projection_frontend_compile_test.dart`: CLI real analisa SIGAsul,
  `.src` e backend; exige 45 tabelas originais + 5 anexos/32 relações públicas; gera recorte real de `TbPessoa`
  (59 colunas) e valida core/frontend com analyzer e webdev build.

O teste longo aceita `ACCESS_SIGASUL_ANALYSIS_SNAPSHOT` apenas para salvar uma
cópia opcional da análise completa antes do recorte. Não depende de artefato
prévio em build. Dados de pessoas e strings de conexão não entram neste relato.

A análise bruta contém 34 relações: duas referem tabelas MSysNavPane de sistema
que não foram materializadas. As 32 públicas incluem dois pares com mesmos
extremos e flags, porém nomes distintos terminados em `1`; esses nomes são
preservados. A regressão compara o conjunto completo das relações públicas,
além da contagem. Uma execução inicial expôs a deduplicação excessiva por
extremos, corrigida para eliminar somente registros idênticos.

Para repetir somente linker e compilação sobre a análise real já obtida, o teste
aceita `ACCESS_SIGASUL_ANALYSIS_INPUT`; por padrão executa novamente a CLI
com os arquivos Access. O gate final desta rodada reutilizou o snapshot da
execução real, reaplicando a correção de relações sem repetir a decifragem.

Validação desta etapa concluída: 4 testes do linker, 15 testes rápidos de geração
(incluindo o caso de vínculo existente) e 1 teste real de análise/geração e
compilação passaram. O gate final sobre o snapshot real levou 1m25 e executou
`dart analyze lib` em core e frontend, seguido de `dart run webdev build`.
Logs locais: `build/codex-projection-fast-final.log` e
`build/codex-sigasul-projection-build-final.log`. A compilação cobre o recorte
real de TbPessoa; não comprova funcionamento integral das 97 interfaces.
