part of '../project_generator.dart';

final DartFormatter _projectDartFormatter = DartFormatter(
  languageVersion: DartFormatter.latestLanguageVersion,
  pageWidth: 80,
);

final Map<String, Template> _projectTemplateCache = <String, Template>{};
Directory? _projectTemplatesRoot;

String _renderTemplate(
  String template,
  Map<String, Object?> context, {
  String? name,
}) {
  final parsedTemplate = name == null
      ? Template(
          template,
          htmlEscapeValues: false,
          lenient: true,
        )
      : Template(
          template,
          name: name,
          htmlEscapeValues: false,
          lenient: true,
        );
  return parsedTemplate.renderString(context);
}

String _renderTemplateAsset(
  String relativePath,
  Map<String, Object?> context,
) {
  final parsedTemplate = _projectTemplateCache.putIfAbsent(relativePath, () {
    final file = File(
      p.join(_resolveProjectTemplatesRoot().path, relativePath),
    );
    if (!file.existsSync()) {
      throw StateError('Template nao encontrado: $relativePath');
    }
    return Template(
      file.readAsStringSync(),
      name: relativePath,
      htmlEscapeValues: false,
      lenient: true,
    );
  });
  return parsedTemplate.renderString(context);
}

Directory _resolveProjectTemplatesRoot() {
  final cached = _projectTemplatesRoot;
  if (cached != null) {
    return cached;
  }

  var current = Directory.current.absolute;
  while (true) {
    final candidate = Directory(
      p.join(current.path, 'lib', 'src', 'project_generator', 'templates'),
    );
    if (candidate.existsSync()) {
      _projectTemplatesRoot = candidate;
      return candidate;
    }
    final parent = current.parent;
    if (parent.path == current.path) {
      throw StateError('Nao foi possivel localizar lib/src/project_generator/templates');
    }
    current = parent;
  }
}

String _emitDartLibrary({
  Iterable<Directive> directives = const <Directive>[],
  required Iterable<Spec> body,
}) {
  final library = Library(
    (builder) => builder
      ..directives.addAll(directives)
      ..body.addAll(body),
  );
  final emitter = DartEmitter.scoped(useNullSafetySyntax: true);
  return _projectDartFormatter.format('${library.accept(emitter)}');
}

String _emitSimpleDartType({
  required String name,
  required Iterable<Field> fields,
  Iterable<Reference> types = const <Reference>[],
  Constructor? constructor,
  Iterable<Method> methods = const <Method>[],
}) {
  return _emitDartLibrary(
    body: <Spec>[
      Class(
        (builder) => builder
          ..name = name
          ..types.addAll(types)
          ..fields.addAll(fields)
          ..constructors.addAll(
            constructor == null
                ? const <Constructor>[]
                : <Constructor>[constructor],
          )
          ..methods.addAll(methods),
      ),
    ],
  );
}