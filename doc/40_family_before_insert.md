# Numeração de família: BeforeInsert reconhecido integralmente

O formulário real `FrmCadGeral` usa `Form_BeforeInsert(Cancel As Integer)` para atribuir `CodFam = 1` quando `DCount("*", "CadResidencia") < 1`; caso contrário, atribui `DMax("CodFam", "CadResidencia") + 1`. A coluna é chave primária Long sem AutoNumber. Inserir o valor padrão zero não reproduzia esse comportamento.

O gerador reconhece o procedimento inteiro por uma gramática finita: assinatura, condição, dois ramos e encerramento. Exige evento `[Event Procedure]`, tabela direta, chave inteira simples, nomes consistentes, ausência de regra de validação própria no PK e controle de origem desabilitado. Comandos extras, domínio alterado, incremento diferente, procedimento duplicado e proveniência ausente recusam a tradução. Não há interpretação genérica de VBA. `access_behaviors.json` registra SHA-256 do procedimento e propriedades do controle; os demais eventos VBA permanecem explicitamente não implementados.

## Controle e oráculo Access

O controle `CodResid`, vinculado a `CodFam`, exporta `Enabled = NotDefault`. `tools/test_family_number_access.ps1` cria uma base descartável, desabilita um controle e confirma via COM `Enabled=False`, `Locked=False` e o mesmo marcador no SaveAsText. Assim, a ausência de Locked não permite edição pelo usuário. O ensaio verifica DCount/DMax: vazio→1, somente1→2, IDs1/10→11 e exclusão10→2. Remove sua própria base ao terminar; não altera SIGAsul.

Esse oráculo verifica as funções de domínio e a propriedade exportada; não simula digitação nativa para disparar BeforeInsert. A documentação primária esclarece que atribuição programática não dispara o evento: [Microsoft — Form.BeforeInsert](https://learn.microsoft.com/en-us/office/vba/api/access.form.beforeinsert%28even%29).

## Aplicação gerada

O número final é atribuído no clique explícito em Salvar, dentro de uma transação usando exclusivamente `ctx`: `LOCK TABLE ... IN SHARE ROW EXCLUSIVE MODE`, cálculo COUNT/MAX e INSERT. Identificadores SQL são delimitados e escapados. O bloqueio também aguarda INSERTs externos, não apenas outras requisições deste gerador. Falha de gravação reverte a transação sem consumir número. Não se usa sequência porque o comportamento original reutiliza o maior número removido.

O código aparece vazio e somente leitura na inclusão, com “Código definido ao salvar”. Apenas a validação do PK gerado é dispensada na inclusão; os outros campos continuam validados. UPDATE usa o identificador da rota e remove a chave do payload de atualização, impedindo troca do ID. Migração não usa esse alocador e mantém os códigos de origem.

Há uma diferença de momento declarada: no Access, BeforeInsert ocorre no início da digitação; no web, a atribuição definitiva ocorre ao salvar. Não há gravação ou reserva durante a digitação. Form_Load, atalhos de teclado, cmdGravar e outros eventos do FrmCadGeral continuam pendentes.

## Validação reproduzível

- `dart test test/before_insert_allocator_test.dart`: 10 casos, incluindo oito recusas de traduções incompletas/alteradas.
- `dart test test/generation/long/family_allocator_postgres_test.dart`: base PostgreSQL descartável TEMPLATE template0; vazio, gaps, exclusão do máximo, preservação de ID em UPDATE, rollback, dez POST concorrentes e conflito com INSERT externo ainda não commitado.
- `tools/verify_family_allocator_browser.mjs`: Chrome contra API/PG reais da base sintética, sem mocks; testa campo somente leitura, ausência de escrita na digitação, POST somente após Salvar e ID recarregado. O modo `ACCESS_FAMILY_BROWSER_HOLD=1` do teste PG publica porta em `browser.ready.json` e aguarda `browser.done.json`, depois valida a única linha salva e remove servidor/base.
- Analyze das áreas alteradas e frontend gerado limpos; release real verificado com 294 arquivos; 27 regressões de navegação, OpenForm e leitura de origem aprovadas.

A compilação usa `dart run tool/build_release.dart`; nenhum build de 54 módulos é necessário para este teste isolado. Credenciais são fornecidas por variáveis de ambiente da sessão, nunca gravadas no repositório.
