Responda sempre em portugues.

Regras permanentes deste workspace:

- Nunca corrija arquivos gerados em `build/` para resolver defeitos do produto final. Corrija o gerador, os templates ou a pipeline de analise que produziu o artefato.
- Em AngularDart/NgDart, nunca emita atributos customizados crus como `data-access-*` em elementos nativos. Quando um atributo customizado for realmente necessario no template, use binding explicito no formato `[attr.data-access-nome]="'valor'"`.
- Em AngularDart/NgDart, nunca use `[style]="variavel"` para estilo dinamico e evite usar `class` como mecanismo de logica visual ad hoc. Quando houver comportamento visual reutilizavel ou dinamico, crie uma diretiva propria.
- Ao corrigir problemas de scaffold frontend, valide com `dart analyze lib` e com compilacao real via `dart run webdev build`.
- Testes de componentes frontend em NgDart devem ser executados com `dart run build_runner test`.
- Sempre escape `$` de forma segura ao gerar literais Dart a partir de dados externos, metadados do Access, SQL, formatos e textos vindos do `.accdb` ou do `.accdb.src`.
- Ao implementar melhorias de forms/reports do Access, priorize fidelidade estrutural: tipo real de controle, ordem visual, agrupamentos, captions e semantica original antes de cosmetica.
- Em integracoes com PostgreSQL usando o pacote `postgres` 3.x, use `connection.runTx(...)` para transacoes e nao emita `BEGIN` / `COMMIT` manualmente.
- Dentro de `connection.runTx((session) async { ... })`, use apenas o `TxSession session` fornecido pelo callback para executar statements transacionais.
- Ao criar bancos locais de validacao PostgreSQL, prefira `TEMPLATE template0` para evitar falhas ligadas a `template1` e `collation version`.
