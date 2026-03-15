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
    Width =6609
    DatasheetFontHeight =11
    ItemSuffix =11
    Top =900
    Right =11535
    Bottom =12045
    OrderBy ="[Lookup_BENEFICIARIO].[Nome]"
    RecSrcDt = Begin
        0x28d108a213f8e540
    End
    RecordSource ="coletivo total beneficiarios"
    Caption ="coletivo total beneficiarios"
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
                    Width =5274
                    Height =969
                    FontSize =20
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Rótulo10"
                    Caption ="coletivo total beneficiarios"
                    GridlineColor =10921638
                    LayoutCachedLeft =57
                    LayoutCachedTop =57
                    LayoutCachedWidth =5331
                    LayoutCachedHeight =1026
                End
            End
        End
        Begin Section
            Height =2382
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
                    ColumnWidth =1701
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodBenef"
                    ControlSource ="CodBenef"
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
                            ForeColor =6710886
                            Name ="CodBenef_Rótulo"
                            Caption ="CodBenef"
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
                    ListWidth =6795
                    Left =2892
                    Top =741
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="BENEFICIARIO"
                    ControlSource ="BENEFICIARIO"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome], [TbPessoa].[CPF], [TbPessoa].["
                        "Celular] FROM TbPessoa ORDER BY [Nome]; "
                    ColumnWidths ="0;3915;1440;1440"
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
                            Name ="BENEFICIARIO_Rótulo"
                            Caption ="BENEFICIARIO"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =4515
                    Left =2892
                    Top =1140
                    Width =3660
                    Height =330
                    ColumnWidth =855
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="TipoBeneficio"
                    ControlSource ="TipoBeneficio"
                    RowSourceType ="Value List"
                    RowSource ="BMD;BMI;BSF"
                    ColumnWidths ="4515"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1140
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =1470
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1140
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="TipoBeneficio_Rótulo"
                            Caption ="TipoBeneficio"
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
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =1440
                    Left =2892
                    Top =1539
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nome"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT TbPessoa.CodPessoa, TbPessoa.Nome, TbPessoa.Celular FROM TbPessoa ORDER B"
                        "Y TbPessoa.[Nome]; "
                    ColumnWidths ="0;1440"
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
                            ForeColor =6710886
                            Name ="Nome_Rótulo"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1539
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1869
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1938
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="ÚltimoDeDataCol"
                    ControlSource ="ÚltimoDeDataCol"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1938
                    LayoutCachedWidth =4512
                    LayoutCachedHeight =2268
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1938
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="ÚltimoDeDataCol_Rótulo"
                            Caption ="ÚltimoDeDataCol"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1938
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2268
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
