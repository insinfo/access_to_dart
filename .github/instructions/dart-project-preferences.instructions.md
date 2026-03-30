
responda sempre em portugues

Ao trabalhar com PostgreSQL neste repositorio:

- use `connection.runTx(...)` para transacoes com o pacote `postgres` 3.x;
- dentro do callback, use apenas o `TxSession session` recebido;
- para criar bancos locais de validacao, prefira `TEMPLATE template0`.
