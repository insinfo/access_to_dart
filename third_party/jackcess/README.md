Curated subset of `jackcess` copied into the repository for ongoing port work.

Included:

- `LICENSE.txt`
- `NOTICE.txt`
- `README.upstream.txt`
- `JetFormat.java`
- `PageChannel.java`
- `DatabaseImpl.java`
- `TableImpl.java`
- `ColumnImpl.java`
- `PropertyMaps.java`
- `RelationshipCreator.java`
- `AttachmentColumnInfoImpl.java`

Why this subset exists:

- it covers format detection, page IO, schema parsing, row decoding, relationships, and attachments;
- it is enough to guide the early Dart port without keeping the whole research dump in `referencias/`.
