import 'dart:convert';
import 'dart:io';

import 'generation_test_utils.dart';

Future<File> writeFrontendBindingFixture(Directory directory) async {
  final file = await writeDropdownAnalysisFixture(directory);
  final data = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
  final table = (data['tables'] as List).first as Map;
  final columns = table['columns'] as List;
  final category = columns[1] as Map;
  category['name'] = "Categoria d'agua";
  category['caption'] = 'Categoria & faixa <especial>';
  final lookup = columns[2] as Map;
  lookup['name'] = "Pessoa d'agua";
  final tags = columns[3] as Map;
  tags['name'] = "Tags d'agua";
  tags['rowSource'] = r'''"O'Brien";"C:\docs";"R$ 10 & <especial>"''';
  await file.writeAsString(jsonEncode(data));
  return file;
}
