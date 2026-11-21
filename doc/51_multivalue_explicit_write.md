# Edição explícita da coleção MotivoNão

## Fonte e limite de reconhecimento

O incremento adiciona escrita transacional a `FrmEncaminhamento.MotivoNão`, cujo controle exportado é ComboBox, Value List, uma coluna e `LimitToList=NotDefault`, com sete opções. A fonte é `fixtures/SIGAsul.accdb.src/forms/FrmEncaminhamento.bas`, SHA-256 `9d64dd673dcd04f1f641d2afe1cb700038a837e670ed7a78ceab600b1d201ea6`.

A capacidade só é emitida quando há export comprovado do form/controle, vínculo físico único, PK simples do filho AutoNumber inteiro e valor Text. O controle deve permitir edição, não estar Locked/Disabled, não ter eventos/macros próprios, usar BoundColumn/ColumnCount 1 e opções distintas não vazias. AllowEdits desativado também impede a edição. Formatos desconhecidos são recusados. Os outros campos multivalorados sem controle exportado continuam sem interface inventada; nenhuma tabela sintética ganha CRUD público.

O painel avisa que esta operação salva somente a coleção, separadamente dos demais campos, e que não executa os outros eventos VBA do formulário. Não representa equivalência completa do ciclo de eventos do Access.

## Oráculo Access controlado

`tools/test_multivalue_write_access.ps1` cria exclusivamente uma base temporária com campo DAO dbComplexText (109), pais sintéticos e ComboBox Value List. Não abre nem altera dados SIGAsul. A fixture é removida no finally.

Resultados reproduzidos:

- inserção de valores distintos e remoção de toda a seleção persistem;
- duplicatas, inclusive `ONE`/`one`, são rejeitadas pelo Access;
- escrita DAO aceita `OUTSIDE` mesmo quando a interface tem LimitToList: a restrição da interface não deve ser confundida com validação do armazenamento;
- atribuição COM `$null` tornou-se texto vazio, não demonstrou VT_NULL;
- atribuição `[DBNull]::Value` falhou no binder COM. Isso **não prova** que DAO rejeita Null. Tentativa adicional via módulo VBA/Run bloqueou; o processo temporário identificado foi encerrado, a fixture removida, sem alterar configurações de confiança. Semântica de inserção de um filho Null permanece não estabelecida.

Por isso o contrato web aceita somente strings exatas das sete opções e `[]` para nenhuma seleção. Valores legados Null, vazios, desconhecidos, repetidos ou uma coleção truncada permanecem legíveis, mas não editáveis por esta operação. Não são descartados automaticamente.

Referências primárias: [campos multivalorados com DAO](https://learn.microsoft.com/en-us/office/vba/access/concepts/data-access-objects/manipulate-multivalued-fields-with-dao), [DataTypeEnum](https://learn.microsoft.com/en-us/office/client-developer/access/desktop-database-reference/datatypeenum-enumeration-dao) e [Recordset2.AddNew](https://learn.microsoft.com/en-us/office/client-developer/access/desktop-database-reference/recordset2-addnew-method-dao).

## API, transação e alocadores

`PUT /api/v1/<modulo>/<id>/collections/<campo>` recebe apenas `{values: [...], revision: "..."}`. A revisão é a serialização Base64 dos IDs/valores já visíveis no GET, usada para controle otimista; não é token de autorização nem contém o ponteiro físico. Payload com outros campos, duplicatas, Null ou opções desconhecidas é recusado.

Toda a gravação usa o `ctx` da mesma transação. O pai é bloqueado com `FOR UPDATE`, a coleção é relida e a revisão comparada. Uma edição desatualizada retorna 409. Ponteiro compartilhado por outro registro também é recusado. Valores mantidos conservam IDs filhos; removidos são excluídos; novos recebem a PK pelo DEFAULT sequencial já migrado. Falha de qualquer etapa desfaz tanto a alteração do pai quanto todos os filhos.

Para pai com ponteiro NULL, seleção vazia não aloca nada. Primeira seleção não vazia usa `nextval` de sequência própria, sem aceitar ponteiro do cliente. Limpar uma coleção existente conserva seu ponteiro. O guard do CRUD genérico do pai continua impedindo substituição do ponteiro por POST/PUT comum.

A migração cria a sequência de ponteiro inteira, sem ciclo, com nome determinístico de tamanho limitado e independente de colisões na normalização de nomes. A sincronização de migração considera ponteiros existentes nos pais **e nos filhos órfãos**, preserva o valor já consumido da sequência e não a rebobina. O endpoint nunca usa MAX+1 nem cria DDL em runtime. Lacunas de sequência após rollback são esperadas.

A escrita exige migração com `--auto-number-mode sequence`, DEFAULT `nextval` válido no PK filho e sequência própria de ponteiro presente. O GET verifica essas condições no catálogo PostgreSQL; sem elas informa somente leitura e diagnóstico explícito. O PUT rejeita em 409. O gate integrado histórico 21c986c já usava modo sequence, mas precisa ser regenerado/migrado para incluir a nova sequência de ponteiro antes de habilitar este recurso.

## Interface

Marcar/desmarcar opções altera somente o rascunho. `Salvar coleção` é uma ação explícita e independente de salvar o pai. `Descartar seleção` e recarregar um rascunho pedem confirmação; cancelar conserva as escolhas. Durante save os controles ficam bloqueados. Erro/conflicto conserva o rascunho e solicita conferência por recarregamento. Pai novo exige primeiro salvar o registro principal. A navegação de registros reconhece alterações pendentes da coleção e não descarta uma gravação em andamento.

## Validação

- Oráculo COM/DAO controlado: inserção, duplicatas/case, fora da lista, texto vazio e remoção persistida; limpeza da fixture confirmada.
- Testes de fonte/geração: sete opções reais; ausência de export; vínculo incompleto; controles/eventos/capacidades incompatíveis recusados; nomes SQL escapados; alocador independente da normalização; mapeamento ambíguo recusado.
- PostgreSQL/HTTP real: seleção/clear, IDs estáveis, ponteiros acima de órfãos, mesma revisão concorrente 200/409, pais diferentes com ponteiros distintos, rollback em falha de filho, guarda de ponteiro genérica, legado/coleção truncada/ponteiro compartilhado recusados, sincronização que não rebobina e DEFAULT filho inválido desabilitando escrita.
- Scaffold de um módulo: `dart analyze lib`, release frio validado pelo manifesto (295 arquivos). Um rebuild incremental após reemitir o scaffold falhou no cache NgDart com perda de metadados de diretivas (inclusive ngIf); após `dart run build_runner clean`, a compilação fria passou sem alteração de código gerado. A causa do cache incremental não foi estabelecida neste lote.
- Chrome contra backend e PG descartáveis: sete opções, nenhuma gravação ao marcar, Cancel/Accept, erro real do banco preservando rascunho, Save explícito, persistência após reload, clear conservando ponteiro e outro pai intacto. Três PUTs deliberados: um erro controlado, um Save válido e um clear; zero erros JavaScript.
- Regressão de leitura de coleção e guard genérico executada separadamente. Artefatos locais em `build/codex-multivalue-write-*.log` e `build/codex-multivalue-write-ui/browser.done.json`; não contêm dados pessoais.

Esta validação é uma fixture controlada baseada no export real. Não é uma nova execução completa dos 54 objetos migrados nem autorização para gravar na base original.
