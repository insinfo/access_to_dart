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
export 'components/access_subform_panel.dart';
export 'components/access_multivalue_panel.dart';
export 'components/access_report_viewer.dart';
export 'components/access_query_viewer.dart';
export 'components/access_menu_panel.dart';
export 'components/modal.dart';
export 'services/api_http_service.dart';
export 'services/rest_service.dart';
export 'utils/filters.dart';
export 'utils/dataframe.dart';
export 'utils/loading.dart';
export 'utils/toast.dart';
export 'utils/dialogs.dart';
''';

    final compiledReports = compileEligibleReports(project).reports;
    await File(p.join(sharedDir.path, 'components', 'access_report_viewer.dart'))
        .writeAsString(_buildAccessReportViewerDartSource(compiledReports));
    await File(p.join(sharedDir.path, 'components', 'access_report_viewer.html'))
        .writeAsString(_buildAccessReportViewerHtml(compiledReports));
    await File(p.join(sharedDir.path, 'components', 'access_report_viewer.scss'))
        .writeAsString(_buildAccessReportViewerScss(compiledReports));

    final catalogQueries = _catalogQueryDescriptors(project);
    await File(p.join(sharedDir.path, 'components', 'access_query_viewer.dart'))
        .writeAsString(_buildAccessQueryViewerDartSource(catalogQueries));
    await File(p.join(sharedDir.path, 'components', 'access_query_viewer.html'))
        .writeAsString(_buildAccessQueryViewerHtml());
    await File(p.join(sharedDir.path, 'components', 'access_query_viewer.scss'))
        .writeAsString(_buildAccessQueryViewerScss());

    final compiledMenus = _compileMenuForms(project);
    await File(p.join(sharedDir.path, 'components', 'access_menu_panel.dart'))
        .writeAsString(_buildAccessMenuPanelDartSource(compiledMenus));
    await File(p.join(sharedDir.path, 'components', 'access_menu_panel.html'))
        .writeAsString(_buildAccessMenuPanelHtml());
    await File(p.join(sharedDir.path, 'components', 'access_menu_panel.scss'))
        .writeAsString(_buildAccessMenuPanelScss());

    await File(p.join(sharedDir.path, 'services', 'api_http_service.dart'))
        .writeAsString(_buildApiHttpServiceSource());
    await File(p.join(sharedDir.path, 'services', 'rest_service.dart'))
        .writeAsString(_buildRestServiceSource());
    await File(p.join(sharedDir.path, 'utils', 'filters.dart'))
        .writeAsString(_buildFiltersSource());
    await File(p.join(sharedDir.path, 'utils', 'dataframe.dart'))
        .writeAsString(_buildDataFrameSource());
    await File(p.join(sharedDir.path, 'shared.dart')).writeAsString(sharedDart);

    await File(p.join(sharedDir.path, 'components', 'access_multivalue_panel.dart')).writeAsString(_multivaluePanelSource);

    await File(p.join(sharedDir.path, 'components', 'access_subform_panel.dart'))
        .writeAsString(_subformPanelSource);

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