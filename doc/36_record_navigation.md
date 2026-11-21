# Navegação de registro: primeiro incremento funcional

## Contrato confirmado

A Microsoft define `AcRecord`: Previous=0, Next=1, First=2, Last=3, GoTo=4, New=5. O método seleciona o registro atual; `Offset` altera o deslocamento de Next/Previous ou indica posição em GoTo. O conversor não deduz enum pela posição de strings do IDA. Fontes primárias: [AcRecord](https://learn.microsoft.com/en-us/office/vba/api/access.acrecord), [DoCmd.GoToRecord](https://learn.microsoft.com/en-us/office/vba/api/access.docmd.gotorecord).

`tools/test_record_navigation_access.ps1` abre somente um banco temporário criado pelo próprio script, com três IDs sintéticos (10,20,30) e formulário ordenado por ID. O Access real confirmou: First→10, Next→20, Last→30, Previous→20; Next após o último entra em NewRecord, Previous a partir do novo retorna ao último; New não deixa o formulário Dirty e mantém três linhas gravadas. Previous antes do primeiro produz erro e mantém ID10. Banco removido ao final; log em `build/codex-record-navigation-oracle.log`, `TEMP_REMOVED=True`. Nenhum arquivo SIGAsul foi aberto pelo oráculo.

## Escopo implementado

Botões com uma única ação GoToRecord e argumentos `[-1, '', token]` podem navegar no editor gerado. Os tokens 0/1/2/3/5 são reconhecidos explicitamente. No primeiro incremento, condições e ações adicionais eram rejeitadas; a continuação abaixo habilita somente uma sequência exata de erro. Filhos, demais argumentos e offset explícito continuam rejeitados. Comentários estruturais continuam preservados.

A forma precisa usar tabela direta, PK inteira única, propriedades disponíveis, sem filtro, OrderBy, restrições de edição/inclusão ou eventos de lifecycle ainda não migrados. Eventos de controles além de OnClick também bloqueiam. PK textual/composta/ausente é recusada. O status é `partial_record_navigation`, não equivalência completa de janela Access.

O repository ordena a consulta por identificador de chave validado. A consulta frontend pede o conjunto completo, sem enviar `limit` ou `offset`; o serviço aceita filtros opcionais mantendo chamadas anteriores compatíveis. O editor recebe o snapshot da consulta e valida chaves inteiras, únicas e crescentes antes de navegar. Não mistura páginas nem assume que um limite de 50 represente todos os registros. Uma futura paginação exige novo contrato de cursor.

Mudanças no draft, anexos pendentes e salvamento em curso impedem navegação. Os avisos de navegação são visíveis inline. O helper geral `SimpleDialogComponent.showAlert` era vazio no primeiro incremento; a continuação descrita abaixo corrige os diálogos chamados por ações explícitas. Novo e Next após o último apenas preparam um draft; nenhum POST é disparado. Salvar continua sendo uma ação separada do usuário.

O snapshot corresponde à última consulta, não é um cursor transacional vivo do Access. Ordem crescente da chave é uma escolha explícita do cadastro gerado; formulários com ordem original declarada ainda não suportada ficam bloqueados.

## Cobertura real e limites

Das 149 ações GoToRecord do overlay SIGAsul, 60 aparecem sozinhas; 81 em `OnError → GoToRecord → MsgBox`; 5 ainda têm GoToControl; 3 têm GoToRecord e MsgBox. Não basta contar uma ação reconhecida para declarar a macro inteira migrada. [OnError](https://support.microsoft.com/en-us/access/onerror-macro-action) possui política de continuação e tratamento de erros; essas sequências permaneceram bloqueadas no primeiro lote; a continuação abaixo habilita o padrão exato com guardas preservadas.

O teste real usa `FrmNomeAcolhida`: BTPRIM executa First; BTULT executa Last **apesar da legenda original Próximo**. O argumento é a autoridade, não o nome ou a legenda do botão. As macros reais Previous e New dessa forma ficaram bloqueadas no primeiro lote; agora o padrão exato de erro é aceito conforme descrito abaixo. `FrmGestantes` não foi usado como caso elegível porque seu controle Nometxt tem OnGotFocus VBA.

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


## Continuação: alerta real e confirmação explícita

`showAlert(String, {String? subMessage})` mantém a assinatura `void` existente e usa `window.alert` com texto; `showConfirm` devolve o resultado booleano de `window.confirm`. Texto não vira HTML e nenhuma expressão VBA é executada. Os únicos usos de alerta no gerador são validação/erro no fluxo de Salvar acionado pelo usuário, sem diálogo em inicialização automática.

Ao bloquear navegação por alterações pendentes, aparece **Descartar alterações e navegar**. Clicar abre confirmação. Cancelar mantém draft, registro atual e navegação pendente. Confirmar restaura o draft salvo em memória, limpa arquivos de anexo ainda não enviados e executa o comando de navegação pendente. Nenhum endpoint de gravação é chamado. Não se traduzem MsgBox nem sequências OnError por esse helper genérico.

Chrome/Playwright confirmou: ausência de diálogo no carregamento, dois diálogos de confirmação (Cancelar e Confirmar), um alerta de validação ao clicar Salvar com nome obrigatório vazio, manutenção do texto e do registro ao cancelar, descarte e avanço ao confirmar, **zero writes e zero erros JavaScript**. O snapshot da API tem apenas dados sintéticos. Os 16 testes de geração/regressão passaram novamente; análise do gerador/teste e frontend gerado limpa; release de 293 arquivos verificado.


## Continuação: sequência exata de erro

O gerador reconhece integralmente apenas:

1. `OnError` com argumentos `['0']`, sem condição.
2. `GoToRecord` com `['-1', '', token]`, sem condição.
3. `MsgBox` com `['=[MacroError].[Description]', '-1', '0']` e condição **exatamente** `[MacroError]<>0`.

Comentários `_AXL` são dados preservados. Qualquer ação adicional, alteração da condição, modo diferente de OnError, mensagem diferente, argumento extra ou filhos mantém o comando bloqueado. Não há `eval` nem executor genérico de expressões Access. Inventário registra `errorPolicy: alert_macro_error`; o status continua parcial. O som/estilo da janela nativa Access não é reproduzido.

O erro de navegação é local à chamada, com número 2105 no limite validado e uma descrição legível. O alerta só aparece no ramo com erro e política reconhecida; sucesso não herda erro anterior. Guardas de draft, snapshot e lifecycle são verificadas antes do comando, sem serem inventadas como erros do Access. A confirmação de descarte mantém a política do comando pendente.

### Oráculo e sua limitação

`tools/test_macro_error_access.ps1` importa uma macro controlada por `LoadFromText` em banco temporário de duas linhas. Para observar a condição sem prender a sessão SSH num modal, substitui **somente o terceiro efeito MsgBox** por `SetTempVar ObservedError = [MacroError].[Number]`. Quatro execuções alternadas confirmaram 2105, 0, 2105, 0; o registro após cada execução foi ID10. Assim confirma continuação OnError0, teste condicional e ausência de erro herdado entre invocações. O banco foi removido (`TEMP_REMOVED=True`); log `build/codex-macro-error-oracle.log`.

Uma tentativa separada de MsgBox nativo literal bloqueou no desktop isolado do COM via SSH; o watcher de janelas não conseguiu acessar o modal. O processo criado exclusivamente pelo teste foi identificado e encerrado, e seu diretório temporário removido. A limitação está registrada em `build/codex-macro-native-modal-limitation.log`. **Não se afirma validação visual do MsgBox nativo do Access.** A janela de alerta do frontend foi testada de fato no Chrome.

### Cobertura observada

As 81 sequências são o universo estrutural, não a cobertura habilitada: os filtros e eventos de lifecycle excluem a maior parte. Auditoria de metadados identificou duas formas candidatas (`FrmBuscaAtiva`, `FrmNomeAcolhida`) antes da seleção final de módulos. O scaffold/teste real desta rodada comprova `FrmNomeAcolhida`, com os cinco comandos originais: First, Last, Previous com erro condicional, Next sem erro herdado e New sem gravação.

Passaram **22 testes** de geração/regressão, incluindo seis mutações negativas da sequência; análise estática limpa; release com **293 arquivos**. Chrome confirmou um alerta por falha de Previous, nenhum alerta no Next bem-sucedido seguinte, descarte Cancel/Accept, validação ao Salvar inválido e **zero writes/zero erros JavaScript**. O mock agora exige a rota real `/api/v1/tb_nome_acolhida`, impedindo que o antigo erro kebab/snake de endpoints fique oculto por interceptação ampla. GoToControl, outras condições/mensagens e execução geral de VBA/macros continuam pendentes.
