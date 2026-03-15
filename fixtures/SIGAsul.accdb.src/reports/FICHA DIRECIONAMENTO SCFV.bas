Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    PopUp = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11168
    DatasheetFontHeight =11
    ItemSuffix =205
    Left =3675
    Top =2775
    RecSrcDt = Begin
        0x218b472cbaa6e540
    End
    RecordSource ="SELECT TbUnidade.LOGO, TbUnidade.RODAPE, TbUnidade.NOME FROM TbUnidade; "
    Caption ="CONSULTA PARTE TÉCNICA"
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
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin PageHeader
            Height =0
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin Section
            KeepTogether = NotDefault
            Height =15675
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Rectangle
                    Top =2154
                    Width =11055
                    Height =737
                    BackColor =14277081
                    BorderColor =10921638
                    Name ="Caixa189"
                    GridlineColor =10921638
                    LayoutCachedTop =2154
                    LayoutCachedWidth =11055
                    LayoutCachedHeight =2891
                    BackShade =85.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =-15
                    Top =1755
                    Width =11055
                    Height =375
                    FontSize =14
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2"
                    Caption ="FICHA DE DIRECIONAMENTO - SCFV"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =-15
                    LayoutCachedTop =1755
                    LayoutCachedWidth =11040
                    LayoutCachedHeight =2130
                    ThemeFontIndex =-1
                End
                Begin Label
                    TextAlign =2
                    Left =1305
                    Top =1275
                    Width =5100
                    Height =345
                    FontSize =12
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo160"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL -"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =1305
                    LayoutCachedTop =1275
                    LayoutCachedWidth =6405
                    LayoutCachedHeight =1620
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =7022
                    Top =1275
                    Width =3741
                    Height =345
                    FontSize =12
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CRAS"
                    ControlSource ="NOME"
                    RowSourceType ="Value List"
                    RowSource ="Centro;Sul;Norte;Rocha Leão"
                    ColumnWidths ="1441"
                    GridlineColor =10921638

                    LayoutCachedLeft =7022
                    LayoutCachedTop =1275
                    LayoutCachedWidth =10763
                    LayoutCachedHeight =1620
                    Begin
                        Begin Label
                            Left =6405
                            Top =1275
                            Width =615
                            Height =345
                            FontSize =12
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo112"
                            Caption ="CRAS"
                            GridlineColor =10921638
                            LayoutCachedLeft =6405
                            LayoutCachedTop =1275
                            LayoutCachedWidth =7020
                            LayoutCachedHeight =1620
                        End
                    End
                End
                Begin Label
                    Left =285
                    Top =3120
                    Width =3390
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo125"
                    Caption ="DATA: _______/_______/__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =3120
                    LayoutCachedWidth =3675
                    LayoutCachedHeight =3405
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =3510
                    Width =10590
                    Height =315
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo126"
                    Caption ="USUÁRIO: _______________________________________________________________________"
                        "____________________________________ "
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =3510
                    LayoutCachedWidth =10875
                    LayoutCachedHeight =3825
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =4800
                    Width =10395
                    Height =315
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo127"
                    Caption ="NIS: ___________________________________________________________________________"
                        "______"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =4800
                    LayoutCachedWidth =10680
                    LayoutCachedHeight =5115
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Top =9195
                    Width =5655
                    Height =315
                    FontWeight =700
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="Rótulo128"
                    Caption ="SITUAÇÃO DO USUÁRIO: "
                    GridlineColor =10921638
                    LayoutCachedTop =9195
                    LayoutCachedWidth =5655
                    LayoutCachedHeight =9510
                    BackShade =75.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =12
                    Left =165
                    Top =9525
                    Width =3090
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo129"
                    Caption ="(   ) Não está em situação prioritária "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =9525
                    LayoutCachedWidth =3255
                    LayoutCachedHeight =9795
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =12
                    Left =165
                    Top =9795
                    Width =2655
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo130"
                    Caption ="(   ) Em situação de isolamento "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =9795
                    LayoutCachedWidth =2820
                    LayoutCachedHeight =10065
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =10065
                    Width =1815
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo131"
                    Caption ="(   ) Trabalho infantil "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =10065
                    LayoutCachedWidth =1980
                    LayoutCachedHeight =10335
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =10335
                    Width =3600
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo132"
                    Caption ="(   ) Vivência de violência e/ou negligência "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =10335
                    LayoutCachedWidth =3765
                    LayoutCachedHeight =10605
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =10590
                    Width =5325
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo133"
                    Caption ="(   ) Fora da escola ou com defasagem escolar superior a 2 anos "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =10590
                    LayoutCachedWidth =5490
                    LayoutCachedHeight =10860
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =13320
                    Width =10485
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo139"
                    Caption ="OBSERVAÇÃO: ____________________________________________________________________"
                        "__________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =13320
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =13635
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =13815
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo140"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =13815
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =14100
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =14265
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo141"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =14265
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =14550
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =3975
                    Width =10560
                    Height =315
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo161"
                    Caption ="RESPONSÁVEL PELO USUÁRIO: ______________________________________________________"
                        "__________________________________ "
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =3975
                    LayoutCachedWidth =10845
                    LayoutCachedHeight =4290
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =4380
                    Width =10560
                    Height =315
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo162"
                    Caption ="DATA DE NASC: ________/_______/___________  GRAU DE PARENTESCO: ________________"
                        "___________________________________ "
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =4380
                    LayoutCachedWidth =10845
                    LayoutCachedHeight =4695
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =90
                    Top =14745
                    Width =4860
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo163"
                    Caption ="______________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =90
                    LayoutCachedTop =14745
                    LayoutCachedWidth =4950
                    LayoutCachedHeight =15030
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =60
                    Top =15075
                    Width =4905
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo164"
                    Caption ="ASS. RESPONSÁVEL"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =15075
                    LayoutCachedWidth =4965
                    LayoutCachedHeight =15360
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =6150
                    Top =14745
                    Width =4845
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo165"
                    Caption ="______________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =6150
                    LayoutCachedTop =14745
                    LayoutCachedWidth =10995
                    LayoutCachedHeight =15030
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =6420
                    Top =15090
                    Width =3735
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo166"
                    Caption ="ASS. TÉC. REFERÊNCIA"
                    GridlineColor =10921638
                    LayoutCachedLeft =6420
                    LayoutCachedTop =15090
                    LayoutCachedWidth =10155
                    LayoutCachedHeight =15375
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =11130
                    Width =5340
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo167"
                    Caption ="(   ) Em cumprimento de medida socioeducativa em meio aberto "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =11130
                    LayoutCachedWidth =5505
                    LayoutCachedHeight =11400
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =11415
                    Width =3435
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo168"
                    Caption ="(   ) Egresso de medidas socioeducativas "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =11415
                    LayoutCachedWidth =3600
                    LayoutCachedHeight =11685
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =11655
                    Width =3900
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo169"
                    Caption ="(   ) Situação de abuso e/ou exploração sexual "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =11655
                    LayoutCachedWidth =4065
                    LayoutCachedHeight =11925
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =667
                    Top =5325
                    Width =9660
                    Height =630
                    FontSize =12
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo178"
                    Caption ="Solicitamos incluir a criança/adolescente/adulto acima citado(a) no Serviço de C"
                        "onvivência e Fortalecimento de Vínculos / Atividade nesta Unidade:"
                    GridlineColor =10921638
                    LayoutCachedLeft =667
                    LayoutCachedTop =5325
                    LayoutCachedWidth =10327
                    LayoutCachedHeight =5955
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =10860
                    Width =2700
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo181"
                    Caption ="(   ) Em situação de acolhimento"
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =10860
                    LayoutCachedWidth =2865
                    LayoutCachedHeight =11130
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =11925
                    Width =4875
                    Height =465
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo182"
                    Caption ="(   ) Com medidas de proteção do Estatuto da Criança e do Adolescente - ECA"
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =11925
                    LayoutCachedWidth =5040
                    LayoutCachedHeight =12390
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =12405
                    Width =4080
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo183"
                    Caption ="(   ) Crianças e Adolescentes em situação de rua  "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =12405
                    LayoutCachedWidth =4245
                    LayoutCachedHeight =12675
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =165
                    Top =12660
                    Width =5100
                    Height =540
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo184"
                    Caption ="(   ) Vulnerabilidade no que diz respeito às pessoas com deficiência "
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =12660
                    LayoutCachedWidth =5265
                    LayoutCachedHeight =13200
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Top =7530
                    Width =11115
                    Height =315
                    FontWeight =700
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="Rótulo185"
                    Caption ="SCFV EXTERNO: "
                    GridlineColor =10921638
                    LayoutCachedTop =7530
                    LayoutCachedWidth =11115
                    LayoutCachedHeight =7845
                    BackShade =75.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =340
                    Top =2494
                    Width =10260
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo187"
                    Caption ="(   ) 0-5 ANOS     (   ) 6-11 ANOS     (   ) 12-14 ANOS     (   ) 15-17 ANOS    "
                        " (   ) 18-29 ANOS     (   ) 30-59 ANOS     (   ) 60 OU MAIS"
                    GridlineColor =10921638
                    LayoutCachedLeft =340
                    LayoutCachedTop =2494
                    LayoutCachedWidth =10600
                    LayoutCachedHeight =2779
                    ForeTint =100.0
                End
                Begin Label
                    Left =60
                    Top =2145
                    Width =1695
                    Height =360
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo188"
                    Caption ="FAIXA ETÁRIA: "
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =2145
                    LayoutCachedWidth =1755
                    LayoutCachedHeight =2505
                    ForeTint =100.0
                End
                Begin Label
                    Left =1141
                    Top =7937
                    Width =3285
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo190"
                    Caption ="(   ) CASA DA CRIANÇA ÂNCORA     "
                    GridlineColor =10921638
                    LayoutCachedLeft =1141
                    LayoutCachedTop =7937
                    LayoutCachedWidth =4426
                    LayoutCachedHeight =8252
                    ForeTint =100.0
                End
                Begin Label
                    Left =1140
                    Top =8325
                    Width =3780
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo192"
                    Caption ="(   ) CASA DA CRIANÇA CIDADE PRAIANA "
                    GridlineColor =10921638
                    LayoutCachedLeft =1140
                    LayoutCachedTop =8325
                    LayoutCachedWidth =4920
                    LayoutCachedHeight =8610
                    ForeTint =100.0
                End
                Begin Label
                    Left =1140
                    Top =8685
                    Width =3375
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo193"
                    Caption ="(   ) CASA DA CRIANÇA LIBERDADE     "
                    GridlineColor =10921638
                    LayoutCachedLeft =1140
                    LayoutCachedTop =8685
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =8970
                    ForeTint =100.0
                End
                Begin Label
                    Left =5102
                    Top =7927
                    Width =3930
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo194"
                    Caption ="(   ) CIC DR GILBERTO SOBRAL BARCELLOS   "
                    GridlineColor =10921638
                    LayoutCachedLeft =5102
                    LayoutCachedTop =7927
                    LayoutCachedWidth =9032
                    LayoutCachedHeight =8242
                    ForeTint =100.0
                End
                Begin Image
                    PictureType =2
                    Top =5887
                    Width =11160
                    Height =1590
                    BorderColor =10921638
                    Name ="Imagem196"
                    Picture ="1_ATIVIDADES CRAS"
                    GridlineColor =10921638

                    LayoutCachedTop =5887
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =7477
                    TabIndex =2
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
                    TabIndex =1

                    LayoutCachedWidth =5445
                    LayoutCachedHeight =1200
                    BorderShade =100.0
                End
                Begin Label
                    Left =5100
                    Top =8325
                    Width =3180
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo198"
                    Caption ="(   ) CIC APRENDIZ DE FUTURO   "
                    GridlineColor =10921638
                    LayoutCachedLeft =5100
                    LayoutCachedTop =8325
                    LayoutCachedWidth =8280
                    LayoutCachedHeight =8640
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =6015
                    Top =9195
                    Width =5145
                    Height =315
                    FontWeight =700
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="Rótulo199"
                    Caption ="SITUAÇÃO MUNICIPAL DO USUÁRIO: "
                    GridlineColor =10921638
                    LayoutCachedLeft =6015
                    LayoutCachedTop =9195
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =9510
                    BackShade =75.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =6525
                    Top =9585
                    Width =2340
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo200"
                    Caption ="(   ) Mulher chefe de família"
                    GridlineColor =10921638
                    LayoutCachedLeft =6525
                    LayoutCachedTop =9585
                    LayoutCachedWidth =8865
                    LayoutCachedHeight =9855
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =6525
                    Top =9930
                    Width =2055
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo201"
                    Caption ="(   ) Conflitos familiares "
                    GridlineColor =10921638
                    LayoutCachedLeft =6525
                    LayoutCachedTop =9930
                    LayoutCachedWidth =8580
                    LayoutCachedHeight =10200
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =6525
                    Top =10260
                    Width =3735
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo202"
                    Caption ="(   ) Ausência de rede de apoio no município "
                    GridlineColor =10921638
                    LayoutCachedLeft =6525
                    LayoutCachedTop =10260
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =10530
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =6525
                    Top =10590
                    Width =3135
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo203"
                    Caption ="(   ) Vulnerabilidade socioeconômica "
                    GridlineColor =10921638
                    LayoutCachedLeft =6525
                    LayoutCachedTop =10590
                    LayoutCachedWidth =9660
                    LayoutCachedHeight =10860
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =4
                    Left =6525
                    Top =10935
                    Width =3585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo204"
                    Caption ="(   ) Beneficiário do Programa Renda Brasil "
                    GridlineColor =10921638
                    LayoutCachedLeft =6525
                    LayoutCachedTop =10935
                    LayoutCachedWidth =10110
                    LayoutCachedHeight =11205
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
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
