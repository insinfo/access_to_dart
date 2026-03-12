`access_to_dart` is the workspace root and CLI entrypoint for the Access-to-Dart converter.

Current command:

```text
dart run access_to_dart inspect-accdb --accdb fixtures/teste1/teste1.accdb
dart run access_to_dart read-src --src fixtures/teste1/teste1.accdb.src
```

Repository rules:

- the final tool must not depend on `referencias/`;
- checked-in development fixtures live in `fixtures/`;
- reverse-engineering source material lives in `third_party/`;
- runtime input must be a user-provided `.accdb` and optional `.accdb.src`.

Current implemented baseline:

- `inspect-accdb` opens a user-supplied `.accdb` with the Dart port in `jackcess_dart`;
- `read-src` parses checked-in `.accdb.src` exports in Dart without Microsoft Access;
- both commands run only against local inputs, not against `referencias/`.
