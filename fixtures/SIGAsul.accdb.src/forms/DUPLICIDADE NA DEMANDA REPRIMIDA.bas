Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    OrderByOn = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =8193
    DatasheetFontHeight =11
    ItemSuffix =7
    OrderBy ="[Lookup_Nome].[Nome], [Encontrar duplicatas para TbDemandaReprimida].[data]"
    RecSrcDt = Begin
        0xe6bdf58aedd4e540
    End
    RecordSource ="Encontrar duplicatas para TbDemandaReprimida"
    Caption ="DUPLICIDADE NA DEMANDA REPRIMIDA"
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
            ForeTint =60.0
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
            Height =1026
            Name ="CabeçalhoDoFormulário"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
            Begin
                Begin Label
                    OverlapFlags =85
                    Left =57
                    Top =57
                    Width =8136
                    Height =969
                    FontSize =20
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Rótulo6"
                    Caption ="DUPLICIDADE NA DEMANDA REPRIMIDA"
                    GridlineColor =10921638
                    LayoutCachedLeft =57
                    LayoutCachedTop =57
                    LayoutCachedWidth =8193
                    LayoutCachedHeight =1026
                End
            End
        End
        Begin Section
            Height =1584
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
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="data"
                    ControlSource ="data"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =342
                    LayoutCachedWidth =4512
                    LayoutCachedHeight =672
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =342
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="data_Rótulo"
                            Caption ="data"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =4
                    ListWidth =6735
                    Left =2892
                    Top =741
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nome"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome], [TbPessoa].[Celular], [TbPesso"
                        "a].[DNasc] FROM TbPessoa ORDER BY [Nome]; "
                    ColumnWidths ="0;3855;1440;1440"
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
                            ForeColor =6710886
                            Name ="Nome_Rótulo"
                            Caption ="Nome"
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
                    Height =315
                    ColumnWidth =1701
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodDemanda"
                    ControlSource ="CodDemanda"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1140
                    LayoutCachedWidth =4593
                    LayoutCachedHeight =1455
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1140
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="CodDemanda_Rótulo"
                            Caption ="CodDemanda"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1470
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
