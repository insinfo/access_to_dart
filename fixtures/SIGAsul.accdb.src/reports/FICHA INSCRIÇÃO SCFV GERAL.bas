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
    ItemSuffix =433
    Left =750
    Top =2550
    RecSrcDt = Begin
        0xffa2ca2374cde540
    End
    RecordSource ="FICHA INSCRIÇÃO SCFV E RF"
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
                    Top =1200
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
                    LayoutCachedTop =1200
                    LayoutCachedWidth =5355
                    LayoutCachedHeight =1515
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =5852
                    Top =226
                    Width =4560
                    Height =345
                    FontSize =13
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo21"
                    Caption ="FICHA DE CADASTRO SCFV - INTERNO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5852
                    LayoutCachedTop =226
                    LayoutCachedWidth =10412
                    LayoutCachedHeight =571
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =5384
                    Top =1200
                    Width =5106
                    Height =315
                    ColumnWidth =2385
                    FontWeight =700
                    BorderColor =10921638
                    Name ="TbUnidade.Nome"
                    ControlSource ="nomeUnidade"
                    Format =">"
                    EventProcPrefix ="TbUnidade_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =5384
                    LayoutCachedTop =1200
                    LayoutCachedWidth =10490
                    LayoutCachedHeight =1515
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
                    ControlSource ="[FICHA INSCRIÇÃO SCFV].NomePessoa"
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
                    Width =2721
                    Height =405
                    FontWeight =700
                    TabIndex =2
                    BackColor =14277081
                    Name ="NIS"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV].NIS"
                    GridlineColor =10921638

                    LayoutCachedLeft =8016
                    LayoutCachedTop =1590
                    LayoutCachedWidth =10737
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
                    ControlSource ="LOGO"
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
                    ControlSource ="nomerespons"
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
                    Top =450
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
                    LayoutCachedTop =450
                    LayoutCachedWidth =10905
                    LayoutCachedHeight =2835
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2091
                    Top =795
                    Width =2331
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =4
                    Name ="DNasc"
                    ControlSource ="DNasc"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =2091
                    LayoutCachedTop =795
                    LayoutCachedWidth =4422
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =795
                            Width =1920
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo317"
                            Caption ="DATA DE NASCIMENTO: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =795
                            LayoutCachedWidth =2085
                            LayoutCachedHeight =1065
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
                    Top =795
                    Width =1341
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =5
                    Name ="Idade"
                    ControlSource ="Idade"
                    GridlineColor =10921638

                    LayoutCachedLeft =5106
                    LayoutCachedTop =795
                    LayoutCachedWidth =6447
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =4425
                            Top =795
                            Width =675
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo318"
                            Caption ="Idade: "
                            GridlineColor =10921638
                            LayoutCachedLeft =4425
                            LayoutCachedTop =795
                            LayoutCachedWidth =5100
                            LayoutCachedHeight =1065
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
                    Top =795
                    Width =1221
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =6
                    Name ="Sexo"
                    ControlSource ="Sexo"
                    RowSourceType ="Value List"
                    RowSource ="\"M\";\"F\";\"Trans\""
                    ColumnWidths ="2700"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =6981
                    LayoutCachedTop =795
                    LayoutCachedWidth =8202
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =6450
                            Top =795
                            Width =540
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo319"
                            Caption ="Sexo: "
                            GridlineColor =10921638
                            LayoutCachedLeft =6450
                            LayoutCachedTop =795
                            LayoutCachedWidth =6990
                            LayoutCachedHeight =1065
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
                    Top =795
                    Width =1671
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =7
                    Name ="Raça/Cor"
                    ControlSource ="Raça/Cor"
                    RowSourceType ="Value List"
                    RowSource ="\"BRANCA\";\"PRETA\";\"AMARELA\";\"PARDA\";\"INDIGENA\""
                    ColumnWidths ="2625"
                    EventProcPrefix ="Raça_Cor"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =9111
                    LayoutCachedTop =795
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =8205
                            Top =795
                            Width =885
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo320"
                            Caption ="Raça/Cor: "
                            GridlineColor =10921638
                            LayoutCachedLeft =8205
                            LayoutCachedTop =795
                            LayoutCachedWidth =9090
                            LayoutCachedHeight =1065
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =566
                    Top =1065
                    Width =2376
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =8
                    Name ="CPF"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV].CPF"
                    InputMask ="000\\.000\\.000\\-00;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedTop =1065
                    LayoutCachedWidth =2942
                    LayoutCachedHeight =1335
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =170
                            Top =1065
                            Width =435
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo321"
                            Caption ="CPF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =1065
                            LayoutCachedWidth =605
                            LayoutCachedHeight =1335
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =3284
                    Top =1065
                    Width =2436
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =9
                    Name ="RG"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV].RG"
                    GridlineColor =10921638

                    LayoutCachedLeft =3284
                    LayoutCachedTop =1065
                    LayoutCachedWidth =5720
                    LayoutCachedHeight =1335
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =2948
                            Top =1065
                            Width =345
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo322"
                            Caption ="RG:"
                            GridlineColor =10921638
                            LayoutCachedLeft =2948
                            LayoutCachedTop =1065
                            LayoutCachedWidth =3293
                            LayoutCachedHeight =1335
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =6586
                    Top =1065
                    Width =1911
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =10
                    Name ="OrgaoRG"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV].RG"
                    GridlineColor =10921638

                    LayoutCachedLeft =6586
                    LayoutCachedTop =1065
                    LayoutCachedWidth =8497
                    LayoutCachedHeight =1335
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =5725
                            Top =1065
                            Width =870
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo323"
                            Caption ="OrgaoRG: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5725
                            LayoutCachedTop =1065
                            LayoutCachedWidth =6595
                            LayoutCachedHeight =1335
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =9426
                    Top =1065
                    Width =1356
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =11
                    Name ="DEmisRG"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV].DEmisRG"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =9426
                    LayoutCachedTop =1065
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =1335
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =8503
                            Top =1065
                            Width =915
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo324"
                            Caption ="DEmisRG: "
                            GridlineColor =10921638
                            LayoutCachedLeft =8503
                            LayoutCachedTop =1065
                            LayoutCachedWidth =9418
                            LayoutCachedHeight =1335
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =1856
                    Top =1335
                    Width =5511
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =12
                    Name ="MunicNasc"
                    ControlSource ="MunicNasc"
                    GridlineColor =10921638

                    LayoutCachedLeft =1856
                    LayoutCachedTop =1335
                    LayoutCachedWidth =7367
                    LayoutCachedHeight =1605
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =170
                            Top =1335
                            Width =1710
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo325"
                            Caption ="Município de Nasc.: "
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =1335
                            LayoutCachedWidth =1880
                            LayoutCachedHeight =1605
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
                    Top =1335
                    Width =2271
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =13
                    Name ="UFNasc"
                    ControlSource ="UFNasc"
                    RowSourceType ="Value List"
                    RowSource ="\"AC\";\"AL\";\"AP\";\"AM\";\"BA\";\"CE\";\"DF\";\"ES\";\"GO\";\"MA\";\"MT\";\"M"
                        "S\";\"MG\";\"PA \";\"PB\";\"PR\";\"PE\";\"PI\";\"RJ\";\"RN\";\"RS\";\"RO\";\"RR\""
                        ";\"SC\";\"SP\";\"SE\";\"TO\""
                    ColumnWidths ="1444"
                    GridlineColor =10921638

                    LayoutCachedLeft =8511
                    LayoutCachedTop =1335
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =1605
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =7365
                            Top =1335
                            Width =1140
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo326"
                            Caption ="UF de Nasc.: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7365
                            LayoutCachedTop =1335
                            LayoutCachedWidth =8505
                            LayoutCachedHeight =1605
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =165
                    Top =1635
                    TabIndex =14
                    BorderColor =10921638
                    Name ="FreqEscola"
                    ControlSource ="FreqEscola"
                    GridlineColor =10921638

                    LayoutCachedLeft =165
                    LayoutCachedTop =1635
                    LayoutCachedWidth =425
                    LayoutCachedHeight =1875
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =395
                            Top =1605
                            Width =1485
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo327"
                            Caption ="Frequenta Escola"
                            GridlineColor =10921638
                            LayoutCachedLeft =395
                            LayoutCachedTop =1605
                            LayoutCachedWidth =1880
                            LayoutCachedHeight =1875
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
                    Top =1605
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
                    LayoutCachedTop =1605
                    LayoutCachedWidth =5022
                    LayoutCachedHeight =1875
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =1860
                            Top =1605
                            Width =1230
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo328"
                            Caption ="Escolaridade: "
                            GridlineColor =10921638
                            LayoutCachedLeft =1860
                            LayoutCachedTop =1605
                            LayoutCachedWidth =3090
                            LayoutCachedHeight =1875
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
                    Top =1605
                    Width =2901
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =16
                    Name ="NOME ESCOLA"
                    ControlSource ="NOME ESCOLA"
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
                    LayoutCachedTop =1605
                    LayoutCachedWidth =9180
                    LayoutCachedHeight =1875
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =5028
                            Top =1605
                            Width =1260
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo329"
                            Caption ="NOME ESCOLA: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5028
                            LayoutCachedTop =1605
                            LayoutCachedWidth =6288
                            LayoutCachedHeight =1875
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
                    Top =1605
                    Width =1011
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =17
                    Name ="Turno"
                    ControlSource ="Turno"
                    RowSourceType ="Value List"
                    RowSource ="\"Manhã\";\"Tarde\";\"Noite\";\"Integral\""
                    ColumnWidths ="1441"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =9771
                    LayoutCachedTop =1605
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =1875
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =9184
                            Top =1605
                            Width =585
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo330"
                            Caption ="Turno:"
                            GridlineColor =10921638
                            LayoutCachedLeft =9184
                            LayoutCachedTop =1605
                            LayoutCachedWidth =9769
                            LayoutCachedHeight =1875
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =1363
                    Top =1875
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
                    LayoutCachedTop =1875
                    LayoutCachedWidth =5554
                    LayoutCachedHeight =2145
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =1875
                            Width =1230
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo331"
                            Caption ="Nome da Mãe: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =1875
                            LayoutCachedWidth =1395
                            LayoutCachedHeight =2145
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =6651
                    Top =1875
                    Width =4131
                    Height =270
                    FontSize =9
                    FontWeight =700
                    TabIndex =19
                    Name ="NomePai"
                    ControlSource ="NomePai"
                    GridlineColor =10921638

                    LayoutCachedLeft =6651
                    LayoutCachedTop =1875
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =2145
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =5550
                            Top =1875
                            Width =1125
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo332"
                            Caption ="Nome do Pai: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5550
                            LayoutCachedTop =1875
                            LayoutCachedWidth =6675
                            LayoutCachedHeight =2145
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =3066
                    Top =2145
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
                    LayoutCachedTop =2145
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =2415
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =2145
                            Width =2895
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo333"
                            Caption ="Nome do Responsável pela Inscrição: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =2145
                            LayoutCachedWidth =3060
                            LayoutCachedHeight =2415
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =561
                    Top =2415
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
                    LayoutCachedTop =2415
                    LayoutCachedWidth =4527
                    LayoutCachedHeight =2685
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =2415
                            Width =390
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo334"
                            Caption ="CPF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =2415
                            LayoutCachedWidth =555
                            LayoutCachedHeight =2685
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
                    Top =2415
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
                    LayoutCachedTop =2415
                    LayoutCachedWidth =10782
                    LayoutCachedHeight =2685
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =4530
                            Top =2415
                            Width =1020
                            Height =270
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo335"
                            Caption ="Parentesco:"
                            GridlineColor =10921638
                            LayoutCachedLeft =4530
                            LayoutCachedTop =2415
                            LayoutCachedWidth =5550
                            LayoutCachedHeight =2685
                            BackThemeColorIndex =3
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    Left =60
                    Top =3000
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
                    LayoutCachedTop =3000
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =5385
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin TextBox
                    BackStyle =0
                    IMESentenceMode =3
                    Left =966
                    Top =3450
                    Width =6066
                    Height =390
                    ColumnWidth =3180
                    FontWeight =700
                    TabIndex =23
                    BackColor =14277081
                    Name ="CS RESPONSAVEL FAMILIAR.Nome"
                    ControlSource ="nomerespons"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =966
                    LayoutCachedTop =3450
                    LayoutCachedWidth =7032
                    LayoutCachedHeight =3840
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =3450
                            Width =795
                            Height =390
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo350"
                            Caption ="Nome: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =3450
                            LayoutCachedWidth =960
                            LayoutCachedHeight =3840
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
                    Top =3450
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
                    LayoutCachedTop =3450
                    LayoutCachedWidth =10767
                    LayoutCachedHeight =3840
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =7035
                            Top =3450
                            Width =1245
                            Height =390
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo351"
                            Caption ="Parentesco: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7035
                            LayoutCachedTop =3450
                            LayoutCachedWidth =8280
                            LayoutCachedHeight =3840
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =576
                    Top =3975
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
                    LayoutCachedTop =3975
                    LayoutCachedWidth =1917
                    LayoutCachedHeight =4290
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =3975
                            Width =405
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo352"
                            Caption ="RG: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =3975
                            LayoutCachedWidth =570
                            LayoutCachedHeight =4290
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =7896
                    Top =3975
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
                    LayoutCachedTop =3975
                    LayoutCachedWidth =9132
                    LayoutCachedHeight =4290
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =7485
                            Top =3975
                            Width =435
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo353"
                            Caption ="NIS: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7485
                            LayoutCachedTop =3975
                            LayoutCachedWidth =7920
                            LayoutCachedHeight =4290
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =9546
                    Top =3975
                    Width =1221
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =27
                    Name ="CS RESPONSAVEL FAMILIAR.CPF"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].CPF"
                    InputMask ="000\\.000\\.000\\-00;0;_"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_CPF"
                    GridlineColor =10921638

                    LayoutCachedLeft =9546
                    LayoutCachedTop =3975
                    LayoutCachedWidth =10767
                    LayoutCachedHeight =4290
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =9135
                            Top =3975
                            Width =450
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo354"
                            Caption ="CPF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =9135
                            LayoutCachedTop =3975
                            LayoutCachedWidth =9585
                            LayoutCachedHeight =4290
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =1091
                    Top =4297
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
                    LayoutCachedTop =4297
                    LayoutCachedWidth =5447
                    LayoutCachedHeight =4612
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =170
                            Top =4297
                            Width =930
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo355"
                            Caption ="Endereço: "
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =4297
                            LayoutCachedWidth =1100
                            LayoutCachedHeight =4612
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
                    Top =4290
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
                    LayoutCachedTop =4290
                    LayoutCachedWidth =8112
                    LayoutCachedHeight =4605
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =5445
                            Top =4290
                            Width =630
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo356"
                            Caption ="Bairro: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5445
                            LayoutCachedTop =4290
                            LayoutCachedWidth =6075
                            LayoutCachedHeight =4605
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
                    Top =4290
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
                    LayoutCachedTop =4290
                    LayoutCachedWidth =9237
                    LayoutCachedHeight =4605
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =8100
                            Top =4290
                            Width =375
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo357"
                            Caption ="UF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =8100
                            LayoutCachedTop =4290
                            LayoutCachedWidth =8475
                            LayoutCachedHeight =4605
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =9651
                    Top =4290
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
                    LayoutCachedTop =4290
                    LayoutCachedWidth =10767
                    LayoutCachedHeight =4605
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =9234
                            Top =4290
                            Width =450
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo358"
                            Caption ="CEP: "
                            GridlineColor =10921638
                            LayoutCachedLeft =9234
                            LayoutCachedTop =4290
                            LayoutCachedWidth =9684
                            LayoutCachedHeight =4605
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
                    Top =4609
                    Width =2256
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
                    LayoutCachedTop =4609
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =4924
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =4609
                            Width =975
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo359"
                            Caption ="Municipio: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =4609
                            LayoutCachedWidth =1140
                            LayoutCachedHeight =4924
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =4772
                    Top =4609
                    Width =2271
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =33
                    Name ="Complemento"
                    ControlSource ="Complemento"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =4772
                    LayoutCachedTop =4609
                    LayoutCachedWidth =7043
                    LayoutCachedHeight =4924
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =3401
                            Top =4609
                            Width =1365
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo360"
                            Caption ="Complemento: "
                            GridlineColor =10921638
                            LayoutCachedLeft =3401
                            LayoutCachedTop =4609
                            LayoutCachedWidth =4766
                            LayoutCachedHeight =4924
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =8070
                    Top =4609
                    Width =2706
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =34
                    Name ="Referencia"
                    ControlSource ="Referencia"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =8070
                    LayoutCachedTop =4609
                    LayoutCachedWidth =10776
                    LayoutCachedHeight =4924
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =7029
                            Top =4609
                            Width =1035
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo361"
                            Caption ="Referencia: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7029
                            LayoutCachedTop =4609
                            LayoutCachedWidth =8064
                            LayoutCachedHeight =4924
                            BackShade =85.0
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =3456
                    Top =3975
                    Width =1356
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =36
                    BorderColor =10921638
                    Name ="CS RESPONSAVEL FAMILIAR.OrgaoRG"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].OrgaoRG"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_OrgaoRG"
                    GridlineColor =10921638

                    LayoutCachedLeft =3456
                    LayoutCachedTop =3975
                    LayoutCachedWidth =4812
                    LayoutCachedHeight =4290
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =1920
                            Top =3975
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
                            LayoutCachedTop =3975
                            LayoutCachedWidth =3450
                            LayoutCachedHeight =4290
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =6354
                    Top =3975
                    Width =1131
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =37
                    BorderColor =10921638
                    Name ="CS RESPONSAVEL FAMILIAR.DEmisRG"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].DEmisRG"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_DEmisRG"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =6354
                    LayoutCachedTop =3975
                    LayoutCachedWidth =7485
                    LayoutCachedHeight =4290
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =4818
                            Top =3975
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
                            LayoutCachedTop =3975
                            LayoutCachedWidth =6348
                            LayoutCachedHeight =4290
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    Left =60
                    Top =5445
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
                    LayoutCachedTop =5445
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =5835
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =60
                    Top =6705
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
                    LayoutCachedTop =6705
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =7110
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2271
                    Top =5865
                    Width =1086
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =38
                    BorderColor =10921638
                    Name ="BeneficioMunic"
                    ControlSource ="BeneficioMunic"
                    Format ="Yes/No"
                    GridlineColor =10921638

                    LayoutCachedLeft =2271
                    LayoutCachedTop =5865
                    LayoutCachedWidth =3357
                    LayoutCachedHeight =6180
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =570
                            Top =5865
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
                            LayoutCachedTop =5865
                            LayoutCachedWidth =2280
                            LayoutCachedHeight =6180
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3809
                    Top =5865
                    Width =906
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =39
                    BorderColor =10921638
                    Name ="BPC"
                    ControlSource ="BPC"
                    Format ="Yes/No"
                    GridlineColor =10921638

                    LayoutCachedLeft =3809
                    LayoutCachedTop =5865
                    LayoutCachedWidth =4715
                    LayoutCachedHeight =6180
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =3353
                            Top =5865
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
                            LayoutCachedTop =5865
                            LayoutCachedWidth =3788
                            LayoutCachedHeight =6180
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5165
                    Top =5865
                    Width =906
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =40
                    BorderColor =10921638
                    Name ="PBF"
                    ControlSource ="PBF"
                    Format ="Yes/No"
                    GridlineColor =10921638

                    LayoutCachedLeft =5165
                    LayoutCachedTop =5865
                    LayoutCachedWidth =6071
                    LayoutCachedHeight =6180
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =4709
                            Top =5865
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
                            LayoutCachedTop =5865
                            LayoutCachedWidth =5129
                            LayoutCachedHeight =6180
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =7035
                    Top =5865
                    Width =1026
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =41
                    BorderColor =10921638
                    Name ="CADUNICO"
                    ControlSource ="CADUNICO"
                    Format ="Yes/No"
                    GridlineColor =10921638

                    LayoutCachedLeft =7035
                    LayoutCachedTop =5865
                    LayoutCachedWidth =8061
                    LayoutCachedHeight =6180
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =6069
                            Top =5865
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
                            LayoutCachedTop =5865
                            LayoutCachedWidth =7029
                            LayoutCachedHeight =6180
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =181
                    Top =8175
                    TabIndex =42
                    BorderColor =10921638
                    Name ="Autismo"
                    ControlSource ="Autismo"
                    GridlineColor =10921638

                    LayoutCachedLeft =181
                    LayoutCachedTop =8175
                    LayoutCachedWidth =441
                    LayoutCachedHeight =8415
                    Begin
                        Begin Label
                            Left =411
                            Top =8145
                            Width =825
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo379"
                            Caption ="Autismo"
                            GridlineColor =10921638
                            LayoutCachedLeft =411
                            LayoutCachedTop =8145
                            LayoutCachedWidth =1236
                            LayoutCachedHeight =8460
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =180
                    Top =8505
                    TabIndex =43
                    BorderColor =10921638
                    Name ="Cegueira"
                    ControlSource ="Cegueira"
                    GridlineColor =10921638

                    LayoutCachedLeft =180
                    LayoutCachedTop =8505
                    LayoutCachedWidth =440
                    LayoutCachedHeight =8745
                    Begin
                        Begin Label
                            Left =410
                            Top =8475
                            Width =870
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo380"
                            Caption ="Cegueira"
                            GridlineColor =10921638
                            LayoutCachedLeft =410
                            LayoutCachedTop =8475
                            LayoutCachedWidth =1280
                            LayoutCachedHeight =8790
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =180
                    Top =8835
                    TabIndex =44
                    BorderColor =10921638
                    Name ="Baixa visão"
                    ControlSource ="Baixa visão"
                    EventProcPrefix ="Baixa_visão"
                    GridlineColor =10921638

                    LayoutCachedLeft =180
                    LayoutCachedTop =8835
                    LayoutCachedWidth =440
                    LayoutCachedHeight =9075
                    Begin
                        Begin Label
                            Left =410
                            Top =8805
                            Width =1065
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo381"
                            Caption ="Baixa visão"
                            GridlineColor =10921638
                            LayoutCachedLeft =410
                            LayoutCachedTop =8805
                            LayoutCachedWidth =1475
                            LayoutCachedHeight =9120
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =1799
                    Top =8181
                    TabIndex =45
                    BorderColor =10921638
                    Name ="Surdez severa profunda"
                    ControlSource ="Surdez severa profunda"
                    EventProcPrefix ="Surdez_severa_profunda"
                    GridlineColor =10921638

                    LayoutCachedLeft =1799
                    LayoutCachedTop =8181
                    LayoutCachedWidth =2059
                    LayoutCachedHeight =8421
                    Begin
                        Begin Label
                            Left =2029
                            Top =8151
                            Width =2205
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo382"
                            Caption ="Surdez severa profunda"
                            GridlineColor =10921638
                            LayoutCachedLeft =2029
                            LayoutCachedTop =8151
                            LayoutCachedWidth =4234
                            LayoutCachedHeight =8466
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =1798
                    Top =8511
                    TabIndex =46
                    BorderColor =10921638
                    Name ="Surdez leve moderada"
                    ControlSource ="Surdez leve moderada"
                    EventProcPrefix ="Surdez_leve_moderada"
                    GridlineColor =10921638

                    LayoutCachedLeft =1798
                    LayoutCachedTop =8511
                    LayoutCachedWidth =2058
                    LayoutCachedHeight =8751
                    Begin
                        Begin Label
                            Left =2028
                            Top =8481
                            Width =2070
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo383"
                            Caption ="Surdez leve moderada"
                            GridlineColor =10921638
                            LayoutCachedLeft =2028
                            LayoutCachedTop =8481
                            LayoutCachedWidth =4098
                            LayoutCachedHeight =8796
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =1798
                    Top =8841
                    TabIndex =47
                    BorderColor =10921638
                    Name ="Deficiencia fisica"
                    ControlSource ="Deficiencia fisica"
                    EventProcPrefix ="Deficiencia_fisica"
                    GridlineColor =10921638

                    LayoutCachedLeft =1798
                    LayoutCachedTop =8841
                    LayoutCachedWidth =2058
                    LayoutCachedHeight =9081
                    Begin
                        Begin Label
                            Left =2028
                            Top =8811
                            Width =1560
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo384"
                            Caption ="Deficiencia fisica"
                            GridlineColor =10921638
                            LayoutCachedLeft =2028
                            LayoutCachedTop =8811
                            LayoutCachedWidth =3588
                            LayoutCachedHeight =9126
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =4350
                    Top =8181
                    TabIndex =48
                    BorderColor =10921638
                    Name ="Defic mental intelec"
                    ControlSource ="Defic mental intelec"
                    EventProcPrefix ="Defic_mental_intelec"
                    GridlineColor =10921638

                    LayoutCachedLeft =4350
                    LayoutCachedTop =8181
                    LayoutCachedWidth =4610
                    LayoutCachedHeight =8421
                    Begin
                        Begin Label
                            Left =4580
                            Top =8151
                            Width =1875
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo385"
                            Caption ="Defic mental intelec"
                            GridlineColor =10921638
                            LayoutCachedLeft =4580
                            LayoutCachedTop =8151
                            LayoutCachedWidth =6455
                            LayoutCachedHeight =8466
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =4349
                    Top =8511
                    TabIndex =49
                    BorderColor =10921638
                    Name ="Sindrome down"
                    ControlSource ="Sindrome down"
                    EventProcPrefix ="Sindrome_down"
                    GridlineColor =10921638

                    LayoutCachedLeft =4349
                    LayoutCachedTop =8511
                    LayoutCachedWidth =4609
                    LayoutCachedHeight =8751
                    Begin
                        Begin Label
                            Left =4579
                            Top =8481
                            Width =1500
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo386"
                            Caption ="Sindrome down"
                            GridlineColor =10921638
                            LayoutCachedLeft =4579
                            LayoutCachedTop =8481
                            LayoutCachedWidth =6079
                            LayoutCachedHeight =8796
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =4349
                    Top =8841
                    TabIndex =50
                    BorderColor =10921638
                    Name ="Transt doença mental"
                    ControlSource ="Transt doença mental"
                    EventProcPrefix ="Transt_doença_mental"
                    GridlineColor =10921638

                    LayoutCachedLeft =4349
                    LayoutCachedTop =8841
                    LayoutCachedWidth =4609
                    LayoutCachedHeight =9081
                    Begin
                        Begin Label
                            Left =4579
                            Top =8811
                            Width =2040
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo387"
                            Caption ="Transt doença mental"
                            GridlineColor =10921638
                            LayoutCachedLeft =4579
                            LayoutCachedTop =8811
                            LayoutCachedWidth =6619
                            LayoutCachedHeight =9126
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =210
                    Top =9180
                    TabIndex =51
                    BorderColor =10921638
                    Name ="DoencaCronica"
                    ControlSource ="DoencaCronica"
                    GridlineColor =10921638

                    LayoutCachedLeft =210
                    LayoutCachedTop =9180
                    LayoutCachedWidth =470
                    LayoutCachedHeight =9420
                    Begin
                        Begin Label
                            Left =440
                            Top =9150
                            Width =1200
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo388"
                            Caption ="DoencaCronica"
                            GridlineColor =10921638
                            LayoutCachedLeft =440
                            LayoutCachedTop =9150
                            LayoutCachedWidth =1640
                            LayoutCachedHeight =9465
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =2915
                    Top =9153
                    Width =7416
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =52
                    BorderColor =10921638
                    Name ="Qual DCronica"
                    ControlSource ="Qual DCronica"
                    EventProcPrefix ="Qual_DCronica"
                    GridlineColor =10921638

                    LayoutCachedLeft =2915
                    LayoutCachedTop =9153
                    LayoutCachedWidth =10331
                    LayoutCachedHeight =9468
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =1724
                            Top =9153
                            Width =1185
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo389"
                            Caption ="Qual DCronica"
                            GridlineColor =10921638
                            LayoutCachedLeft =1724
                            LayoutCachedTop =9153
                            LayoutCachedWidth =2909
                            LayoutCachedHeight =9468
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    Left =393
                    Top =7157
                    Width =1245
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo371"
                    Caption ="Vacina em Dia"
                    GridlineColor =10921638
                    LayoutCachedLeft =393
                    LayoutCachedTop =7157
                    LayoutCachedWidth =1638
                    LayoutCachedHeight =7472
                    ForeTint =100.0
                End
                Begin Label
                    Left =2044
                    Top =7157
                    Width =1425
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo372"
                    Caption ="Medicamentos"
                    GridlineColor =10921638
                    LayoutCachedLeft =2044
                    LayoutCachedTop =7157
                    LayoutCachedWidth =3469
                    LayoutCachedHeight =7472
                    ForeTint =100.0
                End
                Begin Label
                    Left =3517
                    Top =7155
                    Width =1935
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo373"
                    Caption ="Quais Medicamentos"
                    GridlineColor =10921638
                    LayoutCachedLeft =3517
                    LayoutCachedTop =7155
                    LayoutCachedWidth =5452
                    LayoutCachedHeight =7470
                    ForeTint =100.0
                End
                Begin Label
                    Left =393
                    Top =7470
                    Width =1695
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo374"
                    Caption ="Tratamento de Saude"
                    GridlineColor =10921638
                    LayoutCachedLeft =393
                    LayoutCachedTop =7470
                    LayoutCachedWidth =2088
                    LayoutCachedHeight =7785
                    ForeTint =100.0
                End
                Begin Label
                    Left =2145
                    Top =7470
                    Width =1380
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo375"
                    Caption ="Qual Tratamento"
                    GridlineColor =10921638
                    LayoutCachedLeft =2145
                    LayoutCachedTop =7470
                    LayoutCachedWidth =3525
                    LayoutCachedHeight =7785
                    ForeTint =100.0
                End
                Begin Label
                    Left =405
                    Top =7815
                    Width =660
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo376"
                    Caption ="Alergia"
                    GridlineColor =10921638
                    LayoutCachedLeft =405
                    LayoutCachedTop =7815
                    LayoutCachedWidth =1065
                    LayoutCachedHeight =8130
                    ForeTint =100.0
                End
                Begin Label
                    Left =1185
                    Top =7830
                    Width =1005
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo377"
                    Caption ="Qual Alergia"
                    GridlineColor =10921638
                    LayoutCachedLeft =1185
                    LayoutCachedTop =7830
                    LayoutCachedWidth =2190
                    LayoutCachedHeight =8145
                    ForeTint =100.0
                End
                Begin Label
                    Left =5957
                    Top =7816
                    Width =825
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo378"
                    Caption ="Pediatra"
                    GridlineColor =10921638
                    LayoutCachedLeft =5957
                    LayoutCachedTop =7816
                    LayoutCachedWidth =6782
                    LayoutCachedHeight =8131
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =173
                    Top =7155
                    TabIndex =53
                    BorderColor =10921638
                    Name ="Seleção398"
                    ControlSource ="VacinaEmDia"
                    GridlineColor =10921638

                    LayoutCachedLeft =173
                    LayoutCachedTop =7155
                    LayoutCachedWidth =433
                    LayoutCachedHeight =7395
                End
                Begin CheckBox
                    Left =1817
                    Top =7155
                    TabIndex =54
                    BorderColor =10921638
                    Name ="Seleção400"
                    ControlSource ="Medicamentos"
                    GridlineColor =10921638

                    LayoutCachedLeft =1817
                    LayoutCachedTop =7155
                    LayoutCachedWidth =2077
                    LayoutCachedHeight =7395
                End
                Begin CheckBox
                    Left =165
                    Top =7470
                    TabIndex =55
                    BorderColor =10921638
                    Name ="Seleção401"
                    ControlSource ="TratamentoSaude"
                    GridlineColor =10921638

                    LayoutCachedLeft =165
                    LayoutCachedTop =7470
                    LayoutCachedWidth =425
                    LayoutCachedHeight =7710
                End
                Begin CheckBox
                    Left =165
                    Top =7815
                    TabIndex =56
                    BorderColor =10921638
                    Name ="Seleção403"
                    ControlSource ="Alergia"
                    GridlineColor =10921638

                    LayoutCachedLeft =165
                    LayoutCachedTop =7815
                    LayoutCachedWidth =425
                    LayoutCachedHeight =8055
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =5162
                    Top =7155
                    Width =5661
                    Height =330
                    FontSize =9
                    FontWeight =700
                    TabIndex =57
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="QuaisMedicamentos"
                    ControlSource ="QuaisMedicamentos"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =5162
                    LayoutCachedTop =7155
                    LayoutCachedWidth =10823
                    LayoutCachedHeight =7485
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =3555
                    Top =7470
                    Width =1611
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =58
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="QualTratamento"
                    ControlSource ="QualTratamento"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =3555
                    LayoutCachedTop =7470
                    LayoutCachedWidth =5166
                    LayoutCachedHeight =7785
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =2205
                    Top =7815
                    Width =3681
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =59
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="QualAlergia"
                    ControlSource ="QualAlergia"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2205
                    LayoutCachedTop =7815
                    LayoutCachedWidth =5886
                    LayoutCachedHeight =8130
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =6693
                    Top =7815
                    Width =3576
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =60
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Pediatra"
                    ControlSource ="Pediatra"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =6693
                    LayoutCachedTop =7815
                    LayoutCachedWidth =10269
                    LayoutCachedHeight =8130
                End
                Begin CheckBox
                    Left =4605
                    Top =6345
                    TabIndex =61
                    BorderColor =10921638
                    Name ="PAF"
                    ControlSource ="PAF"
                    GridlineColor =10921638

                    LayoutCachedLeft =4605
                    LayoutCachedTop =6345
                    LayoutCachedWidth =4865
                    LayoutCachedHeight =6585
                    Begin
                        Begin Label
                            Left =4835
                            Top =6315
                            Width =615
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo413"
                            Caption ="PAF"
                            GridlineColor =10921638
                            LayoutCachedLeft =4835
                            LayoutCachedTop =6315
                            LayoutCachedWidth =5450
                            LayoutCachedHeight =6630
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =630
                    Top =6330
                    TabIndex =62
                    BorderColor =10921638
                    Name ="Aco"
                    ControlSource ="Aco"
                    GridlineColor =10921638

                    LayoutCachedLeft =630
                    LayoutCachedTop =6330
                    LayoutCachedWidth =890
                    LayoutCachedHeight =6570
                    Begin
                        Begin Label
                            Left =860
                            Top =6300
                            Width =2190
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo414"
                            Caption ="Família Acompanhada  "
                            GridlineColor =10921638
                            LayoutCachedLeft =860
                            LayoutCachedTop =6300
                            LayoutCachedWidth =3050
                            LayoutCachedHeight =6615
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
                    Top =9585
                    Width =5586
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =63
                    BorderColor =10921638
                    Name ="Motivo busca serviço"
                    ControlSource ="Motivo busca serviço"
                    RowSourceType ="Value List"
                    RowSource ="\"Demanda espontanea\";\"Direcionamento do PAIF\";\"Direcionamento do PAEFI\";\""
                        "Encam Sistema Garantia de Direitos\";\"Encam de Outras Politicas\""
                    ColumnWidths ="1441"
                    EventProcPrefix ="Motivo_busca_serviço"
                    GridlineColor =10921638

                    LayoutCachedLeft =3036
                    LayoutCachedTop =9585
                    LayoutCachedWidth =8622
                    LayoutCachedHeight =9900
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            TextAlign =1
                            Left =120
                            Top =9585
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
                            LayoutCachedTop =9585
                            LayoutCachedWidth =3030
                            LayoutCachedHeight =9900
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
                    Top =9929
                    Width =6876
                    Height =315
                    ColumnWidth =3870
                    FontSize =9
                    FontWeight =700
                    TabIndex =64
                    BorderColor =10921638
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
                    LayoutCachedTop =9929
                    LayoutCachedWidth =8632
                    LayoutCachedHeight =10244
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            TextAlign =1
                            Left =100
                            Top =9929
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
                            LayoutCachedTop =9929
                            LayoutCachedWidth =1750
                            LayoutCachedHeight =10244
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    Top =10365
                    Width =10830
                    Height =345
                    FontSize =12
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo418"
                    Caption ="PARECER TÉCNICO:"
                    GridlineColor =10921638
                    LayoutCachedTop =10365
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =10710
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =4035
                    Top =10860
                    Width =6795
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo419"
                    Caption ="_______________________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =4035
                    LayoutCachedTop =10860
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =11175
                    ForeTint =100.0
                End
                Begin Label
                    Left =120
                    Top =11205
                    Width =10710
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo420"
                    Caption ="________________________________________________________________________________"
                        "_____________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =120
                    LayoutCachedTop =11205
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =11520
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Top =11790
                    Width =10830
                    Height =405
                    FontSize =12
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo422"
                    Caption ="EM CASOS DE CRIANÇA/ADOLESCENTE:"
                    GridlineColor =10921638
                    LayoutCachedTop =11790
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =12195
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =165
                    Top =12297
                    TabIndex =65
                    BorderColor =10921638
                    Name ="Cuidador exclusivo"
                    ControlSource ="Cuidador exclusivo"
                    EventProcPrefix ="Cuidador_exclusivo"
                    GridlineColor =10921638

                    LayoutCachedLeft =165
                    LayoutCachedTop =12297
                    LayoutCachedWidth =425
                    LayoutCachedHeight =12537
                    Begin
                        Begin Label
                            Left =395
                            Top =12240
                            Width =2160
                            Height =315
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo423"
                            Caption ="Cuidador exclusivo"
                            GridlineColor =10921638
                            LayoutCachedLeft =395
                            LayoutCachedTop =12240
                            LayoutCachedWidth =2555
                            LayoutCachedHeight =12555
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    Left =2659
                    Top =12270
                    TabIndex =66
                    BorderColor =10921638
                    Name ="Cuidador exclusivo trabalha"
                    ControlSource ="Cuidador exclusivo trabalha"
                    EventProcPrefix ="Cuidador_exclusivo_trabalha"
                    GridlineColor =10921638

                    LayoutCachedLeft =2659
                    LayoutCachedTop =12270
                    LayoutCachedWidth =2919
                    LayoutCachedHeight =12510
                    Begin
                        Begin Label
                            Left =2889
                            Top =12240
                            Width =2970
                            Height =315
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo424"
                            Caption ="Cuidador exclusivo trabalha"
                            GridlineColor =10921638
                            LayoutCachedLeft =2889
                            LayoutCachedTop =12240
                            LayoutCachedWidth =5859
                            LayoutCachedHeight =12555
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =4648
                    Top =12648
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
                    LayoutCachedTop =12648
                    LayoutCachedWidth =8107
                    LayoutCachedHeight =12988
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =2551
                            Top =12648
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
                            LayoutCachedTop =12648
                            LayoutCachedWidth =4648
                            LayoutCachedHeight =12988
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =2306
                    Top =13050
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
                    LayoutCachedTop =13050
                    LayoutCachedWidth =5942
                    LayoutCachedHeight =13365
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =395
                            Top =13050
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
                            LayoutCachedTop =13050
                            LayoutCachedWidth =2315
                            LayoutCachedHeight =13365
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =2361
                    Top =13441
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
                    LayoutCachedTop =13441
                    LayoutCachedWidth =5937
                    LayoutCachedHeight =13756
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =390
                            Top =13441
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
                            LayoutCachedTop =13441
                            LayoutCachedWidth =2355
                            LayoutCachedHeight =13756
                            BackShade =85.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    Left =396
                    Top =12648
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
                    LayoutCachedTop =12648
                    LayoutCachedWidth =2494
                    LayoutCachedHeight =12988
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =165
                    Top =12650
                    TabIndex =70
                    BorderColor =10921638
                    Name ="Seleção429"
                    ControlSource ="Autorizado a sair sozinho"
                    GridlineColor =10921638

                    LayoutCachedLeft =165
                    LayoutCachedTop =12650
                    LayoutCachedWidth =425
                    LayoutCachedHeight =12890
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2331
                    Top =60
                    Width =2091
                    Height =315
                    FontSize =12
                    FontWeight =700
                    TabIndex =71
                    BorderColor =10921638
                    Name ="DataAtual"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV].MáxDeDataAtual"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =2331
                    LayoutCachedTop =60
                    LayoutCachedWidth =4422
                    LayoutCachedHeight =375
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =120
                            Top =60
                            Width =2205
                            Height =315
                            FontSize =12
                            FontWeight =700
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo431"
                            Caption ="Data da Atualização: "
                            GridlineColor =10921638
                            LayoutCachedLeft =120
                            LayoutCachedTop =60
                            LayoutCachedWidth =2325
                            LayoutCachedHeight =375
                        End
                    End
                End
                Begin Label
                    Top =10830
                    Width =3945
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo417"
                    Caption ="Familia dentro do perfil    SIM (    )   NÃO  (    )   "
                    GridlineColor =10921638
                    LayoutCachedTop =10830
                    LayoutCachedWidth =3945
                    LayoutCachedHeight =11115
                    ForeTint =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =4142
                    Top =4920
                    Width =2316
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =72
                    Name ="FICHA INSCRIÇÃO SCFV.Celular"
                    ControlSource ="[FICHA INSCRIÇÃO SCFV].Celular"
                    EventProcPrefix ="FICHA_INSCRIÇÃO_SCFV_Celular"
                    GridlineColor =10921638

                    LayoutCachedLeft =4142
                    LayoutCachedTop =4920
                    LayoutCachedWidth =6458
                    LayoutCachedHeight =5235
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            OldBorderStyle =1
                            Left =3401
                            Top =4920
                            Width =735
                            Height =315
                            FontSize =9
                            FontWeight =700
                            Name ="Rótulo432"
                            Caption ="Celular:"
                            GridlineColor =10921638
                            LayoutCachedLeft =3401
                            LayoutCachedTop =4920
                            LayoutCachedWidth =4136
                            LayoutCachedHeight =5235
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =861
                    Top =4920
                    Width =2541
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
                    LayoutCachedTop =4920
                    LayoutCachedWidth =3402
                    LayoutCachedHeight =5235
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =165
                            Top =4920
                            Width =720
                            Height =315
                            FontSize =9
                            FontWeight =700
                            BackColor =14277081
                            Name ="Rótulo362"
                            Caption ="Tel fixo: "
                            GridlineColor =10921638
                            LayoutCachedLeft =165
                            LayoutCachedTop =4920
                            LayoutCachedWidth =885
                            LayoutCachedHeight =5235
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
