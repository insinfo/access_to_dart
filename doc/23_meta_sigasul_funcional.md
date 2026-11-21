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
| Dados | Todas as tabelas, anexos e relacionamentos migrados; contagens, valores e integridade comparados com Access/DAO; CRUD persistente validado | 50/50 contagens DAO conferidas em migração estrita; valores e conteúdo de anexos ainda precisam de comparação |
| Consultas | Dependências e parâmetros resolvidos; resultados comparados com Access, incluindo filtros, JOIN, agregações e ações | Reconciliação textual sem divergências não prova execução PostgreSQL; executor geral pendente |
| Formulários | Os 97 forms e seus subforms, seleção, filtros, ordenação e navegação exercitados | Apenas parte dos forms fornece metadados ao CRUD; não são 97 telas equivalentes |
| Regras | Eventos, macros e VBA executados em Dart com efeitos comparados ao Access | Preservação estrutural melhorada; tradução/execução integral pendente |
| Relatórios | Os 165 reports, agrupamentos, expressões, paginação e saídas comparados ao Access | Inventário e estrutura disponíveis; renderer pendente |
| Operação | Aplicação completa compilada e fluxos reais de cadastro, atendimento, benefícios, encaminhamento e relatórios testados com PostgreSQL | Backend completo compilado; GET real de 7.040 pessoas aprovado. Demais fluxos completos ainda não comprovados |

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
- Promover dados suficientes ao scaffold não implementa vínculo pai/filho,
  lifecycle VBA, formulários sem RecordSource nem múltiplas telas por tabela.
- Completar lookups com JOIN/WHERE, parâmetros de forms e exibição multicoluna.
- Consumir macros/eventos e traduzir regras sem substituir lógica real por
  mensagens ou validadores heurísticos.
- Implementar relatórios e verificar o sistema completo em navegador com banco
  real. Cada limitação permanece aberta até existir evidência correspondente.

Relatórios específicos: `20_sigasul_behavior_preservation.md`,
`21_dependencias_e_forms_sql_sigasul.md` e `22_sigasul_backend_lookup_sources.md`.

Migração estrita e leitura HTTP integral detalhadas em `27_sigasul_migracao_integral.md`.
