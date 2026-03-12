import 'package:jackcess_dart/jackcess_dart.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Usage: dart run example/jackcess_dart_example.dart <path-to.accdb>');
    return;
  }

  final database = await AccessDatabase.openPath(arguments.first);
  try {
    print(database.info.toJson());
  } finally {
    await database.close();
  }
}
