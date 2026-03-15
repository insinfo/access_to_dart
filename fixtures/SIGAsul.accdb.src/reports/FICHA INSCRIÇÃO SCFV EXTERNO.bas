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
    Width =10905
    DatasheetFontHeight =11
    ItemSuffix =441
    Left =660
    Top =2385
    RecSrcDt = Begin
        0xa23fe5eeaeafe540
    End
    RecordSource ="FICHA INSCRIÇÃO SCFV EXTERNO E RF"
    Caption ="FICHA GERAL DE INSCRIÇÃO SCFV"
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
        Begin PageHeader
            Height =1995
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    Left =120
                    Top =1140
                    Width =5235
                    Height =315
                    LeftMargin =22
                    TopMargin =22
                    RightMargin =22
                    BottomMargin =22
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo160"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL - CRAS  "
                    GridlineColor =-2147483609
                    LayoutCachedLeft =120
                    LayoutCachedTop =1140
                    LayoutCachedWidth =5355
                    LayoutCachedHeight =1455
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =5888
                    Top =225
                    Width =4605
                    Height =345
                    FontSize =13
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo21"
                    Caption ="FICHA DE CADASTRO SCFV - EXTERNO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5888
                    LayoutCachedTop =225
                    LayoutCachedWidth =10493
                    LayoutCachedHeight =570
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =5384
                    Top =1140
                    Width =5106
                    Height =315
                    ColumnWidth =2385
                    FontWeight =700
                    BorderColor =10921638
                    Name ="TbUnidade.Nome"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].UnidadeNome"
                    Format =">"
                    EventProcPrefix ="TbUnidade_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =5384
                    LayoutCachedTop =1140
                    LayoutCachedWidth =10490
                    LayoutCachedHeight =1455
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =876
                    Top =1590
                    Width =6666
                    Height =405
                    FontWeight =700
                    TabIndex =1
                    BackColor =14277081
                    Name ="DADOS PESSOAIS PARA FICHA SCFV.Nome"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].NomePessoa"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    EventProcPrefix ="DADOS_PESSOAIS_PARA_FICHA_SCFV_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =876
                    LayoutCachedTop =1590
                    LayoutCachedWidth =7542
                    LayoutCachedHeight =1995
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =120
                            Top =1590
                            Width =750
                            Height =405
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo315"
                            Caption ="NOME: "
                            GridlineColor =10921638
                            LayoutCachedLeft =120
                            LayoutCachedTop =1590
                            LayoutCachedWidth =870
                            LayoutCachedHeight =1995
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =8016
                    Top =1590
                    Width =2871
                    Height =405
                    FontWeight =700
                    TabIndex =2
                    BackColor =14277081
                    Name ="NIS"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].NIS"
                    GridlineColor =10921638

                    LayoutCachedLeft =8016
                    LayoutCachedTop =1590
                    LayoutCachedWidth =10887
                    LayoutCachedHeight =1995
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =7545
                            Top =1590
                            Width =465
                            Height =405
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo316"
                            Caption ="NIS: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7545
                            LayoutCachedTop =1590
                            LayoutCachedWidth =8010
                            LayoutCachedHeight =1995
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Width =5445
                    Height =1200
                    BorderColor =16777215
                    Name ="LOGO"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].LOGO"
                    GridlineColor =10921638
                    TabIndex =3

                    LayoutCachedWidth =5445
                    LayoutCachedHeight =1200
                    BorderShade =100.0
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =0
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
        End
        Begin Section
            KeepTogether = NotDefault
            Height =22920
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    Left =1755
                    Top =19125
                    Width =1530
                    Height =285
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo181"
                    Caption ="RESPONSÁVEL     "
                    GridlineColor =10921638
                    LayoutCachedLeft =1755
                    LayoutCachedTop =19125
                    LayoutCachedWidth =3285
                    LayoutCachedHeight =19410
                    ForeTint =100.0
                End
                Begin Label
                    Left =7755
                    Top =19125
                    Width =2775
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo184"
                    Caption ="FUNCIONÁRIO/MATRÍCULA     "
                    GridlineColor =10921638
                    LayoutCachedLeft =7755
                    LayoutCachedTop =19125
                    LayoutCachedWidth =10530
                    LayoutCachedHeight =19395
                    ForeTint =100.0
                End
                Begin Label
                    Left =330
                    Top =18840
                    Width =5100
                    Height =285
                    FontSize =10
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo194"
                    Caption ="________________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =330
                    LayoutCachedTop =18840
                    LayoutCachedWidth =5430
                    LayoutCachedHeight =19125
                End
                Begin Label
                    TextAlign =2
                    Left =386
                    Top =18495
                    Width =3465
                    Height =300
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo178"
                    Caption ="DATA ______/_______/_______   "
                    GridlineColor =10921638
                    LayoutCachedLeft =386
                    LayoutCachedTop =18495
                    LayoutCachedWidth =3851
                    LayoutCachedHeight =18795
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =450
                    Top =18090
                    Width =10200
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo199"
                    Caption ="COM ISTO, FIRMO O PRESENTE E ASSINO:"
                    GridlineColor =10921638
                    LayoutCachedLeft =450
                    LayoutCachedTop =18090
                    LayoutCachedWidth =10650
                    LayoutCachedHeight =18375
                    ForeTint =100.0
                End
                Begin Label
                    Left =5717
                    Top =18835
                    Width =5100
                    Height =285
                    FontSize =10
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo245"
                    Caption ="________________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =5717
                    LayoutCachedTop =18835
                    LayoutCachedWidth =10817
                    LayoutCachedHeight =19120
                End
                Begin Label
                    TextAlign =2
                    Top =15645
                    Width =10785
                    Height =300
                    FontSize =12
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo253"
                    Caption ="AUTORIZAÇÃO PARA DIVULGAÇÃO DE IMAGEM"
                    GridlineColor =10921638
                    LayoutCachedTop =15645
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =15945
                    ForeTint =100.0
                End
                Begin Label
                    Left =900
                    Top =16110
                    Width =360
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo254"
                    Caption ="EU,                                                                             "
                        "                                                                                "
                    GridlineColor =10921638
                    LayoutCachedLeft =900
                    LayoutCachedTop =16110
                    LayoutCachedWidth =1260
                    LayoutCachedHeight =16395
                End
                Begin Label
                    Left =285
                    Top =16665
                    Width =375
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo255"
                    Caption ="RG:                                                                             "
                        "                  "
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =16665
                    LayoutCachedWidth =660
                    LayoutCachedHeight =16950
                End
                Begin Label
                    TextAlign =4
                    Left =300
                    Top =16902
                    Width =10605
                    Height =510
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo256"
                    Caption ="AUTORIZO O USO DA SUA IMAGEM EM PROPAGANDAS DA PREFEITURA MUNICIPAL DE RIO DAS O"
                        "STRAS, PODENDO SER REPRODUZIDA EM OUTDOOR OU TELEVISÃO, ESTOU CIENTE E DE ACORDO"
                        " COM AS NORMAS DE CONDUTA ESTABELECIDAS. "
                    GridlineColor =10921638
                    LayoutCachedLeft =300
                    LayoutCachedTop =16902
                    LayoutCachedWidth =10905
                    LayoutCachedHeight =17412
                End
                Begin TextBox
                    FontItalic = NotDefault
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =1255
                    Top =16110
                    Width =9336
                    Height =286
                    FontWeight =700
                    BorderColor =10921638
                    Name ="Texto257"
                    ControlSource ="nomeRespons"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1255
                    LayoutCachedTop =16110
                    LayoutCachedWidth =10591
                    LayoutCachedHeight =16396
                    ForeTint =100.0
                End
                Begin TextBox
                    FontItalic = NotDefault
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =701
                    Top =16622
                    Width =2391
                    Height =255
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    Name ="Texto259"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].RG"
                    GridlineColor =10921638

                    LayoutCachedLeft =701
                    LayoutCachedTop =16622
                    LayoutCachedWidth =3092
                    LayoutCachedHeight =16877
                    ForeTint =100.0
                End
                Begin TextBox
                    FontItalic = NotDefault
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =4840
                    Top =16619
                    Width =2316
                    Height =315
                    FontWeight =700
                    TabIndex =2
                    BorderColor =10921638
                    Name ="Texto260"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].OrgaoRG"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =4840
                    LayoutCachedTop =16619
                    LayoutCachedWidth =7156
                    LayoutCachedHeight =16934
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =3135
                            Top =16620
                            Width =1695
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo261"
                            Caption ="ÓRGÃO EMISSOR:"
                            GridlineColor =10921638
                            LayoutCachedLeft =3135
                            LayoutCachedTop =16620
                            LayoutCachedWidth =4830
                            LayoutCachedHeight =16935
                        End
                    End
                End
                Begin Label
                    Left =7164
                    Top =16618
                    Width =165
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo262"
                    Caption =",                                                                               "
                        "                                                                              "
                    GridlineColor =10921638
                    LayoutCachedLeft =7164
                    LayoutCachedTop =16618
                    LayoutCachedWidth =7329
                    LayoutCachedHeight =16903
                End
                Begin TextBox
                    FontItalic = NotDefault
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =7849
                    Top =16619
                    Width =2871
                    Height =315
                    FontWeight =700
                    TabIndex =3
                    BorderColor =10921638
                    Name ="Texto263"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].CPF"
                    InputMask ="000\\.000\\.000\\-00;;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =7849
                    LayoutCachedTop =16619
                    LayoutCachedWidth =10720
                    LayoutCachedHeight =16934
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =7395
                            Top =16619
                            Width =465
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo264"
                            Caption ="CPF:"
                            GridlineColor =10921638
                            LayoutCachedLeft =7395
                            LayoutCachedTop =16619
                            LayoutCachedWidth =7860
                            LayoutCachedHeight =16934
                        End
                    End
                End
                Begin Label
                    TextAlign =1
                    Left =240
                    Top =17467
                    Width =10545
                    Height =240
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo260"
                    Caption ="Observações:____________________________________________________________________"
                        "____________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =240
                    LayoutCachedTop =17467
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =17707
                End
                Begin Label
                    TextAlign =1
                    Left =240
                    Top =17692
                    Width =10545
                    Height =240
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo271"
                    Caption ="________________________________________________________________________________"
                        "____________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =240
                    LayoutCachedTop =17692
                    LayoutCachedWidth =10785
                    LayoutCachedHeight =17932
                End
                Begin Label
                    BackStyle =1
                    Left =75
                    Top =1140
                    Width =10830
                    Height =2385
                    FontSize =12
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo314"
                    Caption ="DADOS DA PESSOA INSCRITA:"
                    GridlineColor =10921638
                    LayoutCachedLeft =75
                    LayoutCachedTop =1140
                    LayoutCachedWidth =10905
                    LayoutCachedHeight =3525
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2091
                    Top =1485
                    Width =2331
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =4
                    Name ="DNasc"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].DNasc"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =2091
                    LayoutCachedTop =1485
                    LayoutCachedWidth =4422
                    LayoutCachedHeight =1755
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =1485
                            Width =1920
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo317"
                            Caption ="DATA DE NASCIMENTO: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =1485
                            LayoutCachedWidth =2085
                            LayoutCachedHeight =1755
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5106
                    Top =1485
                    Width =1341
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =5
                    Name ="Idade"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].IdadePessoa"
                    GridlineColor =10921638

                    LayoutCachedLeft =5106
                    LayoutCachedTop =1485
                    LayoutCachedWidth =6447
                    LayoutCachedHeight =1755
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =4425
                            Top =1485
                            Width =675
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo318"
                            Caption ="Idade: "
                            GridlineColor =10921638
                            LayoutCachedLeft =4425
                            LayoutCachedTop =1485
                            LayoutCachedWidth =5100
                            LayoutCachedHeight =1755
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =2700
                    Left =6981
                    Top =1485
                    Width =1221
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =6
                    Name ="Sexo"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].Sexo"
                    RowSourceType ="Value List"
                    RowSource ="\"M\";\"F\";\"Trans\""
                    ColumnWidths ="2700"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =6981
                    LayoutCachedTop =1485
                    LayoutCachedWidth =8202
                    LayoutCachedHeight =1755
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =6450
                            Top =1485
                            Width =540
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo319"
                            Caption ="Sexo: "
                            GridlineColor =10921638
                            LayoutCachedLeft =6450
                            LayoutCachedTop =1485
                            LayoutCachedWidth =6990
                            LayoutCachedHeight =1755
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =2625
                    Left =9111
                    Top =1485
                    Width =1671
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =7
                    Name ="Raça/Cor"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].[Raça/Cor]"
                    RowSourceType ="Value List"
                    RowSource ="\"BRANCA\";\"PRETA\";\"AMARELA\";\"PARDA\";\"INDIGENA\""
                    ColumnWidths ="2625"
                    EventProcPrefix ="Raça_Cor"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =9111
                    LayoutCachedTop =1485
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =1755
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =8205
                            Top =1485
                            Width =885
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo320"
                            Caption ="Raça/Cor: "
                            GridlineColor =10921638
                            LayoutCachedLeft =8205
                            LayoutCachedTop =1485
                            LayoutCachedWidth =9090
                            LayoutCachedHeight =1755
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =566
                    Top =1755
                    Width =2376
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =8
                    Name ="CPF"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].CPF"
                    InputMask ="000\\.000\\.000\\-00;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedTop =1755
                    LayoutCachedWidth =2942
                    LayoutCachedHeight =2025
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =170
                            Top =1755
                            Width =435
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo321"
                            Caption ="CPF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =1755
                            LayoutCachedWidth =605
                            LayoutCachedHeight =2025
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =3284
                    Top =1755
                    Width =2436
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =9
                    Name ="RG"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].RG"
                    GridlineColor =10921638

                    LayoutCachedLeft =3284
                    LayoutCachedTop =1755
                    LayoutCachedWidth =5720
                    LayoutCachedHeight =2025
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =2948
                            Top =1755
                            Width =345
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo322"
                            Caption ="RG:"
                            GridlineColor =10921638
                            LayoutCachedLeft =2948
                            LayoutCachedTop =1755
                            LayoutCachedWidth =3293
                            LayoutCachedHeight =2025
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =6586
                    Top =1755
                    Width =1911
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =10
                    Name ="OrgaoRG"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].OrgaoRG"
                    GridlineColor =10921638

                    LayoutCachedLeft =6586
                    LayoutCachedTop =1755
                    LayoutCachedWidth =8497
                    LayoutCachedHeight =2025
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =5725
                            Top =1755
                            Width =870
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo323"
                            Caption ="OrgaoRG: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5725
                            LayoutCachedTop =1755
                            LayoutCachedWidth =6595
                            LayoutCachedHeight =2025
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =9426
                    Top =1755
                    Width =1356
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =11
                    Name ="DEmisRG"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].DEmisRG"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =9426
                    LayoutCachedTop =1755
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =2025
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =8503
                            Top =1755
                            Width =915
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo324"
                            Caption ="DEmisRG: "
                            GridlineColor =10921638
                            LayoutCachedLeft =8503
                            LayoutCachedTop =1755
                            LayoutCachedWidth =9418
                            LayoutCachedHeight =2025
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =1856
                    Top =2025
                    Width =5511
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =12
                    Name ="MunicNasc"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].MunicNasc"
                    GridlineColor =10921638

                    LayoutCachedLeft =1856
                    LayoutCachedTop =2025
                    LayoutCachedWidth =7367
                    LayoutCachedHeight =2295
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =170
                            Top =2025
                            Width =1710
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo325"
                            Caption ="Município de Nasc.: "
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =2025
                            LayoutCachedWidth =1880
                            LayoutCachedHeight =2295
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =1444
                    Left =8511
                    Top =2025
                    Width =2271
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =13
                    Name ="UFNasc"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].UFNasc"
                    RowSourceType ="Value List"
                    RowSource ="\"AC\";\"AL\";\"AP\";\"AM\";\"BA\";\"CE\";\"DF\";\"ES\";\"GO\";\"MA\";\"MT\";\"M"
                        "S\";\"MG\";\"PA \";\"PB\";\"PR\";\"PE\";\"PI\";\"RJ\";\"RN\";\"RS\";\"RO\";\"RR\""
                        ";\"SC\";\"SP\";\"SE\";\"TO\""
                    ColumnWidths ="1444"
                    GridlineColor =10921638

                    LayoutCachedLeft =8511
                    LayoutCachedTop =2025
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =2295
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =7365
                            Top =2025
                            Width =1140
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo326"
                            Caption ="UF de Nasc.: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7365
                            LayoutCachedTop =2025
                            LayoutCachedWidth =8505
                            LayoutCachedHeight =2295
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =165
                    Top =2325
                    TabIndex =14
                    BorderColor =10921638
                    Name ="FreqEscola"
                    ControlSource ="FreqEscola"
                    GridlineColor =10921638

                    LayoutCachedLeft =165
                    LayoutCachedTop =2325
                    LayoutCachedWidth =425
                    LayoutCachedHeight =2565
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =395
                            Top =2295
                            Width =1485
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo327"
                            Caption ="Frequenta Escola"
                            GridlineColor =10921638
                            LayoutCachedLeft =395
                            LayoutCachedTop =2295
                            LayoutCachedWidth =1880
                            LayoutCachedHeight =2565
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =3885
                    Left =3066
                    Top =2295
                    Width =1956
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =15
                    Name ="Escolaridade"
                    ControlSource ="Escolaridade"
                    RowSourceType ="Value List"
                    RowSource ="\"Nunca frequentou\";\"Crecha\";\"Educação Infantil\";\"1º ano fund\";\"2º ano f"
                        "und\";\"3º ano fund\";\"4º ano fund\";\"5º ano fund\";\"6º ano fund\";\"7º ano f"
                        "und\";\"8º ano fund\";\"9º ano fund\";\"1º ano medio\";\"2º ano medio\";\"3º ano"
                        " medio\";\"Sup Incompleto\";\"Sup Completo\";\"EJA Fundamental\";\"EJA Medio\";\""
                        "Outros\""
                    ColumnWidths ="3885"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =3066
                    LayoutCachedTop =2295
                    LayoutCachedWidth =5022
                    LayoutCachedHeight =2565
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =1860
                            Top =2295
                            Width =1230
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo328"
                            Caption ="Escolaridade: "
                            GridlineColor =10921638
                            LayoutCachedLeft =1860
                            LayoutCachedTop =2295
                            LayoutCachedWidth =3090
                            LayoutCachedHeight =2565
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =1445
                    Left =6279
                    Top =2295
                    Width =2901
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =16
                    Name ="NOME ESCOLA"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].[NOME ESCOLA]"
                    RowSourceType ="Value List"
                    RowSource ="\"CRECHE M. ALMIRA ROSA DE SOUZA DONA COTA\";\"CRECHE M. DONA SENHORINHA\";\"CRE"
                        "CHE MUN VALDIRA FLAUSINO RODRIGUES\";\"CRECHE ESC M. MARIA ROSA RIBEIRO PINHEIRO"
                        " \"\"TIA DIDI\"\"\";\"ESC MUN ALBERTO JORGE\";\"ESC MUN ALZIR DAVID PEREIRA\";\""
                        "ESC MUN SR. JOÃO BATISTA GOMES DA CRUZ \"\"ARCO-ÍRIS\"\"\";\"ESC MUN JOSÉ DE OLI"
                        "VEIRA MARTINS\";\"ESC MUN JOSÉ LUIZ DE LEMOS\";\"ESC MUN NELZIR PEREIRA MELLO\";"
                        "\"ESC MUN PREF CLÁUDIO RIBEIRO\";\"ESC MUN PREF PAULO PINHEIRO\";\"ESC MUN ONDIN"
                        "A PINTO MARCONDES\";\"ESC MUN ENEDINA FIDELIS MOREIRA\";\"ESC MUN ERNESTINA JORG"
                        "E PEREIRA\";\"ESC MUN NADIR DA SILVA SALVADOR\";\"ESC MUN RIO DAS OSTRAS\";\"ESC"
                        " MUN PROF NELI APARECIDA TÂMARA LUIZ\";\"ESC MUN ELSON PINHEIRO\";\"ESC MUN PREF"
                        " CÉLIO SARZEDAS\";\"ESC MUN HENRIQUE SARZEDAS\";\"ESC MUN TRINDADE\";\"ESC MUN J"
                        "OVENIL BASTOS DA SILVA\";\"ESC MUN ARY GOMES DE MARINS\";\"ESC MUN JERONYMO MEND"
                        "ES DA COSTA\";\"ESC MUN JOÃO BENTO DUARTE NETO\";\"ESC MUN MARIA DA PENHA DE OLI"
                        "VEIRA\";\"ESC MUN SIMAR MACHADO SODRÉ\";\"ESC MUN MARIA TEIXEIRA DE PAULA\";\"ES"
                        "C MUN INAYÁ MORAES D’COUTO\";\"ESC EST DOM BOSCO MUNIZADA\";\"ESC MUN ROCHA LEÃO"
                        "\";\"ESC EST FAZENDA DA PRAIA MUNIZADA\";\"ESC MUN NILTON BALTHAZAR\";\"ESC MUN "
                        "FRANCISCO DE ASSIS MEDEIROS RANGEL\";\"ESC MUN PADRE JOSÉ DILSON DÓREA\";\"ESC M"
                        "UN PROF ROSÂNGELA DUARTE FARIA\";\"ESC MUN VEREADOR PEDRO MOREIRA DOS SANTOS\";\""
                        "CIEP - BRIZOLÃO - MESTRE MARÇAL - MUNIZADO\";\"ESC MUN MARIA GORETE VICENTE JORG"
                        "E\";\"ESC MUN ACERBAL PINTO MALHEIROS\";\"ESC MUN FANY BATISTA ESTEVES\";\"ESC M"
                        "UN PROF MARINETE COELHO DE SOUZA\";\"COLÉGIO MUN PROF AMÉRICA ABDALLA\";\"ESC ES"
                        "T FAZENDAS REUNIDAS ATLÂNTICA MUNIZADA\";\"ESC MUN CIDADE PRAIANA\";\"INST MUN D"
                        "E EDUC DE RIO DAS OSTRAS\";\"ESC AGRÍCOLA CARLOS MAURÍCIO FRANCO\""
                    ColumnWidths ="1445"
                    EventProcPrefix ="NOME_ESCOLA"
                    GridlineColor =10921638

                    LayoutCachedLeft =6279
                    LayoutCachedTop =2295
                    LayoutCachedWidth =9180
                    LayoutCachedHeight =2565
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =5028
                            Top =2295
                            Width =1260
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo329"
                            Caption ="NOME ESCOLA: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5028
                            LayoutCachedTop =2295
                            LayoutCachedWidth =6288
                            LayoutCachedHeight =2565
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =9771
                    Top =2295
                    Width =1011
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =17
                    Name ="Turno"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].[DADOS PESSOAIS PARA FICHA SCFV].Turno"
                    RowSourceType ="Value List"
                    RowSource ="\"Manhã\";\"Tarde\";\"Noite\";\"Integral\""
                    ColumnWidths ="1441"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =9771
                    LayoutCachedTop =2295
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =2565
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =9184
                            Top =2295
                            Width =585
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo330"
                            Caption ="Turno:"
                            GridlineColor =10921638
                            LayoutCachedLeft =9184
                            LayoutCachedTop =2295
                            LayoutCachedWidth =9769
                            LayoutCachedHeight =2565
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =1363
                    Top =2565
                    Width =4191
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =18
                    Name ="NomeMae"
                    ControlSource ="NomeMae"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1363
                    LayoutCachedTop =2565
                    LayoutCachedWidth =5554
                    LayoutCachedHeight =2835
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =2565
                            Width =1230
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo331"
                            Caption ="Nome da Mãe: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =2565
                            LayoutCachedWidth =1395
                            LayoutCachedHeight =2835
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =6651
                    Top =2565
                    Width =4131
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =19
                    Name ="NomePai"
                    ControlSource ="NomePai"
                    GridlineColor =10921638

                    LayoutCachedLeft =6651
                    LayoutCachedTop =2565
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =2835
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =5550
                            Top =2565
                            Width =1125
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo332"
                            Caption ="Nome do Pai: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5550
                            LayoutCachedTop =2565
                            LayoutCachedWidth =6675
                            LayoutCachedHeight =2835
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =3066
                    Top =2835
                    Width =7716
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =20
                    Name ="Nome Respons Criança"
                    ControlSource ="Nome Respons Criança"
                    EventProcPrefix ="Nome_Respons_Criança"
                    GridlineColor =10921638

                    LayoutCachedLeft =3066
                    LayoutCachedTop =2835
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =3105
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =2835
                            Width =2895
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo333"
                            Caption ="Nome do Responsável pela Inscrição: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =2835
                            LayoutCachedWidth =3060
                            LayoutCachedHeight =3105
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =561
                    Top =3105
                    Width =3966
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =21
                    Name ="CPF Resp"
                    ControlSource ="CPF Resp"
                    InputMask ="000,000,000\\-00;0;"
                    EventProcPrefix ="CPF_Resp"
                    GridlineColor =10921638

                    LayoutCachedLeft =561
                    LayoutCachedTop =3105
                    LayoutCachedWidth =4527
                    LayoutCachedHeight =3375
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =3105
                            Width =390
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo334"
                            Caption ="CPF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =3105
                            LayoutCachedWidth =555
                            LayoutCachedHeight =3375
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =2880
                    Left =5556
                    Top =3105
                    Width =5226
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =22
                    Name ="Parentesco Resp"
                    ControlSource ="Parentesco Resp"
                    RowSourceType ="Value List"
                    RowSource ="\"Mãe/Pai\";\"Madrasta/Padrasto\";\"Avó/Avô\";\"Tia/Tio\";\"Outro\""
                    ColumnWidths ="2881"
                    EventProcPrefix ="Parentesco_Resp"
                    GridlineColor =10921638

                    LayoutCachedLeft =5556
                    LayoutCachedTop =3105
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =3375
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =4530
                            Top =3105
                            Width =1020
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo335"
                            Caption ="Parentesco:"
                            GridlineColor =10921638
                            LayoutCachedLeft =4530
                            LayoutCachedTop =3105
                            LayoutCachedWidth =5550
                            LayoutCachedHeight =3375
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    Left =60
                    Top =3690
                    Width =10830
                    Height =2385
                    FontSize =12
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo336"
                    Caption ="DADOS DO RESPONSÁVEL PELO PRONTUÁRIO:"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =3690
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =6075
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin TextBox
                    BackStyle =0
                    IMESentenceMode =3
                    Left =966
                    Top =4140
                    Width =6066
                    Height =390
                    ColumnWidth =3180
                    FontWeight =700
                    TabIndex =23
                    BackColor =14277081
                    Name ="CS RESPONSAVEL FAMILIAR.Nome"
                    ControlSource ="nomeRespons"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =966
                    LayoutCachedTop =4140
                    LayoutCachedWidth =7032
                    LayoutCachedHeight =4530
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =4140
                            Width =795
                            Height =390
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo350"
                            Caption ="Nome: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =4140
                            LayoutCachedWidth =960
                            LayoutCachedHeight =4530
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    BackStyle =0
                    IMESentenceMode =3
                    Left =8286
                    Top =4140
                    Width =2481
                    Height =390
                    FontWeight =700
                    TabIndex =24
                    BackColor =14277081
                    Name ="CS RESPONSAVEL FAMILIAR.Parentesco"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].Parentesco"
                    Format =">"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_Parentesco"
                    GridlineColor =10921638

                    LayoutCachedLeft =8286
                    LayoutCachedTop =4140
                    LayoutCachedWidth =10767
                    LayoutCachedHeight =4530
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =7035
                            Top =4140
                            Width =1245
                            Height =390
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo351"
                            Caption ="Parentesco: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7035
                            LayoutCachedTop =4140
                            LayoutCachedWidth =8280
                            LayoutCachedHeight =4530
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =576
                    Top =4665
                    Width =1341
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =25
                    Name ="CS RESPONSAVEL FAMILIAR.RG"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].RG"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_RG"
                    GridlineColor =10921638

                    LayoutCachedLeft =576
                    LayoutCachedTop =4665
                    LayoutCachedWidth =1917
                    LayoutCachedHeight =4980
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =4665
                            Width =405
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo352"
                            Caption ="RG: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =4665
                            LayoutCachedWidth =570
                            LayoutCachedHeight =4980
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =7896
                    Top =4665
                    Width =1236
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =26
                    Name ="CS RESPONSAVEL FAMILIAR.NIS"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].NIS"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_NIS"
                    GridlineColor =10921638

                    LayoutCachedLeft =7896
                    LayoutCachedTop =4665
                    LayoutCachedWidth =9132
                    LayoutCachedHeight =4980
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =7485
                            Top =4665
                            Width =435
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo353"
                            Caption ="NIS: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7485
                            LayoutCachedTop =4665
                            LayoutCachedWidth =7920
                            LayoutCachedHeight =4980
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =9546
                    Top =4665
                    Width =1221
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =27
                    Name ="CS RESPONSAVEL FAMILIAR.CPF"
                    ControlSource ="CPF Resp"
                    InputMask ="000\\.000\\.000\\-00;0;_"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_CPF"
                    GridlineColor =10921638

                    LayoutCachedLeft =9546
                    LayoutCachedTop =4665
                    LayoutCachedWidth =10767
                    LayoutCachedHeight =4980
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =9135
                            Top =4665
                            Width =450
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo354"
                            Caption ="CPF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =9135
                            LayoutCachedTop =4665
                            LayoutCachedWidth =9585
                            LayoutCachedHeight =4980
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =1091
                    Top =4987
                    Width =4356
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =28
                    Name ="Endereço"
                    ControlSource ="Endereço"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1091
                    LayoutCachedTop =4987
                    LayoutCachedWidth =5447
                    LayoutCachedHeight =5302
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =170
                            Top =4987
                            Width =930
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo355"
                            Caption ="Endereço: "
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =4987
                            LayoutCachedWidth =1100
                            LayoutCachedHeight =5302
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =6081
                    Top =4980
                    Width =2031
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =29
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

                    LayoutCachedLeft =6081
                    LayoutCachedTop =4980
                    LayoutCachedWidth =8112
                    LayoutCachedHeight =5295
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =5445
                            Top =4980
                            Width =630
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo356"
                            Caption ="Bairro: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5445
                            LayoutCachedTop =4980
                            LayoutCachedWidth =6075
                            LayoutCachedHeight =5295
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =1443
                    Left =8511
                    Top =4980
                    Width =726
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =30
                    Name ="UF"
                    ControlSource ="UF"
                    RowSourceType ="Value List"
                    RowSource ="\"AC\";\"AL\";\"AP\";\"AM\";\"BA\";\"CE\";\"DF\";\"ES\";\"GO\";\"MA\";\"MT\";\"M"
                        "S\";\"MG\";\"PA \";\"PB\";\"PR\";\"PE\";\"PI\";\"RJ\";\"RN\";\"RS\";\"RO\";\"RR\""
                        ";\"SC\";\"SP\";\"SE\";\"TO\""
                    ColumnWidths ="1443"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =8511
                    LayoutCachedTop =4980
                    LayoutCachedWidth =9237
                    LayoutCachedHeight =5295
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =8100
                            Top =4980
                            Width =405
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo357"
                            Caption ="UF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =8100
                            LayoutCachedTop =4980
                            LayoutCachedWidth =8505
                            LayoutCachedHeight =5295
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =9651
                    Top =4980
                    Width =1116
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =31
                    Name ="CEP"
                    ControlSource ="CEP"
                    InputMask ="00000\\-000;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =9651
                    LayoutCachedTop =4980
                    LayoutCachedWidth =10767
                    LayoutCachedHeight =5295
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =9234
                            Top =4980
                            Width =450
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo358"
                            Caption ="CEP: "
                            GridlineColor =10921638
                            LayoutCachedLeft =9234
                            LayoutCachedTop =4980
                            LayoutCachedWidth =9684
                            LayoutCachedHeight =5295
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =1146
                    Top =5299
                    Width =1626
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =32
                    Name ="Municipio"
                    ControlSource ="Municipio"
                    RowSourceType ="Value List"
                    RowSource ="\"RIO DAS OSTRAS\""
                    ColumnWidths ="1440"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =1146
                    LayoutCachedTop =5299
                    LayoutCachedWidth =2772
                    LayoutCachedHeight =5614
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =5299
                            Width =975
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo359"
                            Caption ="Municipio: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =5299
                            LayoutCachedWidth =1140
                            LayoutCachedHeight =5614
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =4146
                    Top =5295
                    Width =2271
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =33
                    Name ="Complemento"
                    ControlSource ="Complemento"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =4146
                    LayoutCachedTop =5295
                    LayoutCachedWidth =6417
                    LayoutCachedHeight =5610
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =2775
                            Top =5295
                            Width =1365
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo360"
                            Caption ="Complemento: "
                            GridlineColor =10921638
                            LayoutCachedLeft =2775
                            LayoutCachedTop =5295
                            LayoutCachedWidth =4140
                            LayoutCachedHeight =5610
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =7476
                    Top =5295
                    Width =3291
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =34
                    Name ="Referencia"
                    ControlSource ="Referencia"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =7476
                    LayoutCachedTop =5295
                    LayoutCachedWidth =10767
                    LayoutCachedHeight =5610
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =6435
                            Top =5295
                            Width =1035
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo361"
                            Caption ="Referencia: "
                            GridlineColor =10921638
                            LayoutCachedLeft =6435
                            LayoutCachedTop =5295
                            LayoutCachedWidth =7470
                            LayoutCachedHeight =5610
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =861
                    Top =5595
                    Width =3831
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =35
                    Name ="Tel fixo"
                    ControlSource ="Tel fixo"
                    InputMask ="!\\(99\") \"!9900\\-0000;0;_"
                    EventProcPrefix ="Tel_fixo"
                    GridlineColor =10921638

                    LayoutCachedLeft =861
                    LayoutCachedTop =5595
                    LayoutCachedWidth =4692
                    LayoutCachedHeight =5910
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =5595
                            Width =720
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo362"
                            Caption ="Tel fixo: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =5595
                            LayoutCachedWidth =885
                            LayoutCachedHeight =5910
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =3456
                    Top =4665
                    Width =1356
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =36
                    Name ="CS RESPONSAVEL FAMILIAR.OrgaoRG"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].OrgaoRG"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_OrgaoRG"
                    GridlineColor =10921638

                    LayoutCachedLeft =3456
                    LayoutCachedTop =4665
                    LayoutCachedWidth =4812
                    LayoutCachedHeight =4980
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =1920
                            Top =4665
                            Width =1530
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo363"
                            Caption ="Órgão Emissor RG: "
                            GridlineColor =10921638
                            LayoutCachedLeft =1920
                            LayoutCachedTop =4665
                            LayoutCachedWidth =3450
                            LayoutCachedHeight =4980
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =6354
                    Top =4665
                    Width =1131
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =37
                    Name ="CS RESPONSAVEL FAMILIAR.DEmisRG"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].DEmisRG"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_DEmisRG"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =6354
                    LayoutCachedTop =4665
                    LayoutCachedWidth =7485
                    LayoutCachedHeight =4980
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =4818
                            Top =4665
                            Width =1530
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo364"
                            Caption ="Data Emissão RG: "
                            GridlineColor =10921638
                            LayoutCachedLeft =4818
                            LayoutCachedTop =4665
                            LayoutCachedWidth =6348
                            LayoutCachedHeight =4980
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    Left =60
                    Top =6135
                    Width =10830
                    Height =390
                    FontSize =12
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo365"
                    Caption ="CADASTROS / BENEFÍCIOS:"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =6135
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =6525
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =60
                    Top =7395
                    Width =10830
                    Height =405
                    FontSize =12
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo366"
                    Caption ="DADOS DE SAÚDE:"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =7395
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =7800
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2271
                    Top =6555
                    Width =1086
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =38
                    Name ="BeneficioMunic"
                    ControlSource ="BeneficioMunic"
                    Format ="Yes/No"
                    GridlineColor =10921638

                    LayoutCachedLeft =2271
                    LayoutCachedTop =6555
                    LayoutCachedWidth =3357
                    LayoutCachedHeight =6870
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =570
                            Top =6555
                            Width =1710
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo367"
                            Caption ="Benefício Municipal: "
                            GridlineColor =10921638
                            LayoutCachedLeft =570
                            LayoutCachedTop =6555
                            LayoutCachedWidth =2280
                            LayoutCachedHeight =6870
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3809
                    Top =6555
                    Width =906
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =39
                    Name ="BPC"
                    ControlSource ="BPC"
                    Format ="Yes/No"
                    GridlineColor =10921638

                    LayoutCachedLeft =3809
                    LayoutCachedTop =6555
                    LayoutCachedWidth =4715
                    LayoutCachedHeight =6870
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =3353
                            Top =6555
                            Width =435
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo368"
                            Caption ="BPC:  "
                            GridlineColor =10921638
                            LayoutCachedLeft =3353
                            LayoutCachedTop =6555
                            LayoutCachedWidth =3788
                            LayoutCachedHeight =6870
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5165
                    Top =6555
                    Width =906
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =40
                    Name ="PBF"
                    ControlSource ="PBF"
                    Format ="Yes/No"
                    GridlineColor =10921638

                    LayoutCachedLeft =5165
                    LayoutCachedTop =6555
                    LayoutCachedWidth =6071
                    LayoutCachedHeight =6870
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =4709
                            Top =6555
                            Width =420
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo369"
                            Caption ="PBF:  "
                            GridlineColor =10921638
                            LayoutCachedLeft =4709
                            LayoutCachedTop =6555
                            LayoutCachedWidth =5129
                            LayoutCachedHeight =6870
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =7035
                    Top =6555
                    Width =1026
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =41
                    Name ="CADUNICO"
                    ControlSource ="CADUNICO"
                    Format ="Yes/No"
                    GridlineColor =10921638

                    LayoutCachedLeft =7035
                    LayoutCachedTop =6555
                    LayoutCachedWidth =8061
                    LayoutCachedHeight =6870
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =6069
                            Top =6555
                            Width =960
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo370"
                            Caption ="CADUNICO:  "
                            GridlineColor =10921638
                            LayoutCachedLeft =6069
                            LayoutCachedTop =6555
                            LayoutCachedWidth =7029
                            LayoutCachedHeight =6870
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =646
                    Top =8880
                    TabIndex =42
                    BorderColor =10921638
                    Name ="Autismo"
                    ControlSource ="Autismo"
                    GridlineColor =10921638

                    LayoutCachedLeft =646
                    LayoutCachedTop =8880
                    LayoutCachedWidth =906
                    LayoutCachedHeight =9120
                    Begin
                        Begin Label
                            Left =876
                            Top =8850
                            Width =825
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo379"
                            Caption ="Autismo"
                            GridlineColor =10921638
                            LayoutCachedLeft =876
                            LayoutCachedTop =8850
                            LayoutCachedWidth =1701
                            LayoutCachedHeight =9165
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =645
                    Top =9210
                    TabIndex =43
                    BorderColor =10921638
                    Name ="Cegueira"
                    ControlSource ="Cegueira"
                    GridlineColor =10921638

                    LayoutCachedLeft =645
                    LayoutCachedTop =9210
                    LayoutCachedWidth =905
                    LayoutCachedHeight =9450
                    Begin
                        Begin Label
                            Left =875
                            Top =9180
                            Width =870
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo380"
                            Caption ="Cegueira"
                            GridlineColor =10921638
                            LayoutCachedLeft =875
                            LayoutCachedTop =9180
                            LayoutCachedWidth =1745
                            LayoutCachedHeight =9495
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =645
                    Top =9540
                    TabIndex =44
                    BorderColor =10921638
                    Name ="Baixa visão"
                    ControlSource ="Baixa visão"
                    EventProcPrefix ="Baixa_visão"
                    GridlineColor =10921638

                    LayoutCachedLeft =645
                    LayoutCachedTop =9540
                    LayoutCachedWidth =905
                    LayoutCachedHeight =9780
                    Begin
                        Begin Label
                            Left =875
                            Top =9510
                            Width =1065
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo381"
                            Caption ="Baixa visão"
                            GridlineColor =10921638
                            LayoutCachedLeft =875
                            LayoutCachedTop =9510
                            LayoutCachedWidth =1940
                            LayoutCachedHeight =9825
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =2264
                    Top =8886
                    TabIndex =45
                    BorderColor =10921638
                    Name ="Surdez severa profunda"
                    ControlSource ="Surdez severa profunda"
                    EventProcPrefix ="Surdez_severa_profunda"
                    GridlineColor =10921638

                    LayoutCachedLeft =2264
                    LayoutCachedTop =8886
                    LayoutCachedWidth =2524
                    LayoutCachedHeight =9126
                    Begin
                        Begin Label
                            Left =2494
                            Top =8856
                            Width =2205
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo382"
                            Caption ="Surdez severa profunda"
                            GridlineColor =10921638
                            LayoutCachedLeft =2494
                            LayoutCachedTop =8856
                            LayoutCachedWidth =4699
                            LayoutCachedHeight =9171
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =2263
                    Top =9216
                    TabIndex =46
                    BorderColor =10921638
                    Name ="Surdez leve moderada"
                    ControlSource ="Surdez leve moderada"
                    EventProcPrefix ="Surdez_leve_moderada"
                    GridlineColor =10921638

                    LayoutCachedLeft =2263
                    LayoutCachedTop =9216
                    LayoutCachedWidth =2523
                    LayoutCachedHeight =9456
                    Begin
                        Begin Label
                            Left =2493
                            Top =9186
                            Width =2070
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo383"
                            Caption ="Surdez leve moderada"
                            GridlineColor =10921638
                            LayoutCachedLeft =2493
                            LayoutCachedTop =9186
                            LayoutCachedWidth =4563
                            LayoutCachedHeight =9501
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =2263
                    Top =9546
                    TabIndex =47
                    BorderColor =10921638
                    Name ="Deficiencia fisica"
                    ControlSource ="Deficiencia fisica"
                    EventProcPrefix ="Deficiencia_fisica"
                    GridlineColor =10921638

                    LayoutCachedLeft =2263
                    LayoutCachedTop =9546
                    LayoutCachedWidth =2523
                    LayoutCachedHeight =9786
                    Begin
                        Begin Label
                            Left =2493
                            Top =9516
                            Width =1560
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo384"
                            Caption ="Deficiencia fisica"
                            GridlineColor =10921638
                            LayoutCachedLeft =2493
                            LayoutCachedTop =9516
                            LayoutCachedWidth =4053
                            LayoutCachedHeight =9831
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =4815
                    Top =8886
                    TabIndex =48
                    BorderColor =10921638
                    Name ="Defic mental intelec"
                    ControlSource ="Defic mental intelec"
                    EventProcPrefix ="Defic_mental_intelec"
                    GridlineColor =10921638

                    LayoutCachedLeft =4815
                    LayoutCachedTop =8886
                    LayoutCachedWidth =5075
                    LayoutCachedHeight =9126
                    Begin
                        Begin Label
                            Left =5045
                            Top =8856
                            Width =1875
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo385"
                            Caption ="Defic mental intelec"
                            GridlineColor =10921638
                            LayoutCachedLeft =5045
                            LayoutCachedTop =8856
                            LayoutCachedWidth =6920
                            LayoutCachedHeight =9171
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =4814
                    Top =9216
                    TabIndex =49
                    BorderColor =10921638
                    Name ="Sindrome down"
                    ControlSource ="Sindrome down"
                    EventProcPrefix ="Sindrome_down"
                    GridlineColor =10921638

                    LayoutCachedLeft =4814
                    LayoutCachedTop =9216
                    LayoutCachedWidth =5074
                    LayoutCachedHeight =9456
                    Begin
                        Begin Label
                            Left =5044
                            Top =9186
                            Width =1500
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo386"
                            Caption ="Sindrome down"
                            GridlineColor =10921638
                            LayoutCachedLeft =5044
                            LayoutCachedTop =9186
                            LayoutCachedWidth =6544
                            LayoutCachedHeight =9501
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =4814
                    Top =9546
                    TabIndex =50
                    BorderColor =10921638
                    Name ="Transt doença mental"
                    ControlSource ="Transt doença mental"
                    EventProcPrefix ="Transt_doença_mental"
                    GridlineColor =10921638

                    LayoutCachedLeft =4814
                    LayoutCachedTop =9546
                    LayoutCachedWidth =5074
                    LayoutCachedHeight =9786
                    Begin
                        Begin Label
                            Left =5044
                            Top =9516
                            Width =2040
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo387"
                            Caption ="Transt doença mental"
                            GridlineColor =10921638
                            LayoutCachedLeft =5044
                            LayoutCachedTop =9516
                            LayoutCachedWidth =7084
                            LayoutCachedHeight =9831
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =675
                    Top =9885
                    TabIndex =51
                    BorderColor =10921638
                    Name ="DoencaCronica"
                    ControlSource ="DoencaCronica"
                    GridlineColor =10921638

                    LayoutCachedLeft =675
                    LayoutCachedTop =9885
                    LayoutCachedWidth =935
                    LayoutCachedHeight =10125
                    Begin
                        Begin Label
                            Left =905
                            Top =9855
                            Width =1200
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo388"
                            Caption ="DoencaCronica"
                            GridlineColor =10921638
                            LayoutCachedLeft =905
                            LayoutCachedTop =9855
                            LayoutCachedWidth =2105
                            LayoutCachedHeight =10170
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =3380
                    Top =9858
                    Width =7416
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =52
                    Name ="Qual DCronica"
                    ControlSource ="Qual DCronica"
                    EventProcPrefix ="Qual_DCronica"
                    GridlineColor =10921638

                    LayoutCachedLeft =3380
                    LayoutCachedTop =9858
                    LayoutCachedWidth =10796
                    LayoutCachedHeight =10173
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =2189
                            Top =9858
                            Width =1185
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo389"
                            Caption ="Qual DCronica"
                            GridlineColor =10921638
                            LayoutCachedLeft =2189
                            LayoutCachedTop =9858
                            LayoutCachedWidth =3374
                            LayoutCachedHeight =10173
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    Left =858
                    Top =7862
                    Width =1245
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo371"
                    Caption ="Vacina em Dia"
                    GridlineColor =10921638
                    LayoutCachedLeft =858
                    LayoutCachedTop =7862
                    LayoutCachedWidth =2103
                    LayoutCachedHeight =8177
                    ForeTint =100.0
                End
                Begin Label
                    Left =2509
                    Top =7862
                    Width =1425
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo372"
                    Caption ="Medicamentos"
                    GridlineColor =10921638
                    LayoutCachedLeft =2509
                    LayoutCachedTop =7862
                    LayoutCachedWidth =3934
                    LayoutCachedHeight =8177
                    ForeTint =100.0
                End
                Begin Label
                    Left =3982
                    Top =7860
                    Width =1935
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo373"
                    Caption ="Quais Medicamentos"
                    GridlineColor =10921638
                    LayoutCachedLeft =3982
                    LayoutCachedTop =7860
                    LayoutCachedWidth =5917
                    LayoutCachedHeight =8175
                    ForeTint =100.0
                End
                Begin Label
                    Left =858
                    Top =8175
                    Width =1695
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo374"
                    Caption ="Tratamento de Saude"
                    GridlineColor =10921638
                    LayoutCachedLeft =858
                    LayoutCachedTop =8175
                    LayoutCachedWidth =2553
                    LayoutCachedHeight =8490
                    ForeTint =100.0
                End
                Begin Label
                    Left =2955
                    Top =8176
                    Width =1560
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo375"
                    Caption ="Qual Tratamento"
                    GridlineColor =10921638
                    LayoutCachedLeft =2955
                    LayoutCachedTop =8176
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =8491
                    ForeTint =100.0
                End
                Begin Label
                    Left =870
                    Top =8520
                    Width =660
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo376"
                    Caption ="Alergia"
                    GridlineColor =10921638
                    LayoutCachedLeft =870
                    LayoutCachedTop =8520
                    LayoutCachedWidth =1530
                    LayoutCachedHeight =8835
                    ForeTint =100.0
                End
                Begin Label
                    Left =1650
                    Top =8535
                    Width =1005
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo377"
                    Caption ="Qual Alergia"
                    GridlineColor =10921638
                    LayoutCachedLeft =1650
                    LayoutCachedTop =8535
                    LayoutCachedWidth =2655
                    LayoutCachedHeight =8850
                    ForeTint =100.0
                End
                Begin Label
                    Left =6422
                    Top =8521
                    Width =825
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo378"
                    Caption ="Pediatra"
                    GridlineColor =10921638
                    LayoutCachedLeft =6422
                    LayoutCachedTop =8521
                    LayoutCachedWidth =7247
                    LayoutCachedHeight =8836
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =638
                    Top =7860
                    TabIndex =53
                    BorderColor =10921638
                    Name ="Seleção398"
                    ControlSource ="VacinaEmDia"
                    GridlineColor =10921638

                    LayoutCachedLeft =638
                    LayoutCachedTop =7860
                    LayoutCachedWidth =898
                    LayoutCachedHeight =8100
                End
                Begin CheckBox
                    Left =2282
                    Top =7860
                    TabIndex =54
                    BorderColor =10921638
                    Name ="Seleção400"
                    ControlSource ="Medicamentos"
                    GridlineColor =10921638

                    LayoutCachedLeft =2282
                    LayoutCachedTop =7860
                    LayoutCachedWidth =2542
                    LayoutCachedHeight =8100
                End
                Begin CheckBox
                    Left =630
                    Top =8175
                    TabIndex =55
                    BorderColor =10921638
                    Name ="Seleção401"
                    ControlSource ="TratamentoSaude"
                    GridlineColor =10921638

                    LayoutCachedLeft =630
                    LayoutCachedTop =8175
                    LayoutCachedWidth =890
                    LayoutCachedHeight =8415
                End
                Begin CheckBox
                    Left =630
                    Top =8520
                    TabIndex =56
                    BorderColor =10921638
                    Name ="Seleção403"
                    ControlSource ="Alergia"
                    GridlineColor =10921638

                    LayoutCachedLeft =630
                    LayoutCachedTop =8520
                    LayoutCachedWidth =890
                    LayoutCachedHeight =8760
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =5627
                    Top =7860
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =57
                    ForeColor =4210752
                    Name ="QuaisMedicamentos"
                    ControlSource ="QuaisMedicamentos"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =5627
                    LayoutCachedTop =7860
                    LayoutCachedWidth =7328
                    LayoutCachedHeight =8175
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =4372
                    Top =8175
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =58
                    ForeColor =4210752
                    Name ="QualTratamento"
                    ControlSource ="QualTratamento"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =4372
                    LayoutCachedTop =8175
                    LayoutCachedWidth =6073
                    LayoutCachedHeight =8490
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =2670
                    Top =8520
                    Width =3681
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =59
                    ForeColor =4210752
                    Name ="QualAlergia"
                    ControlSource ="QualAlergia"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2670
                    LayoutCachedTop =8520
                    LayoutCachedWidth =6351
                    LayoutCachedHeight =8835
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =7158
                    Top =8520
                    Width =3576
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =60
                    ForeColor =4210752
                    Name ="Pediatra"
                    ControlSource ="Pediatra"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =7158
                    LayoutCachedTop =8520
                    LayoutCachedWidth =10734
                    LayoutCachedHeight =8835
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =4605
                    Top =7035
                    TabIndex =61
                    BorderColor =10921638
                    Name ="PAF"
                    ControlSource ="PAF"
                    GridlineColor =10921638

                    LayoutCachedLeft =4605
                    LayoutCachedTop =7035
                    LayoutCachedWidth =4865
                    LayoutCachedHeight =7275
                    Begin
                        Begin Label
                            Left =4835
                            Top =7005
                            Width =615
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo413"
                            Caption ="PAF"
                            GridlineColor =10921638
                            LayoutCachedLeft =4835
                            LayoutCachedTop =7005
                            LayoutCachedWidth =5450
                            LayoutCachedHeight =7320
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =630
                    Top =7020
                    TabIndex =62
                    BorderColor =10921638
                    Name ="Aco"
                    ControlSource ="Aco"
                    GridlineColor =10921638

                    LayoutCachedLeft =630
                    LayoutCachedTop =7020
                    LayoutCachedWidth =890
                    LayoutCachedHeight =7260
                    Begin
                        Begin Label
                            Left =860
                            Top =6990
                            Width =2190
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo414"
                            Caption ="Família Acompanhada  "
                            GridlineColor =10921638
                            LayoutCachedLeft =860
                            LayoutCachedTop =6990
                            LayoutCachedWidth =3050
                            LayoutCachedHeight =7305
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =3036
                    Top =10275
                    Width =5586
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =63
                    Name ="Motivo busca serviço"
                    ControlSource ="Motivo busca serviço"
                    RowSourceType ="Value List"
                    RowSource ="\"Demanda espontanea\";\"Direcionamento do PAIF\";\"Direcionamento do PAEFI\";\""
                        "Encam Sistema Garantia de Direitos\";\"Encam de Outras Politicas\""
                    ColumnWidths ="1441"
                    EventProcPrefix ="Motivo_busca_serviço"
                    GridlineColor =10921638

                    LayoutCachedLeft =3036
                    LayoutCachedTop =10275
                    LayoutCachedWidth =8622
                    LayoutCachedHeight =10590
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            TextAlign =1
                            Left =120
                            Top =10275
                            Width =2910
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo415"
                            Caption ="O que motivou a busca pelo serviço? "
                            GridlineColor =10921638
                            LayoutCachedLeft =120
                            LayoutCachedTop =10275
                            LayoutCachedWidth =3030
                            LayoutCachedHeight =10590
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =1756
                    Top =10619
                    Width =6876
                    Height =315
                    ColumnWidth =3870
                    FontSize =9
                    FontWeight =700
                    TabIndex =64
                    Name ="SituaçãoUsuario"
                    ControlSource ="SituaçãoUsuario"
                    RowSourceType ="Value List"
                    RowSource ="\"Não está em situação de prioridade\";\"Em situação de isolamento\";\"Trabalho "
                        "infantil\";\"Vivência de violência e/ou negligência\";\"Fora da escola defasagem"
                        " sup 2 anos\";\"Em situação de acolhimento\";\"Situação de abuso e/ou exploração"
                        " sexual\";\"Com medidas protetivas do ECA\";\"Crianças e adolescentes em situaçã"
                        "o de rua\";\"Vulnerabilidade de pessoa com deficiência\""
                    ColumnWidths ="1440"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1756
                    LayoutCachedTop =10619
                    LayoutCachedWidth =8632
                    LayoutCachedHeight =10934
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            TextAlign =1
                            Left =100
                            Top =10619
                            Width =1650
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo416"
                            Caption ="Situação do Usuario: "
                            GridlineColor =10921638
                            LayoutCachedLeft =100
                            LayoutCachedTop =10619
                            LayoutCachedWidth =1750
                            LayoutCachedHeight =10934
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    Top =11055
                    Width =10830
                    Height =345
                    FontSize =12
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo418"
                    Caption ="PARECER TÉCNICO:"
                    GridlineColor =10921638
                    LayoutCachedTop =11055
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =11400
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =4095
                    Top =11550
                    Width =6735
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo419"
                    Caption ="________________________________________________________________________________"
                        "_____________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =4095
                    LayoutCachedTop =11550
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =11865
                    ForeTint =100.0
                End
                Begin Label
                    Left =120
                    Top =11895
                    Width =10710
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo420"
                    Caption ="________________________________________________________________________________"
                        "_____________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =120
                    LayoutCachedTop =11895
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =12210
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Top =12480
                    Width =10830
                    Height =405
                    FontSize =12
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo422"
                    Caption ="EM CASOS DE CRIANÇA/ADOLESCENTE:"
                    GridlineColor =10921638
                    LayoutCachedTop =12480
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =12885
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =165
                    Top =12987
                    TabIndex =65
                    BorderColor =10921638
                    Name ="Cuidador exclusivo"
                    ControlSource ="Cuidador exclusivo"
                    EventProcPrefix ="Cuidador_exclusivo"
                    GridlineColor =10921638

                    LayoutCachedLeft =165
                    LayoutCachedTop =12987
                    LayoutCachedWidth =425
                    LayoutCachedHeight =13227
                    Begin
                        Begin Label
                            Left =395
                            Top =12930
                            Width =2160
                            Height =315
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo423"
                            Caption ="Cuidador exclusivo"
                            GridlineColor =10921638
                            LayoutCachedLeft =395
                            LayoutCachedTop =12930
                            LayoutCachedWidth =2555
                            LayoutCachedHeight =13245
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =2659
                    Top =12960
                    TabIndex =66
                    BorderColor =10921638
                    Name ="Cuidador exclusivo trabalha"
                    ControlSource ="Cuidador exclusivo trabalha"
                    EventProcPrefix ="Cuidador_exclusivo_trabalha"
                    GridlineColor =10921638

                    LayoutCachedLeft =2659
                    LayoutCachedTop =12960
                    LayoutCachedWidth =2919
                    LayoutCachedHeight =13200
                    Begin
                        Begin Label
                            Left =2889
                            Top =12930
                            Width =2970
                            Height =315
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo424"
                            Caption ="Cuidador exclusivo trabalha"
                            GridlineColor =10921638
                            LayoutCachedLeft =2889
                            LayoutCachedTop =12930
                            LayoutCachedWidth =5859
                            LayoutCachedHeight =13245
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =4648
                    Top =13338
                    Width =3459
                    Height =340
                    FontSize =9
                    FontWeight =700
                    TabIndex =67
                    BorderColor =10921638
                    Name ="QuemBusca"
                    ControlSource ="QuemBusca"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =4648
                    LayoutCachedTop =13338
                    LayoutCachedWidth =8107
                    LayoutCachedHeight =13678
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =2551
                            Top =13338
                            Width =2097
                            Height =340
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo426"
                            Caption ="Se não, quem vai buscar?   "
                            GridlineColor =10921638
                            LayoutCachedLeft =2551
                            LayoutCachedTop =13338
                            LayoutCachedWidth =4648
                            LayoutCachedHeight =13678
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =2306
                    Top =13740
                    Width =3636
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =68
                    BorderColor =10921638
                    Name ="PessoaEmergencia"
                    ControlSource ="PessoaEmergencia"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2306
                    LayoutCachedTop =13740
                    LayoutCachedWidth =5942
                    LayoutCachedHeight =14055
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =395
                            Top =13740
                            Width =1920
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo427"
                            Caption ="Pessoa de emergencia: "
                            GridlineColor =10921638
                            LayoutCachedLeft =395
                            LayoutCachedTop =13740
                            LayoutCachedWidth =2315
                            LayoutCachedHeight =14055
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =2361
                    Top =14131
                    Width =3576
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =69
                    BorderColor =10921638
                    Name ="TelEmergencia"
                    ControlSource ="TelEmergencia"
                    InputMask ="!\\(99\") \"!99000\\-0000;0;"
                    GridlineColor =10921638

                    LayoutCachedLeft =2361
                    LayoutCachedTop =14131
                    LayoutCachedWidth =5937
                    LayoutCachedHeight =14446
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =390
                            Top =14131
                            Width =1965
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            BorderColor =8355711
                            Name ="Rótulo428"
                            Caption ="Telefone de emergencia: "
                            GridlineColor =10921638
                            LayoutCachedLeft =390
                            LayoutCachedTop =14131
                            LayoutCachedWidth =2355
                            LayoutCachedHeight =14446
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    Left =396
                    Top =13338
                    Width =2098
                    Height =340
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo425"
                    Caption ="Autorizado a sair sozinho?"
                    GridlineColor =10921638
                    LayoutCachedLeft =396
                    LayoutCachedTop =13338
                    LayoutCachedWidth =2494
                    LayoutCachedHeight =13678
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =165
                    Top =13340
                    TabIndex =70
                    BorderColor =10921638
                    Name ="Seleção429"
                    ControlSource ="Autorizado a sair sozinho"
                    GridlineColor =10921638

                    LayoutCachedLeft =165
                    LayoutCachedTop =13340
                    LayoutCachedWidth =425
                    LayoutCachedHeight =13580
                End
                Begin TextBox
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =5241
                    Top =56
                    Width =1431
                    Height =315
                    FontSize =12
                    FontWeight =700
                    TabIndex =71
                    Name ="DataAtual"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].MáxDeDataAtual"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =5241
                    LayoutCachedTop =56
                    LayoutCachedWidth =6672
                    LayoutCachedHeight =371
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =3570
                            Top =56
                            Width =1665
                            Height =315
                            FontSize =12
                            FontWeight =700
                            ForeColor =8355711
                            Name ="Rótulo431"
                            Caption ="Data da Atualiz: "
                            GridlineColor =10921638
                            LayoutCachedLeft =3570
                            LayoutCachedTop =56
                            LayoutCachedWidth =5235
                            LayoutCachedHeight =371
                            BorderTint =100.0
                        End
                    End
                End
                Begin Label
                    Left =165
                    Top =11520
                    Width =3945
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo417"
                    Caption ="Familia dentro do perfil    SIM (    )   NÃO  (    )   "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =11520
                    LayoutCachedWidth =4110
                    LayoutCachedHeight =11805
                    ForeTint =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =2144
                    Top =56
                    Width =1431
                    Height =315
                    FontSize =12
                    FontWeight =700
                    TabIndex =72
                    ForeColor =4210752
                    Name ="DATAINSCR"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].DATAINSCR"
                    GridlineColor =10921638

                    LayoutCachedLeft =2144
                    LayoutCachedTop =56
                    LayoutCachedWidth =3575
                    LayoutCachedHeight =371
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =165
                            Top =56
                            Width =1965
                            Height =315
                            FontSize =12
                            FontWeight =700
                            ForeColor =8355711
                            Name ="Rótulo432"
                            Caption ="Data de Inscrição: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =56
                            LayoutCachedWidth =2130
                            LayoutCachedHeight =371
                            BorderTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    IMESentenceMode =3
                    Left =7551
                    Top =56
                    Width =3336
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =73
                    ForeColor =3484194
                    Name ="GRUPOEXT"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].NomeGrupo"
                    RowSourceType ="Table/Query"
                    GridlineColor =10921638

                    LayoutCachedLeft =7551
                    LayoutCachedTop =56
                    LayoutCachedWidth =10887
                    LayoutCachedHeight =371
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =6690
                            Top =56
                            Width =840
                            Height =315
                            FontSize =10
                            FontWeight =700
                            ForeColor =8355711
                            Name ="Rótulo433"
                            Caption ="GRUPO: "
                            GridlineColor =10921638
                            LayoutCachedLeft =6690
                            LayoutCachedTop =56
                            LayoutCachedWidth =7530
                            LayoutCachedHeight =371
                            BorderTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =1298
                    Top =375
                    Width =2841
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =74
                    ForeColor =4210752
                    Name ="FXETARIA"
                    ControlSource ="FXETARIA"
                    GridlineColor =10921638

                    LayoutCachedLeft =1298
                    LayoutCachedTop =375
                    LayoutCachedWidth =4139
                    LayoutCachedHeight =690
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =165
                            Top =375
                            Width =1140
                            Height =315
                            FontSize =10
                            FontWeight =700
                            ForeColor =8355711
                            Name ="Rótulo434"
                            Caption ="FX. ETARIA"
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =375
                            LayoutCachedWidth =1305
                            LayoutCachedHeight =690
                            BorderTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =5107
                    Top =375
                    Width =5781
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =75
                    ForeColor =4210752
                    Name ="Texto435"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].[DADOS FICHA INSCR SCFV EXTERNO].Turno"
                    GridlineColor =10921638

                    LayoutCachedLeft =5107
                    LayoutCachedTop =375
                    LayoutCachedWidth =10888
                    LayoutCachedHeight =690
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =4139
                            Top =375
                            Width =960
                            Height =315
                            FontSize =10
                            FontWeight =700
                            ForeColor =8355711
                            Name ="Rótulo436"
                            Caption ="TURNO"
                            GridlineColor =10921638
                            LayoutCachedLeft =4139
                            LayoutCachedTop =375
                            LayoutCachedWidth =5099
                            LayoutCachedHeight =690
                            BorderTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    IMESentenceMode =3
                    Left =1146
                    Top =690
                    Width =9741
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =76
                    ForeColor =3484194
                    Name ="UNIDADE"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV EXTERNO].UNIDADE"
                    RowSourceType ="Table/Query"
                    GridlineColor =10921638

                    LayoutCachedLeft =1146
                    LayoutCachedTop =690
                    LayoutCachedWidth =10887
                    LayoutCachedHeight =1005
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =165
                            Top =690
                            Width =975
                            Height =315
                            FontSize =10
                            FontWeight =700
                            ForeColor =8355711
                            Name ="Rótulo437"
                            Caption ="UNIDADE"
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =690
                            LayoutCachedWidth =1140
                            LayoutCachedHeight =1005
                            BorderTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =5911
                    Top =5612
                    Width =3831
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =77
                    Name ="Texto439"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].Celular"
                    InputMask ="!\\(99\") \"!9900\\-0000;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =5911
                    LayoutCachedTop =5612
                    LayoutCachedWidth =9742
                    LayoutCachedHeight =5927
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =4975
                            Top =5612
                            Width =960
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo440"
                            Caption ="Celular: "
                            GridlineColor =10921638
                            LayoutCachedLeft =4975
                            LayoutCachedTop =5612
                            LayoutCachedWidth =5935
                            LayoutCachedHeight =5927
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
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
    End
End
