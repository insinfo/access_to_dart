# 46 — CRUD com chave primária Double editável

## Reprodução e decisão de fidelidade

Quatro tabelas físicas SIGA possuem chave Double: `CADUNICO.Identificação`, `BPC.CODBPC`, `DESCUMPRIMENTO.Identificação` e `TbPBF08.codpbf`. O teste utiliza os mesmos nomes e tipos com registros exclusivamente sintéticos, sem copiar dados pessoais.

Antes da correção, PUT de uma chave 1.25 para 3.75 gravava a alteração, mas devolvia 404: o serviço buscava novamente a chave antiga. GET da nova chave já devolvia 200. Frações e números inteiros Double não eram truncados. NaN, Infinity, -Infinity, overflow 1e999 e texto inválido já devolviam 400 no pipeline real, inclusive DELETE; não foi inventada uma alteração de parser para esse caso.

O oráculo `tools/test_double_primary_key_access.ps1` cria um banco Access temporário e um formulário vinculado com controle sobre PK Double. Editar `.Text` de 1.25 para 3.75, mudar o foco e salvar `.Dirty` efetivamente altera a chave, conservando o outro campo. O script usa a configuração regional atual para o texto decimal e remove o banco ao final. Essa evidência sustenta manter a edição de uma chave comum; não autoriza ignorar controles desabilitados, relacionamentos ou regras específicas de outros formulários.

## Correção no gerador

O repositório gerado agora executa UPDATE e recarga dentro da mesma transação. A chave usada na recarga vem do payload efetivamente persistido, depois dos guards. Portanto CadResidencia, cujo allocator remove a chave do payload de UPDATE, continua usando a chave anterior. Se nenhuma linha foi atualizada, retorna ausência sem buscar uma linha diferente pela nova chave. Falha na recarga lança erro e reverte a transação. O serviço retorna o mapa salvo pelo repositório.

Os filtros continuam usando query builder e parâmetros. A correção não adiciona SQL proveniente do pedido nem altera dados da fonte Access.

## Evidências

- Oráculo Access: `DOUBLE_PK_BOUND_EDIT_OK 1.25 -> 3.75`, `TEMP_REMOVED=True`; log privado `build/codex-double-pk-access.log`.
- `test/generation/long/double_primary_key_postgres_test.dart`: gera quatro módulos, resolve dependências, analisa e compila backend real; exercita HTTP com PostgreSQL em banco temporário TEMPLATE template0. Cobre POST/GET com fração e inteiro Double, edição da chave, GET antigo ausente, UPDATE de linha ausente sem retornar outra linha, identificadores inválidos, DELETE, colisão de PK, FK restritiva com rollback e duas renumerações concorrentes (um sucesso e uma ausência).
- `test/generation/long/family_allocator_postgres_test.dart`: revalida o allocator e a proteção da chave familiar após a mudança compartilhada de UPDATE.
- `dart analyze lib test/generation/long/double_primary_key_postgres_test.dart`: sem problemas. Suite `test/generation/fast`: 60/60 passaram. Double CRUD e allocator PostgreSQL/HTTP: 2/2 passaram.
- Regressão `temporal_storage_postgres_test.dart`: passou, incluindo UPDATE normalizado e preservação de componentes civis/microssegundos; log `build/codex-double-temporal-regression.log`.
- Logs: `build/codex-double-pk-final.log`, `build/codex-double-pk-analyze.log`, `build/codex-double-pk-fast.log`.

O teste sintético comprova o comportamento de backend dessas operações e tipos; não afirma que todas as telas Access com essas tabelas, eventos ou relacionamentos já foram reproduzidas. A migração integral anterior não foi repetida por esta alteração.
