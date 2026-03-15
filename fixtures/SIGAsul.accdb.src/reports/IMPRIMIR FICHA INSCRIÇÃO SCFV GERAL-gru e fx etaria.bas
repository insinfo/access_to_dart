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
    Width =10939
    DatasheetFontHeight =11
    ItemSuffix =558
    Left =3900
    Top =2445
    RecordSource ="SELECT TbUnidade.LOGO, TbUnidade.RODAPE, TbUnidade.CodUnidade, TbUnidade.CRAS, T"
        "bUnidade.[Nº UNIDADE], TbUnidade.NOME, TbUnidade.CODBARRAS, TbUnidade.[DIRETOR(A"
        ")], TbUnidade.CARGO, TbUnidade.FUNÇÃO, TbUnidade.MATRICULA FROM TbUnidade; "
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
            Height =3975
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Top =2835
                    Width =10890
                    Height =450
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo557"
                    Caption ="FAIXA ETÁRIA: "
                    GridlineColor =10921638
                    LayoutCachedTop =2835
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =3285
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =6122
                    Top =226
                    Width =3810
                    Height =345
                    FontSize =13
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo21"
                    Caption ="FICHA DE CADASTRO SCFV"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =6122
                    LayoutCachedTop =226
                    LayoutCachedWidth =9932
                    LayoutCachedHeight =571
                    ThemeFontIndex =-1
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =2897
                    Top =1360
                    Width =5550
                    Height =345
                    FontSize =13
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo420"
                    Caption ="ATIVIDADES E/OU OFICINA SOCIOEDUCATIVA"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2897
                    LayoutCachedTop =1360
                    LayoutCachedWidth =8447
                    LayoutCachedHeight =1705
                    ThemeFontIndex =-1
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =56
                    Top =3630
                    Width =4476
                    Height =345
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo421"
                    Caption ="GRUPO"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =3630
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =3975
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7365
                    Top =3630
                    Width =1704
                    Height =345
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo424"
                    Caption ="DIA DA SEMANA"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =3630
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =3975
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9075
                    Top =3630
                    Width =1695
                    Height =345
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo425"
                    Caption ="HORÁRIO "
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =3630
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =3975
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Top =2265
                    Width =750
                    Height =450
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo426"
                    Caption ="NOME: "
                    GridlineColor =10921638
                    LayoutCachedTop =2265
                    LayoutCachedWidth =750
                    LayoutCachedHeight =2715
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =7365
                    Top =2265
                    Width =1365
                    Height =450
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo427"
                    Caption ="DATA NASC.: "
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =2265
                    LayoutCachedWidth =8730
                    LayoutCachedHeight =2715
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4533
                    Top =3630
                    Width =2829
                    Height =345
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo428"
                    Caption ="TIPO"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =3630
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =3975
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =1530
                    Top =2895
                    Width =9300
                    Height =330
                    FontWeight =700
                    Name ="Rótulo314"
                    Caption ="   (   )0 a 5     (   )6 a 11     (   )12 a 14     (   )15 a 17     (   )18 a 29"
                        "     (   )30 a 59     (   )60 ou mais    "
                    GridlineColor =10921638
                    LayoutCachedLeft =1530
                    LayoutCachedTop =2895
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =3225
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =737
                    Top =2259
                    Width =6621
                    Height =460
                    Name ="Caixa554"
                    GridlineColor =10921638
                    LayoutCachedLeft =737
                    LayoutCachedTop =2259
                    LayoutCachedWidth =7358
                    LayoutCachedHeight =2719
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8728
                    Top =2267
                    Width =2211
                    Height =445
                    Name ="Caixa555"
                    GridlineColor =10921638
                    LayoutCachedLeft =8728
                    LayoutCachedTop =2267
                    LayoutCachedWidth =10939
                    LayoutCachedHeight =2712
                    BorderThemeColorIndex =0
                    BorderShade =100.0
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
            Height =6835
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Rectangle
                    Left =56
                    Width =4476
                    Height =565
                    Name ="Caixa432"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =565
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Width =2829
                    Height =565
                    Name ="Caixa433"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =565
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Width =1704
                    Height =565
                    Name ="Caixa434"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =565
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Width =1695
                    Height =565
                    Name ="Caixa435"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =565
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4590
                    Top =15
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo484"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4590
                    LayoutCachedTop =15
                    LayoutCachedWidth =5835
                    LayoutCachedHeight =255
                    ForeTint =100.0
                End
                Begin Label
                    Left =4590
                    Top =285
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo485"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4590
                    LayoutCachedTop =285
                    LayoutCachedWidth =6690
                    LayoutCachedHeight =525
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =570
                    Width =4476
                    Height =565
                    Name ="Caixa486"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =570
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =1135
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =570
                    Width =2829
                    Height =565
                    Name ="Caixa487"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =570
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =1135
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =570
                    Width =1704
                    Height =565
                    Name ="Caixa488"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =570
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =1135
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =570
                    Width =1695
                    Height =565
                    Name ="Caixa489"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =570
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =1135
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4594
                    Top =585
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo490"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4594
                    LayoutCachedTop =585
                    LayoutCachedWidth =5839
                    LayoutCachedHeight =825
                    ForeTint =100.0
                End
                Begin Label
                    Left =4594
                    Top =855
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo491"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4594
                    LayoutCachedTop =855
                    LayoutCachedWidth =6694
                    LayoutCachedHeight =1095
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =1140
                    Width =4476
                    Height =565
                    Name ="Caixa492"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =1140
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =1705
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =1140
                    Width =2829
                    Height =565
                    Name ="Caixa493"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =1140
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =1705
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =1140
                    Width =1704
                    Height =565
                    Name ="Caixa494"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =1140
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =1705
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =1140
                    Width =1695
                    Height =565
                    Name ="Caixa495"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =1140
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =1705
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4598
                    Top =1155
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo496"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4598
                    LayoutCachedTop =1155
                    LayoutCachedWidth =5843
                    LayoutCachedHeight =1395
                    ForeTint =100.0
                End
                Begin Label
                    Left =4598
                    Top =1425
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo497"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4598
                    LayoutCachedTop =1425
                    LayoutCachedWidth =6698
                    LayoutCachedHeight =1665
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =1710
                    Width =4476
                    Height =565
                    Name ="Caixa498"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =1710
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =2275
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =1710
                    Width =2829
                    Height =565
                    Name ="Caixa499"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =1710
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =2275
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =1710
                    Width =1704
                    Height =565
                    Name ="Caixa500"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =1710
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =2275
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =1710
                    Width =1695
                    Height =565
                    Name ="Caixa501"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =1710
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =2275
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4602
                    Top =1725
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo502"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4602
                    LayoutCachedTop =1725
                    LayoutCachedWidth =5847
                    LayoutCachedHeight =1965
                    ForeTint =100.0
                End
                Begin Label
                    Left =4602
                    Top =1995
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo503"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4602
                    LayoutCachedTop =1995
                    LayoutCachedWidth =6702
                    LayoutCachedHeight =2235
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =2280
                    Width =4476
                    Height =565
                    Name ="Caixa504"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =2280
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =2845
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =2280
                    Width =2829
                    Height =565
                    Name ="Caixa505"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =2280
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =2845
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =2280
                    Width =1704
                    Height =565
                    Name ="Caixa506"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =2280
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =2845
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =2280
                    Width =1695
                    Height =565
                    Name ="Caixa507"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =2280
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =2845
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4606
                    Top =2295
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo508"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4606
                    LayoutCachedTop =2295
                    LayoutCachedWidth =5851
                    LayoutCachedHeight =2535
                    ForeTint =100.0
                End
                Begin Label
                    Left =4606
                    Top =2565
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo509"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4606
                    LayoutCachedTop =2565
                    LayoutCachedWidth =6706
                    LayoutCachedHeight =2805
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =2850
                    Width =4476
                    Height =565
                    Name ="Caixa510"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =2850
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =3415
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =2850
                    Width =2829
                    Height =565
                    Name ="Caixa511"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =2850
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =3415
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =2850
                    Width =1704
                    Height =565
                    Name ="Caixa512"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =2850
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =3415
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =2850
                    Width =1695
                    Height =565
                    Name ="Caixa513"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =2850
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =3415
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4610
                    Top =2865
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo514"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4610
                    LayoutCachedTop =2865
                    LayoutCachedWidth =5855
                    LayoutCachedHeight =3105
                    ForeTint =100.0
                End
                Begin Label
                    Left =4610
                    Top =3135
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo515"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4610
                    LayoutCachedTop =3135
                    LayoutCachedWidth =6710
                    LayoutCachedHeight =3375
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =3420
                    Width =4476
                    Height =565
                    Name ="Caixa516"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =3420
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =3985
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =3420
                    Width =2829
                    Height =565
                    Name ="Caixa517"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =3420
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =3985
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =3420
                    Width =1704
                    Height =565
                    Name ="Caixa518"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =3420
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =3985
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =3420
                    Width =1695
                    Height =565
                    Name ="Caixa519"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =3420
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =3985
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4614
                    Top =3435
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo520"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4614
                    LayoutCachedTop =3435
                    LayoutCachedWidth =5859
                    LayoutCachedHeight =3675
                    ForeTint =100.0
                End
                Begin Label
                    Left =4614
                    Top =3705
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo521"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4614
                    LayoutCachedTop =3705
                    LayoutCachedWidth =6714
                    LayoutCachedHeight =3945
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =3990
                    Width =4476
                    Height =565
                    Name ="Caixa522"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =3990
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =4555
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =3990
                    Width =2829
                    Height =565
                    Name ="Caixa523"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =3990
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =4555
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =3990
                    Width =1704
                    Height =565
                    Name ="Caixa524"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =3990
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =4555
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =3990
                    Width =1695
                    Height =565
                    Name ="Caixa525"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =3990
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =4555
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4618
                    Top =4005
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo526"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4618
                    LayoutCachedTop =4005
                    LayoutCachedWidth =5863
                    LayoutCachedHeight =4245
                    ForeTint =100.0
                End
                Begin Label
                    Left =4618
                    Top =4275
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo527"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4618
                    LayoutCachedTop =4275
                    LayoutCachedWidth =6718
                    LayoutCachedHeight =4515
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =4560
                    Width =4476
                    Height =565
                    Name ="Caixa528"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =4560
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =5125
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =4560
                    Width =2829
                    Height =565
                    Name ="Caixa529"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =4560
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =5125
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =4560
                    Width =1704
                    Height =565
                    Name ="Caixa530"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =4560
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =5125
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =4560
                    Width =1695
                    Height =565
                    Name ="Caixa531"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =4560
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =5125
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4622
                    Top =4575
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo532"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4622
                    LayoutCachedTop =4575
                    LayoutCachedWidth =5867
                    LayoutCachedHeight =4815
                    ForeTint =100.0
                End
                Begin Label
                    Left =4622
                    Top =4845
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo533"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4622
                    LayoutCachedTop =4845
                    LayoutCachedWidth =6722
                    LayoutCachedHeight =5085
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =5130
                    Width =4476
                    Height =565
                    Name ="Caixa534"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =5130
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =5695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =5130
                    Width =2829
                    Height =565
                    Name ="Caixa535"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =5130
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =5695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =5130
                    Width =1704
                    Height =565
                    Name ="Caixa536"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =5130
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =5695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =5130
                    Width =1695
                    Height =565
                    Name ="Caixa537"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =5130
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =5695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4626
                    Top =5145
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo538"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4626
                    LayoutCachedTop =5145
                    LayoutCachedWidth =5871
                    LayoutCachedHeight =5385
                    ForeTint =100.0
                End
                Begin Label
                    Left =4626
                    Top =5415
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo539"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4626
                    LayoutCachedTop =5415
                    LayoutCachedWidth =6726
                    LayoutCachedHeight =5655
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =5700
                    Width =4476
                    Height =565
                    Name ="Caixa540"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =5700
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =6265
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =5700
                    Width =2829
                    Height =565
                    Name ="Caixa541"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =5700
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =6265
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =5700
                    Width =1704
                    Height =565
                    Name ="Caixa542"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =5700
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =6265
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =5700
                    Width =1695
                    Height =565
                    Name ="Caixa543"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =5700
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =6265
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4630
                    Top =5715
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo544"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4630
                    LayoutCachedTop =5715
                    LayoutCachedWidth =5875
                    LayoutCachedHeight =5955
                    ForeTint =100.0
                End
                Begin Label
                    Left =4630
                    Top =5985
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo545"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4630
                    LayoutCachedTop =5985
                    LayoutCachedWidth =6730
                    LayoutCachedHeight =6225
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =56
                    Top =6270
                    Width =4476
                    Height =565
                    Name ="Caixa546"
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedTop =6270
                    LayoutCachedWidth =4532
                    LayoutCachedHeight =6835
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4533
                    Top =6270
                    Width =2829
                    Height =565
                    Name ="Caixa547"
                    GridlineColor =10921638
                    LayoutCachedLeft =4533
                    LayoutCachedTop =6270
                    LayoutCachedWidth =7362
                    LayoutCachedHeight =6835
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7365
                    Top =6270
                    Width =1704
                    Height =565
                    Name ="Caixa548"
                    GridlineColor =10921638
                    LayoutCachedLeft =7365
                    LayoutCachedTop =6270
                    LayoutCachedWidth =9069
                    LayoutCachedHeight =6835
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9075
                    Top =6270
                    Width =1695
                    Height =565
                    Name ="Caixa549"
                    GridlineColor =10921638
                    LayoutCachedLeft =9075
                    LayoutCachedTop =6270
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =6835
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =4634
                    Top =6285
                    Width =1245
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo550"
                    Caption ="(   )  Atividade "
                    GridlineColor =10921638
                    LayoutCachedLeft =4634
                    LayoutCachedTop =6285
                    LayoutCachedWidth =5879
                    LayoutCachedHeight =6525
                    ForeTint =100.0
                End
                Begin Label
                    Left =4634
                    Top =6555
                    Width =2100
                    Height =240
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo551"
                    Caption ="(   )  Oficina Socioeducativa"
                    GridlineColor =10921638
                    LayoutCachedLeft =4634
                    LayoutCachedTop =6555
                    LayoutCachedWidth =6734
                    LayoutCachedHeight =6795
                    ForeTint =100.0
                End
            End
        End
        Begin PageFooter
            Height =793
            Name ="PageFooterSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
