part of '../project_generator.dart';

extension _FrontendSharedGenerator on ProjectGenerator {
  Future<void> _generateFrontendShared(
    AnalysisProject project,
    Directory sharedDir,
  ) async {
    if (!sharedDir.existsSync()) {
      sharedDir.createSync(recursive: true);
    }

    Directory(p.join(sharedDir.path, 'components')).createSync(recursive: true);
    Directory(p.join(sharedDir.path, 'services')).createSync(recursive: true);
    Directory(p.join(sharedDir.path, 'utils')).createSync(recursive: true);

    const sharedDart = '''
export 'components/datatable.dart';
export 'components/modal.dart';
export 'services/api_http_service.dart';
export 'services/rest_service.dart';
export 'utils/filters.dart';
export 'utils/dataframe.dart';
export 'utils/loading.dart';
export 'utils/toast.dart';
export 'utils/dialogs.dart';
''';

    await File(p.join(sharedDir.path, 'services', 'api_http_service.dart'))
        .writeAsString(_buildApiHttpServiceSource());
    await File(p.join(sharedDir.path, 'services', 'rest_service.dart'))
        .writeAsString(_buildRestServiceSource());
    await File(p.join(sharedDir.path, 'utils', 'filters.dart'))
        .writeAsString(_buildFiltersSource());
    await File(p.join(sharedDir.path, 'utils', 'dataframe.dart'))
        .writeAsString(_buildDataFrameSource());
    await File(p.join(sharedDir.path, 'shared.dart')).writeAsString(sharedDart);

    await File(p.join(sharedDir.path, 'components', 'datatable.dart'))
        .writeAsString(_buildDatatableComponentSource());

    await File(p.join(sharedDir.path, 'components', 'modal.dart'))
        .writeAsString(_buildModalComponentSource());

    await File(p.join(sharedDir.path, 'utils', 'loading.dart'))
        .writeAsString(_buildSimpleLoadingSource());

    await File(p.join(sharedDir.path, 'utils', 'toast.dart'))
        .writeAsString(_buildNotificationToastServiceSource());

    await File(p.join(sharedDir.path, 'utils', 'dialogs.dart'))
        .writeAsString(_buildDialogsSource());
  }
}