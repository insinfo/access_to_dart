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
    Width =16149
    DatasheetFontHeight =11
    ItemSuffix =2121
    Left =3675
    Top =2535
    RecordSource ="SELECT TbUnidade.NOME, TbUnidade.LOGO, TbUnidade.RODAPE FROM TbUnidade; "
    Caption ="AtendimentoIndividual"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    OnOpenEmMacro = Begin
        Version =196611
        ColumnsShown =0
        Begin
            Action ="Maximize"
        End
        Begin
            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                "nterfaceMacro Event=\"OnOpen\" xmlns=\"http://schemas.microsoft.com/office/acces"
                "sservices/2009/11/application\" xmlns:a=\"http://schemas.microsoft.com/office/ac"
                "cessservices/2009/11/forms\"><S"
        End
        Begin
            Comment ="_AXL:tatements><Action Name=\"MaximizeWindow\"/></Statements></UserInterfaceMacr"
                "o>"
        End
    End
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
            Height =1200
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    TextAlign =2
                    Left =7710
                    Top =170
                    Width =6480
                    Height =360
                    FontSize =13
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo68"
                    Caption ="LISTAGEM DE FAMÍLIAS EXCLUÍDAS DO ACOMPANHAMENTO"
                    GridlineColor =10921638
                    LayoutCachedLeft =7710
                    LayoutCachedTop =170
                    LayoutCachedWidth =14190
                    LayoutCachedHeight =530
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
        Begin PageHeader
            Height =975
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Top =566
                    Width =1916
                    Height =285
                    FontSize =9
                    FontWeight =700
                    Name ="Nome_Rótulo"
                    Caption ="DATA"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =566
                    LayoutCachedWidth =1916
                    LayoutCachedHeight =851
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7650
                    Top =450
                    Width =3060
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo1606"
                    Caption ="CÓDIGO FAMILIAR SEMBES"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =450
                    LayoutCachedWidth =10710
                    LayoutCachedHeight =975
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =6750
                    Top =60
                    Width =6015
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo2024"
                    Caption ="Mês/Ano: _______________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =6750
                    LayoutCachedTop =60
                    LayoutCachedWidth =12765
                    LayoutCachedHeight =345
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10710
                    Top =450
                    Width =5394
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2034"
                    Caption ="OBSERVAÇÕES"
                    GridlineColor =10921638
                    LayoutCachedLeft =10710
                    LayoutCachedTop =450
                    LayoutCachedWidth =16104
                    LayoutCachedHeight =975
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1980
                    Top =450
                    Width =5672
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2035"
                    Caption ="NOME"
                    GridlineColor =10921638
                    LayoutCachedLeft =1980
                    LayoutCachedTop =450
                    LayoutCachedWidth =7652
                    LayoutCachedHeight =975
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    FontItalic = NotDefault
                    TextAlign =2
                    Left =2211
                    Top =680
                    Width =5160
                    Height =270
                    FontSize =9
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo1576"
                    Caption ="FAVOR PREENCHER OS NOMES DOS USUÁRIOS SEM ABREVIAÇÕES"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =2211
                    LayoutCachedTop =680
                    LayoutCachedWidth =7371
                    LayoutCachedHeight =950
                    BackShade =85.0
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =7500
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Rectangle
                    Width =1982
                    Height =630
                    Name ="Caixa1601"
                    GridlineColor =10921638
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =630
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =60
                    Top =285
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo1870"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =285
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =600
                End
                Begin Rectangle
                    Left =10695
                    Width =5394
                    Height =629
                    Name ="Caixa1897"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =629
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Width =3054
                    Height =629
                    Name ="Caixa1898"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =629
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =630
                    Width =1982
                    Height =630
                    Name ="Caixa2037"
                    GridlineColor =10921638
                    LayoutCachedTop =630
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =1260
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =630
                    Width =5394
                    Height =629
                    Name ="Caixa2040"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =630
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =1259
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =630
                    Width =3054
                    Height =629
                    Name ="Caixa2041"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =630
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =1259
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =1260
                    Width =1982
                    Height =630
                    Name ="Caixa2042"
                    GridlineColor =10921638
                    LayoutCachedTop =1260
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =1890
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =1260
                    Width =5394
                    Height =629
                    Name ="Caixa2045"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =1260
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =1889
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =1260
                    Width =3054
                    Height =629
                    Name ="Caixa2046"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =1260
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =1889
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =1860
                    Width =1982
                    Height =630
                    Name ="Caixa2047"
                    GridlineColor =10921638
                    LayoutCachedTop =1860
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =2490
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =1860
                    Width =5394
                    Height =629
                    Name ="Caixa2050"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =1860
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =2489
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =1860
                    Width =3054
                    Height =629
                    Name ="Caixa2051"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =1860
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =2489
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =2490
                    Width =1982
                    Height =630
                    Name ="Caixa2052"
                    GridlineColor =10921638
                    LayoutCachedTop =2490
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =3120
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =2490
                    Width =5394
                    Height =629
                    Name ="Caixa2055"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =2490
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =3119
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =2490
                    Width =3054
                    Height =629
                    Name ="Caixa2056"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =2490
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =3119
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =3120
                    Width =1982
                    Height =630
                    Name ="Caixa2057"
                    GridlineColor =10921638
                    LayoutCachedTop =3120
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =3750
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =3120
                    Width =5394
                    Height =629
                    Name ="Caixa2059"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =3120
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =3749
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =3120
                    Width =3054
                    Height =629
                    Name ="Caixa2060"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =3120
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =3749
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =3750
                    Width =1982
                    Height =630
                    Name ="Caixa2061"
                    GridlineColor =10921638
                    LayoutCachedTop =3750
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =4380
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =3750
                    Width =5394
                    Height =629
                    Name ="Caixa2063"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =3750
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =4379
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =3750
                    Width =3054
                    Height =629
                    Name ="Caixa2064"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =3750
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =4379
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =4380
                    Width =1982
                    Height =630
                    Name ="Caixa2065"
                    GridlineColor =10921638
                    LayoutCachedTop =4380
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =5010
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =4380
                    Width =5394
                    Height =629
                    Name ="Caixa2067"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =4380
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =5009
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =4380
                    Width =3054
                    Height =629
                    Name ="Caixa2068"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =4380
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =5009
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =5010
                    Width =1982
                    Height =630
                    Name ="Caixa2069"
                    GridlineColor =10921638
                    LayoutCachedTop =5010
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =5640
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =5010
                    Width =5394
                    Height =629
                    Name ="Caixa2071"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =5010
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =5639
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =5010
                    Width =3054
                    Height =629
                    Name ="Caixa2072"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =5010
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =5639
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =5640
                    Width =1982
                    Height =630
                    Name ="Caixa2073"
                    GridlineColor =10921638
                    LayoutCachedTop =5640
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =6270
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =5640
                    Width =5394
                    Height =629
                    Name ="Caixa2075"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =5640
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =6269
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =5640
                    Width =3054
                    Height =629
                    Name ="Caixa2076"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =5640
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =6269
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =6240
                    Width =1982
                    Height =630
                    Name ="Caixa2077"
                    GridlineColor =10921638
                    LayoutCachedTop =6240
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =6870
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =6240
                    Width =5394
                    Height =629
                    Name ="Caixa2079"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =6240
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =6869
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =6240
                    Width =3054
                    Height =629
                    Name ="Caixa2080"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =6240
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =6869
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Top =6870
                    Width =1982
                    Height =630
                    Name ="Caixa2093"
                    GridlineColor =10921638
                    LayoutCachedTop =6870
                    LayoutCachedWidth =1982
                    LayoutCachedHeight =7500
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10695
                    Top =6870
                    Width =5394
                    Height =629
                    Name ="Caixa2095"
                    GridlineColor =10921638
                    LayoutCachedLeft =10695
                    LayoutCachedTop =6870
                    LayoutCachedWidth =16089
                    LayoutCachedHeight =7499
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7650
                    Top =6870
                    Width =3054
                    Height =629
                    Name ="Caixa2096"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =6870
                    LayoutCachedWidth =10704
                    LayoutCachedHeight =7499
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Left =60
                    Top =855
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2098"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =855
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =1170
                End
                Begin Label
                    Left =60
                    Top =1530
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2099"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =1530
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =1845
                End
                Begin Label
                    Left =60
                    Top =2085
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2100"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =2085
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =2400
                End
                Begin Label
                    Left =60
                    Top =2775
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2101"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =2775
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =3090
                End
                Begin Label
                    Left =60
                    Top =3465
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2102"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =3465
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =3780
                End
                Begin Label
                    Left =60
                    Top =4035
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2103"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =4035
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =4350
                End
                Begin Label
                    Left =60
                    Top =4605
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2104"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =4605
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =4920
                End
                Begin Label
                    Left =60
                    Top =5220
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2105"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =5220
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =5535
                End
                Begin Label
                    Left =60
                    Top =5835
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2106"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =5835
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =6150
                End
                Begin Label
                    Left =60
                    Top =6450
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2107"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =6450
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =6765
                End
                Begin Label
                    Left =60
                    Top =7155
                    Width =1890
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2108"
                    Caption ="___/___/_________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =7155
                    LayoutCachedWidth =1950
                    LayoutCachedHeight =7470
                End
                Begin Rectangle
                    Left =1984
                    Width =5672
                    Height =630
                    Name ="Caixa2109"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =630
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =630
                    Width =5672
                    Height =630
                    Name ="Caixa2110"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =630
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =1260
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =1260
                    Width =5672
                    Height =630
                    Name ="Caixa2111"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =1260
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =1890
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =1860
                    Width =5672
                    Height =630
                    Name ="Caixa2112"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =1860
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =2490
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =2490
                    Width =5672
                    Height =630
                    Name ="Caixa2113"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =2490
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =3120
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =3120
                    Width =5672
                    Height =630
                    Name ="Caixa2114"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =3120
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =3750
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =3750
                    Width =5672
                    Height =630
                    Name ="Caixa2115"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =3750
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =4380
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =4380
                    Width =5672
                    Height =630
                    Name ="Caixa2116"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =4380
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =5010
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =5010
                    Width =5672
                    Height =630
                    Name ="Caixa2117"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =5010
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =5640
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =5640
                    Width =5672
                    Height =630
                    Name ="Caixa2118"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =5640
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =6270
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =6240
                    Width =5672
                    Height =630
                    Name ="Caixa2119"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =6240
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =6870
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1984
                    Top =6870
                    Width =5672
                    Height =630
                    Name ="Caixa2120"
                    GridlineColor =10921638
                    LayoutCachedLeft =1984
                    LayoutCachedTop =6870
                    LayoutCachedWidth =7656
                    LayoutCachedHeight =7500
                    BorderThemeColorIndex =0
                    BorderShade =100.0
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
            Visible = NotDefault
            Height =0
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
