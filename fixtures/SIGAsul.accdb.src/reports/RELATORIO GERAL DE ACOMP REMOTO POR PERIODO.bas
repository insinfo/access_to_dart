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
    Width =16221
    DatasheetFontHeight =11
    ItemSuffix =3514
    Left =660
    Top =2445
    RecSrcDt = Begin
        0x5c035bb536b1e540
    End
    RecordSource ="RELATORIO ACOMP REMOTO E BENEFICIOS"
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
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            KeepTogether =1
            ControlSource ="NomeFunc"
        End
        Begin BreakLevel
            ControlSource ="Nome"
        End
        Begin BreakLevel
            ControlSource ="DATA DO ACOMP REMOTO"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin PageHeader
            Height =450
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    Width =16215
                    Height =450
                    FontSize =14
                    BorderColor =8355711
                    Name ="Rótulo68"
                    Caption ="RELATÓRIO GERAL DE ACOMPANHAMENTO REMOTO"
                    GridlineColor =10921638
                    LayoutCachedWidth =16215
                    LayoutCachedHeight =450
                    ForeTint =100.0
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            RepeatSection = NotDefault
            Height =2600
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Width =6876
                    Height =315
                    FontWeight =700
                    BorderColor =10921638
                    Name ="NomeFunc"
                    ControlSource ="NomeFunc"
                    GridlineColor =10921638

                    LayoutCachedWidth =6876
                    LayoutCachedHeight =315
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Top =330
                    Width =6876
                    Height =315
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    Name ="FuncaoFuncionario"
                    ControlSource ="FuncaoFuncionario"
                    GridlineColor =10921638

                    LayoutCachedTop =330
                    LayoutCachedWidth =6876
                    LayoutCachedHeight =645
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Top =680
                    Width =450
                    Height =1920
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3448"
                    Caption ="DATA DO ACOMPANHAMENTO REMOTO"
                    GridlineColor =10921638
                    LayoutCachedTop =680
                    LayoutCachedWidth =450
                    LayoutCachedHeight =2600
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =450
                    Top =680
                    Width =345
                    Height =1920
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3449"
                    Caption ="COD. FAMILIAR"
                    GridlineColor =10921638
                    LayoutCachedLeft =450
                    LayoutCachedTop =680
                    LayoutCachedWidth =795
                    LayoutCachedHeight =2600
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =795
                    Top =680
                    Width =1410
                    Height =1920
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3450"
                    Caption ="Nome"
                    GridlineColor =10921638
                    LayoutCachedLeft =795
                    LayoutCachedTop =680
                    LayoutCachedWidth =2205
                    LayoutCachedHeight =2600
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =2220
                    Top =1260
                    Width =390
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3451"
                    Caption ="GRUPO DO SCFV"
                    GridlineColor =10921638
                    LayoutCachedLeft =2220
                    LayoutCachedTop =1260
                    LayoutCachedWidth =2610
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =2610
                    Top =1260
                    Width =465
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3452"
                    Caption ="PAF INÍCIO"
                    GridlineColor =10921638
                    LayoutCachedLeft =2610
                    LayoutCachedTop =1260
                    LayoutCachedWidth =3075
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =3060
                    Top =1260
                    Width =330
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3453"
                    Caption ="BPC"
                    GridlineColor =10921638
                    LayoutCachedLeft =3060
                    LayoutCachedTop =1260
                    LayoutCachedWidth =3390
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =3379
                    Top =1260
                    Width =345
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3454"
                    Caption ="INSS"
                    GridlineColor =10921638
                    LayoutCachedLeft =3379
                    LayoutCachedTop =1260
                    LayoutCachedWidth =3724
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =3724
                    Top =1260
                    Width =315
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3455"
                    Caption ="SCFV"
                    GridlineColor =10921638
                    LayoutCachedLeft =3724
                    LayoutCachedTop =1260
                    LayoutCachedWidth =4039
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4039
                    Top =1260
                    Width =285
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3456"
                    Caption ="EDUCAÇÃO"
                    GridlineColor =10921638
                    LayoutCachedLeft =4039
                    LayoutCachedTop =1260
                    LayoutCachedWidth =4324
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4324
                    Top =1260
                    Width =300
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3457"
                    Caption ="SAÚDE"
                    GridlineColor =10921638
                    LayoutCachedLeft =4324
                    LayoutCachedTop =1260
                    LayoutCachedWidth =4624
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4624
                    Top =1260
                    Width =300
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3458"
                    Caption ="JUSTIÇA"
                    GridlineColor =10921638
                    LayoutCachedLeft =4624
                    LayoutCachedTop =1260
                    LayoutCachedWidth =4924
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4924
                    Top =1260
                    Width =510
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3459"
                    Caption ="BENEF. MUNICIPAIS"
                    GridlineColor =10921638
                    LayoutCachedLeft =4924
                    LayoutCachedTop =1260
                    LayoutCachedWidth =5434
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5434
                    Top =1260
                    Width =510
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3460"
                    Caption ="AUXÍLIO NATALIDADE"
                    GridlineColor =10921638
                    LayoutCachedLeft =5434
                    LayoutCachedTop =1260
                    LayoutCachedWidth =5944
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5944
                    Top =1260
                    Width =510
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3461"
                    Caption ="GRATUIDADE TRANSPORTE"
                    GridlineColor =10921638
                    LayoutCachedLeft =5944
                    LayoutCachedTop =1260
                    LayoutCachedWidth =6454
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9225
                    Top =1260
                    Width =480
                    Height =1335
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3466"
                    Caption ="ESPECIF. OUTRA DEMANDA"
                    GridlineColor =10921638
                    LayoutCachedLeft =9225
                    LayoutCachedTop =1260
                    LayoutCachedWidth =9705
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =6465
                    Top =1275
                    Width =2040
                    Height =330
                    FontSize =7
                    FontWeight =700
                    BackColor =10469818
                    BorderColor =8355711
                    Name ="Rótulo3463"
                    Caption ="PROVIDENCIAR DOCUMENTAÇÃO CIVIL"
                    GridlineColor =10921638
                    LayoutCachedLeft =6465
                    LayoutCachedTop =1275
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =1605
                    BackThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8505
                    Top =1260
                    Width =345
                    Height =1335
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3464"
                    Caption ="APOIO ALIMENTAR"
                    GridlineColor =10921638
                    LayoutCachedLeft =8505
                    LayoutCachedTop =1260
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8850
                    Top =1260
                    Width =375
                    Height =1335
                    FontSize =7
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3465"
                    Caption ="OUTRA DEMANDA"
                    GridlineColor =10921638
                    LayoutCachedLeft =8850
                    LayoutCachedTop =1260
                    LayoutCachedWidth =9225
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =3060
                    Top =680
                    Width =6645
                    Height =585
                    FontSize =8
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo3468"
                    Caption ="DEMANDAS DO ACOMPANHAMENTO REMOTO"
                    GridlineColor =10921638
                    LayoutCachedLeft =3060
                    LayoutCachedTop =680
                    LayoutCachedWidth =9705
                    LayoutCachedHeight =1265
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =2220
                    Top =675
                    Width =840
                    Height =585
                    FontSize =8
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo1628"
                    Caption ="FAMÍLIAS PAF E SCFV"
                    GridlineColor =10921638
                    LayoutCachedLeft =2220
                    LayoutCachedTop =675
                    LayoutCachedWidth =3060
                    LayoutCachedHeight =1260
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6470
                    Top =1625
                    Width =510
                    Height =975
                    FontSize =8
                    BackColor =14675966
                    Name ="Rótulo3469"
                    Caption ="CERT. NASCIMENTO"
                    GridlineColor =10921638
                    LayoutCachedLeft =6470
                    LayoutCachedTop =1625
                    LayoutCachedWidth =6980
                    LayoutCachedHeight =2600
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6980
                    Top =1625
                    Width =345
                    Height =975
                    FontSize =8
                    BackColor =14675966
                    Name ="Rótulo3470"
                    Caption ="RG"
                    GridlineColor =10921638
                    LayoutCachedLeft =6980
                    LayoutCachedTop =1625
                    LayoutCachedWidth =7325
                    LayoutCachedHeight =2600
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7320
                    Top =1620
                    Width =390
                    Height =975
                    FontSize =8
                    BackColor =14675966
                    Name ="Rótulo3471"
                    Caption ="CTPS"
                    GridlineColor =10921638
                    LayoutCachedLeft =7320
                    LayoutCachedTop =1620
                    LayoutCachedWidth =7710
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7710
                    Top =1620
                    Width =330
                    Height =975
                    FontSize =8
                    BackColor =14675966
                    Name ="Rótulo3472"
                    Caption ="CPF"
                    GridlineColor =10921638
                    LayoutCachedLeft =7710
                    LayoutCachedTop =1620
                    LayoutCachedWidth =8040
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8040
                    Top =1620
                    Width =465
                    Height =975
                    FontSize =8
                    BackColor =14675966
                    Name ="Rótulo3473"
                    Caption ="TIT. ELEITOR"
                    GridlineColor =10921638
                    LayoutCachedLeft =8040
                    LayoutCachedTop =1620
                    LayoutCachedWidth =8505
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9705
                    Top =1260
                    Width =240
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3474"
                    Caption ="Autismo"
                    GridlineColor =10921638
                    LayoutCachedLeft =9705
                    LayoutCachedTop =1260
                    LayoutCachedWidth =9945
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9945
                    Top =1260
                    Width =270
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3475"
                    Caption ="Cegueira"
                    GridlineColor =10921638
                    LayoutCachedLeft =9945
                    LayoutCachedTop =1260
                    LayoutCachedWidth =10215
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10215
                    Top =1260
                    Width =285
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3476"
                    Caption ="Baixa visão"
                    GridlineColor =10921638
                    LayoutCachedLeft =10215
                    LayoutCachedTop =1260
                    LayoutCachedWidth =10500
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10500
                    Top =1260
                    Width =450
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3477"
                    Caption ="Surdez severa profunda"
                    GridlineColor =10921638
                    LayoutCachedLeft =10500
                    LayoutCachedTop =1260
                    LayoutCachedWidth =10950
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10950
                    Top =1260
                    Width =465
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3478"
                    Caption ="Surdez leve moderada"
                    GridlineColor =10921638
                    LayoutCachedLeft =10950
                    LayoutCachedTop =1260
                    LayoutCachedWidth =11415
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11415
                    Top =1260
                    Width =330
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3479"
                    Caption ="Deficiencia fisica"
                    GridlineColor =10921638
                    LayoutCachedLeft =11415
                    LayoutCachedTop =1260
                    LayoutCachedWidth =11745
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11745
                    Top =1260
                    Width =465
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3480"
                    Caption ="Defic mental intelec"
                    GridlineColor =10921638
                    LayoutCachedLeft =11745
                    LayoutCachedTop =1260
                    LayoutCachedWidth =12210
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12210
                    Top =1260
                    Width =285
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3481"
                    Caption ="Sindrome down"
                    GridlineColor =10921638
                    LayoutCachedLeft =12210
                    LayoutCachedTop =1260
                    LayoutCachedWidth =12495
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12495
                    Top =1260
                    Width =510
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3482"
                    Caption ="Transt doença mental"
                    GridlineColor =10921638
                    LayoutCachedLeft =12495
                    LayoutCachedTop =1260
                    LayoutCachedWidth =13005
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13005
                    Top =1260
                    Width =405
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3483"
                    Caption ="DoencaCronica"
                    GridlineColor =10921638
                    LayoutCachedLeft =13005
                    LayoutCachedTop =1260
                    LayoutCachedWidth =13410
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9705
                    Top =680
                    Width =3705
                    Height =585
                    FontSize =8
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo3484"
                    Caption ="SITUAÇÃO DE SAÚDE"
                    GridlineColor =10921638
                    LayoutCachedLeft =9705
                    LayoutCachedTop =680
                    LayoutCachedWidth =13410
                    LayoutCachedHeight =1265
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =7653
                    Width =1350
                    Height =315
                    FontSize =12
                    FontWeight =700
                    TabIndex =2
                    Name ="AccessTotalsNome"
                    ControlSource ="=Count([Nome])"
                    ControlTipText ="Nome Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =7653
                    LayoutCachedWidth =9003
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14805
                    Top =680
                    Width =1416
                    Height =1920
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3467"
                    Caption ="OBSERVAÇÕES E/OU DESDOBRAMENTO DAS DEMANDAS"
                    GridlineColor =10921638
                    LayoutCachedLeft =14805
                    LayoutCachedTop =680
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =2600
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =6870
                    Top =15
                    Width =765
                    Height =315
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo3487"
                    Caption ="TOTAL: "
                    GridlineColor =10921638
                    LayoutCachedLeft =6870
                    LayoutCachedTop =15
                    LayoutCachedWidth =7635
                    LayoutCachedHeight =330
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13410
                    Top =1260
                    Width =270
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3496"
                    Caption ="BPC D"
                    GridlineColor =10921638
                    LayoutCachedLeft =13410
                    LayoutCachedTop =1260
                    LayoutCachedWidth =13680
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13680
                    Top =1260
                    Width =285
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3497"
                    Caption ="BPC I"
                    GridlineColor =10921638
                    LayoutCachedLeft =13680
                    LayoutCachedTop =1260
                    LayoutCachedWidth =13965
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13410
                    Top =675
                    Width =1395
                    Height =585
                    FontSize =8
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo3495"
                    Caption ="BENEFICIOS"
                    GridlineColor =10921638
                    LayoutCachedLeft =13410
                    LayoutCachedTop =675
                    LayoutCachedWidth =14805
                    LayoutCachedHeight =1260
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13965
                    Top =1260
                    Width =270
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3501"
                    Caption ="BMD"
                    GridlineColor =10921638
                    LayoutCachedLeft =13965
                    LayoutCachedTop =1260
                    LayoutCachedWidth =14235
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14235
                    Top =1260
                    Width =270
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3502"
                    Caption ="BMI"
                    GridlineColor =10921638
                    LayoutCachedLeft =14235
                    LayoutCachedTop =1260
                    LayoutCachedWidth =14505
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14520
                    Top =1260
                    Width =285
                    Height =1335
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo3503"
                    Caption ="BSF"
                    GridlineColor =10921638
                    LayoutCachedLeft =14520
                    LayoutCachedTop =1260
                    LayoutCachedWidth =14805
                    LayoutCachedHeight =2595
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =960
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Rectangle
                    Left =13410
                    Width =1394
                    Height =960
                    Name ="Caixa3499"
                    GridlineColor =10921638
                    LayoutCachedLeft =13410
                    LayoutCachedWidth =14804
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9709
                    Width =3704
                    Height =960
                    Name ="Caixa3492"
                    GridlineColor =10921638
                    LayoutCachedLeft =9709
                    LayoutCachedWidth =13413
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8520
                    Width =1184
                    Height =960
                    Name ="Caixa3491"
                    GridlineColor =10921638
                    LayoutCachedLeft =8520
                    LayoutCachedWidth =9704
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =3071
                    Width =3389
                    Height =960
                    Name ="Caixa3489"
                    GridlineColor =10921638
                    LayoutCachedLeft =3071
                    LayoutCachedWidth =6460
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =6465
                    Width =2039
                    Height =960
                    Name ="Caixa3490"
                    GridlineColor =10921638
                    LayoutCachedLeft =6465
                    LayoutCachedWidth =8504
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    Vertical = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    Width =450
                    Height =960
                    ColumnWidth =2250
                    FontSize =8
                    Name ="DATA DO ACOMP REMOTO"
                    ControlSource ="DATA DO ACOMP REMOTO"
                    EventProcPrefix ="DATA_DO_ACOMP_REMOTO"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedWidth =450
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin ComboBox
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =450
                    Width =345
                    Height =960
                    FontSize =8
                    TabIndex =1
                    Name ="CodFam"
                    ControlSource ="CodFam"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT CadResidencia.CodFam, CadResidencia.DataCad FROM CadResidencia ORDER BY C"
                        "adResidencia.[CodFam]; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =450
                    LayoutCachedWidth =795
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =795
                    Width =1410
                    Height =960
                    ColumnWidth =3570
                    FontSize =8
                    TabIndex =2
                    Name ="Nome"
                    ControlSource ="Nome"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =795
                    LayoutCachedWidth =2205
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    Vertical = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2205
                    Width =411
                    Height =960
                    ColumnWidth =2250
                    FontSize =8
                    TabIndex =3
                    Name ="Grupo"
                    ControlSource ="Grupo"
                    GridlineColor =10921638

                    LayoutCachedLeft =2205
                    LayoutCachedWidth =2616
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    Vertical = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2610
                    Width =471
                    Height =960
                    FontSize =8
                    TabIndex =4
                    Name ="PAF inicio"
                    ControlSource ="PAF inicio"
                    EventProcPrefix ="PAF_inicio"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =2610
                    LayoutCachedWidth =3081
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =3124
                    Top =510
                    TabIndex =5
                    BorderColor =10921638
                    Name ="DemandaBPC"
                    ControlSource ="DemandaBPC"
                    GridlineColor =10921638

                    LayoutCachedLeft =3124
                    LayoutCachedTop =510
                    LayoutCachedWidth =3384
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =3469
                    Top =510
                    TabIndex =6
                    BorderColor =10921638
                    Name ="DemandaINSS"
                    ControlSource ="DemandaINSS"
                    GridlineColor =10921638

                    LayoutCachedLeft =3469
                    LayoutCachedTop =510
                    LayoutCachedWidth =3729
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =3799
                    Top =510
                    Width =235
                    TabIndex =7
                    BorderColor =10921638
                    Name ="DemandaSCFV"
                    ControlSource ="DemandaSCFV"
                    GridlineColor =10921638

                    LayoutCachedLeft =3799
                    LayoutCachedTop =510
                    LayoutCachedWidth =4034
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =4114
                    Top =510
                    TabIndex =8
                    BorderColor =10921638
                    Name ="DemandaEduc"
                    ControlSource ="DemandaEduc"
                    GridlineColor =10921638

                    LayoutCachedLeft =4114
                    LayoutCachedTop =510
                    LayoutCachedWidth =4374
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =4369
                    Top =510
                    TabIndex =9
                    BorderColor =10921638
                    Name ="DemandaSaude"
                    ControlSource ="DemandaSaude"
                    GridlineColor =10921638

                    LayoutCachedLeft =4369
                    LayoutCachedTop =510
                    LayoutCachedWidth =4629
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =4684
                    Top =510
                    TabIndex =10
                    BorderColor =10921638
                    Name ="DemandaJustiça"
                    ControlSource ="DemandaJustiça"
                    GridlineColor =10921638

                    LayoutCachedLeft =4684
                    LayoutCachedTop =510
                    LayoutCachedWidth =4944
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =5104
                    Top =510
                    TabIndex =11
                    BorderColor =10921638
                    Name ="DemandaBenefMun"
                    ControlSource ="DemandaBenefMun"
                    GridlineColor =10921638

                    LayoutCachedLeft =5104
                    LayoutCachedTop =510
                    LayoutCachedWidth =5364
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =5614
                    Top =510
                    TabIndex =12
                    BorderColor =10921638
                    Name ="DemandaAuxNatal"
                    ControlSource ="DemandaAuxNatal"
                    GridlineColor =10921638

                    LayoutCachedLeft =5614
                    LayoutCachedTop =510
                    LayoutCachedWidth =5874
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =6094
                    Top =510
                    TabIndex =13
                    BorderColor =10921638
                    Name ="DemandaGratTransp"
                    ControlSource ="DemandaGratTransp"
                    GridlineColor =10921638

                    LayoutCachedLeft =6094
                    LayoutCachedTop =510
                    LayoutCachedWidth =6354
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =8595
                    Top =510
                    TabIndex =14
                    BorderColor =10921638
                    Name ="DemandaApoioAlim"
                    ControlSource ="DemandaApoioAlim"
                    GridlineColor =10921638

                    LayoutCachedLeft =8595
                    LayoutCachedTop =510
                    LayoutCachedWidth =8855
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =8955
                    Top =510
                    TabIndex =15
                    BorderColor =10921638
                    Name ="Outra Demanda"
                    ControlSource ="Outra Demanda"
                    EventProcPrefix ="Outra_Demanda"
                    GridlineColor =10921638

                    LayoutCachedLeft =8955
                    LayoutCachedTop =510
                    LayoutCachedWidth =9215
                    LayoutCachedHeight =750
                End
                Begin TextBox
                    Vertical = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9225
                    Width =480
                    Height =960
                    ColumnWidth =1665
                    FontSize =8
                    TabIndex =16
                    Name ="Especif Outra"
                    ControlSource ="Especif Outra"
                    EventProcPrefix ="Especif_Outra"
                    GridlineColor =10921638

                    LayoutCachedLeft =9225
                    LayoutCachedWidth =9705
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =6639
                    Top =510
                    TabIndex =18
                    BorderColor =10921638
                    Name ="PROVICN"
                    ControlSource ="PROVICN"
                    GridlineColor =10921638

                    LayoutCachedLeft =6639
                    LayoutCachedTop =510
                    LayoutCachedWidth =6899
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =7020
                    Top =510
                    TabIndex =19
                    BorderColor =10921638
                    Name ="PROVIRG"
                    ControlSource ="PROVIRG"
                    GridlineColor =10921638

                    LayoutCachedLeft =7020
                    LayoutCachedTop =510
                    LayoutCachedWidth =7280
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =7425
                    Top =510
                    TabIndex =20
                    BorderColor =10921638
                    Name ="PROVICTPS"
                    ControlSource ="PROVICTPS"
                    GridlineColor =10921638

                    LayoutCachedLeft =7425
                    LayoutCachedTop =510
                    LayoutCachedWidth =7685
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =7770
                    Top =510
                    TabIndex =21
                    BorderColor =10921638
                    Name ="PROVICPF"
                    ControlSource ="PROVICPF"
                    GridlineColor =10921638

                    LayoutCachedLeft =7770
                    LayoutCachedTop =510
                    LayoutCachedWidth =8030
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =8160
                    Top =510
                    TabIndex =22
                    BorderColor =10921638
                    Name ="PROVITE"
                    ControlSource ="PROVITE"
                    GridlineColor =10921638

                    LayoutCachedLeft =8160
                    LayoutCachedTop =510
                    LayoutCachedWidth =8420
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =9720
                    Top =510
                    TabIndex =23
                    BorderColor =10921638
                    Name ="Autismo"
                    ControlSource ="Autismo"
                    GridlineColor =10921638

                    LayoutCachedLeft =9720
                    LayoutCachedTop =510
                    LayoutCachedWidth =9980
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =10005
                    Top =510
                    TabIndex =24
                    BorderColor =10921638
                    Name ="Cegueira"
                    ControlSource ="Cegueira"
                    GridlineColor =10921638

                    LayoutCachedLeft =10005
                    LayoutCachedTop =510
                    LayoutCachedWidth =10265
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =10264
                    Top =510
                    TabIndex =25
                    BorderColor =10921638
                    Name ="Baixa visão"
                    ControlSource ="Baixa visão"
                    EventProcPrefix ="Baixa_visão"
                    GridlineColor =10921638

                    LayoutCachedLeft =10264
                    LayoutCachedTop =510
                    LayoutCachedWidth =10524
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =10629
                    Top =510
                    TabIndex =26
                    BorderColor =10921638
                    Name ="Surdez severa profunda"
                    ControlSource ="Surdez severa profunda"
                    EventProcPrefix ="Surdez_severa_profunda"
                    GridlineColor =10921638

                    LayoutCachedLeft =10629
                    LayoutCachedTop =510
                    LayoutCachedWidth =10889
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =11089
                    Top =510
                    TabIndex =27
                    BorderColor =10921638
                    Name ="Surdez leve moderada"
                    ControlSource ="Surdez leve moderada"
                    EventProcPrefix ="Surdez_leve_moderada"
                    GridlineColor =10921638

                    LayoutCachedLeft =11089
                    LayoutCachedTop =510
                    LayoutCachedWidth =11349
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =11449
                    Top =510
                    TabIndex =28
                    BorderColor =10921638
                    Name ="Deficiencia fisica"
                    ControlSource ="Deficiencia fisica"
                    EventProcPrefix ="Deficiencia_fisica"
                    GridlineColor =10921638

                    LayoutCachedLeft =11449
                    LayoutCachedTop =510
                    LayoutCachedWidth =11709
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =11884
                    Top =510
                    TabIndex =29
                    BorderColor =10921638
                    Name ="Defic mental intelec"
                    ControlSource ="Defic mental intelec"
                    EventProcPrefix ="Defic_mental_intelec"
                    GridlineColor =10921638

                    LayoutCachedLeft =11884
                    LayoutCachedTop =510
                    LayoutCachedWidth =12144
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =12229
                    Top =510
                    TabIndex =30
                    BorderColor =10921638
                    Name ="Sindrome down"
                    ControlSource ="Sindrome down"
                    EventProcPrefix ="Sindrome_down"
                    GridlineColor =10921638

                    LayoutCachedLeft =12229
                    LayoutCachedTop =510
                    LayoutCachedWidth =12489
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =12604
                    Top =510
                    TabIndex =31
                    BorderColor =10921638
                    Name ="Transt doença mental"
                    ControlSource ="Transt doença mental"
                    EventProcPrefix ="Transt_doença_mental"
                    GridlineColor =10921638

                    LayoutCachedLeft =12604
                    LayoutCachedTop =510
                    LayoutCachedWidth =12864
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =13054
                    Top =510
                    TabIndex =32
                    BorderColor =10921638
                    Name ="DoencaCronica"
                    ControlSource ="DoencaCronica"
                    GridlineColor =10921638

                    LayoutCachedLeft =13054
                    LayoutCachedTop =510
                    LayoutCachedWidth =13314
                    LayoutCachedHeight =750
                End
                Begin CheckBox
                    Left =7599
                    TabIndex =33
                    BorderColor =10921638
                    Name ="DemandaDocCivil"
                    ControlSource ="DemandaDocCivil"
                    GridlineColor =10921638

                    LayoutCachedLeft =7599
                    LayoutCachedWidth =7859
                    LayoutCachedHeight =240
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =14805
                    Width =1416
                    Height =960
                    FontSize =8
                    TabIndex =17
                    Name ="DESDOBRAMENTO"
                    ControlSource ="OBS"
                    GridlineColor =10921638

                    LayoutCachedLeft =14805
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =960
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin Line
                    Left =6749
                    Top =340
                    Width =1536
                    Name ="Linha3488"
                    GridlineColor =10921638
                    LayoutCachedLeft =6749
                    LayoutCachedTop =340
                    LayoutCachedWidth =8285
                    LayoutCachedHeight =340
                End
                Begin CheckBox
                    Left =13440
                    Top =480
                    TabIndex =34
                    BorderColor =10921638
                    Name ="BPCD"
                    ControlSource ="BPCD"
                    GridlineColor =10921638

                    LayoutCachedLeft =13440
                    LayoutCachedTop =480
                    LayoutCachedWidth =13700
                    LayoutCachedHeight =720
                End
                Begin CheckBox
                    Left =13725
                    Top =480
                    TabIndex =35
                    BorderColor =10921638
                    Name ="BPCI"
                    ControlSource ="BPCI"
                    GridlineColor =10921638

                    LayoutCachedLeft =13725
                    LayoutCachedTop =480
                    LayoutCachedWidth =13985
                    LayoutCachedHeight =720
                End
                Begin TextBox
                    Vertical = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    Left =13946
                    Width =291
                    Height =945
                    FontSize =8
                    FontWeight =700
                    TabIndex =36
                    ForeColor =4210752
                    Name ="BMD"
                    ControlSource ="BMD"
                    GridlineColor =10921638

                    LayoutCachedLeft =13946
                    LayoutCachedWidth =14237
                    LayoutCachedHeight =945
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    Vertical = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    Left =14229
                    Width =291
                    Height =945
                    FontSize =8
                    FontWeight =700
                    TabIndex =37
                    ForeColor =4210752
                    Name ="BMI"
                    ControlSource ="BMI"
                    GridlineColor =10921638

                    LayoutCachedLeft =14229
                    LayoutCachedWidth =14520
                    LayoutCachedHeight =945
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    Vertical = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    Left =14513
                    Width =291
                    Height =945
                    FontSize =8
                    FontWeight =700
                    TabIndex =38
                    ForeColor =4210752
                    Name ="BSF"
                    ControlSource ="BSF"
                    GridlineColor =10921638

                    LayoutCachedLeft =14513
                    LayoutCachedWidth =14804
                    LayoutCachedHeight =945
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =0
            Name ="RodapéDoGrupo1"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
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
            Height =320
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =795
                    Top =5
                    Width =1410
                    Height =315
                    FontSize =8
                    FontWeight =700
                    Name ="AccessTotalsNome2"
                    ControlSource ="=Count(*)"
                    ControlTipText ="Contagem de Registros"
                    GridlineColor =10921638

                    LayoutCachedLeft =795
                    LayoutCachedTop =5
                    LayoutCachedWidth =2205
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
            End
        End
    End
End
