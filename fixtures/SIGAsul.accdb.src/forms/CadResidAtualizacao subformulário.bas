Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =16611
    DatasheetFontHeight =11
    ItemSuffix =11
    Left =-3060
    Top =4680
    Right =14220
    Bottom =8955
    FrozenColumns =7
    RecSrcDt = Begin
        0xb3a6ee511489e540
    End
    RecordSource ="SELECT CadResidAtualizacao.CodCadResAtual, CadResidAtualizacao.CodCadResd, CadRe"
        "sidAtualizacao.[DATA ATUALIZ], CadResidAtualizacao.[TIPO ATEND], CadResidAtualiz"
        "acao.[TECNICO/ADM], CadResidAtualizacao.[NOME TECADM] FROM CadResidAtualizacao; "
    Caption ="CadResidAtualizacao subformulário"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin ComboBox
            AddColon = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            Height =0
            Name ="CabeçalhoDoFormulário"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =2834
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =342
                    Height =315
                    ColumnWidth =1701
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodCadResAtual"
                    ControlSource ="CodCadResAtual"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =342
                    LayoutCachedWidth =4593
                    LayoutCachedHeight =657
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =342
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodCadResAtual_Rótulo"
                            Caption ="CodCadResAtual"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2892
                    Top =741
                    Width =3660
                    Height =330
                    ColumnWidth =1335
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodCadResd"
                    ControlSource ="CodCadResd"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [CadResidencia].[CodFam] FROM CadResidencia ORDER BY [CodFam]; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =741
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =1071
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =741
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodCadResd_Rótulo"
                            Caption ="CodCadResd"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1140
                    Width =1620
                    Height =330
                    ColumnWidth =2010
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DATA ATUALIZ"
                    ControlSource ="DATA ATUALIZ"
                    EventProcPrefix ="DATA_ATUALIZ"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1140
                    LayoutCachedWidth =4512
                    LayoutCachedHeight =1470
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1140
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DATA ATUALIZ_Rótulo"
                            Caption ="DATA ATUALIZ"
                            EventProcPrefix ="DATA_ATUALIZ_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1470
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2892
                    Top =1539
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="TIPO ATEND"
                    ControlSource ="TIPO ATEND"
                    RowSourceType ="Value List"
                    RowSource ="\"ADMINISTRATIVO\";\"SOCIAL\";\"PSICOLOGICO\""
                    ColumnWidths ="1440"
                    EventProcPrefix ="TIPO_ATEND"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1539
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =1869
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1539
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="TIPO ATEND_Rótulo"
                            Caption ="TIPO ATEND"
                            EventProcPrefix ="TIPO_ATEND_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1539
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1869
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2685
                    Left =2892
                    Top =1938
                    Width =3660
                    Height =330
                    ColumnWidth =2010
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="TECNICOADMTXT"
                    ControlSource ="TECNICO/ADM"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbCadFuncionario].[CodFunc], [TbCadFuncionario].[Nome] FROM TbCadFuncion"
                        "ario ORDER BY [CodFunc]; "
                    ColumnWidths ="405;2280"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638
                    ListItemsEditForm ="FrmCadFuncionarios"

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1938
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =2268
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1938
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="TECNICO/ADM_Rótulo"
                            Caption ="TECNICO/ADM"
                            EventProcPrefix ="TECNICO_ADM_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1938
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2268
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2891
                    Top =2324
                    Width =3636
                    Height =315
                    ColumnWidth =7050
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NOMETECADMTXT"
                    ControlSource ="NOME TECADM"
                    GridlineColor =10921638

                    LayoutCachedLeft =2891
                    LayoutCachedTop =2324
                    LayoutCachedWidth =6527
                    LayoutCachedHeight =2639
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1190
                            Top =2324
                            Width =1485
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo10"
                            Caption ="NOME TECADM"
                            GridlineColor =10921638
                            LayoutCachedLeft =1190
                            LayoutCachedTop =2324
                            LayoutCachedWidth =2675
                            LayoutCachedHeight =2639
                        End
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="RodapéDoFormulário"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "CadResidAtualizacao subformulário.cls"
