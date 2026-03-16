`access_to_dart` is the workspace root and CLI entrypoint for the Access-to-Dart converter.

Current command:

```text
dart run access_to_dart inspect-accdb --accdb fixtures/teste1/teste1.accdb
dart run access_to_dart read-src --src fixtures/teste1/teste1.accdb.src
dart run access_to_dart migrate --accdb fixtures/teste1/teste1.accdb --output build/migration
dart run access_to_dart migrate --accdb fixtures/teste1/teste1.accdb --pg "postgresql://postgres:senha@localhost:5432/access_siga?sslmode=disable" --identifier-style snake_ascii
dart run access_to_dart migrate --accdb fixtures/teste1/teste1.accdb --pg "host=localhost port=5432 dbname=access_siga user=postgres password=senha sslmode=disable" --identifier-style original
```

Repository rules:

- the final tool must not depend on `referencias/`;
- checked-in development fixtures live in `fixtures/`;
- reverse-engineering source material lives in `third_party/`;
- runtime input must be a user-provided `.accdb` and optional `.accdb.src`.

Current implemented baseline:

- `inspect-accdb` opens a user-supplied `.accdb` with the Dart port in `jackcess_dart`;
- `read-src` parses checked-in `.accdb.src` exports in Dart without Microsoft Access;
- `migrate` can now read a real `.accdb`, emit `schema.sql` and `seed.sql`, and optionally apply them directly to PostgreSQL;
- `migrate --identifier-style snake_ascii` removes accents and emits `snake_case`; `migrate --identifier-style original` preserves the original Access table and column names with quoted PostgreSQL identifiers;
- both commands run only against local inputs, not against `referencias/`.
