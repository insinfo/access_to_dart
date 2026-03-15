Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    PopUp = NotDefault
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11057
    DatasheetFontHeight =11
    ItemSuffix =389
    Left =3765
    Top =2100
    RecSrcDt = Begin
        0x92a654bc2bfee540
    End
    RecordSource ="beneficiosMunicListagemGeralFichaBenef"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    FitToPage =1
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
        Begin Rectangle
            BorderLineStyle =0
            Width =850
            Height =850
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
            BorderThemeColorIndex =0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            SizeMode =3
            PictureAlignment =2
            Width =1701
            Height =1701
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
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
            ShowDatePicker =0
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
        Begin UnboundObjectFrame
            OldBorderStyle =1
            Width =4536
            Height =2835
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Attachment
            BackStyle =0
            BorderLineStyle =0
            PictureSizeMode =3
            Width =1701
            Height =1701
            LabelX =-1701
            AddColon =0
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin BreakLevel
            SortOrder = NotDefault
            GroupHeader = NotDefault
            GroupOn =3
            ControlSource ="MáxDeDATA ATUALIZ"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =1485
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Width =4980
                    Height =1485
                    BorderColor =10921638
                    Name ="LOGO"
                    ControlSource ="LOGO"
                    GridlineColor =10921638

                    LayoutCachedWidth =4980
                    LayoutCachedHeight =1485
                End
            End
        End
        Begin PageHeader
            Height =0
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =0
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin Section
            KeepTogether = NotDefault
            Height =28415
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    ColumnCount =3
                    ListWidth =2880
                    Left =1680
                    Top =1170
                    Width =3111
                    Height =315
                    FontSize =10
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="CRAS Origem"
                    ControlSource ="CRAS Origem"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbUnidade].[CodUnidade], [TbUnidade].[NOME], [TbUnidade].[Nº UNIDADE] FR"
                        "OM TbUnidade ORDER BY [NOME]; "
                    ColumnWidths ="0;1440;1440"
                    EventProcPrefix ="CRAS_Origem"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =1680
                    LayoutCachedTop =1170
                    LayoutCachedWidth =4791
                    LayoutCachedHeight =1485
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =885
                    Top =1590
                    Width =7536
                    Height =315
                    ColumnWidth =3885
                    FontSize =10
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="TbBeneficiosMunicipais.Nome"
                    ControlSource ="NOMEPESSOA"
                    EventProcPrefix ="TbBeneficiosMunicipais_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =885
                    LayoutCachedTop =1590
                    LayoutCachedWidth =8421
                    LayoutCachedHeight =1905
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2229
                    Top =2835
                    Width =3981
                    Height =315
                    ColumnWidth =3630
                    FontSize =10
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="Responsavel"
                    ControlSource ="Responsavel"
                    GridlineColor =10921638

                    LayoutCachedLeft =2229
                    LayoutCachedTop =2835
                    LayoutCachedWidth =6210
                    LayoutCachedHeight =3150
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =9337
                    Top =2850
                    Height =315
                    FontSize =10
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="CPF Responsavel"
                    ControlSource ="CPF Responsavel"
                    InputMask ="000\\.000\\.000\\-00;0;_"
                    EventProcPrefix ="CPF_Responsavel"
                    GridlineColor =10921638

                    LayoutCachedLeft =9337
                    LayoutCachedTop =2850
                    LayoutCachedWidth =11038
                    LayoutCachedHeight =3165
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1564
                    Top =3270
                    Width =7551
                    Height =315
                    FontSize =10
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="NomeMae"
                    ControlSource ="NomeMae"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1564
                    LayoutCachedTop =3270
                    LayoutCachedWidth =9115
                    LayoutCachedHeight =3585
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1507
                    Top =3724
                    Width =7551
                    Height =315
                    FontSize =10
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="NomePai"
                    ControlSource ="NomePai"
                    GridlineColor =10921638

                    LayoutCachedLeft =1507
                    LayoutCachedTop =3724
                    LayoutCachedWidth =9058
                    LayoutCachedHeight =4039
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =680
                    Top =4138
                    Height =315
                    FontSize =10
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="CPF"
                    ControlSource ="CPF"
                    InputMask ="000\\.000\\.000\\-00;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =680
                    LayoutCachedTop =4138
                    LayoutCachedWidth =2381
                    LayoutCachedHeight =4453
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =623
                    Top =4592
                    Height =315
                    FontSize =10
                    TabIndex =7
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="RG"
                    ControlSource ="RG"
                    GridlineColor =10921638

                    LayoutCachedLeft =623
                    LayoutCachedTop =4592
                    LayoutCachedWidth =2324
                    LayoutCachedHeight =4907
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =4875
                    Top =4705
                    Height =315
                    FontSize =10
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="OrgaoRG"
                    ControlSource ="OrgaoRG"
                    GridlineColor =10921638

                    LayoutCachedLeft =4875
                    LayoutCachedTop =4705
                    LayoutCachedWidth =6576
                    LayoutCachedHeight =5020
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =9070
                    Top =4762
                    Height =315
                    FontSize =10
                    TabIndex =9
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="DEmisRG"
                    ControlSource ="DEmisRG"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =9070
                    LayoutCachedTop =4762
                    LayoutCachedWidth =10771
                    LayoutCachedHeight =5077
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1190
                    Top =5045
                    Width =7551
                    Height =315
                    FontSize =10
                    TabIndex =10
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="Endereço"
                    ControlSource ="Endereço"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1190
                    LayoutCachedTop =5045
                    LayoutCachedWidth =8741
                    LayoutCachedHeight =5360
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =1020
                    Top =5508
                    Width =7551
                    Height =315
                    FontSize =10
                    TabIndex =11
                    BorderColor =10921638
                    ForeColor =15540503
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

                    LayoutCachedLeft =1020
                    LayoutCachedTop =5508
                    LayoutCachedWidth =8571
                    LayoutCachedHeight =5823
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1077
                    Top =5896
                    Width =7551
                    Height =315
                    FontSize =10
                    TabIndex =12
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="Celular"
                    ControlSource ="Celular"
                    InputMask ="!\\(99\") \"!99000\\-0000;0;"
                    GridlineColor =10921638

                    LayoutCachedLeft =1077
                    LayoutCachedTop =5896
                    LayoutCachedWidth =8628
                    LayoutCachedHeight =6211
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2040
                    Top =6405
                    Width =7551
                    Height =315
                    FontSize =10
                    TabIndex =13
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="Referencia"
                    ControlSource ="Referencia"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2040
                    LayoutCachedTop =6405
                    LayoutCachedWidth =9591
                    LayoutCachedHeight =6720
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =6519
                    Top =4251
                    Height =315
                    FontSize =10
                    TabIndex =14
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="NIS"
                    ControlSource ="NIS"
                    GridlineColor =10921638

                    LayoutCachedLeft =6519
                    LayoutCachedTop =4251
                    LayoutCachedWidth =8220
                    LayoutCachedHeight =4566
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    ListWidth =4515
                    Left =6900
                    Top =420
                    Width =1476
                    Height =390
                    FontSize =15
                    FontWeight =700
                    TabIndex =15
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="TipoBeneficio"
                    ControlSource ="TipoBeneficio"
                    RowSourceType ="Value List"
                    RowSource ="BMD;BMI;BSF"
                    ColumnWidths ="4515"
                    GridlineColor =10921638

                    LayoutCachedLeft =6900
                    LayoutCachedTop =420
                    LayoutCachedWidth =8376
                    LayoutCachedHeight =810
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =540
                    Top =700
                    Width =1881
                    Height =315
                    FontSize =13
                    FontWeight =700
                    TabIndex =16
                    BorderColor =10921638
                    ForeColor =15540503
                    Name ="CodFam"
                    ControlSource ="CodFam"
                    GridlineColor =10921638

                    LayoutCachedLeft =540
                    LayoutCachedTop =700
                    LayoutCachedWidth =2421
                    LayoutCachedHeight =1015
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =540
                            Top =465
                            Width =810
                            Height =285
                            BorderColor =8355711
                            Name ="Rótulo280"
                            Caption ="CodFam"
                            GridlineColor =10921638
                            LayoutCachedLeft =540
                            LayoutCachedTop =465
                            LayoutCachedWidth =1350
                            LayoutCachedHeight =750
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =8010
                    Top =2430
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =17
                    BorderColor =10921638
                    Name ="DNasc"
                    ControlSource ="DNasc"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =8010
                    LayoutCachedTop =2430
                    LayoutCachedWidth =9711
                    LayoutCachedHeight =2745
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =7823
                    Top =1133
                    Width =1821
                    Height =315
                    FontWeight =700
                    TabIndex =18
                    BorderColor =10921638
                    ForeColor =255
                    Name ="MáxDeData do Atendimento"
                    ControlSource ="MáxDeData do Atendimento"
                    EventProcPrefix ="MáxDeData_do_Atendimento"
                    GridlineColor =10921638

                    LayoutCachedLeft =7823
                    LayoutCachedTop =1133
                    LayoutCachedWidth =9644
                    LayoutCachedHeight =1448
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin ComboBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =8371
                    Top =283
                    Width =2190
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =19
                    BorderColor =10921638
                    ForeColor =8210719
                    Name ="Situação Beneficio"
                    ControlSource ="Situação Beneficio"
                    RowSourceType ="Table/Query"
                    EventProcPrefix ="Situação_Beneficio"
                    GridlineColor =10921638

                    LayoutCachedLeft =8371
                    LayoutCachedTop =283
                    LayoutCachedWidth =10561
                    LayoutCachedHeight =553
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    Begin
                        Begin Label
                            TextAlign =1
                            Left =8371
                            Top =45
                            Width =2190
                            Height =270
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo297"
                            Caption ="Situação Beneficio"
                            GridlineColor =10921638
                            LayoutCachedLeft =8371
                            LayoutCachedTop =45
                            LayoutCachedWidth =10561
                            LayoutCachedHeight =315
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =8390
                    Top =793
                    Width =2190
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =20
                    BorderColor =10921638
                    Name ="MáxDeDATA ATUALIZ"
                    ControlSource ="MáxDeDATA ATUALIZ"
                    EventProcPrefix ="MáxDeDATA_ATUALIZ"
                    GridlineColor =10921638

                    LayoutCachedLeft =8390
                    LayoutCachedTop =793
                    LayoutCachedWidth =10580
                    LayoutCachedHeight =1063
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =75.0
                    Begin
                        Begin Label
                            TextAlign =1
                            Left =8390
                            Top =510
                            Width =2400
                            Height =270
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo298"
                            Caption ="DATA ATUALIZ CADASTRO"
                            GridlineColor =10921638
                            LayoutCachedLeft =8390
                            LayoutCachedTop =510
                            LayoutCachedWidth =10790
                            LayoutCachedHeight =780
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Width =10950
                    Height =465
                    FontSize =17
                    BorderColor =8355711
                    Name ="Rótulo300"
                    Caption ="FORMULÁRIO DE AVALIAÇÃO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedWidth =10950
                    LayoutCachedHeight =465
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =2550
                    Top =450
                    Width =4080
                    Height =330
                    FontSize =12
                    BorderColor =8355711
                    Name ="Rótulo301"
                    Caption ="Benefício de Transferência de Renda - "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2550
                    LayoutCachedTop =450
                    LayoutCachedWidth =6630
                    LayoutCachedHeight =780
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =3587
                    Top =735
                    Width =3750
                    Height =375
                    FontSize =14
                    BorderColor =8355711
                    Name ="Rótulo302"
                    Caption ="|__| Inclusão      |__| Atualização"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3587
                    LayoutCachedTop =735
                    LayoutCachedWidth =7337
                    LayoutCachedHeight =1110
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =1155
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo303"
                    Caption ="CRAS/Unidade: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =1155
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =1455
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =1575
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo304"
                    Caption ="Nome: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =1575
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =1875
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =1995
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo305"
                    Caption ="Nome Social: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =1995
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =2295
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =2415
                    Width =7875
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo306"
                    Caption ="Sexo:      |__| Feminino     |__| Masculino                                     "
                        "              Data de nascimento:  "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =2415
                    LayoutCachedWidth =7877
                    LayoutCachedHeight =2715
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Top =2850
                    Width =9300
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo307"
                    Caption ="Nome do responsável:                                                            "
                        "                                                         CPF do responsável: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedTop =2850
                    LayoutCachedWidth =9300
                    LayoutCachedHeight =3150
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =3255
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo308"
                    Caption ="Nome da mãe: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =3255
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =3555
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =3675
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo309"
                    Caption ="Nome do pai: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =3675
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =3975
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =4155
                    Width =555
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo310"
                    Caption ="CPF: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =4155
                    LayoutCachedWidth =557
                    LayoutCachedHeight =4455
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =4575
                    Width =450
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo311"
                    Caption ="RG: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =4575
                    LayoutCachedWidth =452
                    LayoutCachedHeight =4875
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =5025
                    Width =1200
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo312"
                    Caption ="Endereço: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =5025
                    LayoutCachedWidth =1202
                    LayoutCachedHeight =5325
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =5475
                    Width =960
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo313"
                    Caption ="Bairro: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =5475
                    LayoutCachedWidth =962
                    LayoutCachedHeight =5775
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =5895
                    Width =1020
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo314"
                    Caption ="Telefone: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =5895
                    LayoutCachedWidth =1022
                    LayoutCachedHeight =6195
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =6375
                    Width =2040
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo315"
                    Caption ="Ponto de referência: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =6375
                    LayoutCachedWidth =2042
                    LayoutCachedHeight =6675
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =6795
                    Width =11055
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo316"
                    Caption ="Tempo de residência:  |__| menos de 1 ano   |__| de 1 a 3 anos   |__| de 4 a 6 a"
                        "nos   |__| de 7 a 9 anos  |__| 10 anos ou mais "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =6795
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =7095
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =7215
                    Width =10725
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo317"
                    Caption ="Procedência:  |__| Outro município   |__| Outro estado   |__| Outro país - Qual?"
                        " ______________________________________ "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =7215
                    LayoutCachedWidth =10727
                    LayoutCachedHeight =7515
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =7650
                    Width =8175
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo318"
                    Caption ="Casa:  |__| Alugada   |__| Própria   |__| Em quitação   |__| Cedida  |__| Invasã"
                        "o  |__| Outros "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =7650
                    LayoutCachedWidth =8177
                    LayoutCachedHeight =7950
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =8535
                    Width =7965
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo319"
                    Caption ="Nº de cômodos:   Quarto:_____ Sala: _____ Cozinha: _____ Banheiro: _____  Outros"
                        ": _____ "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =8535
                    LayoutCachedWidth =7967
                    LayoutCachedHeight =8835
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =9015
                    Width =11055
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo320"
                    Caption ="Recebe algum benefício financeiro? Considerar também a composição familiar:   |_"
                        "_| SIM    |__| NÃO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =9015
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =9315
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =9390
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo321"
                    Caption ="Auxílio Brasil: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =9390
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =9690
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =9705
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo322"
                    Caption ="BPC - INSS: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =9705
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =10005
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =10005
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo323"
                    Caption ="BMI: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =10005
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =10305
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =10305
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo324"
                    Caption ="BMD: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =10305
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =10605
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =10605
                    Width =1590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo325"
                    Caption ="BSF: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =10605
                    LayoutCachedWidth =1592
                    LayoutCachedHeight =10905
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =10920
                    Width =10845
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo326"
                    Caption ="Outro benefício: |__| Sim      -     Qual? _____________________________________"
                        "____________________________________________ "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =10920
                    LayoutCachedWidth =10847
                    LayoutCachedHeight =11220
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =11610
                    Width =11025
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo327"
                    Caption ="Nome:_______________________________________________________________ Local: ____"
                        "________________________________________ "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =11610
                    LayoutCachedWidth =11027
                    LayoutCachedHeight =11910
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =5897
                    Top =1140
                    Width =1860
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo334"
                    Caption ="Data da Avaliação:  "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5897
                    LayoutCachedTop =1140
                    LayoutCachedWidth =7757
                    LayoutCachedHeight =1440
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =5957
                    Top =4275
                    Width =555
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo335"
                    Caption ="NIS: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5957
                    LayoutCachedTop =4275
                    LayoutCachedWidth =6512
                    LayoutCachedHeight =4575
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =3287
                    Top =4710
                    Width =1560
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo336"
                    Caption ="Órgão emissor: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3287
                    LayoutCachedTop =4710
                    LayoutCachedWidth =4847
                    LayoutCachedHeight =5010
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =7217
                    Top =4710
                    Width =1950
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo337"
                    Caption ="Data Expedição RG: "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =7217
                    LayoutCachedTop =4710
                    LayoutCachedWidth =9167
                    LayoutCachedHeight =5010
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =8070
                    Width =8175
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo338"
                    Caption ="Construção:  |__| Alvenaria   |__| Madeira   |__| Estuque barro   |__| Mista  |_"
                        "_| Outros "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =8070
                    LayoutCachedWidth =8177
                    LayoutCachedHeight =8370
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =3402
                    Top =9354
                    Width =6915
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo339"
                    Caption ="|__| Sim      -     Valor R$                                                    "
                        " |__| Não"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3402
                    LayoutCachedTop =9354
                    LayoutCachedWidth =10317
                    LayoutCachedHeight =9654
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =3402
                    Top =9675
                    Width =6915
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo344"
                    Caption ="|__| Sim      -     Valor R$                                                    "
                        " |__| Não"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3402
                    LayoutCachedTop =9675
                    LayoutCachedWidth =10317
                    LayoutCachedHeight =9975
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =3402
                    Top =9996
                    Width =6915
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo345"
                    Caption ="|__| Sim      -     Valor R$                                                    "
                        " |__| Não"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3402
                    LayoutCachedTop =9996
                    LayoutCachedWidth =10317
                    LayoutCachedHeight =10296
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =3402
                    Top =10305
                    Width =6915
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo346"
                    Caption ="|__| Sim      -     Valor R$                                                    "
                        " |__| Não"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3402
                    LayoutCachedTop =10305
                    LayoutCachedWidth =10317
                    LayoutCachedHeight =10605
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =3402
                    Top =10614
                    Width =6915
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo347"
                    Caption ="|__| Sim      -     Valor R$                                                    "
                        " |__| Não"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3402
                    LayoutCachedTop =10614
                    LayoutCachedWidth =10317
                    LayoutCachedHeight =10914
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =11280
                    Width =11055
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo348"
                    Caption ="Tem algum componente da família abrigado ou privado de liberdade?       |__| SIM"
                        "    |__| NÃO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =11280
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =11580
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =11955
                    Width =11025
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo349"
                    Caption ="Nome:_______________________________________________________________ Local: ____"
                        "________________________________________ "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =11955
                    LayoutCachedWidth =11027
                    LayoutCachedHeight =12255
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =12615
                    Width =11025
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo350"
                    Caption ="Nome:_______________________________________________________________ Local: ____"
                        "________________________________________ "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =12615
                    LayoutCachedWidth =11027
                    LayoutCachedHeight =12915
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =12285
                    Width =11055
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo351"
                    Caption ="Tem adolescente cumprindo MSE (LA/PSC) acompanhados em MSE?          |__| SIM   "
                        " |__| NÃO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =12285
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =12585
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =12960
                    Width =11025
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo352"
                    Caption ="Nome:_______________________________________________________________ Local: ____"
                        "________________________________________ "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =12960
                    LayoutCachedWidth =11027
                    LayoutCachedHeight =13260
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =13260
                    Width =11055
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo353"
                    Caption ="Mulher vítima de violência?          |__| SIM    |__| NÃO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =13260
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =13560
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =15315
                    Width =11055
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo354"
                    Caption ="Família é acompanhada em algum serviço da Secretaria de Assistência Social?"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =15315
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =15615
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =15735
                    Width =11055
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo355"
                    Caption ="            |__| PAIF             |__| PAEFI             |__| PAMF"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =15735
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =16035
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =16215
                    Width =11055
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo356"
                    Caption ="Aceita ser incluído no acompanhamento do CRAS?"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =16215
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =16515
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2
                    Top =16635
                    Width =11055
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo357"
                    Caption ="            |__| SIM               |__| NÃO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2
                    LayoutCachedTop =16635
                    LayoutCachedWidth =11057
                    LayoutCachedHeight =16935
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =4127
                    Top =17070
                    Width =2805
                    Height =375
                    FontSize =14
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo358"
                    Caption ="AVALIAÇÃO TÉCNICA"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =4127
                    LayoutCachedTop =17070
                    LayoutCachedWidth =6932
                    LayoutCachedHeight =17445
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =1697
                    Top =17550
                    Width =9075
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo359"
                    Caption ="            |__| Solicitou apoio alimentar nos últimos 12 meses   |__| Prioridad"
                        "e Alta"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =1697
                    LayoutCachedTop =17550
                    LayoutCachedWidth =10772
                    LayoutCachedHeight =17850
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =7607
                    Top =17895
                    Width =2415
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo360"
                    Caption =" |__| Prioridade Média  "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =7607
                    LayoutCachedTop =17895
                    LayoutCachedWidth =10022
                    LayoutCachedHeight =18195
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =7607
                    Top =18240
                    Width =2355
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo361"
                    Caption =" |__| Prioridade Baixa  "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =7607
                    LayoutCachedTop =18240
                    LayoutCachedWidth =9962
                    LayoutCachedHeight =18540
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =1697
                    Top =18735
                    Width =9075
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo362"
                    Caption ="            Foi considerado dentro do perfil e elegível para o recebimento do be"
                        "nefício?  "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =1697
                    LayoutCachedTop =18735
                    LayoutCachedWidth =10772
                    LayoutCachedHeight =19035
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2207
                    Top =19170
                    Width =2415
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo363"
                    Caption =" |__| Sim          |__| Não  "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2207
                    LayoutCachedTop =19170
                    LayoutCachedWidth =4622
                    LayoutCachedHeight =19470
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =1697
                    Top =19665
                    Width =9075
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo365"
                    Caption ="            Realizou visita domiciliar?  "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =1697
                    LayoutCachedTop =19665
                    LayoutCachedWidth =10772
                    LayoutCachedHeight =19965
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =2207
                    Top =20130
                    Width =2415
                    Height =300
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo366"
                    Caption =" |__| Sim          |__| Não  "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2207
                    LayoutCachedTop =20130
                    LayoutCachedWidth =4622
                    LayoutCachedHeight =20430
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =3617
                    Top =20565
                    Width =3825
                    Height =375
                    FontSize =14
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo367"
                    Caption ="AVALIAÇÃO FORA DO PERFIL"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3617
                    LayoutCachedTop =20565
                    LayoutCachedWidth =7442
                    LayoutCachedHeight =20940
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =5027
                    Top =21060
                    Width =1005
                    Height =330
                    FontSize =12
                    BorderColor =8355711
                    Name ="Rótulo368"
                    Caption ="MOTIVO:"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5027
                    LayoutCachedTop =21060
                    LayoutCachedWidth =6032
                    LayoutCachedHeight =21390
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =257
                    Top =21420
                    Width =2565
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo369"
                    Caption ="|__| Mudança de município"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =257
                    LayoutCachedTop =21420
                    LayoutCachedWidth =2822
                    LayoutCachedHeight =21720
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =257
                    Top =21795
                    Width =3105
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo370"
                    Caption ="|__| Vínculo de trabalho formal   "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =257
                    LayoutCachedTop =21795
                    LayoutCachedWidth =3362
                    LayoutCachedHeight =22095
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =257
                    Top =22170
                    Width =8220
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo371"
                    Caption ="|__| Benefício de Transferência de Renda:   |__| Federal     |__| Estadual     |"
                        "__| Municipal   "
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =257
                    LayoutCachedTop =22170
                    LayoutCachedWidth =8477
                    LayoutCachedHeight =22470
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =257
                    Top =22545
                    Width =5865
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo372"
                    Caption ="|__| Beneficiário de aposentadoria ou pensão"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =257
                    LayoutCachedTop =22545
                    LayoutCachedWidth =6122
                    LayoutCachedHeight =22845
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =257
                    Top =22920
                    Width =5865
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo373"
                    Caption ="|__| Renda acima do previsto em Lei"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =257
                    LayoutCachedTop =22920
                    LayoutCachedWidth =6122
                    LayoutCachedHeight =23220
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =257
                    Top =23295
                    Width =10590
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo374"
                    Caption ="|__| Outros ____________________________________________________________________"
                        "_____________________________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =257
                    LayoutCachedTop =23295
                    LayoutCachedWidth =10847
                    LayoutCachedHeight =23595
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =47
                    Top =23925
                    Width =10755
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo375"
                    Caption ="Obs.: __________________________________________________________________________"
                        "_______________________________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =47
                    LayoutCachedTop =23925
                    LayoutCachedWidth =10802
                    LayoutCachedHeight =24225
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =47
                    Top =24270
                    Width =10695
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo376"
                    Caption ="________________________________________________________________________________"
                        "______________________________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =47
                    LayoutCachedTop =24270
                    LayoutCachedWidth =10742
                    LayoutCachedHeight =24570
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =113
                    Top =24661
                    Width =10605
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo377"
                    Caption ="________________________________________________________________________________"
                        "_____________________________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =113
                    LayoutCachedTop =24661
                    LayoutCachedWidth =10718
                    LayoutCachedHeight =24961
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =47
                    Top =25020
                    Width =10695
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo378"
                    Caption ="________________________________________________________________________________"
                        "______________________________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =47
                    LayoutCachedTop =25020
                    LayoutCachedWidth =10742
                    LayoutCachedHeight =25320
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =47
                    Top =25395
                    Width =10605
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo379"
                    Caption ="________________________________________________________________________________"
                        "_____________________________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =47
                    LayoutCachedTop =25395
                    LayoutCachedWidth =10652
                    LayoutCachedHeight =25695
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =1952
                    Top =26205
                    Width =6885
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo380"
                    Caption ="Rio das Ostras, __________ de _________________________ de __________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =1952
                    LayoutCachedTop =26205
                    LayoutCachedWidth =8837
                    LayoutCachedHeight =26505
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =5792
                    Top =26640
                    Width =5100
                    Height =810
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo381"
                    Caption ="DECLARO, SOB AS PENAS DA LEI, ART. 299 DO CÓD. PENAL, QUE AS INFORMAÇÕES AQUI PR"
                        "ESTADAS SÃO VERDADEIRAS."
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5792
                    LayoutCachedTop =26640
                    LayoutCachedWidth =10892
                    LayoutCachedHeight =27450
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =167
                    Top =27661
                    Width =5655
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo382"
                    Caption ="_________________________________________________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =167
                    LayoutCachedTop =27661
                    LayoutCachedWidth =5822
                    LayoutCachedHeight =27961
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =340
                    Top =27949
                    Width =4890
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo385"
                    Caption ="Assinatura e carimbo - Assistente Social | Matrícula"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =340
                    LayoutCachedTop =27949
                    LayoutCachedWidth =5230
                    LayoutCachedHeight =28249
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =5841
                    Top =27660
                    Width =5205
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo386"
                    Caption ="_________________________________________________________"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5841
                    LayoutCachedTop =27660
                    LayoutCachedWidth =11046
                    LayoutCachedHeight =27960
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =5953
                    Top =27949
                    Width =4890
                    Height =300
                    BorderColor =8355711
                    Name ="Rótulo387"
                    Caption ="Assinatura do entrevistado"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5953
                    LayoutCachedTop =27949
                    LayoutCachedWidth =10843
                    LayoutCachedHeight =28249
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="PageFooterSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin FormFooter
            KeepTogether = NotDefault
            Height =0
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
