Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =18028
    DatasheetFontHeight =11
    ItemSuffix =17
    Left =870
    Top =1530
    Right =19350
    Bottom =10620
    FrozenColumns =11
    RecSrcDt = Begin
        0xa4e159e0d3b4e540
    End
    RecordSource ="MotivoNãoAtendimento"
    Caption ="Motivo de não atendimento"
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
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =6406
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    ListWidth =5295
                    Left =2895
                    Top =165
                    Width =3660
                    Height =330
                    ColumnWidth =3510
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="USUÁRIO"
                    ControlSource ="USUÁRIO"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome], [TbPessoa].[Celular] FROM TbPe"
                        "ssoa ORDER BY [Nome]; "
                    ColumnWidths ="0;3855;1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =165
                    LayoutCachedWidth =6555
                    LayoutCachedHeight =495
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =165
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="USUÁRIO_Rótulo"
                            Caption ="USUÁRIO"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =165
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =495
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2895
                    Top =564
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataMonit"
                    ControlSource ="DataMonit"
                    InputMask ="00/00/0000;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =564
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =894
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =564
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataMonit_Rótulo"
                            Caption ="DataMonit"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =564
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =894
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =963
                    TabIndex =2
                    BorderColor =10921638
                    Name ="ATENDIDO"
                    ControlSource ="ATENDIDO"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =963
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =1203
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =963
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="ATENDIDO_Rótulo"
                            Caption ="ATENDIDO"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =963
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =1293
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =4536
                    Left =2895
                    Top =1362
                    Width =3660
                    Height =330
                    ColumnWidth =2295
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="MotivoNão"
                    ControlSource ="MotivoNão"
                    RowSourceType ="Value List"
                    RowSource ="\"FALTA DE RECURSO FINANCEIRO\";\"CONDIÇÃO DE SAÚDE PESSOAL/FAMILIAR\";\"NEGATIV"
                        "A DE ATENDIMENTO\";\"SEM SISTEMA NA UNIDADE FINAL\";\"SERVIDOR RESPONSÁVEL NÃO E"
                        "STAVA\";\"DESISTIU DO ATENDIMENTO\";\"OUTROS\""
                    ColumnWidths ="4536"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =1362
                    LayoutCachedWidth =6555
                    LayoutCachedHeight =1692
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =1362
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="MotivoNão_Rótulo"
                            Caption ="MotivoNão"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =1362
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =1692
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2834
                    Top =1927
                    TabIndex =4
                    BorderColor =10921638
                    Name ="ENG"
                    ControlSource ="ENG"
                    GridlineColor =10921638

                    LayoutCachedLeft =2834
                    LayoutCachedTop =1927
                    LayoutCachedWidth =3094
                    LayoutCachedHeight =2167
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3064
                            Top =1897
                            Width =465
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo11"
                            Caption ="ENG"
                            GridlineColor =10921638
                            LayoutCachedLeft =3064
                            LayoutCachedTop =1897
                            LayoutCachedWidth =3529
                            LayoutCachedHeight =2212
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2834
                    Top =2267
                    TabIndex =5
                    BorderColor =10921638
                    Name ="RSA"
                    ControlSource ="RSA"
                    GridlineColor =10921638

                    LayoutCachedLeft =2834
                    LayoutCachedTop =2267
                    LayoutCachedWidth =3094
                    LayoutCachedHeight =2507
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3064
                            Top =2237
                            Width =435
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo12"
                            Caption ="RSA"
                            GridlineColor =10921638
                            LayoutCachedLeft =3064
                            LayoutCachedTop =2237
                            LayoutCachedWidth =3499
                            LayoutCachedHeight =2552
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2834
                    Top =2607
                    TabIndex =6
                    BorderColor =10921638
                    Name ="RS"
                    ControlSource ="RS"
                    GridlineColor =10921638

                    LayoutCachedLeft =2834
                    LayoutCachedTop =2607
                    LayoutCachedWidth =3094
                    LayoutCachedHeight =2847
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3064
                            Top =2577
                            Width =300
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo13"
                            Caption ="RS"
                            GridlineColor =10921638
                            LayoutCachedLeft =3064
                            LayoutCachedTop =2577
                            LayoutCachedWidth =3364
                            LayoutCachedHeight =2892
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2834
                    Top =2948
                    TabIndex =7
                    BorderColor =10921638
                    Name ="RE"
                    ControlSource ="RE"
                    GridlineColor =10921638

                    LayoutCachedLeft =2834
                    LayoutCachedTop =2948
                    LayoutCachedWidth =3094
                    LayoutCachedHeight =3188
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3064
                            Top =2918
                            Width =300
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo14"
                            Caption ="RE"
                            GridlineColor =10921638
                            LayoutCachedLeft =3064
                            LayoutCachedTop =2918
                            LayoutCachedWidth =3364
                            LayoutCachedHeight =3233
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2834
                    Top =3288
                    TabIndex =8
                    BorderColor =10921638
                    Name ="SF"
                    ControlSource ="SF"
                    GridlineColor =10921638

                    LayoutCachedLeft =2834
                    LayoutCachedTop =3288
                    LayoutCachedWidth =3094
                    LayoutCachedHeight =3528
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3064
                            Top =3258
                            Width =285
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo15"
                            Caption ="SF"
                            GridlineColor =10921638
                            LayoutCachedLeft =3064
                            LayoutCachedTop =3258
                            LayoutCachedWidth =3349
                            LayoutCachedHeight =3573
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2834
                    Top =3628
                    TabIndex =9
                    BorderColor =10921638
                    Name ="OP"
                    ControlSource ="OP"
                    GridlineColor =10921638

                    LayoutCachedLeft =2834
                    LayoutCachedTop =3628
                    LayoutCachedWidth =3094
                    LayoutCachedHeight =3868
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3064
                            Top =3598
                            Width =345
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo16"
                            Caption ="OP"
                            GridlineColor =10921638
                            LayoutCachedLeft =3064
                            LayoutCachedTop =3598
                            LayoutCachedWidth =3409
                            LayoutCachedHeight =3913
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
