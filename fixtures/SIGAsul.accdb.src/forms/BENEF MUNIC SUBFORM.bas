Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =10209
    DatasheetFontHeight =11
    ItemSuffix =24
    Left =-225
    Top =3510
    Right =19665
    Bottom =6975
    RecSrcDt = Begin
        0xdcea874d1c84e540
    End
    RecordSource ="SELECT [TbBenfMunDet].[CodBefMunDetalhe], [TbBenfMunDet].[CodBenef], [TbBenfMunD"
        "et].[Data do Atendimento], [TbBenfMunDet].[Ano de referencia], [TbBenfMunDet].[C"
        "odFunc], [TbBenfMunDet].[NomeFunc], [TbBenfMunDet].[Tipo de Atendimento], [TbBen"
        "fMunDet].[Cras de Transferencia], [TbBenfMunDet].[Situação Beneficio], [TbBenfMu"
        "nDet].[Motivo Desligamento], [TbBenfMunDet].[Motivo Suspensão], [TbBenfMunDet].["
        "Obs] FROM TbBenfMunDet; "
    Caption ="BENEF MUNIC SUBFORM"
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
            Height =5730
            Name ="Detalhe"
            AutoHeight =1
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
                    ColumnWidth =1155
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodBefMunDetalhe"
                    ControlSource ="CodBefMunDetalhe"
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
                            Name ="CodBefMunDetalhe_Rótulo"
                            Caption ="CodBefMunDetalhe"
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
                    ColumnWidth =825
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodBenef"
                    ControlSource ="CodBenef"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbBeneficiosMunicipais].[CodBenef] FROM TbBeneficiosMunicipais ORDER BY "
                        "[CodBenef]; "
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
                            Name ="CodBenef_Rótulo"
                            Caption ="CodBenef"
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
                    ColumnWidth =1620
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Data do Atendimento"
                    ControlSource ="Data do Atendimento"
                    EventProcPrefix ="Data_do_Atendimento"
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
                            Name ="Data do Atendimento_Rótulo"
                            Caption ="Data do Atendimento"
                            EventProcPrefix ="Data_do_Atendimento_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1470
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =2892
                    Top =1539
                    Width =3660
                    Height =330
                    ColumnWidth =825
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Ano de referencia"
                    ControlSource ="Ano de referencia"
                    RowSourceType ="Value List"
                    RowSource ="2018;2019;2020;2021;2022;2023;2024;2025"
                    ColumnWidths ="1441"
                    EventProcPrefix ="Ano_de_referencia"
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
                            Name ="Ano de referencia_Rótulo"
                            Caption ="Ano de referencia"
                            EventProcPrefix ="Ano_de_referencia_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1539
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1869
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2880
                    Left =2892
                    Top =1938
                    Width =3660
                    Height =330
                    ColumnWidth =765
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodFuncTXT"
                    ControlSource ="CodFunc"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbCadFuncionario].[CodFunc], [TbCadFuncionario].[Nome] FROM TbCadFuncion"
                        "ario ORDER BY [CodFunc]; "
                    ColumnWidths ="1440;1440"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

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
                            Name ="CodFunc_Rótulo"
                            Caption ="CodFunc"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1938
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2268
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2890
                    Top =2437
                    Width =7260
                    Height =600
                    ColumnWidth =3000
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NomeFuncTXT"
                    ControlSource ="NomeFunc"
                    GridlineColor =10921638

                    LayoutCachedLeft =2890
                    LayoutCachedTop =2437
                    LayoutCachedWidth =10150
                    LayoutCachedHeight =3037
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =340
                            Top =2437
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NomeFunc_Rótulo"
                            Caption ="NomeFunc"
                            GridlineColor =10921638
                            LayoutCachedLeft =340
                            LayoutCachedTop =2437
                            LayoutCachedWidth =2800
                            LayoutCachedHeight =2767
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =247
                    IMESentenceMode =3
                    ListWidth =4170
                    Left =2892
                    Top =3021
                    Width =3660
                    Height =330
                    ColumnWidth =1830
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Tipo de Atendimento"
                    ControlSource ="Tipo de Atendimento"
                    RowSourceType ="Value List"
                    RowSource ="\"DESLIGAMENTO\";\"INCLUSÃO\";\"REATIVAÇÃO\";\"ATUALIZAÇÃO\";\"SUSPENSÃO\";\"TRA"
                        "NSFERÊNCIA DE CRAS\";\"TRANSFERÊNCIA DE TITULARIDADE\""
                    ColumnWidths ="4171"
                    EventProcPrefix ="Tipo_de_Atendimento"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3021
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =3351
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3021
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Tipo de Atendimento_Rótulo"
                            Caption ="Tipo de Atendimento"
                            EventProcPrefix ="Tipo_de_Atendimento_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3021
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3351
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
                    Top =3420
                    Width =3660
                    Height =330
                    ColumnWidth =1020
                    TabIndex =7
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Cras de Transferencia"
                    ControlSource ="Cras de Transferencia"
                    RowSourceType ="Value List"
                    RowSource ="\"Central\";\"Norte\";\"Sul\";\"Mar do Norte\";\"Cantagalo\";\"Rocha Leão\""
                    ColumnWidths ="1440"
                    EventProcPrefix ="Cras_de_Transferencia"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3420
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =3750
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3420
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Cras de Transferencia_Rótulo"
                            Caption ="Cras de Transferencia"
                            EventProcPrefix ="Cras_de_Transferencia_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3420
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3750
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =2892
                    Top =3819
                    Width =3660
                    Height =330
                    ColumnWidth =1545
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Situação Beneficio"
                    ControlSource ="Situação Beneficio"
                    RowSourceType ="Value List"
                    RowSource ="\"Desligado\";\"Suspenso\";\"Ativo\";\"Transferido\""
                    ColumnWidths ="1441"
                    EventProcPrefix ="Situação_Beneficio"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3819
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =4149
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3819
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Situação Beneficio_Rótulo"
                            Caption ="Situação Beneficio"
                            EventProcPrefix ="Situação_Beneficio_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3819
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4149
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =2892
                    Top =4218
                    Width =3660
                    Height =330
                    ColumnWidth =735
                    TabIndex =9
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Motivo Desligamento"
                    ControlSource ="Motivo Desligamento"
                    RowSourceType ="Value List"
                    RowSource ="\"Falecimento\";\"Mudança Município\";\"Fora Perfil\";\"Outros\""
                    ColumnWidths ="1441"
                    EventProcPrefix ="Motivo_Desligamento"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =4218
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =4548
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4218
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Motivo Desligamento_Rótulo"
                            Caption ="Motivo Desligamento"
                            EventProcPrefix ="Motivo_Desligamento_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =4218
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4548
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =3960
                    Left =2892
                    Top =4617
                    Width =3660
                    Height =330
                    ColumnWidth =975
                    TabIndex =10
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Motivo Suspensão"
                    ControlSource ="Motivo Suspensão"
                    RowSourceType ="Value List"
                    RowSource ="\"Não localizado\";\"Não compareceu ao recadastramento\";\"Transferência de CRAS"
                        "\";\"Outros\""
                    ColumnWidths ="3961"
                    EventProcPrefix ="Motivo_Suspensão"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =4617
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =4947
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4617
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Motivo Suspensão_Rótulo"
                            Caption ="Motivo Suspensão"
                            EventProcPrefix ="Motivo_Suspensão_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =4617
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4947
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =5016
                    Width =7260
                    Height =600
                    ColumnWidth =3000
                    TabIndex =11
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Obs"
                    ControlSource ="Obs"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =5016
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =5616
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =5016
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Obs_Rótulo"
                            Caption ="Obs"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =5016
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =5346
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
' See "BENEF MUNIC SUBFORM.cls"
