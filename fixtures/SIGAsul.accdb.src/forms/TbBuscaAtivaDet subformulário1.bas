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
    ItemSuffix =14
    Left =1110
    Top =6045
    Right =18705
    Bottom =9705
    FrozenColumns =8
    RecSrcDt = Begin
        0x8c84b674ce8ae540
    End
    RecordSource ="SELECT TbBuscaAtivaDet.CodBADet, TbBuscaAtivaDet.CodBA, TbBuscaAtivaDet.DataBA, "
        "TbBuscaAtivaDet.Tecnico, TbBuscaAtivaDet.Função, TbBuscaAtivaDet.[Nao Localizado"
        "], TbBuscaAtivaDet.[Motivo Não localizado] FROM TbBuscaAtivaDet; "
    Caption ="TbBuscaAtivaDet subformulário1"
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
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            BorderThemeColorIndex =1
            BorderShade =65.0
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
            Height =3066
            Name ="Detalhe"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2895
                    Top =60
                    Height =315
                    ColumnWidth =1065
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodBADet"
                    ControlSource ="CodBADet"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =60
                    LayoutCachedWidth =4596
                    LayoutCachedHeight =375
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =60
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodBADet_Rótulo"
                            Caption ="CodBADet"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =60
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =390
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2895
                    Top =459
                    Width =3660
                    Height =330
                    ColumnWidth =1350
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodBA"
                    ControlSource ="CodBA"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbBuscaAtiva].[CodBA] FROM TbBuscaAtiva ORDER BY [CodBA]; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2895
                    LayoutCachedTop =459
                    LayoutCachedWidth =6555
                    LayoutCachedHeight =789
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =459
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodBA_Rótulo"
                            Caption ="CodBA"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =459
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =789
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2895
                    Top =858
                    Width =1620
                    Height =330
                    ColumnWidth =1875
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataBA"
                    ControlSource ="DataBA"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =858
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =1188
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =858
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataBA_Rótulo"
                            Caption ="DataBA"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =858
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =1188
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =2223
                    ColumnWidth =1875
                    TabIndex =5
                    BorderColor =10921638
                    Name ="Localizado"
                    ControlSource ="Nao Localizado"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2223
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =2463
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2223
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Localizado_Rótulo"
                            Caption ="Não Localizado"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2223
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2553
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =4830
                    Left =2892
                    Top =2622
                    Width =3660
                    Height =330
                    ColumnWidth =4335
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Motivo Não localizado"
                    ControlSource ="Motivo Não localizado"
                    RowSourceType ="Value List"
                    RowSource ="\"ENDEREÇO NÃO ENCONTRADO\";\"PESSOA NÃO ENCONTRADA NO ENDEREÇO\";\"FALECIMENTO\""
                        ";\"MUDANÇA DE ENDEREÇO\""
                    ColumnWidths ="4830"
                    EventProcPrefix ="Motivo_Não_localizado"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2622
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =2952
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2622
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Motivo Não localizado_Rótulo"
                            Caption ="Motivo Não localizado"
                            EventProcPrefix ="Motivo_Não_localizado_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2622
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2952
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    ListWidth =2880
                    Left =2894
                    Top =1305
                    Height =315
                    ColumnWidth =5130
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Tecnicotxt"
                    ControlSource ="Tecnico"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbCadFuncionario].[CodFunc], [TbCadFuncionario].[Nome], [TbCadFuncionari"
                        "o].[FUNÇÃO NO SISTEMA] FROM TbCadFuncionario ORDER BY [Nome]; "
                    ColumnWidths ="0;2576;1442"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2894
                    LayoutCachedTop =1305
                    LayoutCachedWidth =4595
                    LayoutCachedHeight =1620
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1193
                            Top =1305
                            Width =780
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo12"
                            Caption ="Tecnico"
                            GridlineColor =10921638
                            LayoutCachedLeft =1193
                            LayoutCachedTop =1305
                            LayoutCachedWidth =1973
                            LayoutCachedHeight =1620
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2948
                    Top =1757
                    Height =315
                    ColumnWidth =1875
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Funçãotxt"
                    ControlSource ="Função"
                    GridlineColor =10921638

                    LayoutCachedLeft =2948
                    LayoutCachedTop =1757
                    LayoutCachedWidth =4649
                    LayoutCachedHeight =2072
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1247
                            Top =1757
                            Width =735
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo13"
                            Caption ="Função"
                            GridlineColor =10921638
                            LayoutCachedLeft =1247
                            LayoutCachedTop =1757
                            LayoutCachedWidth =1982
                            LayoutCachedHeight =2072
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
' See "TbBuscaAtivaDet subformulário1.cls"
