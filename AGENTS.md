# Regras Operacionais do Repositorio

## Prioridades

1. Corrigir a origem do problema no gerador.
2. Validar no scaffold gerado real.
3. So depois ajustar testes e documentacao.

## Geracao de codigo

- Nunca editar arquivos gerados em `build/` como solucao definitiva.
- Toda correcao em backend, frontend, core ou SQL gerado deve acontecer em `lib/src/project_generator/**`, templates associados ou pipeline de analise.
- Sempre tratar strings emitidas para Dart como potencialmente perigosas para interpolacao. Escape `$`, aspas e demais caracteres relevantes no contexto correto.
- Sempre tratar strings emitidas para HTML como dados de atributo/texto e aplicar escape apropriado ao contexto.

## NgDart / AngularDart

- Nao emitir `data-access-*` cru em elementos HTML nativos.
- Quando um atributo HTML customizado for necessario, usar `[attr.data-access-nome]="'valor'"`.
- Nao usar `[style]="variavel"` para compor estilo dinamico.
- Nao concentrar logica visual em concatenacao opportunista de `class`; quando o comportamento for reutilizavel ou semantico, criar uma diretiva propria.
- Toda mudanca relevante em templates deve ser validada com `dart analyze lib` e `dart run webdev build`.
- Testes de componentes frontend devem usar `dart run build_runner test`.

## Fidelidade Access

- Propagar tipo real de controle do Access para o scaffold sempre que possivel para distinguir textbox, combobox, listbox, checkbox e textarea.
- Usar controles reais do `.accdb.src` para melhorar ordem, agrupamentos, captions e hierarquia visual dos forms.
- Abrir trilha equivalente para reports usando inventario de controles, secoes e ordem estrutural.

## Regra de ouro

- Se o bug aparece no app gerado, a correcao deve nascer no gerador.

## PostgreSQL

- Ao criar bancos PostgreSQL locais para validacao, preferir sempre `TEMPLATE template0`, especialmente quando houver risco de mismatch de `collation version` no `template1`.
- No driver Dart `postgres` 3.x, transacoes devem usar `connection.runTx(...)` em vez de emitir `BEGIN` / `COMMIT` manualmente.
- Dentro de `connection.runTx((session) async { ... })`, usar apenas o `TxSession session` recebido no callback para executar statements transacionais. Nao misturar `connection.execute(...)` com `session.execute(...)` dentro da mesma transacao.
