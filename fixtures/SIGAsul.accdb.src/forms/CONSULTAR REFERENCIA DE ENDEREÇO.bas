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
    Width =10209
    ItemSuffix =19
    Left =1200
    Top =1515
    Right =18090
    Bottom =7245
    RecSrcDt = Begin
        0x3b62b8eb09dce540
    End
    RecordSource ="CONSULTAR REFERENCIA DE ENDEREÇO"
    Caption ="CONSULTAR REFERENCIA DE ENDEREÇO"
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
                    Width =7938
                    Height =969
                    FontSize =20
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Rótulo18"
                    Caption ="CONSULTAR REFERENCIA DE ENDEREÇO"
                    GridlineColor =10921638
                    LayoutCachedLeft =57
                    LayoutCachedTop =57
                    LayoutCachedWidth =7995
                    LayoutCachedHeight =1026
                End
            End
        End
        Begin Section
            Height =4833
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
                    Width =1530
                    Height =330
                    ColumnWidth =1140
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodFam"
                    ControlSource ="CodFam"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =342
                    LayoutCachedWidth =4422
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
                            Name ="CodFam_Rótulo"
                            Caption ="CodFam"
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
                    ColumnWidth =1095
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataCad"
                    ControlSource ="DataCad"
                    InputMask ="99/99/9999"
                    GridlineColor =10921638

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
                            Name ="DataCad_Rótulo"
                            Caption ="DataCad"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1140
                    Width =7260
                    Height =600
                    ColumnWidth =2820
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Endereço"
                    ControlSource ="Endereço"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1140
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =1740
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1140
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Endereço_Rótulo"
                            Caption ="Endereço"
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
                    ListWidth =1441
                    Left =2892
                    Top =1824
                    Width =3660
                    Height =330
                    ColumnWidth =1800
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Bairro"
                    ControlSource ="Bairro"
                    RowSourceType ="Value List"
                    RowSource ="\"Ancora\";\"Atlântica\";\"Balneário das Garças\";\"Balneário Remanso\";\"Boca d"
                        "a Barra\";\"Bosque d`areia\";\"Bosque da Praia\";\"Cantagalo\";\"Cantinho do Mar"
                        "\";\"Casa Grande\";\"Claudio Ribeiro\";\"Centro\";\"Cidade Beira Mar\";\"Cidade "
                        "Praiana\";\"Colinas\";\"Condomínio Beira Rio\";\"Condomínio Maria Turri\";\"Cond"
                        "omínio Porto Seguro\";\"Costazul\";\"Enseada das Gaivotas\";\"Extensão do bosque"
                        "\";\"Extensão Novo Rio das Ostras\";\"Extensão Serramar\";\"Floresta\";\"Gelson "
                        "Apicelo\";\"Jardim Bela Vista\";\"Jardim Campomar \";\"Jardim Mariléa\";\"Jardim"
                        " Miramar\";\"Jardim Patrícia\";\"Liberdade\";\"Mar do Norte\";\"Mar y Lago\";\"M"
                        "ariléa Chácara\";\"Nova Aliança\";\"Nova Cidade\";\"Nova Esperança\";\"Novo Rio "
                        "das Ostras\";\"Operário\";\"Ouro Verde\";\"Palmital\";\"Parque São Jorge\";\"Par"
                        "que Zabulão\";\"Peroba\";\"Praia Mar\";\"Recanto\";\"Recreio\";\"Reduto da Paz\""
                        ";\"Residencial Camping do Bosque\";\"Residencial Praia Âncora\";\"Residencial Ri"
                        "o das Ostras\";\"Rocha Leão\";\"São Cristóvão\";\"Serramar\";\"Sobradinho Cervej"
                        "a\";\"Terra Firme\";\"Verdes Mares\";\"Village Rio das Ostras\";\"Village Sol e "
                        "Mar\";\"Viverde\""
                    ColumnWidths ="1441"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1824
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =2154
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1824
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Bairro_Rótulo"
                            Caption ="Bairro"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1824
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2154
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
                    ColumnWidth =3000
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Referencia"
                    ControlSource ="Referencia"
                    Format =">"
                    GridlineColor =10921638

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
                            Name ="Referencia_Rótulo"
                            Caption ="Referencia"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2223
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2553
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2907
                    Height =315
                    ColumnWidth =960
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodPessoa"
                    ControlSource ="CodPessoa"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2907
                    LayoutCachedWidth =4593
                    LayoutCachedHeight =3222
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2907
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="CodPessoa_Rótulo"
                            Caption ="CodPessoa"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2907
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3237
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =3306
                    Width =7260
                    Height =600
                    ColumnWidth =2325
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Nome"
                    ControlSource ="Nome"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3306
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =3906
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3306
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Nome_Rótulo"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3306
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3636
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =2640
                    Left =2892
                    Top =3990
                    Width =3660
                    Height =330
                    ColumnWidth =1845
                    TabIndex =7
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Parentesco"
                    ControlSource ="Parentesco"
                    RowSourceType ="Value List"
                    RowSource ="\"Pessoa de Referencia\";\"Conjuge/Companheiro(a)\";\"Filho(a)\";\"Enteado(a)\";"
                        "\"Neto(a)/Bisneto(a)\";\"Pai/Mae\";\"Sogro(a)\";\"Irmão(ã)\";\"Genro/Nora\";\"Ou"
                        "tro\";\"Não Parente\""
                    ColumnWidths ="2640"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3990
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =4320
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3990
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Parentesco_Rótulo"
                            Caption ="Parentesco"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3990
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4320
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =4389
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DNasc"
                    ControlSource ="DNasc"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =4389
                    LayoutCachedWidth =4512
                    LayoutCachedHeight =4719
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4389
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="DNasc_Rótulo"
                            Caption ="DNasc"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =4389
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4719
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
