part of '../project_generator.dart';

String _buildApiHttpServiceSource() {
  return _emitDartLibrary(
    directives: <Directive>[
      Directive.import('dart:convert'),
      Directive.import('package:http/http.dart', as: 'http'),
    ],
    body: <Spec>[
      Class(
        (builder) => builder
          ..name = 'ApiHttpService'
          ..fields.addAll(<Field>[
            Field(
              (field) => field
                ..modifier = FieldModifier.final$
                ..name = 'baseUrl'
                ..type = refer('String'),
            ),
            Field(
              (field) => field
                ..modifier = FieldModifier.final$
                ..name = '_client'
                ..type = refer('http.Client'),
            ),
          ])
          ..constructors.add(
            Constructor(
              (ctor) => ctor
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'baseUrl'
                      ..toThis = true,
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'client'
                      ..named = true
                      ..type = refer('http.Client?'),
                  ),
                )
                ..initializers.add(Code('_client = client ?? http.Client()')),
            ),
          )
          ..methods.addAll(<Method>[
            Method(
              (method) => method
                ..name = 'resolve'
                ..returns = refer('Uri')
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'path'
                      ..type = refer('String'),
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'queryParameters'
                      ..named = true
                      ..type = refer('Map<String, String>?'),
                  ),
                )
                ..body = const Code('''
final uri = Uri.parse('\$baseUrl\$path');
if (queryParameters == null || queryParameters.isEmpty) {
  return uri;
}
return uri.replace(queryParameters: queryParameters);
'''),
            ),
            Method(
              (method) => method
                ..name = 'getJson'
                ..modifier = MethodModifier.async
                ..returns = refer('Future<Object?>')
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'path'
                      ..type = refer('String'),
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'queryParameters'
                      ..named = true
                      ..type = refer('Map<String, String>?'),
                  ),
                )
                ..body = const Code('''
final response = await _client.get(
  resolve(path, queryParameters: queryParameters),
);
return _decodeResponse(response);
'''),
            ),
            Method(
              (method) => method
                ..name = 'postJson'
                ..modifier = MethodModifier.async
                ..returns = refer('Future<Object?>')
                ..requiredParameters.addAll(<Parameter>[
                  Parameter(
                    (param) => param
                      ..name = 'path'
                      ..type = refer('String'),
                  ),
                  Parameter(
                    (param) => param
                      ..name = 'body'
                      ..type = refer('Object?'),
                  ),
                ])
                ..body = const Code('''
final response = await _client.post(
  resolve(path),
  headers: const <String, String>{
    'Content-Type': 'application/json; charset=utf-8',
  },
  body: jsonEncode(body),
);
return _decodeResponse(response);
'''),
            ),
            Method(
              (method) => method
                ..name = 'putJson'
                ..modifier = MethodModifier.async
                ..returns = refer('Future<Object?>')
                ..requiredParameters.addAll(<Parameter>[
                  Parameter(
                    (param) => param
                      ..name = 'path'
                      ..type = refer('String'),
                  ),
                  Parameter(
                    (param) => param
                      ..name = 'body'
                      ..type = refer('Object?'),
                  ),
                ])
                ..body = const Code('''
final response = await _client.put(
  resolve(path),
  headers: const <String, String>{
    'Content-Type': 'application/json; charset=utf-8',
  },
  body: jsonEncode(body),
);
return _decodeResponse(response);
'''),
            ),
            Method(
              (method) => method
                ..name = 'deleteJson'
                ..modifier = MethodModifier.async
                ..returns = refer('Future<Object?>')
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'path'
                      ..type = refer('String'),
                  ),
                )
                ..body = const Code('''
final response = await _client.delete(resolve(path));
return _decodeResponse(response);
'''),
            ),
            Method(
              (method) => method
                ..name = '_decodeResponse'
                ..returns = refer('Object?')
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'response'
                      ..type = refer('http.Response'),
                  ),
                )
                ..body = const Code('''
if (response.statusCode < 200 || response.statusCode >= 300) {
  throw StateError(_extractErrorMessage(response));
}
if (response.body.isEmpty) {
  return null;
}

final decoded = jsonDecode(response.body);
if (decoded is Map<String, dynamic> && decoded['is_error'] == true) {
  throw StateError(decoded['message']?.toString() ?? 'Erro HTTP');
}
return decoded;
'''),
            ),
            Method(
              (method) => method
                ..name = '_extractErrorMessage'
                ..returns = refer('String')
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'response'
                      ..type = refer('http.Response'),
                  ),
                )
                ..body = const Code('''
if (response.body.isEmpty) {
  return 'HTTP \${response.statusCode}';
}

try {
  final decoded = jsonDecode(response.body);
  if (decoded is Map<String, dynamic>) {
    return decoded['message']?.toString() ?? 'HTTP \${response.statusCode}';
  }
} catch (_) {}

return response.body;
'''),
            ),
          ]),
      ),
    ],
  );
}

String _buildRestServiceSource() {
  return _emitDartLibrary(
    directives: <Directive>[
      Directive.import('api_http_service.dart'),
      Directive.import('../utils/dataframe.dart'),
      Directive.import('../utils/filters.dart'),
    ],
    body: <Spec>[
      Class(
        (builder) => builder
          ..name = 'RestConfig'
          ..fields.add(
            Field(
              (field) => field
                ..modifier = FieldModifier.final$
                ..name = 'baseUrl'
                ..type = refer('String'),
            ),
          )
          ..constructors.add(
            Constructor(
              (ctor) => ctor
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'baseUrl'
                      ..toThis = true,
                  ),
                ),
            ),
          ),
      ),
      Class(
        (builder) => builder
          ..name = 'RestServiceBase'
          ..fields.addAll(<Field>[
            Field(
              (field) => field
                ..modifier = FieldModifier.final$
                ..name = 'conf'
                ..type = refer('RestConfig'),
            ),
            Field(
              (field) => field
                ..name = '_api'
                ..modifier = FieldModifier.final$
                ..late = true
                ..assignment = Code('ApiHttpService(conf.baseUrl)')
                ..type = refer('ApiHttpService'),
            ),
          ])
          ..constructors.add(
            Constructor(
              (ctor) => ctor
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'conf'
                      ..toThis = true,
                  ),
                ),
            ),
          )
          ..methods.addAll(<Method>[
            Method(
              (method) => method
                ..name = 'getDataFrame'
                ..types.add(refer('T'))
                ..modifier = MethodModifier.async
                ..returns = refer('Future<DataFrame<T>>')
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'endpoint'
                      ..type = refer('String'),
                  ),
                )
                ..optionalParameters.addAll(<Parameter>[
                  Parameter(
                    (param) => param
                      ..name = 'builder'
                      ..named = true
                      ..required = true
                      ..type = refer('T Function(Map<String, dynamic>)'),
                  ),
                  Parameter(
                    (param) => param
                      ..name = 'filtros'
                      ..named = true
                      ..type = refer('Filters?'),
                  ),
                ])
                ..body = const Code('''
final payload = await _api.getJson(
  endpoint,
  queryParameters: _filtersToQueryParameters(filtros),
);
final rows = _expectList(payload, endpoint);
return DataFrame<T>(
  items: rows.map((row) => builder(row)).toList(),
);
'''),
            ),
            Method(
              (method) => method
                ..name = 'getEntity'
                ..types.add(refer('T'))
                ..modifier = MethodModifier.async
                ..returns = refer('Future<T>')
                ..requiredParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'endpoint'
                      ..type = refer('String'),
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (param) => param
                      ..name = 'builder'
                      ..named = true
                      ..required = true
                      ..type = refer('T Function(Map<String, dynamic>)'),
                  ),
                )
                ..body = const Code('''
final payload = await _api.getJson(endpoint);
return builder(_expectMap(payload, endpoint));
'''),
            ),
            Method((method) => method
              ..name = 'insertEntity'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<Map<String, dynamic>>')
              ..requiredParameters.addAll(<Parameter>[
                Parameter((param) => param
                  ..name = 'entity'
                  ..type = refer('Map<String, dynamic>')),
                Parameter((param) => param
                  ..name = 'endpoint'
                  ..type = refer('String')),
              ])
              ..body = const Code('''
final payload = await _api.postJson(endpoint, entity);
return _expectMap(payload, endpoint);
''')),
            Method((method) => method
              ..name = 'updateEntity'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<Map<String, dynamic>>')
              ..requiredParameters.addAll(<Parameter>[
                Parameter((param) => param
                  ..name = 'entity'
                  ..type = refer('Map<String, dynamic>')),
                Parameter((param) => param
                  ..name = 'endpoint'
                  ..type = refer('String')),
              ])
              ..body = const Code('''
final payload = await _api.putJson(endpoint, entity);
return _expectMap(payload, endpoint);
''')),
            Method((method) => method
              ..name = 'deleteEntity'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<void>')
              ..requiredParameters.add(
                Parameter((param) => param
                  ..name = 'endpoint'
                  ..type = refer('String')),
              )
              ..body = const Code('await _api.deleteJson(endpoint);')),
            Method((method) => method
              ..name = 'getLookupOptions'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<List<LookupOption>>')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'endpoint'..type = refer('String')),
              )
              ..optionalParameters.add(
                Parameter((param) => param
                  ..name = 'limit'
                  ..named = true
                  ..type = refer('int')
                  ..defaultTo = const Code('100')),
              )
              ..body = Code('''
final payload = await _api.getJson(
  endpoint,
  queryParameters: <String, String>{
    'limit': '\$limit',
  },
);
final rows = _expectList(payload, endpoint);
return rows
    .map(LookupOption.fromMap)
    .where((option) => option.value.isNotEmpty)
    .toList(growable: false);
''')),
            Method((method) => method
              ..name = '_filtersToQueryParameters'
              ..returns = refer('Map<String, String>?')
              ..requiredParameters.add(
                Parameter((param) => param
                  ..name = 'filtros'
                  ..type = refer('Filters?')),
              )
              ..body = const Code('''
if (filtros == null) {
  return null;
}
return <String, String>{
  'limit': '\${filtros.limit}',
  'offset': '\${filtros.offset}',
};
''')),
            Method((method) => method
              ..name = '_expectList'
              ..returns = refer('List<Map<String, dynamic>>')
              ..requiredParameters.addAll(<Parameter>[
                Parameter((param) => param..name = 'payload'..type = refer('Object?')),
                Parameter((param) => param..name = 'endpoint'..type = refer('String')),
              ])
              ..body = const Code('''
if (payload is List) {
  return payload
      .whereType<Map>()
      .map((row) => row.cast<String, dynamic>())
      .toList();
}
if (payload is Map<String, dynamic> && payload['items'] is List) {
  final items = payload['items'] as List<dynamic>;
  return items
      .whereType<Map>()
      .map((row) => row.cast<String, dynamic>())
      .toList();
}
throw StateError('Resposta inesperada para GET \$endpoint');
''')),
            Method((method) => method
              ..name = '_expectMap'
              ..returns = refer('Map<String, dynamic>')
              ..requiredParameters.addAll(<Parameter>[
                Parameter((param) => param..name = 'payload'..type = refer('Object?')),
                Parameter((param) => param..name = 'endpoint'..type = refer('String')),
              ])
              ..body = const Code('''
if (payload is Map<String, dynamic>) {
  return payload;
}
throw StateError('Resposta inesperada para \$endpoint');
''')),
          ]),
      ),
      Class(
        (builder) => builder
          ..name = 'LookupOption'
          ..fields.addAll(<Field>[
            Field((field) => field
              ..modifier = FieldModifier.final$
              ..name = 'value'
              ..type = refer('String')),
            Field((field) => field
              ..modifier = FieldModifier.final$
              ..name = 'label'
              ..type = refer('String')),
          ])
          ..constructors.add(
            Constructor(
              (ctor) => ctor
                ..constant = true
                ..requiredParameters.addAll(<Parameter>[
                  Parameter((param) => param..name = 'value'..toThis = true),
                  Parameter((param) => param..name = 'label'..toThis = true),
                ]),
            ),
          )
          ..methods.add(
            Method((method) => method
              ..name = 'fromMap'
              ..static = true
              ..returns = refer('LookupOption')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'map'..type = refer('Map<String, dynamic>')),
              )
              ..lambda = true
              ..body = const Code(
                "LookupOption(map['value']?.toString() ?? '', map['label']?.toString() ?? map['value']?.toString() ?? '')",
              )),
          ),
      ),
    ],
  );
}

String _buildFiltersSource() {
  return _emitSimpleDartType(
    name: 'Filters',
    fields: <Field>[
      Field((field) => field..name = 'limit'..type = refer('int')),
      Field((field) => field..name = 'offset'..type = refer('int')),
    ],
    constructor: Constructor(
      (ctor) => ctor
        ..optionalParameters.addAll(<Parameter>[
          Parameter((param) => param
            ..name = 'limit'
            ..named = true
            ..toThis = true
            ..defaultTo = const Code('12')),
          Parameter((param) => param
            ..name = 'offset'
            ..named = true
            ..toThis = true
            ..defaultTo = const Code('0')),
        ]),
    ),
  );
}

String _buildDataFrameSource() {
  return _emitSimpleDartType(
    name: 'DataFrame',
    types: <Reference>[refer('T')],
    fields: <Field>[
      Field((field) => field..name = 'items'..type = refer('List<T>')),
    ],
    constructor: Constructor(
      (ctor) => ctor
        ..optionalParameters.add(
          Parameter((param) => param
            ..name = 'items'
            ..named = true
            ..type = refer('List<T>?')),
        )
        ..initializers.add(Code('items = items ?? <T>[]')),
    ),
    methods: <Method>[
      Method((method) => method
        ..name = 'newClear'
        ..static = true
        ..types.add(refer('T'))
        ..returns = refer('DataFrame<T>')
        ..lambda = true
        ..body = const Code('DataFrame<T>()')),
    ],
  );
}

String _buildFrontendModuleServiceSource({
  required GeneratedFrontendModule module,
}) {
  return _emitDartLibrary(
    directives: <Directive>[
      Directive.import('package:${module.packageName}_core/core.dart'),
      Directive.import('../../../shared/shared.dart'),
    ],
    body: <Spec>[
      Class(
        (builder) => builder
          ..name = '${module.className}Service'
          ..extend = refer('RestServiceBase')
          ..constructors.add(
            Constructor(
              (ctor) => ctor
                ..requiredParameters.add(
                  Parameter((param) => param..name = 'conf'..toSuper = true),
                ),
            ),
          )
          ..methods.addAll(<Method>[
            Method((method) => method
              ..name = 'all'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<DataFrame<${module.className}>>')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'filtros'..type = refer('Filters')),
              )
              ..body = Code('''
return getDataFrame<${module.className}>(
  '/${module.moduleNameKebab}',
  builder: (map) => ${module.className}.fromMap(map),
  filtros: filtros,
);
''')),
            Method((method) => method
              ..name = 'getById'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<${module.className}>')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'id'..type = refer('int')),
              )
              ..body = Code('''
return getEntity<${module.className}>(
  '/${module.moduleNameKebab}/\$id',
  builder: (map) => ${module.className}.fromMap(map),
);
''')),
            Method((method) => method
              ..name = 'insert'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<${module.className}>')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'entity'..type = refer(module.className)),
              )
              ..body = Code('''
final map = await insertEntity(entity.toMap(), '/${module.moduleNameKebab}');
return ${module.className}.fromMap(map);
''')),
            Method((method) => method
              ..name = 'update'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<${module.className}>')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'entity'..type = refer(module.className)),
              )
              ..body = Code('''
final map = await updateEntity(
  entity.toMap(),
  '/${module.moduleNameKebab}/\${entity.${module.primaryKeyField}}',
);
return ${module.className}.fromMap(map);
''')),
            Method((method) => method
              ..name = 'deleteRow'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<void>')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'id'..type = refer('int')),
              )
              ..body = Code("await deleteEntity('/${module.moduleNameKebab}/\$id');")),
            Method((method) => method
              ..name = 'lookupOptions'
              ..modifier = MethodModifier.async
              ..returns = refer('Future<List<LookupOption>>')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'fieldKey'..type = refer('String')),
              )
              ..optionalParameters.add(
                Parameter((param) => param
                  ..name = 'limit'
                  ..named = true
                  ..type = refer('int')
                  ..defaultTo = const Code('100')),
              )
              ..body = Code('''
return getLookupOptions(
  '/${module.moduleNameKebab}/lookups/\$fieldKey',
  limit: limit,
);
''')),
          ]),
      ),
    ],
  );
}

String _buildFrontendModulePageComponentDartSource({
  required String namePascal,
  required String nameSnake,
  required String moduleNameKebab,
}) {
  return _renderTemplate(
    '''
import 'package:ngdart/angular.dart';

import 'consultar_{{nameSnake}}/consultar_{{nameSnake}}_page.dart';

@Component(
  selector: '{{moduleNameKebab}}-page',
  templateUrl: '{{nameSnake}}_page_component.html',
  styleUrls: ['{{nameSnake}}_page_component.css'],
  directives: [coreDirectives, Consultar{{namePascal}}Page],
)
class {{namePascal}}PageComponent {}
''',
    <String, Object?>{
      'namePascal': namePascal,
      'nameSnake': nameSnake,
      'moduleNameKebab': moduleNameKebab,
    },
    name: 'frontend_module_page_component.dart',
  );
}

String _buildFrontendShellDartSource({
  required String initialModule,
  required Iterable<Map<String, Object?>> modules,
}) {
  final importLines = modules
      .map((module) =>
          "import 'src/modules/${module['nameSnake']}/pages/${module['nameSnake']}_page_component.dart';")
      .join('\n');
  final directives = modules
      .map((module) => '${module['namePascal']}PageComponent')
      .join(', ');
  return _renderTemplate(
    '''
import 'package:ngdart/angular.dart';

{{{importLines}}}

@Component(
  selector: 'app-root',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives{{#hasDirectives}}, {{{directives}}}{{/hasDirectives}}],
)
class AppComponent {
  String activeModule = '{{initialModule}}';

  void setActiveModule(String value) {
    activeModule = value;
  }
}
''',
    <String, Object?>{
      'initialModule': initialModule.replaceAll("'", "\\'"),
      'importLines': importLines,
      'directives': directives,
      'hasDirectives': directives.isNotEmpty,
    },
    name: 'app_component.dart',
  );
}

String _buildFrontendMainDartSource({required String packageName}) {
  return _renderTemplate(
    '''
import 'package:ngdart/angular.dart';

import 'package:{{packageName}}_frontend/app_component.template.dart' as ng;

void main() {
  runApp(ng.AppComponentNgFactory);
}
''',
    <String, Object?>{'packageName': packageName},
    name: 'main.dart',
  );
}

String _buildDatatableComponentSource() {
  return _emitDartLibrary(
    directives: <Directive>[Directive.import('package:ngdart/angular.dart')],
    body: <Spec>[
      Class(
        (builder) => builder
          ..annotations.add(
            CodeExpression(Code("Component(selector: 'datatable-component', template: '')")),
          )
          ..name = 'DatatableComponent',
      ),
      Class(
        (builder) => builder
          ..name = 'DatatableCol'
          ..fields.addAll(<Field>[
            Field((field) => field..modifier = FieldModifier.final$..name = 'key'..type = refer('String')),
            Field((field) => field..modifier = FieldModifier.final$..name = 'title'..type = refer('String')),
            Field((field) => field..modifier = FieldModifier.final$..name = 'enableSorting'..type = refer('bool')),
            Field((field) => field..modifier = FieldModifier.final$..name = 'sortingBy'..type = refer('String?')),
          ])
          ..constructors.add(
            Constructor((ctor) => ctor
              ..constant = true
              ..optionalParameters.addAll(<Parameter>[
                Parameter((param) => param..name = 'key'..named = true..required = true..toThis = true),
                Parameter((param) => param..name = 'title'..named = true..required = true..toThis = true),
                Parameter((param) => param..name = 'enableSorting'..named = true..toThis = true..defaultTo = const Code('false')),
                Parameter((param) => param..name = 'sortingBy'..named = true..toThis = true),
              ])),
          ),
      ),
      Class(
        (builder) => builder
          ..name = 'DatatableSearchField'
          ..fields.addAll(<Field>[
            Field((field) => field..modifier = FieldModifier.final$..name = 'field'..type = refer('String')),
            Field((field) => field..modifier = FieldModifier.final$..name = 'operator'..type = refer('String')),
            Field((field) => field..modifier = FieldModifier.final$..name = 'label'..type = refer('String')),
          ])
          ..constructors.add(
            Constructor((ctor) => ctor
              ..constant = true
              ..optionalParameters.addAll(<Parameter>[
                Parameter((param) => param..name = 'field'..named = true..required = true..toThis = true),
                Parameter((param) => param..name = 'operator'..named = true..required = true..toThis = true),
                Parameter((param) => param..name = 'label'..named = true..required = true..toThis = true),
              ])),
          ),
      ),
      Class(
        (builder) => builder
          ..name = 'DatatableSettings'
          ..fields.add(
            Field((field) => field..modifier = FieldModifier.final$..name = 'colsDefinitions'..type = refer('List<DatatableCol>')),
          )
          ..constructors.add(
            Constructor((ctor) => ctor
              ..constant = true
              ..optionalParameters.add(
                Parameter((param) => param..name = 'colsDefinitions'..named = true..required = true..toThis = true),
              )),
          ),
      ),
    ],
  );
}

String _buildModalComponentSource() {
  return _emitDartLibrary(
    directives: <Directive>[Directive.import('package:ngdart/angular.dart')],
    body: <Spec>[
      Class(
        (builder) => builder
          ..annotations.add(
            CodeExpression(Code("Component(selector: 'custom-modal', template: '<ng-content></ng-content>')")),
          )
          ..name = 'CustomModalComponent'
          ..fields.addAll(<Field>[
            Field((field) => field
              ..annotations.add(CodeExpression(Code("Input('start-open')")))
              ..name = 'startOpen'
              ..type = refer('bool')
              ..assignment = const Code('false')),
            Field((field) => field
              ..annotations.add(CodeExpression(Code("Input('title-text')")))
              ..name = 'titleText'
              ..type = refer('String')
              ..assignment = const Code("''")),
            Field((field) => field
              ..annotations.add(CodeExpression(Code('Input()')))
              ..name = 'size'
              ..type = refer('String')
              ..assignment = const Code("''")),
            Field((field) => field
              ..annotations.add(CodeExpression(Code('Input()')))
              ..name = 'headerColor'
              ..type = refer('String')
              ..assignment = const Code("''")),
          ]),
      ),
    ],
  );
}

String _buildSimpleLoadingSource() {
  return _emitDartLibrary(
    body: <Spec>[
      Class(
        (builder) => builder
          ..name = 'SimpleLoading'
          ..methods.addAll(<Method>[
            Method((method) => method
              ..name = 'show'
              ..returns = refer('void')
              ..optionalParameters.add(
                Parameter((param) => param..name = 'target'..named = true..type = refer('Object?')),
              )
              ..body = const Code('')),
            Method((method) => method
              ..name = 'hide'
              ..returns = refer('void')
              ..body = const Code('')),
          ]),
      ),
    ],
  );
}

String _buildNotificationToastServiceSource() {
  return _emitDartLibrary(
    body: <Spec>[
      Class(
        (builder) => builder
          ..name = 'NotificationToastService'
          ..methods.add(
            Method((method) => method
              ..name = 'showSuccess'
              ..returns = refer('void')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'message'..type = refer('String')),
              )
              ..body = const Code('')),
          ),
      ),
    ],
  );
}

String _buildDialogsSource() {
  return _emitDartLibrary(
    body: <Spec>[
      Class(
        (builder) => builder
          ..name = 'StatusMessage'
          ..fields.addAll(<Field>[
            Field((field) => field
              ..static = true
              ..modifier = FieldModifier.constant
              ..name = 'errorLoadingData'
              ..type = refer('String')
              ..assignment = const Code("'Erro ao carregar dados'")),
            Field((field) => field
              ..static = true
              ..modifier = FieldModifier.constant
              ..name = 'errorGeneric'
              ..type = refer('String')
              ..assignment = const Code("'Erro'")),
          ]),
      ),
      Class(
        (builder) => builder
          ..name = 'SimpleDialogComponent'
          ..methods.add(
            Method((method) => method
              ..static = true
              ..name = 'showAlert'
              ..returns = refer('void')
              ..requiredParameters.add(
                Parameter((param) => param..name = 'message'..type = refer('String')),
              )
              ..optionalParameters.add(
                Parameter((param) => param..name = 'subMessage'..named = true..type = refer('String?')),
              )
              ..body = const Code('')),
          ),
      ),
    ],
  );
}