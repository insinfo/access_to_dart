import 'dart:convert';
import 'dart:io';

import 'package:access_to_dart/src/analysis_model.dart';
import 'package:access_to_dart/src/project_generator/project_generator.dart';
import 'package:test/test.dart';

Map<String, dynamic> _commandsAndViewerFixture() {
  return <String, dynamic>{
    'schema_version': '1',
    'source': 'commands_fixture.accdb',
    'format': 'ACCDB',
    'tables': [
      {
        'name': 'Clientes',
        'columns': [
          {'name': 'Id', 'typeName': 'Long', 'typeCode': 4, 'isAutoNumber': true},
          {'name': 'Nome', 'typeName': 'Text', 'typeCode': 10},
        ],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'columns': [
              {'name': 'Id', 'columnNumber': 0}
            ]
          }
        ],
        'sampleRows': [],
      },
      {
        'name': 'Pedidos',
        'columns': [
          {'name': 'Id', 'typeName': 'Long', 'typeCode': 4, 'isAutoNumber': true},
          {'name': 'Descricao', 'typeName': 'Text', 'typeCode': 10},
        ],
        'indexes': [
          {
            'name': 'PrimaryKey',
            'isPrimaryKey': true,
            'columns': [
              {'name': 'Id', 'columnNumber': 0}
            ]
          }
        ],
        'sampleRows': [],
      },
    ],
    'queries': [
      {
        'name': 'QryClientesAtivos',
        'sqlText': 'SELECT Id, Nome FROM Clientes ORDER BY Nome',
      },
      {
        'name': 'QryBuscaCliente',
        'sqlText': 'PARAMETERS [Filtro] Text ( 255 ); SELECT Id, Nome FROM Clientes WHERE Nome LIKE "*" & [Filtro] & "*"',
      },
      {
        'name': '~TMPCLP1',
        'sqlText': 'SELECT Id FROM Clientes',
      },
    ],
    'reports': [
      {
        'name': 'RptClientes',
        'recordSource': 'Clientes',
        'width': 9000,
        'properties': {'Width': '9000', 'RecordSource': 'Clientes'},
        'sections': [
          {
            'name': 'Detalhe',
            'type': 'Section',
            'height': 400,
            'controls': [
              {
                'name': 'NomeTxt',
                'type': 'TextBox',
                'controlSource': 'Nome',
                'properties': {
                  'Left': '100',
                  'Top': '50',
                  'Width': '3000',
                  'Height': '240',
                  'ControlSource': 'Nome',
                },
              }
            ],
          },
        ],
        'binaryStorageSha256': 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      },
    ],
    'forms': [
      {
        'name': 'FrmClientesMacro',
        'recordSource': 'Clientes',
        'properties': <String, Object?>{},
        'controls': [
          {
            'name': 'BtnOpenRpt',
            'type': 'CommandButton',
            'caption': 'Imprimir Lista',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'OpenReport', 'arguments': ['RptClientes', '2', '', '', '0']},
              ],
            },
          },
          {
            'name': 'BtnWizardRpt',
            'type': 'CommandButton',
            'caption': 'Wizard Relatorio',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'OnError', 'arguments': ['0']},
                {'action': 'OpenReport', 'arguments': ['RptClientes', '2', '', '', '0']},
                {
                  'action': 'MsgBox',
                  'condition': '[MacroError]<>0',
                  'arguments': ['=[MacroError].[Description]', '-1', '0'],
                },
              ],
            },
          },
          {
            'name': 'BtnOpenQry',
            'type': 'CommandButton',
            'caption': 'Abrir Consulta',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'OpenQuery', 'arguments': ['QryClientesAtivos', '0', '2']},
              ],
            },
          },
          {
            'name': 'BtnSave',
            'type': 'CommandButton',
            'caption': 'Salvar',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'RunCommand', 'arguments': ['97']},
              ],
            },
          },
          {
            'name': 'BtnCloseMacro',
            'type': 'CommandButton',
            'caption': 'Fechar',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'Close', 'arguments': []},
              ],
            },
          },
          {
            'name': 'BtnOpenMenu',
            'type': 'CommandButton',
            'caption': 'Menu Relatorios',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'OpenForm', 'arguments': ['FrmMenuRelatorios', '0', '', '', '-1', '0']},
              ],
            },
          },
        ],
      },
      {
        'name': 'FrmMenuRelatorios',
        'caption': 'Central de Relatorios',
        'recordSource': '',
        'properties': <String, Object?>{},
        'controls': [
          {
            'name': 'BtnMenuRpt',
            'type': 'CommandButton',
            'caption': 'Relatorio Clientes',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'OpenReport', 'arguments': ['RptClientes', '2', '', '', '0']},
              ],
            },
          },
          {
            'name': 'BtnMenuQry',
            'type': 'CommandButton',
            'caption': 'Consulta Clientes',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'OpenQuery', 'arguments': ['QryClientesAtivos', '0', '2']},
              ],
            },
          },
          {
            'name': 'BtnMenuForm',
            'type': 'CommandButton',
            'caption': 'Cadastro Clientes',
            'macroDefinitions': {
              'OnClickEmMacro': [
                {'action': 'OpenForm', 'arguments': ['FrmClientesMacro', '0', '', '', '-1', '0']},
              ],
            },
          },
        ],
      },
      {
        'name': 'FrmPedidosVba',
        'recordSource': 'Pedidos',
        'properties': <String, Object?>{},
        'rawVbaCode': r'''
Private Sub BtnFecharVba_Click()
On Error GoTo Err_BtnFecharVba_Click
    DoCmd.Close
Exit_BtnFecharVba_Click:
    Exit Sub
Err_BtnFecharVba_Click:
    MsgBox Err.Description
    Resume Exit_BtnFecharVba_Click
End Sub

Private Sub BtnExcluirVba_Click()
If MsgBox("Confirma exclusao?", vbYesNo + vbQuestion, "Aviso") = vbYes Then
    DoCmd.SetWarnings False
    DoCmd.RunCommand acCmdDeleteRecord
    DoCmd.SetWarnings True
Else
    Exit Sub
End If
End Sub

Private Sub BtnImprimirRptVba_Click()
    DoCmd.OpenReport "RptClientes", acViewPreview
End Sub

Private Sub BtnAbrirQryVba_Click()
    DoCmd.OpenQuery "QryBuscaCliente"
End Sub

Private Sub BtnRefreshVba_Click()
    Me.Refresh
End Sub

Private Sub BtnDesfazerVba_Click()
    Me.Undo
End Sub

Private Sub BtnRptComFiltro_Click()
    DoCmd.OpenReport "RptClientes", acViewPreview, , "[Id]=1"
End Sub
''',
        'controls': [
          {'name': 'BtnFecharVba', 'type': 'CommandButton', 'caption': 'Sair', 'events': {'OnClick': '[Event Procedure]'}},
          {'name': 'BtnExcluirVba', 'type': 'CommandButton', 'caption': 'Excluir', 'events': {'OnClick': '[Event Procedure]'}},
          {'name': 'BtnImprimirRptVba', 'type': 'CommandButton', 'caption': 'Relatorio VBA'},
          {'name': 'BtnAbrirQryVba', 'type': 'CommandButton', 'caption': 'Consulta VBA'},
          {'name': 'BtnRefreshVba', 'type': 'CommandButton', 'caption': 'Atualizar'},
          {'name': 'BtnDesfazerVba', 'type': 'CommandButton', 'caption': 'Desfazer'},
          {'name': 'BtnRptComFiltro', 'type': 'CommandButton', 'caption': 'Filtrado'},
        ],
      },
    ],
  };
}

void main() {
  test('compiles macro & VBA commands, query list API, and AccessQueryViewer UI', () async {
    final temp = await Directory.systemTemp.createTemp('b2_cmds_qry_');
    addTearDown(() => temp.delete(recursive: true));

    final project = AnalysisProject.fromJson(_commandsAndViewerFixture());
    final outDir = '${temp.path}/app';
    await ProjectGenerator().generate(project: project, outputDirectory: outDir);

    // 1. Macro commands on Clientes
    final macroCmds = (jsonDecode(
      await File('$outDir/frontend/lib/src/modules/clientes/access_commands.json').readAsString(),
    ) as List).cast<Map>();
    final openRpt = macroCmds.singleWhere((c) => c['control'] == 'BtnOpenRpt');
    expect(openRpt['status'], 'partial_navigation');
    expect(openRpt['href'], '#/access-report/rpt_clientes');

    final wizRpt = macroCmds.singleWhere((c) => c['control'] == 'BtnWizardRpt');
    expect(wizRpt['status'], 'partial_navigation');
    expect(wizRpt['href'], '#/access-report/rpt_clientes');

    final openQry = macroCmds.singleWhere((c) => c['control'] == 'BtnOpenQry');
    expect(openQry['status'], 'partial_navigation');
    expect(openQry['href'], '#/access-query/qry_clientes_ativos');

    final saveMacro = macroCmds.singleWhere((c) => c['control'] == 'BtnSave');
    expect(saveMacro['status'], 'partial_ui_action');
    expect(saveMacro['uiOperation'], 'save');

    final closeMacro = macroCmds.singleWhere((c) => c['control'] == 'BtnCloseMacro');
    expect(closeMacro['status'], 'partial_ui_action');
    expect(closeMacro['uiOperation'], 'close');

    // 2. VBA click commands on Pedidos (without embedded macros)
    final vbaCmds = (jsonDecode(
      await File('$outDir/frontend/lib/src/modules/pedidos/access_commands.json').readAsString(),
    ) as List).cast<Map>();
    expect(vbaCmds.singleWhere((c) => c['control'] == 'BtnFecharVba')['uiOperation'], 'close');
    expect(vbaCmds.singleWhere((c) => c['control'] == 'BtnExcluirVba')['uiOperation'], 'delete');
    expect(vbaCmds.singleWhere((c) => c['control'] == 'BtnImprimirRptVba')['href'], '#/access-report/rpt_clientes');
    expect(vbaCmds.singleWhere((c) => c['control'] == 'BtnAbrirQryVba')['href'], '#/access-query/qry_busca_cliente');
    expect(vbaCmds.singleWhere((c) => c['control'] == 'BtnRefreshVba')['uiOperation'], 'refresh');
    expect(vbaCmds.singleWhere((c) => c['control'] == 'BtnDesfazerVba')['uiOperation'], 'undo');
    expect(vbaCmds.singleWhere((c) => c['control'] == 'BtnRptComFiltro')['status'], 'unsupported');

    // 3. Generated HTML & Dart UI wiring
    final incluirHtml = await File(
      '$outDir/frontend/lib/src/modules/pedidos/pages/incluir_pedidos/incluir_pedidos_page.html',
    ).readAsString();
    expect(incluirHtml, contains("executeUiOperation('close')"));
    expect(incluirHtml, contains("executeUiOperation('delete')"));
    expect(incluirHtml, contains('href="#/access-query/qry_busca_cliente"'));

    final incluirDart = await File(
      '$outDir/frontend/lib/src/modules/pedidos/pages/incluir_pedidos/incluir_pedidos_page.dart',
    ).readAsString();
    expect(incluirDart, contains("@Output('onCloseForm')"));
    expect(incluirDart, contains("@Output('onDeleteEntity')"));
    expect(incluirDart, contains('_service.deleteRow(id)'));

    final consultarHtml = await File(
      '$outDir/frontend/lib/src/modules/pedidos/pages/consultar_pedidos/consultar_pedidos_page.html',
    ).readAsString();
    expect(consultarHtml, contains('(onCloseForm)="closeForm()"'));
    expect(consultarHtml, contains('(onDeleteEntity)="onDeleteEntity()"'));

    final consultarDart = await File(
      '$outDir/frontend/lib/src/modules/pedidos/pages/consultar_pedidos/consultar_pedidos_page.dart',
    ).readAsString();
    expect(consultarDart, contains('void closeForm()'));
    expect(consultarDart, contains('Future<void> onDeleteEntity()'));

    // 4. Backend routes + AccessQueryController.list
    final apiRoutes = await File('$outDir/backend/lib/src/routes/api_routes.dart').readAsString();
    expect(apiRoutes, contains("app.get('/api/v1/access-queries', AccessQueryController.list)"));
    final publicRoutes = await File(
      '$outDir/backend/lib/src/public/api/routes/public_api_routes.dart',
    ).readAsString();
    expect(publicRoutes, contains("app.get('/api/v1/access-queries', AccessQueryController.list)"));

    // 5. AccessQueryViewer & Shell wiring (no ~ temp query leak)
    final viewerDart = await File(
      '$outDir/frontend/lib/src/shared/components/access_query_viewer.dart',
    ).readAsString();
    expect(viewerDart, contains('QryClientesAtivos'));
    expect(viewerDart, contains('QryBuscaCliente'));
    expect(viewerDart, isNot(contains('~TMPCLP1')));

    final appDart = await File('$outDir/frontend/lib/app_component.dart').readAsString();
    expect(appDart, contains("import 'src/shared/components/access_query_viewer.dart';"));
    expect(appDart, contains('#/access-query/'));
    expect(appDart, contains('_queryRoutes'));

    final openMenu = macroCmds.singleWhere((c) => c['control'] == 'BtnOpenMenu');
    expect(openMenu['status'], 'partial_navigation');
    expect(openMenu['href'], '#/access-menu/frm_menu_relatorios');

    final menuPanelDart = await File(
      '$outDir/frontend/lib/src/shared/components/access_menu_panel.dart',
    ).readAsString();
    expect(menuPanelDart, contains('Central de Relatorios'));
    expect(menuPanelDart, contains('#/access-report/rpt_clientes'));
    expect(menuPanelDart, contains('#/access-query/qry_clientes_ativos'));
    expect(menuPanelDart, contains('#/access-form/clientes'));

    expect(appDart, contains("import 'src/shared/components/access_menu_panel.dart';"));
    expect(appDart, contains('#/access-menu/'));
    expect(appDart, contains('_menuRoutes'));

    final appHtml = await File('$outDir/frontend/lib/app_component.html').readAsString();
    expect(appHtml, contains('access-query-viewer'));
    expect(appHtml, contains("'access-queries'"));
    expect(appHtml, contains('access-menu-panel'));
    expect(appHtml, contains("'access-menus'"));
  });
}
