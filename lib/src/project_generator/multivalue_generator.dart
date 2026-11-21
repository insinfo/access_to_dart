part of 'project_generator.dart';

extension _MultivalueGenerator on ProjectGenerator {
  Future<void> _generateMultivalueBackend(
      AnalysisProject project, Directory backendDir) async {
    final specifications = <String, Map<String, Object?>>{};
    for (final child
        in project.tables.where((t) => t.isSyntheticMultiValueTable)) {
      final parents = project.tables
          .where((t) => t.name == child.collectionParentTable)
          .toList();
      if (parents.length != 1) {
        continue;
      }
      final parent = parents.single;
      final fields = parent.columns
          .where((c) => c.name == child.collectionParentColumn)
          .toList();
      final childKeys = child.primaryKey?.columns;
      final parentKeys = parent.primaryKey?.columns;
      if (fields.length != 1 ||
          childKeys?.length != 1 ||
          parentKeys?.length != 1 ||
          child.collectionLinkColumn == null ||
          child.complexValueColumn == null) {
        continue;
      }
      final childNames = child.columns.map((c) => c.name).toSet();
      if (!childNames.containsAll([
        childKeys!.single.name,
        child.collectionLinkColumn!,
        child.complexValueColumn!
      ])) {
        continue;
      }
      final field = fields.single;
      final parentKey = _getPrimaryKey(parent);
      (specifications[tableRouteName(parent)] ??=
          <String, Object?>{})[columnRuntimeName(field)] = {
        'parentTable': tableRuntimeName(parent),
        'parentPrimaryKey': columnRuntimeName(parentKey),
        'parentKeyType': _routeParameterType(parentKey),
        'parentColumn': columnRuntimeName(field),
        'childTable': tableRuntimeName(child),
        'childPrimaryKey': identifierPolicy.columnName(childKeys.single.name),
        'childLinkColumn':
            identifierPolicy.columnName(child.collectionLinkColumn!),
        'valueColumn': identifierPolicy.columnName(child.complexValueColumn!),
      };
    }
    final source = _multivalueBackendSource.replaceFirst(
        '/*SPECIFICATIONS*/', _dartStringLiteral(jsonEncode(specifications)));
    await File(
            p.join(backendDir.path, 'lib/src/shared/access_multivalues.dart'))
        .writeAsString(source);
    await File(
            p.join(backendDir.path, 'lib/src/shared/access_multivalues.json'))
        .writeAsString(
            const JsonEncoder.withIndent('  ').convert(specifications));
  }
}

const _multivalueBackendSource = r'''
import 'dart:convert';
import 'package:eloquent/eloquent.dart';
import 'package:shelf/shelf.dart';
import 'extensions/request_extension.dart';
import 'utils/api_utils.dart';

class AccessMultivalueController {
  static final Map<String, dynamic> specifications =
      (jsonDecode(/*SPECIFICATIONS*/) as Map).cast<String, dynamic>();

  static Future<Response> list(Request request, String module,
      String idRaw, String fieldKey) async {
    try {
      return responseJson(await loadValues(request.make<Connection>(), module, idRaw, fieldKey));
    } on ArgumentError catch (error) {
      return responseError(error.message.toString(), statusCode: 400);
    } on FormatException {
      return responseError('Identificador pai invalido.', statusCode: 400);
    } on StateError catch (error) {
      return responseError(error.message, statusCode: 404);
    } catch (_) {
      return responseError('Nao foi possivel carregar a colecao.', statusCode: 500);
    }
  }

  static Future<Map<String, Object?>> loadValues(
      Connection db, String module, String idRaw, String fieldKey) async {
    final descriptor = (specifications[module] as Map?)?[fieldKey] as Map?;
    if (descriptor == null) throw ArgumentError('Colecao nao suportada.');
    final Object id;
    switch (descriptor['parentKeyType']) {
      case 'int': id = int.parse(idRaw); break;
      case 'double': id = double.parse(idRaw); break;
      default: id = idRaw;
    }
    final parent = await db.table(descriptor['parentTable'] as String)
        .where(descriptor['parentPrimaryKey'] as String, '=', id).first();
    if (parent == null) throw StateError('Registro pai nao encontrado.');
    final pointer = parent[descriptor['parentColumn']];
    if (pointer == null) return {'values': <Object?>[], 'truncated': false};
    final keyColumn = descriptor['childPrimaryKey'] as String;
    final valueColumn = descriptor['valueColumn'] as String;
    // The complex-value pointer is distinct from the parent record's PK.
    final rows = await db.table(descriptor['childTable'] as String)
        .select([keyColumn, valueColumn])
        .where(descriptor['childLinkColumn'] as String, '=', pointer)
        .orderBy(keyColumn).limit(101).get();
    return {
      'values': rows.take(100).map((row) => {
        'id': _jsonValue(row[keyColumn]), 'value': _jsonValue(row[valueColumn]),
      }).toList(),
      'truncated': rows.length > 100,
    };
  }

  static Object? _jsonValue(Object? value) {
    if (value is DateTime) return value.toIso8601String();
    if (value is BigInt) return value.toString();
    return value;
  }
}
''';
