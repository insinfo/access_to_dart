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
    Width =16095
    DatasheetFontHeight =11
    ItemSuffix =2203
    Left =3675
    Top =2505
    RecSrcDt = Begin
        0xb41e6fd06fa7e540
    End
    RecordSource ="SELECT TbUnidade.NOME, TbUnidade.[Nº UNIDADE], TbUnidade.LOGO, TbUnidade.RODAPE "
        "FROM TbUnidade; "
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
                    Left =7937
                    Top =170
                    Width =6930
                    Height =360
                    FontSize =13
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo68"
                    Caption ="BENEFÍCIOS MUNICIPAIS - INCLUSÃO/EXCLUSÃO/SUSPENSÃO"
                    GridlineColor =10921638
                    LayoutCachedLeft =7937
                    LayoutCachedTop =170
                    LayoutCachedWidth =14867
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
            Height =2042
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Rectangle
                    Top =450
                    Width =1689
                    Height =1587
                    BackColor =14675966
                    Name ="Caixa1823"
                    GridlineColor =10921638
                    LayoutCachedTop =450
                    LayoutCachedWidth =1689
                    LayoutCachedHeight =2037
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =390
                    Top =570
                    Width =1023
                    Height =285
                    FontSize =9
                    FontWeight =700
                    BackColor =14675966
                    Name ="Nome_Rótulo"
                    Caption ="DATA"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =390
                    LayoutCachedTop =570
                    LayoutCachedWidth =1413
                    LayoutCachedHeight =855
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    FontItalic = NotDefault
                    BackStyle =1
                    TextAlign =1
                    Width =6150
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo1576"
                    Caption ="FAVOR PREENCHER OS NOMES DOS USUÁRIOS SEM ABREVIAÇÕES"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedWidth =6150
                    LayoutCachedHeight =315
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5670
                    Top =450
                    Width =3345
                    Height =1590
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo1606"
                    Caption ="NOME DE  QUEM RECEBE O BENEFICIO"
                    GridlineColor =10921638
                    LayoutCachedLeft =5670
                    LayoutCachedTop =450
                    LayoutCachedWidth =9015
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1695
                    Top =450
                    Width =3977
                    Height =1590
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2035"
                    Caption ="BENEFICIÁRIO"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =450
                    LayoutCachedWidth =5672
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =6360
                    Top =120
                    Width =9600
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2098"
                    Caption ="TECNICO: _______________________________________________________________________"
                        "___________"
                    GridlineColor =10921638
                    LayoutCachedLeft =6360
                    LayoutCachedTop =120
                    LayoutCachedWidth =15960
                    LayoutCachedHeight =435
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9015
                    Top =450
                    Width =2385
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2107"
                    Caption ="PERFIL"
                    GridlineColor =10921638
                    LayoutCachedLeft =9015
                    LayoutCachedTop =450
                    LayoutCachedWidth =11400
                    LayoutCachedHeight =735
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9015
                    Top =737
                    Width =324
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2099"
                    Caption ="BENEFICIÁRIO BF"
                    GridlineColor =10921638
                    LayoutCachedLeft =9015
                    LayoutCachedTop =737
                    LayoutCachedWidth =9339
                    LayoutCachedHeight =2042
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9358
                    Top =735
                    Width =345
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2100"
                    Caption ="DESCUMPRIMENTO"
                    GridlineColor =10921638
                    LayoutCachedLeft =9358
                    LayoutCachedTop =735
                    LayoutCachedWidth =9703
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9703
                    Top =735
                    Width =345
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2101"
                    Caption ="EXTREMA POBREZA"
                    GridlineColor =10921638
                    LayoutCachedLeft =9703
                    LayoutCachedTop =735
                    LayoutCachedWidth =10048
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10378
                    Top =735
                    Width =345
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2102"
                    Caption ="BPC DEFICIENTE"
                    GridlineColor =10921638
                    LayoutCachedLeft =10378
                    LayoutCachedTop =735
                    LayoutCachedWidth =10723
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10033
                    Top =735
                    Width =345
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2103"
                    Caption ="BPC IDOSO"
                    GridlineColor =10921638
                    LayoutCachedLeft =10033
                    LayoutCachedTop =735
                    LayoutCachedWidth =10378
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10723
                    Top =735
                    Width =345
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2104"
                    Caption ="BMD DEFICIENTE"
                    GridlineColor =10921638
                    LayoutCachedLeft =10723
                    LayoutCachedTop =735
                    LayoutCachedWidth =11068
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11053
                    Top =735
                    Width =345
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2105"
                    Caption ="BMI"
                    GridlineColor =10921638
                    LayoutCachedLeft =11053
                    LayoutCachedTop =735
                    LayoutCachedWidth =11398
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11396
                    Top =737
                    Width =450
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2115"
                    Caption ="BMD"
                    GridlineColor =10921638
                    LayoutCachedLeft =11396
                    LayoutCachedTop =737
                    LayoutCachedWidth =11846
                    LayoutCachedHeight =2042
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11848
                    Top =735
                    Width =405
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2116"
                    Caption ="BMI"
                    GridlineColor =10921638
                    LayoutCachedLeft =11848
                    LayoutCachedTop =735
                    LayoutCachedWidth =12253
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12238
                    Top =735
                    Width =465
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2117"
                    Caption ="BSF"
                    GridlineColor =10921638
                    LayoutCachedLeft =12238
                    LayoutCachedTop =735
                    LayoutCachedWidth =12703
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12700
                    Top =737
                    Width =675
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2109"
                    Caption ="Situação Beneficio"
                    GridlineColor =10921638
                    LayoutCachedLeft =12700
                    LayoutCachedTop =737
                    LayoutCachedWidth =13375
                    LayoutCachedHeight =2042
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14060
                    Top =737
                    Width =675
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2110"
                    Caption ="Motivo Desligamento"
                    GridlineColor =10921638
                    LayoutCachedLeft =14060
                    LayoutCachedTop =737
                    LayoutCachedWidth =14735
                    LayoutCachedHeight =2042
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =15433
                    Top =735
                    Width =660
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2111"
                    Caption ="Motivo Suspensão"
                    GridlineColor =10921638
                    LayoutCachedLeft =15433
                    LayoutCachedTop =735
                    LayoutCachedWidth =16093
                    LayoutCachedHeight =2040
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13380
                    Top =737
                    Width =675
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2112"
                    Caption ="Data Desligamento"
                    GridlineColor =10921638
                    LayoutCachedLeft =13380
                    LayoutCachedTop =737
                    LayoutCachedWidth =14055
                    LayoutCachedHeight =2042
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14741
                    Top =737
                    Width =675
                    Height =1305
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2113"
                    Caption ="Data Suspensão"
                    GridlineColor =10921638
                    LayoutCachedLeft =14741
                    LayoutCachedTop =737
                    LayoutCachedWidth =15416
                    LayoutCachedHeight =2042
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12683
                    Top =450
                    Width =3405
                    Height =285
                    FontSize =8
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2118"
                    Caption ="TIPO DE ATENDIMENTO"
                    GridlineColor =10921638
                    LayoutCachedLeft =12683
                    LayoutCachedTop =450
                    LayoutCachedWidth =16088
                    LayoutCachedHeight =735
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11398
                    Top =450
                    Width =1305
                    Height =285
                    FontSize =8
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2106"
                    Caption ="TIPO DE BENEFÍCIO"
                    GridlineColor =10921638
                    LayoutCachedLeft =11398
                    LayoutCachedTop =450
                    LayoutCachedWidth =12703
                    LayoutCachedHeight =735
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =6780
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Rectangle
                    Width =1697
                    Height =1695
                    Name ="Caixa2082"
                    GridlineColor =10921638
                    LayoutCachedWidth =1697
                    LayoutCachedHeight =1695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1695
                    Width =3977
                    Height =915
                    Name ="Caixa1601"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedWidth =5672
                    LayoutCachedHeight =915
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Top =735
                    Width =1695
                    Height =285
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo1870"
                    Caption ="____/____/________"
                    GridlineColor =10921638
                    LayoutCachedTop =735
                    LayoutCachedWidth =1695
                    LayoutCachedHeight =1020
                End
                Begin Rectangle
                    Left =5670
                    Width =3339
                    Height =914
                    Name ="Caixa1898"
                    GridlineColor =10921638
                    LayoutCachedLeft =5670
                    LayoutCachedWidth =9009
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9014
                    Width =324
                    Height =914
                    Name ="Caixa2119"
                    GridlineColor =10921638
                    LayoutCachedLeft =9014
                    LayoutCachedWidth =9338
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9354
                    Width =324
                    Height =914
                    Name ="Caixa2120"
                    GridlineColor =10921638
                    LayoutCachedLeft =9354
                    LayoutCachedWidth =9678
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9694
                    Width =324
                    Height =914
                    Name ="Caixa2121"
                    GridlineColor =10921638
                    LayoutCachedLeft =9694
                    LayoutCachedWidth =10018
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10034
                    Width =324
                    Height =914
                    Name ="Caixa2122"
                    GridlineColor =10921638
                    LayoutCachedLeft =10034
                    LayoutCachedWidth =10358
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10374
                    Width =324
                    Height =914
                    Name ="Caixa2123"
                    GridlineColor =10921638
                    LayoutCachedLeft =10374
                    LayoutCachedWidth =10698
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10714
                    Width =324
                    Height =914
                    Name ="Caixa2124"
                    GridlineColor =10921638
                    LayoutCachedLeft =10714
                    LayoutCachedWidth =11038
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11054
                    Width =324
                    Height =914
                    Name ="Caixa2125"
                    GridlineColor =10921638
                    LayoutCachedLeft =11054
                    LayoutCachedWidth =11378
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11394
                    Width =450
                    Height =914
                    Name ="Caixa2126"
                    GridlineColor =10921638
                    LayoutCachedLeft =11394
                    LayoutCachedWidth =11844
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11848
                    Width =450
                    Height =914
                    Name ="Caixa2127"
                    GridlineColor =10921638
                    LayoutCachedLeft =11848
                    LayoutCachedWidth =12298
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12240
                    Width =450
                    Height =914
                    Name ="Caixa2128"
                    GridlineColor =10921638
                    LayoutCachedLeft =12240
                    LayoutCachedWidth =12690
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12690
                    Width =690
                    Height =914
                    Name ="Caixa2129"
                    GridlineColor =10921638
                    LayoutCachedLeft =12690
                    LayoutCachedWidth =13380
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13379
                    Width =675
                    Height =914
                    Name ="Caixa2131"
                    GridlineColor =10921638
                    LayoutCachedLeft =13379
                    LayoutCachedWidth =14054
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14059
                    Width =675
                    Height =914
                    Name ="Caixa2132"
                    GridlineColor =10921638
                    LayoutCachedLeft =14059
                    LayoutCachedWidth =14734
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14739
                    Width =675
                    Height =914
                    Name ="Caixa2133"
                    GridlineColor =10921638
                    LayoutCachedLeft =14739
                    LayoutCachedWidth =15414
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15419
                    Width =675
                    Height =914
                    Name ="Caixa2134"
                    GridlineColor =10921638
                    LayoutCachedLeft =15419
                    LayoutCachedWidth =16094
                    LayoutCachedHeight =914
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =1
                    Left =1695
                    Top =1425
                    Width =14400
                    Height =270
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2135"
                    Caption ="OBSERVAÇÕES"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =1425
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =1695
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Top =1695
                    Width =1697
                    Height =1695
                    Name ="Caixa2137"
                    GridlineColor =10921638
                    LayoutCachedTop =1695
                    LayoutCachedWidth =1697
                    LayoutCachedHeight =3390
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1695
                    Top =1695
                    Width =3977
                    Height =915
                    Name ="Caixa2138"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =1695
                    LayoutCachedWidth =5672
                    LayoutCachedHeight =2610
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Top =2430
                    Width =1695
                    Height =285
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2139"
                    Caption ="____/____/________"
                    GridlineColor =10921638
                    LayoutCachedTop =2430
                    LayoutCachedWidth =1695
                    LayoutCachedHeight =2715
                End
                Begin Rectangle
                    Left =5670
                    Top =1695
                    Width =3339
                    Height =914
                    Name ="Caixa2140"
                    GridlineColor =10921638
                    LayoutCachedLeft =5670
                    LayoutCachedTop =1695
                    LayoutCachedWidth =9009
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9014
                    Top =1695
                    Width =324
                    Height =914
                    Name ="Caixa2142"
                    GridlineColor =10921638
                    LayoutCachedLeft =9014
                    LayoutCachedTop =1695
                    LayoutCachedWidth =9338
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9354
                    Top =1695
                    Width =324
                    Height =914
                    Name ="Caixa2143"
                    GridlineColor =10921638
                    LayoutCachedLeft =9354
                    LayoutCachedTop =1695
                    LayoutCachedWidth =9678
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9694
                    Top =1695
                    Width =324
                    Height =914
                    Name ="Caixa2144"
                    GridlineColor =10921638
                    LayoutCachedLeft =9694
                    LayoutCachedTop =1695
                    LayoutCachedWidth =10018
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10034
                    Top =1695
                    Width =324
                    Height =914
                    Name ="Caixa2145"
                    GridlineColor =10921638
                    LayoutCachedLeft =10034
                    LayoutCachedTop =1695
                    LayoutCachedWidth =10358
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10374
                    Top =1695
                    Width =324
                    Height =914
                    Name ="Caixa2146"
                    GridlineColor =10921638
                    LayoutCachedLeft =10374
                    LayoutCachedTop =1695
                    LayoutCachedWidth =10698
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10714
                    Top =1695
                    Width =324
                    Height =914
                    Name ="Caixa2147"
                    GridlineColor =10921638
                    LayoutCachedLeft =10714
                    LayoutCachedTop =1695
                    LayoutCachedWidth =11038
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11054
                    Top =1695
                    Width =324
                    Height =914
                    Name ="Caixa2148"
                    GridlineColor =10921638
                    LayoutCachedLeft =11054
                    LayoutCachedTop =1695
                    LayoutCachedWidth =11378
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11394
                    Top =1695
                    Width =450
                    Height =914
                    Name ="Caixa2149"
                    GridlineColor =10921638
                    LayoutCachedLeft =11394
                    LayoutCachedTop =1695
                    LayoutCachedWidth =11844
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11848
                    Top =1695
                    Width =450
                    Height =914
                    Name ="Caixa2150"
                    GridlineColor =10921638
                    LayoutCachedLeft =11848
                    LayoutCachedTop =1695
                    LayoutCachedWidth =12298
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12240
                    Top =1695
                    Width =450
                    Height =914
                    Name ="Caixa2151"
                    GridlineColor =10921638
                    LayoutCachedLeft =12240
                    LayoutCachedTop =1695
                    LayoutCachedWidth =12690
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12690
                    Top =1695
                    Width =690
                    Height =914
                    Name ="Caixa2152"
                    GridlineColor =10921638
                    LayoutCachedLeft =12690
                    LayoutCachedTop =1695
                    LayoutCachedWidth =13380
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13379
                    Top =1695
                    Width =675
                    Height =914
                    Name ="Caixa2153"
                    GridlineColor =10921638
                    LayoutCachedLeft =13379
                    LayoutCachedTop =1695
                    LayoutCachedWidth =14054
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14059
                    Top =1695
                    Width =675
                    Height =914
                    Name ="Caixa2154"
                    GridlineColor =10921638
                    LayoutCachedLeft =14059
                    LayoutCachedTop =1695
                    LayoutCachedWidth =14734
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14739
                    Top =1695
                    Width =675
                    Height =914
                    Name ="Caixa2155"
                    GridlineColor =10921638
                    LayoutCachedLeft =14739
                    LayoutCachedTop =1695
                    LayoutCachedWidth =15414
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15419
                    Top =1695
                    Width =675
                    Height =914
                    Name ="Caixa2156"
                    GridlineColor =10921638
                    LayoutCachedLeft =15419
                    LayoutCachedTop =1695
                    LayoutCachedWidth =16094
                    LayoutCachedHeight =2609
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =1
                    Left =1695
                    Top =3120
                    Width =14400
                    Height =270
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2157"
                    Caption ="OBSERVAÇÕES"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =3120
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =3390
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Top =3390
                    Width =1697
                    Height =1695
                    Name ="Caixa2159"
                    GridlineColor =10921638
                    LayoutCachedTop =3390
                    LayoutCachedWidth =1697
                    LayoutCachedHeight =5085
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1695
                    Top =3390
                    Width =3977
                    Height =915
                    Name ="Caixa2160"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =3390
                    LayoutCachedWidth =5672
                    LayoutCachedHeight =4305
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Top =4125
                    Width =1695
                    Height =285
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2161"
                    Caption ="____/____/________"
                    GridlineColor =10921638
                    LayoutCachedTop =4125
                    LayoutCachedWidth =1695
                    LayoutCachedHeight =4410
                End
                Begin Rectangle
                    Left =5670
                    Top =3390
                    Width =3339
                    Height =914
                    Name ="Caixa2162"
                    GridlineColor =10921638
                    LayoutCachedLeft =5670
                    LayoutCachedTop =3390
                    LayoutCachedWidth =9009
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9014
                    Top =3390
                    Width =324
                    Height =914
                    Name ="Caixa2164"
                    GridlineColor =10921638
                    LayoutCachedLeft =9014
                    LayoutCachedTop =3390
                    LayoutCachedWidth =9338
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9354
                    Top =3390
                    Width =324
                    Height =914
                    Name ="Caixa2165"
                    GridlineColor =10921638
                    LayoutCachedLeft =9354
                    LayoutCachedTop =3390
                    LayoutCachedWidth =9678
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9694
                    Top =3390
                    Width =324
                    Height =914
                    Name ="Caixa2166"
                    GridlineColor =10921638
                    LayoutCachedLeft =9694
                    LayoutCachedTop =3390
                    LayoutCachedWidth =10018
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10034
                    Top =3390
                    Width =324
                    Height =914
                    Name ="Caixa2167"
                    GridlineColor =10921638
                    LayoutCachedLeft =10034
                    LayoutCachedTop =3390
                    LayoutCachedWidth =10358
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10374
                    Top =3390
                    Width =324
                    Height =914
                    Name ="Caixa2168"
                    GridlineColor =10921638
                    LayoutCachedLeft =10374
                    LayoutCachedTop =3390
                    LayoutCachedWidth =10698
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10714
                    Top =3390
                    Width =324
                    Height =914
                    Name ="Caixa2169"
                    GridlineColor =10921638
                    LayoutCachedLeft =10714
                    LayoutCachedTop =3390
                    LayoutCachedWidth =11038
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11054
                    Top =3390
                    Width =324
                    Height =914
                    Name ="Caixa2170"
                    GridlineColor =10921638
                    LayoutCachedLeft =11054
                    LayoutCachedTop =3390
                    LayoutCachedWidth =11378
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11394
                    Top =3390
                    Width =450
                    Height =914
                    Name ="Caixa2171"
                    GridlineColor =10921638
                    LayoutCachedLeft =11394
                    LayoutCachedTop =3390
                    LayoutCachedWidth =11844
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11848
                    Top =3390
                    Width =450
                    Height =914
                    Name ="Caixa2172"
                    GridlineColor =10921638
                    LayoutCachedLeft =11848
                    LayoutCachedTop =3390
                    LayoutCachedWidth =12298
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12240
                    Top =3390
                    Width =450
                    Height =914
                    Name ="Caixa2173"
                    GridlineColor =10921638
                    LayoutCachedLeft =12240
                    LayoutCachedTop =3390
                    LayoutCachedWidth =12690
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12690
                    Top =3390
                    Width =690
                    Height =914
                    Name ="Caixa2174"
                    GridlineColor =10921638
                    LayoutCachedLeft =12690
                    LayoutCachedTop =3390
                    LayoutCachedWidth =13380
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13379
                    Top =3390
                    Width =675
                    Height =914
                    Name ="Caixa2175"
                    GridlineColor =10921638
                    LayoutCachedLeft =13379
                    LayoutCachedTop =3390
                    LayoutCachedWidth =14054
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14059
                    Top =3390
                    Width =675
                    Height =914
                    Name ="Caixa2176"
                    GridlineColor =10921638
                    LayoutCachedLeft =14059
                    LayoutCachedTop =3390
                    LayoutCachedWidth =14734
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14739
                    Top =3390
                    Width =675
                    Height =914
                    Name ="Caixa2177"
                    GridlineColor =10921638
                    LayoutCachedLeft =14739
                    LayoutCachedTop =3390
                    LayoutCachedWidth =15414
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15419
                    Top =3390
                    Width =675
                    Height =914
                    Name ="Caixa2178"
                    GridlineColor =10921638
                    LayoutCachedLeft =15419
                    LayoutCachedTop =3390
                    LayoutCachedWidth =16094
                    LayoutCachedHeight =4304
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =1
                    Left =1695
                    Top =4815
                    Width =14400
                    Height =270
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2179"
                    Caption ="OBSERVAÇÕES"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =4815
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =5085
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Top =5085
                    Width =1697
                    Height =1695
                    Name ="Caixa2181"
                    GridlineColor =10921638
                    LayoutCachedTop =5085
                    LayoutCachedWidth =1697
                    LayoutCachedHeight =6780
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =1695
                    Top =5085
                    Width =3977
                    Height =915
                    Name ="Caixa2182"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =5085
                    LayoutCachedWidth =5672
                    LayoutCachedHeight =6000
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    Top =5820
                    Width =1695
                    Height =285
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2183"
                    Caption ="____/____/________"
                    GridlineColor =10921638
                    LayoutCachedTop =5820
                    LayoutCachedWidth =1695
                    LayoutCachedHeight =6105
                End
                Begin Rectangle
                    Left =5670
                    Top =5085
                    Width =3339
                    Height =914
                    Name ="Caixa2184"
                    GridlineColor =10921638
                    LayoutCachedLeft =5670
                    LayoutCachedTop =5085
                    LayoutCachedWidth =9009
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9014
                    Top =5085
                    Width =324
                    Height =914
                    Name ="Caixa2186"
                    GridlineColor =10921638
                    LayoutCachedLeft =9014
                    LayoutCachedTop =5085
                    LayoutCachedWidth =9338
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9354
                    Top =5085
                    Width =324
                    Height =914
                    Name ="Caixa2187"
                    GridlineColor =10921638
                    LayoutCachedLeft =9354
                    LayoutCachedTop =5085
                    LayoutCachedWidth =9678
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9694
                    Top =5085
                    Width =324
                    Height =914
                    Name ="Caixa2188"
                    GridlineColor =10921638
                    LayoutCachedLeft =9694
                    LayoutCachedTop =5085
                    LayoutCachedWidth =10018
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10034
                    Top =5085
                    Width =324
                    Height =914
                    Name ="Caixa2189"
                    GridlineColor =10921638
                    LayoutCachedLeft =10034
                    LayoutCachedTop =5085
                    LayoutCachedWidth =10358
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10374
                    Top =5085
                    Width =324
                    Height =914
                    Name ="Caixa2190"
                    GridlineColor =10921638
                    LayoutCachedLeft =10374
                    LayoutCachedTop =5085
                    LayoutCachedWidth =10698
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10714
                    Top =5085
                    Width =324
                    Height =914
                    Name ="Caixa2191"
                    GridlineColor =10921638
                    LayoutCachedLeft =10714
                    LayoutCachedTop =5085
                    LayoutCachedWidth =11038
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11054
                    Top =5085
                    Width =324
                    Height =914
                    Name ="Caixa2192"
                    GridlineColor =10921638
                    LayoutCachedLeft =11054
                    LayoutCachedTop =5085
                    LayoutCachedWidth =11378
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11394
                    Top =5085
                    Width =450
                    Height =914
                    Name ="Caixa2193"
                    GridlineColor =10921638
                    LayoutCachedLeft =11394
                    LayoutCachedTop =5085
                    LayoutCachedWidth =11844
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11848
                    Top =5085
                    Width =450
                    Height =914
                    Name ="Caixa2194"
                    GridlineColor =10921638
                    LayoutCachedLeft =11848
                    LayoutCachedTop =5085
                    LayoutCachedWidth =12298
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12240
                    Top =5085
                    Width =450
                    Height =914
                    Name ="Caixa2195"
                    GridlineColor =10921638
                    LayoutCachedLeft =12240
                    LayoutCachedTop =5085
                    LayoutCachedWidth =12690
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12690
                    Top =5085
                    Width =690
                    Height =914
                    Name ="Caixa2196"
                    GridlineColor =10921638
                    LayoutCachedLeft =12690
                    LayoutCachedTop =5085
                    LayoutCachedWidth =13380
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13379
                    Top =5085
                    Width =675
                    Height =914
                    Name ="Caixa2197"
                    GridlineColor =10921638
                    LayoutCachedLeft =13379
                    LayoutCachedTop =5085
                    LayoutCachedWidth =14054
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14059
                    Top =5085
                    Width =675
                    Height =914
                    Name ="Caixa2198"
                    GridlineColor =10921638
                    LayoutCachedLeft =14059
                    LayoutCachedTop =5085
                    LayoutCachedWidth =14734
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14739
                    Top =5085
                    Width =675
                    Height =914
                    Name ="Caixa2199"
                    GridlineColor =10921638
                    LayoutCachedLeft =14739
                    LayoutCachedTop =5085
                    LayoutCachedWidth =15414
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15419
                    Top =5085
                    Width =675
                    Height =914
                    Name ="Caixa2200"
                    GridlineColor =10921638
                    LayoutCachedLeft =15419
                    LayoutCachedTop =5085
                    LayoutCachedWidth =16094
                    LayoutCachedHeight =5999
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =1
                    Left =1695
                    Top =6510
                    Width =14400
                    Height =270
                    FontSize =10
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo2201"
                    Caption ="OBSERVAÇÕES"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =6510
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =6780
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10770
                    Top =6000
                    Width =5325
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2202"
                    Caption ="TROCA DE CRAS"
                    GridlineColor =10921638
                    LayoutCachedLeft =10770
                    LayoutCachedTop =6000
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =6525
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1695
                    Top =6000
                    Width =9075
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2185"
                    Caption ="TROCA DE TITULARIDADE"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =6000
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =6525
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10770
                    Top =4305
                    Width =5325
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2180"
                    Caption ="TROCA DE CRAS"
                    GridlineColor =10921638
                    LayoutCachedLeft =10770
                    LayoutCachedTop =4305
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =4830
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1695
                    Top =4305
                    Width =9075
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2163"
                    Caption ="TROCA DE TITULARIDADE"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =4305
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =4830
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10770
                    Top =2610
                    Width =5325
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2158"
                    Caption ="TROCA DE CRAS"
                    GridlineColor =10921638
                    LayoutCachedLeft =10770
                    LayoutCachedTop =2610
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =3135
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1695
                    Top =2610
                    Width =9075
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2141"
                    Caption ="TROCA DE TITULARIDADE"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =2610
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =3135
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10770
                    Top =915
                    Width =5325
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2136"
                    Caption ="TROCA DE CRAS"
                    GridlineColor =10921638
                    LayoutCachedLeft =10770
                    LayoutCachedTop =915
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =1440
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1695
                    Top =915
                    Width =9075
                    Height =525
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2034"
                    Caption ="TROCA DE TITULARIDADE"
                    GridlineColor =10921638
                    LayoutCachedLeft =1695
                    LayoutCachedTop =915
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =1440
                    BackThemeColorIndex =-1
                    BorderTint =100.0
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
            Visible = NotDefault
            Height =0
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
