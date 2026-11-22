# Meta ativa: SIGAsul funcional em Dart

Atualizado em 21/11/2026. Objetivo: converter o sistema Access da Secretaria de
Bem-Estar Social em uma aplicação Dart fullstack funcional, preservando seus
fluxos e dados. Compilar, gerar CRUD ou preservar um inventário não encerra a meta.

## Escopo e oráculos

- Frontend: `fixtures/SIGAsul.accdb`, com o export `fixtures/SIGAsul.accdb.src`.
- Backend vinculado desta rodada: `fixtures/SIGA2021-SUL_be_senha_4462.accdb`.
- DAO somente leitura confirma 45 tabelas originais no SUL. O CENTRAL disponível
  é outra base: 49 tabelas, incluindo OBITO, TbAvalAcomp, TbLocalEnc e
  TbRegistrarEnc. Não foram misturados dados entre as duas bases.
- Catálogo DAO: 501 QueryDefs, 97 forms e 165 reports. O modelo analítico contém
  429 queries após sua filtragem de queries ocultas; esse número não substitui
  o denominador DAO. O export contém 409 consultas e 164 reports.
- O projeto `new_sali` permanece referência de organização core/backend/frontend,
  modelos compartilhados e camadas de repository/service/controller. Não foi
  modificado nesta rodada nem constitui prova de comportamento equivalente.

## Critérios para encerrar a meta

| Área | Evidência necessária | Estado atual |
|---|---|---|
| Dados | Todas as tabelas, anexos e relacionamentos migrados; contagens, valores e integridade comparados com Access/DAO; CRUD persistente validado | 54/54 contagens DAO conferidas: 123.922 registros lógicos. PostgreSQL: 887/887 colunas escalares, cinco anexos com 25 metadados e 55 valores multivalorados iguais ao DAO; um órfão físico preservado exatamente em arquivo separado. Escrita explícita de `MotivoNão` e CLI padrão com `sequence` para AutoNumber validados separadamente (docs 51/54). CRUD completo de todos os fluxos ainda pendente |
| Consultas | Dependências e parâmetros resolvidos; resultados comparados com Access, incluindo filtros, JOIN, agregações e ações | CSPRONT1 executada pela API gerada: sete casos e 134 colunas iguais ao DAO, mediante contrato validado. Demais consultas, dependências e recursos fora do subconjunto ainda pendentes |
| Formulários | Os 97 forms e seus subforms, seleção, filtros, ordenação e navegação exercitados | Apenas parte dos forms fornece metadados ao CRUD; contrato de capacidades por formulário exportado em `access-form-capabilities.json` (doc53) e binding `[maxlength]` em `incluir_page.html.mustache` corrigido para `dart2js` (doc56). Não são 97 telas equivalentes |
| Regras | Eventos, macros e VBA executados em Dart com efeitos comparados ao Access | Numeração familiar, atribuições de colunas do combo e navegação restrita têm provas específicas. Os demais eventos e a equivalência integral do lifecycle permanecem pendentes |
| Relatórios | Os 165 reports, agrupamentos, expressões, paginação e saídas comparados ao Access | Apresentação e oráculos nativos validados (docs 52/57); renderer web compilado somente leitura validado para **14 relatórios `CSPRONT1`** (`1.806` controles, `Label`/`TextBox`/`Rectangle`/`Image`/`CheckBox`) e confrontado com PostgreSQL + Chrome/Playwright em `prontuario16` e `prontuario4-Condi-Habit` (docs 55/57). Demais 151 reports, `ComboBox` em relatório, agrupamentos, expressões e paginação seguem pendentes |
| Operação | Aplicação completa compilada e fluxos reais de cadastro, atendimento, benefícios, encaminhamento e relatórios testados com PostgreSQL | Snapshot 21c986c: backend AOT/release de 471 arquivos, GET de 7.040 pessoas, navegador com 2.869 residências/16 linhas relacionadas e datas nativas conferidas, sem writes. Cadastro completo, relatórios e demais regras VBA ainda não comprovados |

Não há percentual global de conclusão calculado a partir de testes isolados.

## Falhas comprovadas e correções desta rodada

1. O linker promovia apenas 26 tabelas com RecordSource direto, descartando
   dependências de queries/subforms e relacionamentos. A correção inclui vínculos
   declarados e tabelas auxiliares de anexos, conservando relações locais.
2. Forms com projeções SQL simples não forneciam seus controles ao scaffold.
   Agora projeções monotabela validadas podem fornecer esses metadados. Filtros,
   joins, aliases e ordenação não são apagados para forçar equivalência.
3. Lookups consultavam a tabela dona em vez da origem RowSource e ordenavam
   números como texto. A correção usa a origem resolvida e ordem/limite no SQL.
4. A leitura SaveAsText perdia argumentos repetidos das macros e eventos.
   Agora os preserva, incluindo argumentos vazios e código `.cls`. Preservação
   não transforma automaticamente essas ações em comportamento executável.
5. `migrate --analysis` podia falhar ao carregar um Access real, usar sampleRows
   e terminar com sucesso. Para tabelas com origem física conhecida, fonte ausente,
   corrompida ou backend indisponível agora aborta antes de escrever os artefatos
   ou aplicar PostgreSQL. `--mode schema-only` permanece disponível offline.
   Análises sintéticas sem páginas físicas continuam distinguíveis pelo manifesto;
   elas não constituem prova de migração integral.

A correção de integridade tem três regressões: arquivo ausente, arquivo corrompido
e backend sem caminho. A suíte correspondente e testes rápidos passaram (36
casos na execução conjunta inicial, incluindo os casos de projeção que já haviam
sido adicionados). Logs em `build/codex-goal-fast.log`; análise estática em
`build/codex-goal-analyze.log`. Os testes não apagam nem alteram os Access originais.

## Lacunas que exigem continuidade

- Fonte exportada e esquema backend divergem em alguns formulários: há tabelas
  referenciadas sem vínculo declarado e projeções com colunas ausentes. Esses
  casos precisam de comparação com o Access em execução, não de criação arbitrária
  de colunas ou descarte silencioso das referências.
- Subforms agora têm painéis de leitura com vínculo pai/filho baseado no registro
  salvo. Escrita de filhos, lifecycle VBA, formulários sem RecordSource e múltiplas
  telas por tabela permanecem pendentes.
- Lookups com JOIN/WHERE delimitados foram implementados e testados; completar
  parâmetros de forms, exibição multicoluna e comparação de resultados de todas
  as consultas com o Access.
- Consumir macros/eventos e traduzir regras sem substituir lógica real por
  mensagens ou validadores heurísticos.
- Implementar relatórios e verificar o sistema completo em navegador com banco
  real. Cada limitação permanece aberta até existir evidência correspondente.

Relatórios específicos: `20_sigasul_behavior_preservation.md`,
`21_dependencias_e_forms_sql_sigasul.md` e `22_sigasul_backend_lookup_sources.md`.

Migração estrita e leitura HTTP integral detalhadas em `27_sigasul_migracao_integral.md`.

## Evidência adicional de fidelidade e operação

- O Boolean nativo do Access usa o bit da máscara como valor. A correção evita
  transformar false em null e foi comparada ao DAO nas três tabelas auditadas.
- O FileData dos anexos contém um wrapper; agora a migração remove esse wrapper
  e descomprime quando necessário, com validação de limites e Adler32. A prova inicial de quatro
  arquivos foi ampliada para os cinco anexos no doc45 e seus metadados no doc50.
- O release gerado usa uma compilação one-shot e verifica todos os arquivos do
  manifest. A validação de três módulos confirmou 297/297 arquivos.
- O backend serve o release e a API na mesma origem. Conexões de requisições
  usam Zone; inicialização concorrente reutiliza um único pool. Os testes com
  PostgreSQL incluem concorrência, erros e assets com banco indisponível.

Essas evidências estão em `29_sigasul_value_fidelity_audit.md`,
`30_attachment_payload_decode.md` e `31_same_origin_and_request_scope.md`.
Essas provas iniciais foram ampliadas para as 887 colunas no doc45. A igualdade
dos dados continua sem substituir a validação dos fluxos completos.

Atualização de dados complexos e quarentena em `35_complex_source_coverage.md`.
Navegação de registros e sequências restritas de erro em `36_record_navigation.md`;
correção da precisão Money em `37_currency_storage_scale.md`. A regra de numeração de novas
famílias foi reconhecida e validada em recorte gerado com PostgreSQL e navegador
(`40_family_before_insert.md`): somente Salvar cria registro, com numeração
atômica e proteção contra concorrência. O número é atribuído ao salvar, não na
primeira digitação como no lifecycle original. Isso não prova os outros eventos
nem o cadastro familiar completo.

A API de leitura de multivalue passou no campo real MotivoNão e em fixture cujo
ponteiro complexo difere da PK do pai. As nove coleções preservam PK e
sinalização autonumérica físicas. A edição e apresentação desses controles
continuam pendentes (doc35). A leitura estática adicional de parâmetros de
relatórios no IDA 9.3 está em `42_ida_report_filter.md`; não equivale a relatório
executável. A consulta CSPRONT1 já passou pela API gerada em sete casos e 134 colunas
(docs43/44), repetidos no backend completo. Isso fornece dados para a próxima
etapa; ainda não renderiza os relatórios que a utilizam.


## Último gate integrado e correções de escrita

O doc45 registra a primeira execução rejeitada (885/887 colunas) e a nova
execução aprovada, após corrigir armazenamento/DTO/CRUD temporal no doc48.
DateTime físico conserva data, hora e microssegundos; máscara de exibição não
reduz seu armazenamento a TIME/DATE. O banco, servidor e túnel temporários da
validação integrada foram encerrados, com remoção do banco conferida.

- Doc47: MotivoNão aparece como coleção somente leitura, com sete opções da
  fonte e estados de vazio/erro/truncamento. As tabelas internas não recebem
  CRUD; são 45 cadastros principais e 54 tabelas de migração.
- Doc49: POST/PUT genéricos não podem definir/trocar ponteiros internos; não
  constitui suporte à escrita de filhos ou upload de anexos.
- Doc46: edição de PK Double não retorna mais 404 após atualizar com sucesso;
  recarga transacional, conflitos e rollback foram testados separadamente.
- Doc50: metadados e associação dos cinco anexos também passaram no mesmo banco.
  FileTimeStamp/FileFlags/FileURL são NULL em todos os arquivos desta prova.
- Doc51: escrita explícita e transacional da coleção `FrmEncaminhamento.MotivoNão`
  validada via `PUT /api/v1/<modulo>/<id>/collections/<campo>` com controle
  otimista por revisão e sequências de ponteiro e PK filho.
- Doc52: parser `.src` e overlay preservam os 38 controles de `prontuario16`
  (incluindo `Image` e `Rectangle`), `controlDefaults`, `printSettings` e imagem
  compartilhada `logo-SUAS-ICON.png`, confrontados com oráculo nativo PDF em sessão interativa.
- Doc53: capacidades por formulário exportadas em `access-form-capabilities.json`
  conferidas com oráculo COM sintético; não altera a política somente leitura dos painéis familiares.
- Doc54: `migrate` passa a adotar `--auto-number-mode sequence` como padrão,
  validado em PostgreSQL + HTTP para inserts sem ID explícito.
- Doc55: renderer web compilado somente leitura implementado para relatórios
  elegíveis sem VBA/eventos/agrupamento e validado em `prontuario16` +
  `CSPRONT1` (38 controles conferidos com o oráculo `presentation.json`, rota
  `/api/v1/access-reports`, asset `logo-SUAS-ICON.png` por SHA-256, build release
  NgDart sem `[style]` e verificação em navegador Chrome/Playwright).
- Doc56: corrigido o binding `[maxlength]="<%maxLength%>"` em
  `incluir_page.html.mustache` para atender `MaxLengthValidator` (`int`) do `ngforms`
  e compilar via `dart2js` em tabelas com `maxLength` definido.
- Doc57: renderer estendido para todos os 14 relatórios `CSPRONT1` elegíveis
  (`1.806` controles, `CheckBox` booleano, `TextBox` sem vínculo, coordenadas
  omitidas na origem zero / `LayoutCached*` e default opaco de `Rectangle`),
  confrontado com oráculo nativo de 507 controles e validado em PostgreSQL +
  Chrome/Playwright (`prontuario16` e `prontuario4-Condi-Habit`).

Nenhuma dessas provas encerra a meta de reproduzir os 97 formulários, 165
relatórios e todos os fluxos/regras do sistema.
