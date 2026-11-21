# Proteção dos ponteiros complexos no CRUD do pai

A interface somente leitura e a retirada do CRUD das tabelas internas não eram suficientes. Um teste HTTP/PostgreSQL descartável comprovou que POST podia aceitar `motivo_nao=100`, reaproveitando a coleção de outro pai, e PUT podia trocar o ponteiro do pai1 de100 para200. O resultado anterior foi `create=100 update=200`.

O gerador agora classifica campos de armazenamento complexo (typeCode18/ComplexType e metadado multivalorado) separadamente para escrita. O DTO de leitura, o ponteiro salvo e a migração não são alterados.

- CREATE genérico ignora qualquer valor fornecido para esses campos e inicializa Null, inclusive quando o default antigo seria zero. Não inventa um alocador de ponteiros.
- UPDATE genérico carrega os valores persistidos para validar/deserializar o restante do registro, ignorando tentativas de substituir ou limpar ponteiros, inclusive payloads de tipo incorreto.
- O repository repete a proteção: INSERT impõe Null e UPDATE remove as colunas complexas do payload SQL. Portanto um update concorrente normal não escreve de volta o valor lido anteriormente nem desfaz uma alteração futura feita por uma API dedicada.
- Os endpoints específicos de anexos/coleções continuam sendo o caminho para seus contratos próprios; este guard não implementa escrita multivalorada. Caso o esquema exija ponteiro não nulo, o CRUD genérico não pode criar a coleção sem um alocador dedicado validado.

`test/generation/long/complex_pointer_guard_postgres_test.dart` cria duas coleções distintas, gera/análise/compila o backend e exercita HTTP real. Exige criação sem vincular coleção alheia, preservação no UPDATE, atualização de campo comum, tentativas Null e tipo inválido ignoradas, coleção nova vazia e coleções antigas intactas. Inclui outro campo ComplexType sem allowMultipleValues para proteger também ponteiros complexos não classificados como multivalorados.

A evidência temporal nova também corrigiu a pendência descrita no doc47: componentes ocultos são preservados ao carregar/alterar outros campos; a edição explícita de ShortTime/ShortDate segue os resets observados no Access, não uma presunção de preservação.

Dois testes antigos de dropdown/escaping foram reconciliados com a UI somente leitura: a fixture sem export não pode produzir checkbox que grava string com ponto-e-vírgula. Para manter a cobertura de aspas, barra invertida, cifrão e HTML, a fixture de bindings passou a declarar um controle exportado explícito e o teste exige os valores exatos no descriptor Base64, sem handlers editáveis inventados.

No snapshot SIGAsul integrado803634a, os nove campos ComplexType têm typeCode18, isRequired=false e defaultValue=null. Portanto inicializar Null não viola Required nessa fonte. O ensaio de reprodução usa apenas base sintética descartável; ele verifica a superfície genérica da API, independentemente de índices específicos de uma fonte. Não comprova upload de anexos nem escrita de filhos multivalorados.

Validação do guard: backend gerado analisado/compilado e HTTP/PostgreSQL aprovados, com resultado `create=null update=100`. Os dois testes fast reconciliados também passaram. A suíte fast ampla teve59 aprovados e uma expectativa temporal antiga, encaminhada ao lote temporal separado; não era falha deste guard.
