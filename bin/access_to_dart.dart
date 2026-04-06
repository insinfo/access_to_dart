import 'dart:io';

import 'package:access_to_dart/access_to_dart.dart';


/// dart run access_to_dart migrate --accdb fixtures\SIGAsul.accdb --backend-accdb fixtures\SIGA2021-CENTRAL_be_2026_senha_4461.accdb --backend-password 4461 --output build\migration_access_siga_codex_schema_and_data --mode schema-and-data --pg "postgresql://postgres:s1sadm1n@localhost:5432/access_siga_codex_data_20260329?sslmode=disable" --identifier-style snake_ascii
Future<void> main(List<String> arguments) async {
  exit(await run(arguments));
}
