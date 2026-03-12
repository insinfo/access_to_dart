`jackcess_dart` is the pure-Dart foundation for reading Microsoft Access files.

The current scope is low-level `.accdb` inspection: open a database from an arbitrary path, detect the Access format version, and read fixed-size pages. This is the first practical step toward a Dart-native reader that does not require Microsoft Access to be installed.

## Repository policy

- runtime input is always a user-provided `.accdb` file;
- `referencias/` is not a runtime dependency;
- development fixtures now live in `fixtures/`;
- upstream source material used for reverse engineering now lives in `third_party/`.

## Usage

```dart
import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> inspect(String path) async {
  final database = await AccessDatabase.openPath(path);
  try {
    print(database.info.toJson());
  } finally {
    await database.close();
  }
}
```

CLI:

```text
dart run jackcess_dart path\to\database.accdb
```
