# Cópia de colunas do combo no atendimento

`FrmAtendimento.CodFuncTXT_Click` contém duas atribuições completas: `Me.NomeFuncTXT.Value = Me.CodFuncTXT.Column(1)` e `Me.FuncaoFuncionarioTXT.Value = Me.CodFuncTXT.Column(2)`. O controle possui `OnClick=[Event Procedure]`, é vinculado a `TbAtend.CodFunc` e consulta código, nome e função em `TbCadFuncionario`. Ambos os controles de destino estão desabilitados no export (`Enabled=NotDefault`).

Havia duas perdas: a lookup da coluna da tabela projeta apenas código/nome, enquanto o combo do formulário projeta três campos; e a resposta da API preservava somente value/label. Assim, o formulário não podia copiar a função do funcionário conforme seu procedimento.

## Reconhecimento e execução limitada

O novo helper reconhece a assinatura e o corpo inteiros de um procedimento Click sem parâmetros, composto exclusivamente de atribuições `Me.destino.Value = Me.combo.Column(indice)`. Exige vínculo OnClick explícito, controle ComboBox identificado, campos vinculados existentes, coluna vinculada padrão/1, projeções SQL simples suportadas e destinos textuais sem cálculo/AutoNumber/PK. Instruções extras, referência desconhecida, índice ausente, expressões SQL, evento ausente, procedimentos duplicados e BoundColumn diferente recusam a tradução. O nome CodFuncTXT não é uma heurística de comportamento.

Somente esses controles reconhecidos substituem a lookup da tabela pela RowSource efetiva do formulário. A API acrescenta `columns` com valores originais e Null, sem aplicar o fallback de label às colunas. A projeção adicional não é habilitada para lookups sem comportamento reconhecido. O procedimento SHA-256, SQL, controles, índices e destinos são registrados em `access_behaviors.json`.

No frontend, click no select e alteração explícita de seleção (`ngModelChange`) aplicam as atribuições ao rascunho. Essa adaptação DOM inclui seleção pelo teclado; não renomeia o evento de origem para AfterUpdate nem afirma equivalência do ciclo de eventos completo do Access. O teste cobre clique mantendo a seleção atual e seleção pelo teclado; carregar um registro não executa o evento. Nenhuma gravação ocorre até Salvar. Destinos desabilitados na origem ficam somente leitura. Uma resposta com projeção incompleta recusa toda a execução, sem atribuir metade do procedimento. Seleção vazia atribui Null, conforme o contrato Column sem seleção. Não há interpretação arbitrária de VBA nem execução dos demais eventos de ciclo de vida.

## Oráculo Access e limite da documentação

A documentação [ComboBox.Column](https://learn.microsoft.com/en-us/office/vba/api/access.combobox.column) descreve índices começando em zero, Null sem seleção e uma faixa ligada a ColumnCount. [ComboBox.ColumnCount](https://learn.microsoft.com/en-us/office/vba/api/access.combobox.columncount) descreve as colunas exibidas.

O controle real exporta ColumnCount=2 embora sua consulta projete três campos. Por isso foi necessário testar, sem inferir truncamento. `tools/test_combo_column_access.ps1` cria uma base Access temporária com dados sintéticos e verifica:

- ColumnCount lido de volta igual a 2: Column(0/1/2) retorna código/nome/função; Column(3) retorna Null.
- ColumnCount igual a 3: mesmos resultados.
- Sem seleção: Column(1) retorna Null.

A observação concreta nesta instalação do Access permite preservar a terceira projeção mesmo com duas colunas exibidas. Não generalizamos esse detalhe a toda versão/controle; o teste fica reproduzível. O oráculo usa avaliação de Column pelo próprio Access; não afirma ter automatizado um clique nativo. Remove sua própria base ao terminar, sem abrir SIGAsul.

## Validação

`test/combo_column_behavior_test.dart` usa o `.src` real e cobre o procedimento positivo e dez variantes recusadas. `test/generation/long/combo_column_postgres_test.dart` gera o scaffold e uma base PostgreSQL descartável com consultas reais, verificando terceira coluna, Null e manutenção de nomes históricos até uma interação explícita.

`tools/verify_combo_column_browser.mjs` usa Chrome sem mocks: abre registro histórico, verifica que não houve cópia na carga, seleciona funcionário com função Null, salva explicitamente a atualização, cria outro atendimento e salva a função da terceira coluna. O harness valida as duas linhas na API e encerra servidor/base. Credenciais apenas por ambiente de sessão. A suíte não usa dados pessoais reais.

Resultado final: 12 testes específicos, 32 regressões de BeforeInsert/OpenForm/navegação, analyze do gerador e frontend limpos, release real com 297 arquivos verificados e gate API/PG/navegador aprovados. O navegador confirmou zero execução ao carregar, clique na seleção atual, seleção por busca incremental do teclado, Null preservado e exatamente dois requests de escrita após Salvar (PUT e POST), sem erros ou diálogos.

Limitação do ensaio de teclado: nesta automação Chrome headless no Mac, setas/End não alteraram um select nem em HTML mínimo; Enter com a lista fechada enviou o formulário padrão. O teste usa a busca incremental nativa por letra para selecionar outra opção e não envia Enter. Não foi feita mudança no gerador para contornar essa particularidade da automação.
