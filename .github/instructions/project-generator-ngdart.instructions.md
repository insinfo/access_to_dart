---
applyTo: "lib/src/project_generator/**/*.dart,lib/src/project_generator/templates/frontend/**/*.mustache,test/generation/**/*.dart"
description: "Use when editing the Access->Dart project generator, frontend templates, or generation tests; enforce fixing the generator instead of generated files, NgDart-safe template bindings like [attr.data-access-*], safe Dart $ escaping, build_runner test for NgDart component tests, and preserving Access form/report fidelity."
---

Ao trabalhar no gerador Access -> Dart deste repositorio:

- Nunca corrija arquivos gerados em `build/` como solucao final. Corrija `lib/src/project_generator/**`, os templates em `lib/src/project_generator/templates/**`, ou a analise que alimenta o gerador.
- Em templates NgDart, nunca emitir atributos customizados crus como `data-access-*` em elementos nativos. Se o atributo customizado for realmente necessario, use binding de atributo no formato `[attr.data-access-nome]="'valor'"`.
- Em templates NgDart, nunca usar `[style]="variavel"` para estilizacao. Para comportamento visual reutilizavel ou logica de apresentacao, criar diretiva propria.
- Sempre escape `$` com seguranca quando gerar literais Dart a partir de SQL, `RowSource`, `Format`, `InputMask`, `ValidationText`, captions, hints ou qualquer string externa.
- Para testes de componentes do frontend NgDart, usar `dart run build_runner test`.
- Ao evoluir o scaffold, priorize estes proximos passos estruturais:
  1. Propagar tipo real de controle do Access para o scaffold e distinguir textbox, combobox, listbox, checkbox e textarea.
  2. Extrair agrupamentos e ordem visual mais fortes a partir do `.accdb.src` para sair do grid uniforme.
  3. Abrir trilha equivalente para reports, com inventario de controles e secoes.
- Sempre validar mudancas de frontend gerado com `dart analyze lib` e `dart run webdev build` no scaffold produzido.