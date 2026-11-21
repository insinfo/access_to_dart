# SIGAsul: preservação de macros e vínculos VBA

## Lacuna corrigida

O leitor SaveAsText guardava somente os nomes `Action` em `macros`. As propriedades `Argument` repetidas eram sobrescritas no mapa de propriedades, perdendo destino, filtro, modo de abertura e argumentos vazios posicionais. Condições não chegavam ao resultado. Vínculos como `OnClick="[Event Procedure]"` e o arquivo `.cls` associado também não eram preservados pelo overlay textual.

Exemplo real: `FrmBeneficios.Comando674` executa `OpenForm` com argumentos `['Impressões Referentes a Benefícios', '0', '', '', '-1', '0']`. Antes, o resultado só continha `['OpenForm']`, insuficiente para reconstruir sequer qual formulário abrir.

Agora forms, reports e seus controles conhecidos têm campos aditivos:

```json
{
  "macros": {"OnClickEmMacro": ["OpenForm"]},
  "macroDefinitions": {
    "OnClickEmMacro": [{
      "type": "_Anonymous",
      "action": "OpenForm",
      "condition": null,
      "arguments": ["Impressões Referentes a Benefícios", "0", "", "", "-1", "0"],
      "properties": {},
      "children": []
    }]
  },
  "events": {"OnClick": "[Event Procedure]"}
}
```

O exemplo mostra o formato dos campos; o mesmo controle não precisa ter macro embutida e event procedure simultaneamente. `macros` mantém compatibilidade. `macroDefinitions` preserva ordem, argumentos vazios, condição, tipo do nó, propriedades adicionais e filhos. Um nó com `action=null` pode ser comentário XML `_AXL` ou agrupamento; não deve ser executado como ação. A ausência de condição não transforma automaticamente uma macro condicional em navegação irrestrita.

Forms carregam o arquivo irmão `<nome>.cls` em `rawVbaCode`, sem traduzir ou modificar o conteúdo. O overlay propaga esses campos para `analysis.forms`, além de `source_overlay`. Valores inexistentes não apagam código/eventos binários; mapas mesclam eventos por nome. Reports usam a mesma preservação de macros/eventos no merger existente.

## Inventário real e conferência

A contagem textual independente dos arquivos `.bas`/`.cls` foi comparada com `tools/audit_src_behavior.dart`, que percorre o modelo efetivamente lido:

| Conteúdo SIGAsul | Fonte exportada | Preservado pelo leitor |
|---|---:|---:|
| Forms | 97 | 97 |
| Arquivos code-behind `.cls` | 61 | 61 |
| Macros embutidas em forms/controles | 440 | 440 |
| Ações de macros de forms/controles | 611 | 611 |
| Vínculos `[Event Procedure]` | 296 | 296 |
| Reports `.bas` | 164 | 164 |
| Macros/ações de reports (`Maximize`) | 45 | 45 |

Os 61 `.cls` contêm 318 declarações Sub/Function contadas lexicalmente. Há quatro módulos `.bas` com sete declarações; esse inventário não prova tradução ou extração binária equivalente. O catálogo DAO/binário de reports contém 165 objetos: o export fornece apenas 164 `.bas`. Não se apresenta 164 como cobertura dos 165.

Distribuição das 611 ações de forms:

| Ação | Ocorrências |
|---|---:|
| OpenReport | 149 |
| GoToRecord | 149 |
| MsgBox | 89 |
| OnError | 86 |
| OpenForm | 75 |
| RunCommand | 28 |
| GoToControl | 24 |
| Close | 4 |
| SearchForRecord | 4 |
| OpenQuery | 2 |
| Maximize | 1 |

Os 296 vínculos: OnClick 180, OnGotFocus 12, OnLoad 21, OnKeyDown 2, OnKeyPress 16, AfterUpdate 25, OnChange 16, OnOpen 4, OnClose 13, BeforeInsert 1, BeforeUpdate 6.

## Suporte efetivo versus pendências

**Concluído nesta mudança:** preservação estrutural da totalidade desses contadores no export de SIGAsul. Os testes exercitam `analyze --src` real, verificando os argumentos em `source_overlay` e no form final; também verificam `Condition=[MacroError]<>0` com MsgBox em FrmAcolhidaColetiva, conteúdo exato de DIARIO SUBFORM.cls e vínculos de eventos.

**Não concluído:** execução equivalente de macros no navegador/backend. O gerador ainda não consome `macroDefinitions`/`events` para implementar essas 656 ações. Abrir report, navegar registros, executar query de ação, interpretar filtros e tratar erros exigem consumidores e testes próprios. Não existem 656 ações convertidas apenas porque agora são preservadas.

O `rawVbaCode` do overlay não é automaticamente injetado em `canonical_analysis`. A extração atual de regras de validação VBA usa heurísticas de nomes/mensagens, como presença de “informe”, CPF ou email; isso não equivale a compilar as 318 procedures, suas condições e efeitos. Não se ampliou essa inferência para atribuir regras de negócio sem prova. As sete procedures de módulos, DAO/Recordset, DoCmd, eventos BeforeUpdate e cancelamento exigem auditoria e tradução explícitas. Código VBA inline em `.bas` sem `.cls` irmão continua fora desta nova trilha de code-behind.

Outros tipos de controle não reconhecidos pelo leitor podem conter comportamento em outros bancos; os contadores exatos desta fixture não demonstram suporte universal. Propriedades e argumentos são dados do Access, nunca código confiável para interpolar ou executar diretamente. Renderer de reports, layout, paginação e agregação continuam fora desta correção.

## Validação reproduzível

```text
dart run tools/audit_src_behavior.dart fixtures/SIGAsul.accdb.src
dart test test/access_src_behavior_test.dart test/access_src_continuation_test.dart test/access_src_scaffold_test.dart test/access_src_reports_test.dart test/access_src_report_grouping_test.dart
dart analyze lib/src/access_src_model.dart lib/src/access_src_reader.dart lib/src/analysis_overlay_merger.dart test/access_src_behavior_test.dart tools/audit_src_behavior.dart
```

Os dois testes novos falharam na versão anterior por ausência de macroDefinitions/condições. Com a mudança, os dez testes desses cinco arquivos passam. Contagem de preservação não é métrica de execução funcional; a meta de migração completa exige testar os fluxos reais e os efeitos de cada evento.
