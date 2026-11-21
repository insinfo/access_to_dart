# Navegação de registro: primeiro incremento funcional

## Contrato confirmado

A Microsoft define `AcRecord`: Previous=0, Next=1, First=2, Last=3, GoTo=4, New=5. O método seleciona o registro atual; `Offset` altera o deslocamento de Next/Previous ou indica posição em GoTo. O conversor não deduz enum pela posição de strings do IDA. Fontes primárias: [AcRecord](https://learn.microsoft.com/en-us/office/vba/api/access.acrecord), [DoCmd.GoToRecord](https://learn.microsoft.com/en-us/office/vba/api/access.docmd.gotorecord).

`tools/test_record_navigation_access.ps1` abre somente um banco temporário criado pelo próprio script, com três IDs sintéticos (10,20,30) e formulário ordenado por ID. O Access real confirmou: First→10, Next→20, Last→30, Previous→20; Next após o último entra em NewRecord, Previous a partir do novo retorna ao último; New não deixa o formulário Dirty e mantém três linhas gravadas. Previous antes do primeiro produz erro e mantém ID10. Banco removido ao final; log em `build/codex-record-navigation-oracle.log`, `TEMP_REMOVED=True`. Nenhum arquivo SIGAsul foi aberto pelo oráculo.

## Escopo implementado

Botões com uma única ação GoToRecord e argumentos `[-1, '', token]` podem navegar no editor gerado. Os tokens 0/1/2/3/5 são reconhecidos explicitamente. Condições, ações adicionais, filhos, outros argumentos e offset explícito são rejeitados. Comentários estruturais continuam preservados.

A forma precisa usar tabela direta, PK inteira única, propriedades disponíveis, sem filtro, OrderBy, restrições de edição/inclusão ou eventos de lifecycle ainda não migrados. Eventos de controles além de OnClick também bloqueiam. PK textual/composta/ausente é recusada. O status é `partial_record_navigation`, não equivalência completa de janela Access.

O repository ordena a consulta por identificador de chave validado. A consulta frontend pede o conjunto completo, sem enviar `limit` ou `offset`; o serviço aceita filtros opcionais mantendo chamadas anteriores compatíveis. O editor recebe o snapshot da consulta e valida chaves inteiras, únicas e crescentes antes de navegar. Não mistura páginas nem assume que um limite de 50 represente todos os registros. Uma futura paginação exige novo contrato de cursor.

Mudanças no draft, anexos pendentes e salvamento em curso impedem navegação. Os avisos são visíveis inline: o helper geral `SimpleDialogComponent.showAlert` atualmente é vazio e não foi usado para esconder erros desta funcionalidade. Novo e Next após o último apenas preparam um draft; nenhum POST é disparado. Salvar continua sendo uma ação separada do usuário.

O snapshot corresponde à última consulta, não é um cursor transacional vivo do Access. Ordem crescente da chave é uma escolha explícita do cadastro gerado; formulários com ordem original declarada ainda não suportada ficam bloqueados.

## Cobertura real e limites

Das 149 ações GoToRecord do overlay SIGAsul, 60 aparecem sozinhas; 81 em `OnError → GoToRecord → MsgBox`; 5 ainda têm GoToControl; 3 têm GoToRecord e MsgBox. Não basta contar uma ação reconhecida para declarar a macro inteira migrada. [OnError](https://support.microsoft.com/en-us/access/onerror-macro-action) possui política de continuação e tratamento de erros; essas sequências permanecem bloqueadas neste lote.

O teste real usa `FrmNomeAcolhida`: BTPRIM executa First; BTULT executa Last **apesar da legenda original Próximo**. O argumento é a autoridade, não o nome ou a legenda do botão. As macros reais Previous e New dessa forma permanecem bloqueadas porque são compostas. `FrmGestantes` não foi usado como caso elegível porque seu controle Nometxt tem OnGotFocus VBA.

O navegador testa os outros três comandos com botões sintéticos explícitos no mesmo scaffold. Isso não demonstra que 149 ações ou 97 formulários estejam funcionais. Próximo incremento: executar integralmente as sequências OnError/GoToRecord/MsgBox reconhecidas, com oráculo do estado MacroError, sem descartar a política de erros. GoToControl e GoTo com offset continuam pendentes.

## Validação

- `test/access_record_navigation_test.dart`: geração CLI com formulário real, ações únicas, rejeição de condição, sequência, lifecycle, filtro, ordem, PK textual/composta/ausente.
- Regressão `test/access_openform_navigation_test.dart`: seis casos passaram; conjunto com persistência do scaffold totalizou 16 testes.
- `dart analyze` do gerador/teste e `dart analyze lib` do frontend gerado: sem problemas.
- Build real via `tool/build_release.dart`: **293 arquivos verificados** no scaffold de um módulo, `build/codex-record-navigation-final/app/frontend/build`.
- `tools/verify_record_navigation.mjs`: Chrome/Playwright com API sintética isolada, sem banco real. Passaram First/Last reais, Next/Previous/New sintéticos, extremos, bloqueio de draft alterado, rejeição de snapshot fora de ordem, ausência de query de paginação e **zero writes/zero erros JavaScript**.

Reprodução do scaffold e navegador:

```bat
set ACCESS_RECORD_NAV_OUTPUT=build\codex-record-navigation-final
dart test test/access_record_navigation_test.dart
cd build\codex-record-navigation-final\app\frontend
dart pub get
dart analyze lib
dart run tool/build_release.dart
```

```sh
PLAYWRIGHT_MODULE=/caminho/playwright-core/index.mjs node tools/verify_record_navigation.mjs /caminho/frontend/build
```

O build integral de 50 módulos e o banco SIGAsul não foram necessários para esses testes de navegação. A limitação antiga de filtros/paginação ignorados no backend não foi apresentada como suporte a filtros originais.
