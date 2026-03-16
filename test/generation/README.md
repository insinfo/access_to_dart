## Testes de Geracao

- `fast/`: testes curtos para feedback rapido.
- `long/`: cenarios E2E e fixtures mais pesadas.
- `support/`: helpers compartilhados entre os testes.

Comandos uteis:

```text
dart test test/generation/fast
dart test test/generation/long
dart test test/generation/long/master_detail_people_fixture_rules_test.dart
```

Para ignorar os testes longos localmente, rode apenas a pasta `test/generation/fast`.