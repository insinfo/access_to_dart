# 56 — Correção do binding `[maxlength]` no template NgDart (`incluir_page.html.mustache`)

## Causa raiz

Em `ngforms 5.0.0-dev.3` (`lib/src/directives/validators.dart`), a diretiva
`MaxLengthValidator` usa o seletor `[maxlength][ngControl], [maxlength][ngFormControl], [maxlength][ngModel]`
e declara `@Input('maxlength') set maxlength(int value)` (gerenciando internamente
`@HostBinding('attr.maxlength') late String maxLengthAttr`).

`lib/src/project_generator/templates/frontend/incluir_page.html.mustache` emitia o
atributo cru `maxlength="<%maxLength%>"` em `<textarea>` e `<input>`. Isso fazia o
compilador de templates do NgDart atribuir a string `'255'` a um `@Input` tipado
como `int`, causando falha de compilação no `dart2js` (`dart run tool/build_release.dart`)
para qualquer coluna textual com `maxLength` preenchido:

```
Error: A value of type 'String' can't be assigned to a variable of type 'int'.
```

## Alteração

- `lib/src/project_generator/templates/frontend/incluir_page.html.mustache`:
  substituídas ambas as ocorrências (`<textarea>` e `<input>`) de
  `maxlength="<%maxLength%>"` por `[maxlength]="<%maxLength%>"`.
- `test/generation/fast/generate_emits_scaffold_test.dart`: ajustada a asserção
  de template para `[maxlength]="255"`.

## Validação

- `dart test test/generation/fast/generate_emits_scaffold_test.dart`: passou.
- `test/generation/long/report16_postgres_browser_test.dart`: restaurado
  `'maxLength': 255` em `TbUnidade.NOME` / `TbPessoa.NOME` e `'maxLength': 100`
  em `TbPessoa.Parentesco`; `dart analyze lib` e `dart run tool/build_release.dart`
  (`dart2js`) no frontend gerado passaram sem erros.
