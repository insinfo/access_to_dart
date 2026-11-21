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
      final editable = _multivalueUiDescriptors(project, parent)
          .where((d) =>
              d['key'] == columnRuntimeName(field) && d['writeAllowed'] == true)
          .toList();
      (specifications[tableRouteName(parent)] ??=
          <String, Object?>{})[columnRuntimeName(field)] = {
        if (editable.length == 1) 'writeOptions': editable.single['options'],
        if (editable.length == 1)
          'pointerSequence': identifierPolicy.objectName(
              complexCollectionSequenceName(parent.name, field.name)),
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
    final schemaReady = descriptor['writeOptions'] != null && await _writeSchemaReady(db, descriptor);
    if (pointer == null) return _result(descriptor, const [], false, schemaReady);
    final keyColumn = descriptor['childPrimaryKey'] as String;
    final valueColumn = descriptor['valueColumn'] as String;
    // The complex-value pointer is distinct from the parent record's PK.
    final rows = await db.table(descriptor['childTable'] as String)
        .select([keyColumn, valueColumn])
        .where(descriptor['childLinkColumn'] as String, '=', pointer)
        .orderBy(keyColumn).limit(101).get();
    return _result(descriptor, rows.take(100).map((row) => {
      'id': _jsonValue(row[keyColumn]), 'value': _jsonValue(row[valueColumn]),
    }).toList(), rows.length > 100, schemaReady);
  }

  static Map<String, Object?> _result(Map descriptor, List rows, bool truncated, bool schemaReady) {
    final options = descriptor['writeOptions'] as List?;
    return {
      'values': rows, 'truncated': truncated,
      if (options != null) 'revision': base64Url.encode(utf8.encode(jsonEncode(rows))),
      if (options != null && !schemaReady) 'readOnlyReason': 'Edicao indisponivel: aplique a migracao com --auto-number-mode sequence e as sequencias de colecao.',
      if (options != null) 'editable': schemaReady && !truncated &&
          rows.every((row) => options.contains(row['value'])) &&
          rows.map((row) => row['value']).toSet().length == rows.length,
    };
  }

  static Future<bool> _writeSchemaReady(Connection db, Map descriptor) async {
    String quoted(String value) => '"${value.replaceAll('"', '""')}"';
    final childTable = quoted(descriptor['childTable'] as String);
    final key = descriptor['childPrimaryKey'] as String;
    final rows = await db.select(
      'SELECT pg_get_serial_sequence(?, ?) AS child_sequence, '
      '(SELECT pg_get_expr(d.adbin, d.adrelid) FROM pg_attribute a '
      'JOIN pg_attrdef d ON d.adrelid = a.attrelid AND d.adnum = a.attnum '
      'WHERE a.attrelid = to_regclass(?) AND a.attname = ?) AS default_expression, '
      'to_regclass(?)::text AS pointer_sequence',
      [childTable, key, childTable, key, quoted(descriptor['pointerSequence'] as String)]);
    final row = rows.single;
    final expression = row['default_expression'];
    return row['child_sequence'] != null && row['pointer_sequence'] != null &&
        expression is String && expression.startsWith('nextval(') && expression.endsWith('::regclass)');
  }

  static Future<Response> replace(Request request, String module,
      String idRaw, String fieldKey) async {
    try {
      final body = jsonDecode(await request.readAsString());
      if (body is! Map || body['values'] is! List || body['revision'] is! String ||
          body.keys.any((key) => key != 'values' && key != 'revision')) {
        throw ArgumentError('Selecao e revisao da colecao sao obrigatorias.');
      }
      final result = await replaceValues(request.make<Connection>(), module,
          idRaw, fieldKey, body['values'] as List, body['revision'] as String);
      return responseJson(result);
    } on _CollectionConflict catch (error) {
      return responseError(error.message, statusCode: 409);
    } on ArgumentError catch (error) {
      return responseError(error.message.toString(), statusCode: 400);
    } on FormatException {
      return responseError('Dados da colecao invalidos.', statusCode: 400);
    } on StateError catch (error) {
      return responseError(error.message, statusCode: 404);
    } catch (_) {
      return responseError('Nao foi possivel salvar a colecao. Nenhuma alteracao foi aplicada.', statusCode: 500);
    }
  }

  static Future<Map<String, Object?>> replaceValues(Connection db,
      String module, String idRaw, String fieldKey, List selected, String revision) async {
    final descriptor = (specifications[module] as Map?)?[fieldKey] as Map?;
    final options = descriptor?['writeOptions'] as List?;
    if (descriptor == null || options == null) {
      throw ArgumentError('Edicao desta colecao nao suportada.');
    }
    if (selected.any((value) => value is! String || !options.contains(value)) ||
        selected.toSet().length != selected.length) {
      throw ArgumentError('Selecione apenas opcoes distintas do controle de origem.');
    }
    final Object id;
    switch (descriptor['parentKeyType']) {
      case 'int': id = int.parse(idRaw); break;
      case 'double':
        final parsed = double.parse(idRaw);
        if (!parsed.isFinite) throw const FormatException('Nonfinite ID');
        id = parsed; break;
      default: id = idRaw;
    }
    return await db.transaction((ctx) async {
      final parent = await ctx.table(descriptor['parentTable'] as String)
          .where(descriptor['parentPrimaryKey'] as String, '=', id)
          .lockForUpdate().first();
      if (parent == null) throw StateError('Registro pai nao encontrado.');
      final current = await loadValues(ctx, module, idRaw, fieldKey);
      if (current['readOnlyReason'] != null) {
        throw _CollectionConflict(current['readOnlyReason'] as String);
      }
      if (current['editable'] != true || current['revision'] != revision) {
        throw _CollectionConflict('Colecao alterada ou com valores legados nao editaveis. Recarregue antes de salvar.');
      }
      var pointer = parent[descriptor['parentColumn']];
      if (pointer != null) {
        final otherParents = await ctx.table(descriptor['parentTable'] as String)
            .where(descriptor['parentColumn'] as String, '=', pointer)
            .where(descriptor['parentPrimaryKey'] as String, '<>', id).limit(1).get();
        if (otherParents.isNotEmpty) {
          throw _CollectionConflict('Ponteiro compartilhado por outros registros. A colecao precisa ser revisada antes de editar.');
        }
      }
      if (pointer == null && selected.isEmpty) return current;
      if (pointer == null) {
        final sequence = descriptor['pointerSequence'] as String;
        final allocated = await ctx.select('SELECT nextval(?::regclass) AS value',
            ['"${sequence.replaceAll('"', '""')}"']);
        pointer = allocated.single['value'];
        await ctx.table(descriptor['parentTable'] as String)
            .where(descriptor['parentPrimaryKey'] as String, '=', id)
            .update({descriptor['parentColumn'] as String: pointer});
      }
      final rows = current['values'] as List;
      final saved = rows.map((row) => row['value']).toSet();
      for (final row in rows) {
        if (!selected.contains(row['value'])) {
          await ctx.table(descriptor['childTable'] as String)
              .where(descriptor['childPrimaryKey'] as String, '=', row['id'])
              .where(descriptor['childLinkColumn'] as String, '=', pointer).delete();
        }
      }
      // Keep existing child IDs; new child IDs use the migrated PK default.
      for (final value in options.where((value) => selected.contains(value))) {
        if (!saved.contains(value)) {
          await ctx.table(descriptor['childTable'] as String).insert({
            descriptor['childLinkColumn'] as String: pointer,
            descriptor['valueColumn'] as String: value,
          });
        }
      }
      return await loadValues(ctx, module, idRaw, fieldKey);
    });
  }

  static Object? _jsonValue(Object? value) {
    if (value is DateTime) return value.toIso8601String();
    if (value is BigInt) return value.toString();
    return value;
  }
}

class _CollectionConflict implements Exception {
  final String message;
  _CollectionConflict(this.message);
}
''';
