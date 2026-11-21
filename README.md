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
- `migrate` defaults to `--auto-number-mode sequence` for source columns marked AutoNumber, so generated POST operations can omit their IDs. Existing IDs are retained; sequences start after the imported maximum. Use `--auto-number-mode plain-int` to explicitly omit sequence defaults (automatic inserts then require separately configured defaults). Ordinary primary keys are not promoted to sequences. This does not preserve historical Access counters after deleted records.
- both commands run only against local inputs, not against `referencias/`.

Generated frontend releases:

```text
cd <generated-app>/frontend
dart pub get
dart run tool/build_release.dart
```

The generated helper uses a one-shot release build and verifies the complete output manifest plus nonempty HTML/JavaScript entrypoints. Development still uses `dart run webdev serve`. See `doc/28_frontend_release_packaging.md` for the Windows daemon race investigation and cold-build validation.
