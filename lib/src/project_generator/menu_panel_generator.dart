part of 'project_generator.dart';

extension _AccessMenuPanelGenerator on ProjectGenerator {
  List<Map<String, Object?>> _compileMenuForms(AnalysisProject project) {
    final cached = _compiledMenuFormsCache[project];
    if (cached != null) return cached;

    final rawForms =
        ((project.raw['forms'] as List?) ?? const []).whereType<Map>().toList();
    final unboundForms = rawForms
        .where((f) => (f['recordSource']?.toString() ?? '').trim().isEmpty)
        .toList();
    if (unboundForms.isEmpty) {
      _compiledMenuFormsCache[project] = const <Map<String, Object?>>[];
      return const <Map<String, Object?>>[];
    }

    final compiledReportKeyByLowerName = <String, String>{
      for (final report in compileEligibleReports(project).reports)
        report.name.toLowerCase(): report.key,
    };
    final compiledQueryKeyByLowerName =
        _compileCatalogQueries(project).catalogKeyByLowerName;

    Map? rawFormLookup(String name) {
      final matches = rawForms
          .where((f) =>
              (f['name'] as String? ?? '').toLowerCase() == name.toLowerCase())
          .toList();
      return matches.length == 1 ? matches.single : null;
    }

    // First pass: assign stable route keys to candidate unbound forms
    final usedKeys = <String>{};
    final candidateKeyByLowerName = <String, String>{};
    for (final form in unboundForms) {
      final name = (form['name']?.toString() ?? '').trim();
      if (name.isEmpty) continue;
      final base = toSnakeCaseIdentifier(name);
      var key = base.isEmpty ? 'menu' : base;
      var suffix = 2;
      while (usedKeys.contains(key)) {
        key = '${base}_$suffix';
        suffix++;
      }
      usedKeys.add(key);
      candidateKeyByLowerName[name.toLowerCase()] = key;
    }

    ({String? href, String? reason}) resolveTargetForm(
      String destination,
      Map<String, String> allowedMenus,
    ) {
      final crud = _resolveCleanOpenFormDestination(
        project,
        rawFormLookup,
        destination,
        includeMenuForms: false,
      );
      if (crud.href != null) return crud;
      final menuKey = allowedMenus[destination.toLowerCase()];
      if (menuKey != null) {
        return (
          href: '#/access-menu/${Uri.encodeComponent(menuKey)}',
          reason: null,
        );
      }
      return crud;
    }

    List<Map<String, Object?>> extractMenuCommands(
      Map form,
      Map<String, String> allowedMenus,
    ) {
      final formName = (form['name']?.toString() ?? '').trim();
      final rawVba = (form['rawVbaCode'] as String?) ?? '';
      final vbaSubs = _extractVbaSubBodies(rawVba);
      final out = <Map<String, Object?>>[];
      for (final control
          in ((form['controls'] as List?) ?? const []).whereType<Map>()) {
        if (control['type'] != 'CommandButton') continue;
        final ctrlName = (control['name']?.toString() ?? '').trim();
        final label =
            (control['caption'] as String? ?? ctrlName).trim();
        if (label.isEmpty) continue;
        final rawSteps =
            ((control['macroDefinitions'] as Map?)?['OnClickEmMacro'] as List?);
        String? href;
        String? destination;
        String? kind;

        if (rawSteps != null) {
          final actions = rawSteps
              .whereType<Map>()
              .where((s) => s['action'] != null)
              .toList();
          final wizardWrapper = actions.length == 3 &&
              actions[0]['action'] == 'OnError' &&
              _exactMacroArguments(actions[0], const ['0']) &&
              actions[2]['action'] == 'MsgBox' &&
              actions[2]['condition'] == '[MacroError]<>0' &&
              _exactMacroArguments(
                  actions[2], const ['=[MacroError].[Description]', '-1', '0']);
          final core = wizardWrapper
              ? actions[1]
              : (actions.length == 1 ? actions.single : null);
          final clean = rawSteps.whereType<Map>().every((step) =>
              ((step['children'] as List?) ?? const []).isEmpty &&
              ((step['condition']?.toString() ?? '').trim().isEmpty ||
                  (wizardWrapper && identical(step, actions[2]))));
          if (clean && core != null) {
            final act = core['action']?.toString() ?? '';
            final args = ((core['arguments'] as List?) ?? const [])
                .map((v) => v.toString().trim())
                .toList();
            if (act == 'OpenReport' &&
                args.isNotEmpty &&
                args[0].isNotEmpty &&
                (args.length <= 2 || args[2].isEmpty) &&
                (args.length <= 3 || args[3].isEmpty)) {
              destination = args[0];
              final rk = compiledReportKeyByLowerName[destination.toLowerCase()];
              if (rk != null) {
                href = '#/access-report/${Uri.encodeComponent(rk)}';
                kind = 'report';
              }
            } else if (act == 'OpenQuery' &&
                args.isNotEmpty &&
                args[0].isNotEmpty) {
              destination = args[0];
              final qk = compiledQueryKeyByLowerName[destination.toLowerCase()];
              if (qk != null) {
                href = '#/access-query/${Uri.encodeComponent(qk)}';
                kind = 'query';
              }
            } else if (act == 'OpenForm' &&
                args.length == 6 &&
                args[1] == '0' &&
                args[2].isEmpty &&
                args[3].isEmpty &&
                args[4] == '-1' &&
                args[5] == '0') {
              destination = args[0];
              final resolved = resolveTargetForm(destination, allowedMenus);
              if (resolved.href != null) {
                href = resolved.href;
                kind = resolved.href!.startsWith('#/access-menu/')
                    ? 'menu'
                    : 'form';
              }
            }
          }
        } else {
          final clickEvent =
              ((control['events'] as Map?)?['OnClick']?.toString() ?? '').trim();
          final normCtrlName = ctrlName
              .toLowerCase()
              .replaceAll(RegExp(r'[^a-z0-9_]'), '_');
          final vbaBody =
              (clickEvent.isEmpty || clickEvent == '[Event Procedure]')
                  ? (vbaSubs['${ctrlName.toLowerCase()}_click'] ??
                      vbaSubs['${normCtrlName}_click'])
                  : null;
          if (vbaBody != null) {
            final parsed = _parseVbaClickCommand(
              body: vbaBody,
              currentFormName: formName,
              compiledReportKeyByLowerName: compiledReportKeyByLowerName,
              compiledQueryKeyByLowerName: compiledQueryKeyByLowerName,
              resolveOpenForm: (dest) => resolveTargetForm(dest, allowedMenus),
            );
            if (parsed != null && parsed['href'] != null) {
              href = parsed['href'] as String;
              destination = parsed['destination'] as String?;
              kind = href.startsWith('#/access-report/')
                  ? 'report'
                  : (href.startsWith('#/access-query/')
                      ? 'query'
                      : (href.startsWith('#/access-menu/') ? 'menu' : 'form'));
            }
          }
        }

        if (href != null) {
          out.add(<String, Object?>{
            'control': ctrlName,
            'label': label,
            'href': href,
            'destination': destination,
            'kind': kind,
          });
        }
      }
      return out;
    }

    // Pass 1: find unbound forms with direct report/query/CRUD actions
    final activeMenuKeyByLowerName = <String, String>{};
    for (final form in unboundForms) {
      final name = (form['name']?.toString() ?? '').trim();
      final key = candidateKeyByLowerName[name.toLowerCase()];
      if (key == null) continue;
      if (extractMenuCommands(form, const <String, String>{}).isNotEmpty) {
        activeMenuKeyByLowerName[name.toLowerCase()] = key;
      }
    }

    // Pass 2: include unbound menus that navigate to active menus as well
    final menus = <Map<String, Object?>>[];
    for (final form in unboundForms) {
      final name = (form['name']?.toString() ?? '').trim();
      final key = candidateKeyByLowerName[name.toLowerCase()];
      if (key == null) continue;
      final cmds = extractMenuCommands(form, activeMenuKeyByLowerName);
      if (cmds.isEmpty) continue;
      final caption = (form['caption']?.toString() ?? '').trim();
      menus.add(<String, Object?>{
        'key': key,
        'name': name,
        'title': caption.isEmpty ? name : caption,
        'commands': cmds,
      });
    }
    menus.sort((a, b) => (a['title'] as String)
        .toLowerCase()
        .compareTo((b['title'] as String).toLowerCase()));
    _compiledMenuFormsCache[project] = menus;
    return menus;
  }
}

String _buildAccessMenuPanelDartSource(List<Map<String, Object?>> menus) {
  final encoded = _dartStringLiteral(jsonEncode(menus));
  return _accessMenuPanelDartTemplate.replaceFirst('/*COMPILED_MENUS*/', encoded);
}

const _accessMenuPanelDartTemplate = r'''import 'dart:convert';
import 'dart:html' as html;

import 'package:ngdart/angular.dart';

@Component(
  selector: 'access-menu-panel',
  templateUrl: 'access_menu_panel.html',
  styleUrls: ['access_menu_panel.css'],
  directives: [coreDirectives],
)
class AccessMenuPanel implements OnInit {
  static final List<Map<String, dynamic>> compiledMenus =
      (jsonDecode(/*COMPILED_MENUS*/) as List).cast<Map<String, dynamic>>();

  String filterText = '';
  String activeMenuKey =
      compiledMenus.isEmpty ? '' : compiledMenus.first['key'] as String;

  @Input()
  set selectedKey(String? value) {
    if (value == null || value.isEmpty) return;
    if (compiledMenus.any((m) => m['key'] == value)) {
      activeMenuKey = value;
    }
  }

  @override
  void ngOnInit() {
    if (activeMenuKey.isEmpty && compiledMenus.isNotEmpty) {
      activeMenuKey = compiledMenus.first['key'] as String;
    }
  }

  List<Map<String, dynamic>> get filteredMenus {
    final needle = filterText.trim().toLowerCase();
    if (needle.isEmpty) return compiledMenus;
    return compiledMenus.where((m) {
      final title = (m['title']?.toString() ?? '').toLowerCase();
      final name = (m['name']?.toString() ?? '').toLowerCase();
      return title.contains(needle) || name.contains(needle);
    }).toList(growable: false);
  }

  Map<String, dynamic>? get activeMenu {
    for (final m in compiledMenus) {
      if (m['key'] == activeMenuKey) return m;
    }
    return null;
  }

  List<Map<String, dynamic>> get activeCommands {
    final menu = activeMenu;
    if (menu == null) return const <Map<String, dynamic>>[];
    return ((menu['commands'] as List?) ?? const [])
        .whereType<Map>()
        .map((c) => c.cast<String, dynamic>())
        .toList(growable: false);
  }

  void onFilterInput(html.Event event) {
    final target = event.target;
    if (target is html.InputElement) {
      filterText = target.value ?? '';
    }
  }

  void onMenuSelected(html.Event event) {
    final target = event.target;
    if (target is html.SelectElement && target.value != null) {
      activeMenuKey = target.value!;
    }
  }
}
''';

String _buildAccessMenuPanelHtml() {
  return r'''<section class="access-menu-panel">
  <div class="card mb-3" *ngIf="compiledMenus.isEmpty">
    <div class="card-body">
      <p class="mb-0">Nenhum painel de navegacao disponivel neste projeto.</p>
    </div>
  </div>
  <div class="card mb-3" *ngIf="compiledMenus.isNotEmpty">
    <div class="card-body">
      <h4 class="mb-3">Paineis e Menus de Navegacao</h4>
      <div class="mb-3">
        <label class="form-label">Filtrar painel</label>
        <input type="text" class="form-control" [value]="filterText" (input)="onFilterInput($event)" placeholder="Filtrar paineis por nome...">
      </div>
      <div class="mb-3">
        <label class="form-label">Painel</label>
        <select class="form-select" (change)="onMenuSelected($event)">
          <option *ngFor="let menu of filteredMenus" [value]="menu['key']" [selected]="activeMenuKey == menu['key']">{{ menu['title'] }}</option>
        </select>
      </div>
    </div>
  </div>
  <div class="card" *ngIf="activeMenu != null">
    <div class="card-body">
      <h5 class="mb-3">{{ activeMenu!['title'] }}</h5>
      <div class="d-flex flex-wrap gap-2">
        <a *ngFor="let cmd of activeCommands" class="btn btn-outline-primary" [href]="cmd['href']">{{ cmd['label'] }}</a>
      </div>
    </div>
  </div>
</section>
''';
}

String _buildAccessMenuPanelScss() {
  return '''.access-menu-panel {
  max-width: 1100px;
}
''';
}
