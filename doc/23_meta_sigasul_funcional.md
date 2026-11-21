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
| Dados | Todas as tabelas, anexos e relacionamentos migrados; contagens, valores e integridade comparados com Access/DAO; CRUD persistente validado | 54/54 contagens DAO conferidas: 123.922 registros lógicos. PostgreSQL: 188 colunas, cinco anexos e 55 valores multivalorados iguais ao DAO; um órfão físico preservado em arquivo separado. Auditoria das 887 colunas escalares ainda em andamento |
| Consultas | Dependências e parâmetros resolvidos; resultados comparados com Access, incluindo filtros, JOIN, agregações e ações | Reconciliação textual sem divergências não prova execução PostgreSQL; executor geral pendente |
| Formulários | Os 97 forms e seus subforms, seleção, filtros, ordenação e navegação exercitados | Apenas parte dos forms fornece metadados ao CRUD; não são 97 telas equivalentes |
| Regras | Eventos, macros e VBA executados em Dart com efeitos comparados ao Access | Preservação estrutural melhorada; tradução/execução integral pendente |
| Relatórios | Os 165 reports, agrupamentos, expressões, paginação e saídas comparados ao Access | Inventário e estrutura disponíveis; renderer pendente |
| Operação | Aplicação completa compilada e fluxos reais de cadastro, atendimento, benefícios, encaminhamento e relatórios testados com PostgreSQL | Backend/release compilados; GET de 7.040 pessoas e navegador com 2.869 residências e 16 linhas em dois subforms aprovados, sem writes. Cadastro completo e regras VBA ainda não comprovados |

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
  e descomprime quando necessário, com validação de limites e Adler32. Quatro
  arquivos migrados isoladamente para BYTEA têm os hashes dos originais DAO.
- O release gerado usa uma compilação one-shot e verifica todos os arquivos do
  manifest. A validação de três módulos confirmou 297/297 arquivos.
- O backend serve o release e a API na mesma origem. Conexões de requisições
  usam Zone; inicialização concorrente reutiliza um único pool. Os testes com
  PostgreSQL incluem concorrência, erros e assets com banco indisponível.

Essas evidências estão em `29_sigasul_value_fidelity_audit.md`,
`30_attachment_payload_decode.md` e `31_same_origin_and_request_scope.md`.
Não substituem a validação dos fluxos completos nem comprovam os demais campos
fora das três tabelas auditadas.

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
executável. A consulta CSPRONT1 está sendo preparada para comparação de seus
resultados com DAO antes de integrar relatórios.
