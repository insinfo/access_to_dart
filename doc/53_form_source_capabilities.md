# 53 — Propriedades e capacidades por formulário

## Inventário e oráculo

A inspeção do código e do snapshot integrado mostrou que `AccessSrcForm.properties`, `_parseForm`, `toJson` e o overlay já preservavam propriedades raiz. Não havia perda a corrigir nesses pontos. O novo teste compara todas as propriedades dos **97 formulários SIGA**, antes e depois do overlay, e lê o artefato do scaffold efetivamente gerado. Propriedades de controles permanecem isoladas das propriedades do formulário.

O script sintético `tools/test_form_capabilities_access.ps1` cria formulários no Access, consulta valores COM, salva com SaveAsText e remove o banco temporário. Ele confirmou:

| Propriedade COM | Default omitido no export | Export diferente do default |
| --- | --- | --- |
| AllowEdits / AllowAdditions / AllowDeletions | true | false = `NotDefault` |
| DataEntry | false | true = `NotDefault` |
| RecordsetType | 0 | 1 e 2 são exportados como **AllowUpdating=1/2** |

`NotDefault` depende do default da propriedade: não significa sempre true. A primeira tentativa do oráculo revelou o alias AllowUpdating; o contrato final foi construído sobre o resultado observado. O teste final passou para modos 0, 1 e 2, com `TEMP_REMOVED=True`.

## Contrato e limites

O gerador escreve `access-form-capabilities.json` e o referencia no conversion-report. Para cada formulário preserva propriedades raw, permissões de fonte, DataEntry, RecordsetType, eventos do ciclo de escrita na raiz e nos controles, diagnósticos e status `requires_form_specific_validation`.

Defaults por ausência só são inferidos quando existe o formulário correspondente no source_overlay. Nesse caso, o export é autoritativo para as propriedades raiz, inclusive as omitidas por serem default; propriedades binárias herdadas não substituem esse fato. Sem export, uma propriedade ausente permanece desconhecida. Valores desconhecidos e aliases conflitantes geram diagnóstico. Snapshot (RecordsetType 2) não autoriza operações de escrita.

As permissões são **por formulário**, não por tabela. Não provam que RecordSource seja atualizável, que regras VBA estejam implementadas, que controles sejam editáveis ou que exista endpoint específico validado. O contrato não altera permissões globais nem habilita escrita em subforms.

## Subforms de CadResidencia

| Formulário | Fonte | AllowAdditions / Edits / Deletions | BeforeInsert / BeforeUpdate declarados |
| --- | --- | --- | --- |
| COMPOSIÇÃO FAMILIAR SUBFORM | Projeção simples de TbPessoa | true / true / true, defaults do export | nenhum |
| CadResidAtualizacao subformulário | Projeção simples de CadResidAtualizacao | true / true / true, defaults do export | nenhum |
| FrmCadGeral, pai | CadResidencia | true / true / true, defaults do export | BeforeInsert `[Event Procedure]` |

Composição familiar tem Form_Load configurando KeyPreview e Form_KeyDown bloqueando Enter. Atualização residencial tem evento de clique que copia `.Column(1)` de um combo. Ausência de BeforeInsert/BeforeUpdate não significa ausência de regras ou comprovação de escrita fiel. O BeforeInsert do pai tem tratamento específico do allocator previamente implementado; o novo inventário apenas registra o evento e não reinterpreta seu VBA.

`BASE MUNICIPAL COMPLETA` e `RETORNO PARA ACOMPANHAMENTO` declaram as três permissões como NotDefault, portanto false/false/false. Isso não bloqueia outras telas que consultem as mesmas tabelas.

Os painéis familiares continuam somente consulta. Não foi acrescentado um botão de gravação ou uma política de tabela a partir dessa evidência. O contrato agora permite implementar guard por formulário quando o fluxo de escrita e os eventos correspondentes forem validados.

## Verificação

- Oráculo COM sintético: defaults, toggles e três modos RecordsetType passaram, cleanup confirmado; log privado `build/codex-form-capabilities-access.log`.
- `dart test test/access_form_capabilities_test.dart --reporter expanded`: valida defaults/unknowns, isolamento raiz/controles, eventos, preservação dos 97 forms e JSON emitido.
- `dart analyze lib/src/access_form_capabilities.dart lib/src/project_generator/project_generator.dart test/access_form_capabilities_test.dart`: sem problemas.
- Não foi necessária alteração Angular nem repetição da migração integral: esta etapa adiciona contrato e diagnóstico, não muda execução de UI ou dados.
