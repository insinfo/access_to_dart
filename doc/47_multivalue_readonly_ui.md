# Coleção MotivoNão: leitura no formulário exportado

`FrmEncaminhamento` possui um ComboBox chamado `MotivoNão`, vinculado ao campo multivalorado de `TbEncaminhamento`, com sete opções Value List preservadas pelo `.src`. O inteiro armazenado na linha principal é um ponteiro da coleção, não uma opção selecionada. O GET de coleção já resolve esse ponteiro; o frontend agora consome esse endpoint.

A seleção do controle exige export real, um único ComboBox vinculado ao campo e metadados físicos da coleção. Sem formulário exportado não se cria um controle fictício; com vínculo físico incompleto, o controle exportado apresenta leitura indisponível em vez de tentar uma consulta genérica. O manifesto `access_collections.json` registra nome, tipo, opções de origem e condição somente leitura.

O painel apresenta valores salvos, incluindo valor nulo/texto vazio, e sete opções desabilitadas com marcação das selecionadas. Valores fora da lista continuam visíveis, sem descartá-los. A interface diz explicitamente que a edição não está disponível. O antigo input/checkbox editável que operava sobre o inteiro foi removido; a listagem também deixa de apresentar o ponteiro como valor selecionado.

São tratados registro novo (sem GET), ponteiro nulo, coleção vazia, carregamento, falha recuperável e limite de 100 valores. A mensagem de truncamento informa que há mais valores. Trocas de registro e destruição invalidam respostas antigas; recarregar limpa valores anteriores antes de consultar. Não há gravação de coleção pelo componente.

O descriptor é transmitido ao template como JSON codificado em Base64 gerado, decodificado no componente. Isso evita interpolar aspas ou expressões de origem no parser NgDart; não é mostrado ao usuário.

## Tabelas internas e cobertura

`_scaffoldTables` agora exclui todas as tabelas sintéticas complexas do CRUD/menu, mantendo-as no modelo, migração e descriptors das APIs de coleções/anexos. O snapshot integrado `803634a` foi medido: 54 tabelas = 45 tabelas principais + 6 auxiliares de anexos + 3 auxiliares multivaloradas. Antes eram emitidos 48 módulos; passam a ser 45. A contagem de tabelas migradas continua 54. Evidência local: `build/codex-multivalue-scaffold-counts.json`.

O teste de geração verifica ausência dos diretórios de módulos frontend/backend da auxiliar e ausência da rota CRUD interna, enquanto o descriptor GET continua apontando para a tabela auxiliar correta. Nenhum campo ou controle é inventado para TbDemandaReprimida sem export.

## Validação e limites

`test/multivalue_ui_test.dart` usa o `.src` real para validar as sete opções, modo somente leitura, exclusão do CRUD interno, ausência de controle inventado sem export e falha explícita de metadados incompletos. `test/generation/long/multivalue_ui_postgres_test.dart` usa PostgreSQL descartável e API gerada real com ponteiro diferente do PK, valor nulo, ponteiro nulo, coleção vazia e 101 valores.

`tools/verify_multivalue_ui_browser.mjs` verifica Chrome com dados vindos do GET real. Apenas o cenário de erro injeta uma interrupção de rede; nenhum payload bem-sucedido é mockado. Verifica recuperação, estados de leitura, ausência de exposição do ponteiro, sete opções desabilitadas, registro novo sem GET e zero requests de escrita. O harness compara novamente os dados e remove servidor/base.

A edição de coleções não está implementada. Também é necessário testar e proteger o POST/PUT genérico do pai para que um cliente não possa substituir o ponteiro interno por um número arbitrário. Esta entrega de UI não equivale a essa proteção de API.

## Próximo contrato de escrita, ainda não implementado

Antes de habilitar edição: usar oráculo DAO em base controlada para inclusão/remoção/coleção vazia/duplicatas; confirmar o domínio dos ponteiros e a preservação de vazios. Uma API dedicada deverá bloquear a linha pai em transação, resolver/reutilizar seu ponteiro e alterar somente os filhos desse ponteiro. Ponteiros novos precisam de sequência dedicada corretamente inicializada, e IDs dos filhos da sequência física já preservada; não usar MAX+1 em concorrência. Proteger contra atualização perdida e validar opções/tipos segundo a origem, sem apagar valores antigos desconhecidos. Testar concorrência, rollback, pais novos/nulos e isolamento entre pais antes de habilitar o controle.

Pendência separada: campos DateTime com apresentação ShortTime devem preservar a parte de data ao editar hora, conforme oráculo Access. A correção de armazenamento TIMESTAMP de TbAtColetivo.horario/TbGrupo.Horario está em outro lote; esta UI de coleção não altera formatos temporais.

Resultado desta etapa: 4 testes específicos de geração, 38 regressões (combo/BeforeInsert/navegação), analyze das áreas alteradas e frontend gerado limpos, release com 295 arquivos verificados, teste PG/API/browser aprovado. Chrome confirmou sete opções de origem desabilitadas, valores reais via GET, ponteiro oculto, nulo/vazio/truncamento, recuperação de falha de rede, novo pai sem GET e zero requests de escrita. A base e o processo do servidor foram encerrados pelo harness.
