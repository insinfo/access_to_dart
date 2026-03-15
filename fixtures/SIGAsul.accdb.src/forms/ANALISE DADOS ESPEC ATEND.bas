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
    Width =10209
    DatasheetFontHeight =9
    ItemSuffix =22
    Left =690
    Top =285
    Right =19830
    Bottom =8775
    FrozenColumns =11
    OrderBy ="[ANALISE DADOS ESPECIALIDADE ATEND].[FuncaoFuncionario]"
    RecSrcDt = Begin
        0x2261debe2bcde540
    End
    RecordSource ="ANALISE DADOS ESPECIALIDADE ATEND"
    Caption ="ANALISE DADOS ESPEC ATEND"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    TotalsRow =1
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
                    Width =6066
                    Height =969
                    FontSize =20
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Rótulo20"
                    Caption ="ANALISE DADOS ESPEC ATEND"
                    GridlineColor =10921638
                    LayoutCachedLeft =57
                    LayoutCachedTop =57
                    LayoutCachedWidth =6123
                    LayoutCachedHeight =1026
                End
            End
        End
        Begin Section
            Height =5782
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
                    ColumnWidth =1080
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodAtend"
                    ControlSource ="CodAtend"
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
                            Name ="CodAtend_Rótulo"
                            Caption ="CodAtend"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =741
                    Width =1620
                    Height =330
                    ColumnWidth =1155
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Data"
                    ControlSource ="Data"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2892
                    LayoutCachedTop =741
                    LayoutCachedWidth =4512
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
                            Name ="Data_Rótulo"
                            Caption ="Data"
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
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =1440
                    Left =2892
                    Top =1140
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nome"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome] FROM TbPessoa ORDER BY [Nome]; "
                    ColumnWidths ="0;1440"
                    GridlineColor =10921638
                    AggregateType =2

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
                            Name ="Nome_Rótulo"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1470
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1539
                    Width =7260
                    Height =600
                    ColumnWidth =3255
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NomeFunc"
                    ControlSource ="Funcionario"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1539
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =2139
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1539
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="NomeFunc_Rótulo"
                            Caption ="NomeFunc"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1539
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1869
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2223
                    Width =7260
                    Height =600
                    ColumnWidth =2055
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="FuncaoFuncionario"
                    ControlSource ="FuncaoFuncionario"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2223
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =2823
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2223
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="FuncaoFuncionario_Rótulo"
                            Caption ="FuncaoFuncionario"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2223
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2553
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =2907
                    TabIndex =5
                    BorderColor =10921638
                    Name ="Social"
                    ControlSource ="Social"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2907
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =3147
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2907
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Social_Rótulo"
                            Caption ="Social"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2907
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3237
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =3306
                    TabIndex =6
                    BorderColor =10921638
                    Name ="Psicologico"
                    ControlSource ="Psicologico"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3306
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =3546
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3306
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Psicologico_Rótulo"
                            Caption ="Psicologico"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3306
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3636
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =3705
                    TabIndex =7
                    BorderColor =10921638
                    Name ="Multidisciplinar"
                    ControlSource ="Multidisciplinar"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3705
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =3945
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3705
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Multidisciplinar_Rótulo"
                            Caption ="Multidisciplinar"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3705
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4035
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =4104
                    TabIndex =8
                    BorderColor =10921638
                    Name ="OrientadorSoc"
                    ControlSource ="OrientadorSoc"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2892
                    LayoutCachedTop =4104
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =4344
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4104
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="OrientadorSoc_Rótulo"
                            Caption ="OrientadorSoc"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =4104
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4434
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =4920
                    TabIndex =10
                    BorderColor =10921638
                    Name ="AtGestao"
                    ControlSource ="AtGestao"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2895
                    LayoutCachedTop =4920
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =5160
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =4920
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="AtGestao_Rótulo"
                            Caption ="AtGestao"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =4920
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =5250
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2664
                    Top =4535
                    TabIndex =9
                    BorderColor =10921638
                    Name ="Administrativo"
                    ControlSource ="Administrativo"
                    GridlineColor =10921638
                    AggregateType =2

                    LayoutCachedLeft =2664
                    LayoutCachedTop =4535
                    LayoutCachedWidth =2924
                    LayoutCachedHeight =4775
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =2894
                            Top =4505
                            Width =1455
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Rótulo21"
                            Caption ="Administrativo"
                            GridlineColor =10921638
                            LayoutCachedLeft =2894
                            LayoutCachedTop =4505
                            LayoutCachedWidth =4349
                            LayoutCachedHeight =4820
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
