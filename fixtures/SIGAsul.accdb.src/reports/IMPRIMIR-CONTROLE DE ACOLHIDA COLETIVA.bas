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
    Width =16290
    DatasheetFontHeight =11
    ItemSuffix =4368
    Left =4440
    Top =2445
    RecSrcDt = Begin
        0xa4ce53ce6fa7e540
    End
    RecordSource ="SELECT TbUnidade.[Nº UNIDADE], TbUnidade.NOME, TbUnidade.LOGO, TbUnidade.RODAPE "
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
            Height =1200
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    Left =6585
                    Top =60
                    Width =9240
                    Height =390
                    FontSize =14
                    BorderColor =8355711
                    Name ="Rótulo68"
                    Caption ="CONTROLE DE ACOLHIDA COLETIVA - SEM CADASTRO NO CRAS"
                    GridlineColor =10921638
                    LayoutCachedLeft =6585
                    LayoutCachedTop =60
                    LayoutCachedWidth =15825
                    LayoutCachedHeight =450
                    ForeTint =100.0
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
        Begin Section
            KeepTogether = NotDefault
            Height =19515
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =2678
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo1585"
                    Caption ="1"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =2678
                    LayoutCachedWidth =285
                    LayoutCachedHeight =2963
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =9205
                    Top =2423
                    Width =300
                    Height =315
                    Name ="Caixa2735"
                    GridlineColor =10921638
                    LayoutCachedLeft =9205
                    LayoutCachedTop =2423
                    LayoutCachedWidth =9505
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8754
                    Top =2423
                    Width =445
                    Height =315
                    Name ="Caixa2736"
                    GridlineColor =10921638
                    LayoutCachedLeft =8754
                    LayoutCachedTop =2423
                    LayoutCachedWidth =9199
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8422
                    Top =2423
                    Width =330
                    Height =315
                    Name ="Caixa2737"
                    GridlineColor =10921638
                    LayoutCachedLeft =8422
                    LayoutCachedTop =2423
                    LayoutCachedWidth =8752
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4515
                    Top =2423
                    Width =1590
                    Height =315
                    Name ="Caixa2738"
                    GridlineColor =10921638
                    LayoutCachedLeft =4515
                    LayoutCachedTop =2423
                    LayoutCachedWidth =6105
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =6105
                    Top =2423
                    Width =1635
                    Height =315
                    Name ="Caixa2739"
                    GridlineColor =10921638
                    LayoutCachedLeft =6105
                    LayoutCachedTop =2423
                    LayoutCachedWidth =7740
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15750
                    Top =2423
                    Width =525
                    Height =315
                    Name ="Caixa2740"
                    GridlineColor =10921638
                    LayoutCachedLeft =15750
                    LayoutCachedTop =2423
                    LayoutCachedWidth =16275
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14175
                    Top =2423
                    Width =450
                    Height =315
                    Name ="Caixa2741"
                    GridlineColor =10921638
                    LayoutCachedLeft =14175
                    LayoutCachedTop =2423
                    LayoutCachedWidth =14625
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13830
                    Top =2423
                    Width =346
                    Height =315
                    Name ="Caixa2742"
                    GridlineColor =10921638
                    LayoutCachedLeft =13830
                    LayoutCachedTop =2423
                    LayoutCachedWidth =14176
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13320
                    Top =2423
                    Width =510
                    Height =315
                    Name ="Caixa2746"
                    GridlineColor =10921638
                    LayoutCachedLeft =13320
                    LayoutCachedTop =2423
                    LayoutCachedWidth =13830
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7740
                    Top =2423
                    Width =345
                    Height =315
                    Name ="Caixa2747"
                    GridlineColor =10921638
                    LayoutCachedLeft =7740
                    LayoutCachedTop =2423
                    LayoutCachedWidth =8085
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14970
                    Top =2423
                    Width =375
                    Height =315
                    Name ="Caixa2748"
                    GridlineColor =10921638
                    LayoutCachedLeft =14970
                    LayoutCachedTop =2423
                    LayoutCachedWidth =15345
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14625
                    Top =2423
                    Width =361
                    Height =315
                    Name ="Caixa2749"
                    GridlineColor =10921638
                    LayoutCachedLeft =14625
                    LayoutCachedTop =2423
                    LayoutCachedWidth =14986
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2715
                    Top =2423
                    Width =1830
                    Height =315
                    Name ="Caixa2750"
                    GridlineColor =10921638
                    LayoutCachedLeft =2715
                    LayoutCachedTop =2423
                    LayoutCachedWidth =4545
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8080
                    Top =2423
                    Width =340
                    Height =315
                    Name ="Caixa2751"
                    GridlineColor =10921638
                    LayoutCachedLeft =8080
                    LayoutCachedTop =2423
                    LayoutCachedWidth =8420
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9490
                    Top =2423
                    Width =345
                    Height =315
                    Name ="Caixa2752"
                    GridlineColor =10921638
                    LayoutCachedLeft =9490
                    LayoutCachedTop =2423
                    LayoutCachedWidth =9835
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15337
                    Top =2423
                    Width =420
                    Height =315
                    Name ="Caixa2753"
                    GridlineColor =10921638
                    LayoutCachedLeft =15337
                    LayoutCachedTop =2423
                    LayoutCachedWidth =15757
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11142
                    Top =2423
                    Width =345
                    Height =315
                    Name ="Caixa3401"
                    GridlineColor =10921638
                    LayoutCachedLeft =11142
                    LayoutCachedTop =2423
                    LayoutCachedWidth =11487
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11481
                    Top =2423
                    Width =1845
                    Height =315
                    Name ="Caixa3406"
                    GridlineColor =10921638
                    LayoutCachedLeft =11481
                    LayoutCachedTop =2423
                    LayoutCachedWidth =13326
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10512
                    Top =2423
                    Width =300
                    Height =315
                    Name ="Caixa3421"
                    GridlineColor =10921638
                    LayoutCachedLeft =10512
                    LayoutCachedTop =2423
                    LayoutCachedWidth =10812
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10122
                    Top =2423
                    Width =385
                    Height =315
                    Name ="Caixa3422"
                    GridlineColor =10921638
                    LayoutCachedLeft =10122
                    LayoutCachedTop =2423
                    LayoutCachedWidth =10507
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9819
                    Top =2423
                    Width =300
                    Height =315
                    Name ="Caixa3423"
                    GridlineColor =10921638
                    LayoutCachedLeft =9819
                    LayoutCachedTop =2423
                    LayoutCachedWidth =10119
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10800
                    Top =2423
                    Width =345
                    Height =315
                    Name ="Caixa3424"
                    GridlineColor =10921638
                    LayoutCachedLeft =10800
                    LayoutCachedTop =2423
                    LayoutCachedWidth =11145
                    LayoutCachedHeight =2738
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    TextAlign =1
                    Top =2160
                    Width =16290
                    Height =240
                    FontSize =9
                    BorderColor =8355711
                    Name ="Data_Rótulo"
                    Caption ="Data:  _______________________________   NOME: _________________________________"
                        "________________________________________________________________________________"
                        "____________________________________________"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =2160
                    LayoutCachedWidth =16290
                    LayoutCachedHeight =2400
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8080
                    Top =345
                    Width =340
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Atendimento Social 1ª Vez_Rótulo"
                    Caption ="INSS"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Atendimento_Social_1ª_Vez_Rótulo"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =8080
                    LayoutCachedTop =345
                    LayoutCachedWidth =8420
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8422
                    Top =345
                    Width =330
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Atendimento Social Subsequente_Rótulo"
                    Caption ="SCFV"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Atendimento_Social_Subsequente_Rótulo"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =8422
                    LayoutCachedTop =345
                    LayoutCachedWidth =8752
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8754
                    Top =345
                    Width =445
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Atendimento Psicológico 1ª Vez_Rótulo"
                    Caption ="EDUCAÇÃO"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Atendimento_Psicológico_1ª_Vez_Rótulo"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =8754
                    LayoutCachedTop =345
                    LayoutCachedWidth =9199
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9205
                    Top =345
                    Width =300
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo1383"
                    Caption ="DOCMENT. CIVIL"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9205
                    LayoutCachedTop =345
                    LayoutCachedWidth =9505
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14625
                    Top =345
                    Width =361
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo1406"
                    Caption ="SEMFAZ"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =14625
                    LayoutCachedTop =345
                    LayoutCachedWidth =14986
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14970
                    Top =345
                    Width =375
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo1407"
                    Caption ="ENT. NÃO GOVERN"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =14970
                    LayoutCachedTop =345
                    LayoutCachedWidth =15345
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13830
                    Top =345
                    Width =346
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo1408"
                    Caption ="SAÚDE"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =13830
                    LayoutCachedTop =345
                    LayoutCachedWidth =14176
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14175
                    Top =345
                    Width =450
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo1409"
                    Caption ="EDUCAÇÃO"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =14175
                    LayoutCachedTop =345
                    LayoutCachedWidth =14625
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =15750
                    Top =345
                    Width =525
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo1809"
                    Caption ="COMITÊ SUB-REGISTRO"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =15750
                    LayoutCachedTop =345
                    LayoutCachedWidth =16275
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =15337
                    Top =345
                    Width =420
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo1234"
                    Caption ="OUTRAS POLÍTICAS"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =15337
                    LayoutCachedTop =345
                    LayoutCachedWidth =15757
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13320
                    Top =345
                    Width =510
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo2723"
                    Caption ="REDE SOCIOASSISTENCIAL"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =13320
                    LayoutCachedTop =345
                    LayoutCachedWidth =13830
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13320
                    Top =60
                    Width =2955
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo124"
                    Caption ="ENCAMINHAMENTO"
                    GridlineColor =10921638
                    LayoutCachedLeft =13320
                    LayoutCachedTop =60
                    LayoutCachedWidth =16275
                    LayoutCachedHeight =345
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7740
                    Top =345
                    Width =345
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo2945"
                    Caption ="BPC"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =7740
                    LayoutCachedTop =345
                    LayoutCachedWidth =8085
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9490
                    Top =345
                    Width =345
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo2954"
                    Caption ="APOIO ALIMENTAR"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9490
                    LayoutCachedTop =345
                    LayoutCachedWidth =9835
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7740
                    Top =60
                    Width =5580
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo2194"
                    Caption ="DEMANDA DO  ATENDIMENTO"
                    GridlineColor =10921638
                    LayoutCachedLeft =7740
                    LayoutCachedTop =60
                    LayoutCachedWidth =13320
                    LayoutCachedHeight =345
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11142
                    Top =345
                    Width =345
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo3399"
                    Caption ="OUTRA DEMANDA"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =11142
                    LayoutCachedTop =345
                    LayoutCachedWidth =11487
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11481
                    Top =345
                    Width =1845
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo3400"
                    Caption ="ESPECIFICAR OUTRA DEMANDA"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =11481
                    LayoutCachedTop =345
                    LayoutCachedWidth =13326
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9819
                    Top =345
                    Width =300
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo3417"
                    Caption ="SAÚDE"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9819
                    LayoutCachedTop =345
                    LayoutCachedWidth =10119
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10122
                    Top =345
                    Width =385
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo3418"
                    Caption ="JUSTIÇA"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =10122
                    LayoutCachedTop =345
                    LayoutCachedWidth =10507
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10512
                    Top =345
                    Width =300
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo3419"
                    Caption ="BENEF. MUNICIPAIS"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =10512
                    LayoutCachedTop =345
                    LayoutCachedWidth =10812
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10800
                    Top =345
                    Width =345
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo3420"
                    Caption ="AUX. NATALIDADE"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =10800
                    LayoutCachedTop =345
                    LayoutCachedWidth =11145
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =2715
                    Top =345
                    Width =1830
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo4006"
                    Caption ="DATA DE NASCIMENTO"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =2715
                    LayoutCachedTop =345
                    LayoutCachedWidth =4545
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4515
                    Top =345
                    Width =1590
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo4007"
                    Caption ="CPF"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =4515
                    LayoutCachedTop =345
                    LayoutCachedWidth =6105
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6105
                    Top =345
                    Width =1635
                    Height =1576
                    FontSize =9
                    BackColor =14675966
                    Name ="Rótulo4008"
                    Caption ="CELULAR"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedLeft =6105
                    LayoutCachedTop =345
                    LayoutCachedWidth =7740
                    LayoutCachedHeight =1921
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =2025
                    Width =16221
                    Name ="Linha4009"
                    GridlineColor =10921638
                    LayoutCachedTop =2025
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =2025
                End
                Begin Line
                    BorderWidth =2
                    Top =3248
                    Width =16221
                    Name ="Linha4010"
                    GridlineColor =10921638
                    LayoutCachedTop =3248
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =3248
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =2903
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4011"
                    Caption ="OBS.: __________________________________________________________________________"
                        "________________________________________________________________________________"
                        "______"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =2903
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =3173
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =4095
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4012"
                    Caption ="2"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =4095
                    LayoutCachedWidth =285
                    LayoutCachedHeight =4380
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =9205
                    Top =3713
                    Width =300
                    Height =315
                    Name ="Caixa4013"
                    GridlineColor =10921638
                    LayoutCachedLeft =9205
                    LayoutCachedTop =3713
                    LayoutCachedWidth =9505
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8754
                    Top =3713
                    Width =445
                    Height =315
                    Name ="Caixa4014"
                    GridlineColor =10921638
                    LayoutCachedLeft =8754
                    LayoutCachedTop =3713
                    LayoutCachedWidth =9199
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8422
                    Top =3713
                    Width =330
                    Height =315
                    Name ="Caixa4015"
                    GridlineColor =10921638
                    LayoutCachedLeft =8422
                    LayoutCachedTop =3713
                    LayoutCachedWidth =8752
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4515
                    Top =3713
                    Width =1590
                    Height =315
                    Name ="Caixa4016"
                    GridlineColor =10921638
                    LayoutCachedLeft =4515
                    LayoutCachedTop =3713
                    LayoutCachedWidth =6105
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =6105
                    Top =3713
                    Width =1635
                    Height =315
                    Name ="Caixa4017"
                    GridlineColor =10921638
                    LayoutCachedLeft =6105
                    LayoutCachedTop =3713
                    LayoutCachedWidth =7740
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15750
                    Top =3713
                    Width =525
                    Height =315
                    Name ="Caixa4018"
                    GridlineColor =10921638
                    LayoutCachedLeft =15750
                    LayoutCachedTop =3713
                    LayoutCachedWidth =16275
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14175
                    Top =3713
                    Width =450
                    Height =315
                    Name ="Caixa4019"
                    GridlineColor =10921638
                    LayoutCachedLeft =14175
                    LayoutCachedTop =3713
                    LayoutCachedWidth =14625
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13830
                    Top =3713
                    Width =346
                    Height =315
                    Name ="Caixa4020"
                    GridlineColor =10921638
                    LayoutCachedLeft =13830
                    LayoutCachedTop =3713
                    LayoutCachedWidth =14176
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13320
                    Top =3713
                    Width =510
                    Height =315
                    Name ="Caixa4021"
                    GridlineColor =10921638
                    LayoutCachedLeft =13320
                    LayoutCachedTop =3713
                    LayoutCachedWidth =13830
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7740
                    Top =3713
                    Width =345
                    Height =315
                    Name ="Caixa4022"
                    GridlineColor =10921638
                    LayoutCachedLeft =7740
                    LayoutCachedTop =3713
                    LayoutCachedWidth =8085
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14970
                    Top =3713
                    Width =375
                    Height =315
                    Name ="Caixa4023"
                    GridlineColor =10921638
                    LayoutCachedLeft =14970
                    LayoutCachedTop =3713
                    LayoutCachedWidth =15345
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14625
                    Top =3713
                    Width =361
                    Height =315
                    Name ="Caixa4024"
                    GridlineColor =10921638
                    LayoutCachedLeft =14625
                    LayoutCachedTop =3713
                    LayoutCachedWidth =14986
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2715
                    Top =3713
                    Width =1830
                    Height =315
                    Name ="Caixa4025"
                    GridlineColor =10921638
                    LayoutCachedLeft =2715
                    LayoutCachedTop =3713
                    LayoutCachedWidth =4545
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8080
                    Top =3713
                    Width =340
                    Height =315
                    Name ="Caixa4026"
                    GridlineColor =10921638
                    LayoutCachedLeft =8080
                    LayoutCachedTop =3713
                    LayoutCachedWidth =8420
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9490
                    Top =3713
                    Width =345
                    Height =315
                    Name ="Caixa4027"
                    GridlineColor =10921638
                    LayoutCachedLeft =9490
                    LayoutCachedTop =3713
                    LayoutCachedWidth =9835
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15337
                    Top =3713
                    Width =420
                    Height =315
                    Name ="Caixa4028"
                    GridlineColor =10921638
                    LayoutCachedLeft =15337
                    LayoutCachedTop =3713
                    LayoutCachedWidth =15757
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11142
                    Top =3713
                    Width =345
                    Height =315
                    Name ="Caixa4029"
                    GridlineColor =10921638
                    LayoutCachedLeft =11142
                    LayoutCachedTop =3713
                    LayoutCachedWidth =11487
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11481
                    Top =3713
                    Width =1845
                    Height =315
                    Name ="Caixa4030"
                    GridlineColor =10921638
                    LayoutCachedLeft =11481
                    LayoutCachedTop =3713
                    LayoutCachedWidth =13326
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10512
                    Top =3713
                    Width =300
                    Height =315
                    Name ="Caixa4031"
                    GridlineColor =10921638
                    LayoutCachedLeft =10512
                    LayoutCachedTop =3713
                    LayoutCachedWidth =10812
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10122
                    Top =3713
                    Width =385
                    Height =315
                    Name ="Caixa4032"
                    GridlineColor =10921638
                    LayoutCachedLeft =10122
                    LayoutCachedTop =3713
                    LayoutCachedWidth =10507
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9819
                    Top =3713
                    Width =300
                    Height =315
                    Name ="Caixa4033"
                    GridlineColor =10921638
                    LayoutCachedLeft =9819
                    LayoutCachedTop =3713
                    LayoutCachedWidth =10119
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10800
                    Top =3713
                    Width =345
                    Height =315
                    Name ="Caixa4034"
                    GridlineColor =10921638
                    LayoutCachedLeft =10800
                    LayoutCachedTop =3713
                    LayoutCachedWidth =11145
                    LayoutCachedHeight =4028
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    TextAlign =1
                    Top =3450
                    Width =16290
                    Height =240
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4035"
                    Caption ="Data:  _______________________________   NOME: _________________________________"
                        "________________________________________________________________________________"
                        "____________________________________________"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =3450
                    LayoutCachedWidth =16290
                    LayoutCachedHeight =3690
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =4538
                    Width =16221
                    Name ="Linha4037"
                    GridlineColor =10921638
                    LayoutCachedTop =4538
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =4538
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =4193
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4038"
                    Caption ="OBS.: __________________________________________________________________________"
                        "________________________________________________________________________________"
                        "_____________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =4193
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =4463
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =5325
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4040"
                    Caption ="3"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =5325
                    LayoutCachedWidth =285
                    LayoutCachedHeight =5610
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =9205
                    Top =4943
                    Width =300
                    Height =315
                    Name ="Caixa4041"
                    GridlineColor =10921638
                    LayoutCachedLeft =9205
                    LayoutCachedTop =4943
                    LayoutCachedWidth =9505
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8754
                    Top =4943
                    Width =445
                    Height =315
                    Name ="Caixa4042"
                    GridlineColor =10921638
                    LayoutCachedLeft =8754
                    LayoutCachedTop =4943
                    LayoutCachedWidth =9199
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8422
                    Top =4943
                    Width =330
                    Height =315
                    Name ="Caixa4043"
                    GridlineColor =10921638
                    LayoutCachedLeft =8422
                    LayoutCachedTop =4943
                    LayoutCachedWidth =8752
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4515
                    Top =4943
                    Width =1590
                    Height =315
                    Name ="Caixa4044"
                    GridlineColor =10921638
                    LayoutCachedLeft =4515
                    LayoutCachedTop =4943
                    LayoutCachedWidth =6105
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =6105
                    Top =4943
                    Width =1635
                    Height =315
                    Name ="Caixa4045"
                    GridlineColor =10921638
                    LayoutCachedLeft =6105
                    LayoutCachedTop =4943
                    LayoutCachedWidth =7740
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15750
                    Top =4943
                    Width =525
                    Height =315
                    Name ="Caixa4046"
                    GridlineColor =10921638
                    LayoutCachedLeft =15750
                    LayoutCachedTop =4943
                    LayoutCachedWidth =16275
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14175
                    Top =4943
                    Width =450
                    Height =315
                    Name ="Caixa4047"
                    GridlineColor =10921638
                    LayoutCachedLeft =14175
                    LayoutCachedTop =4943
                    LayoutCachedWidth =14625
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13830
                    Top =4943
                    Width =346
                    Height =315
                    Name ="Caixa4048"
                    GridlineColor =10921638
                    LayoutCachedLeft =13830
                    LayoutCachedTop =4943
                    LayoutCachedWidth =14176
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13320
                    Top =4943
                    Width =510
                    Height =315
                    Name ="Caixa4049"
                    GridlineColor =10921638
                    LayoutCachedLeft =13320
                    LayoutCachedTop =4943
                    LayoutCachedWidth =13830
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7740
                    Top =4943
                    Width =345
                    Height =315
                    Name ="Caixa4050"
                    GridlineColor =10921638
                    LayoutCachedLeft =7740
                    LayoutCachedTop =4943
                    LayoutCachedWidth =8085
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14970
                    Top =4943
                    Width =375
                    Height =315
                    Name ="Caixa4051"
                    GridlineColor =10921638
                    LayoutCachedLeft =14970
                    LayoutCachedTop =4943
                    LayoutCachedWidth =15345
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14625
                    Top =4943
                    Width =361
                    Height =315
                    Name ="Caixa4052"
                    GridlineColor =10921638
                    LayoutCachedLeft =14625
                    LayoutCachedTop =4943
                    LayoutCachedWidth =14986
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2715
                    Top =4943
                    Width =1830
                    Height =315
                    Name ="Caixa4053"
                    GridlineColor =10921638
                    LayoutCachedLeft =2715
                    LayoutCachedTop =4943
                    LayoutCachedWidth =4545
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8080
                    Top =4943
                    Width =340
                    Height =315
                    Name ="Caixa4054"
                    GridlineColor =10921638
                    LayoutCachedLeft =8080
                    LayoutCachedTop =4943
                    LayoutCachedWidth =8420
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9490
                    Top =4943
                    Width =345
                    Height =315
                    Name ="Caixa4055"
                    GridlineColor =10921638
                    LayoutCachedLeft =9490
                    LayoutCachedTop =4943
                    LayoutCachedWidth =9835
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15337
                    Top =4943
                    Width =420
                    Height =315
                    Name ="Caixa4056"
                    GridlineColor =10921638
                    LayoutCachedLeft =15337
                    LayoutCachedTop =4943
                    LayoutCachedWidth =15757
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11142
                    Top =4943
                    Width =345
                    Height =315
                    Name ="Caixa4057"
                    GridlineColor =10921638
                    LayoutCachedLeft =11142
                    LayoutCachedTop =4943
                    LayoutCachedWidth =11487
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11481
                    Top =4943
                    Width =1845
                    Height =315
                    Name ="Caixa4058"
                    GridlineColor =10921638
                    LayoutCachedLeft =11481
                    LayoutCachedTop =4943
                    LayoutCachedWidth =13326
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10512
                    Top =4943
                    Width =300
                    Height =315
                    Name ="Caixa4059"
                    GridlineColor =10921638
                    LayoutCachedLeft =10512
                    LayoutCachedTop =4943
                    LayoutCachedWidth =10812
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10122
                    Top =4943
                    Width =385
                    Height =315
                    Name ="Caixa4060"
                    GridlineColor =10921638
                    LayoutCachedLeft =10122
                    LayoutCachedTop =4943
                    LayoutCachedWidth =10507
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9819
                    Top =4943
                    Width =300
                    Height =315
                    Name ="Caixa4061"
                    GridlineColor =10921638
                    LayoutCachedLeft =9819
                    LayoutCachedTop =4943
                    LayoutCachedWidth =10119
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10800
                    Top =4943
                    Width =345
                    Height =315
                    Name ="Caixa4062"
                    GridlineColor =10921638
                    LayoutCachedLeft =10800
                    LayoutCachedTop =4943
                    LayoutCachedWidth =11145
                    LayoutCachedHeight =5258
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    TextAlign =1
                    Top =4680
                    Width =16290
                    Height =240
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4063"
                    Caption ="Data:  _______________________________   NOME: _________________________________"
                        "________________________________________________________________________________"
                        "____________________________________________"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =4680
                    LayoutCachedWidth =16290
                    LayoutCachedHeight =4920
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =5423
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4064"
                    Caption ="OBS.: __________________________________________________________________________"
                        "________________________________________________________________________________"
                        "_____________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =5423
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =5693
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =6338
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4065"
                    Caption ="4"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =6338
                    LayoutCachedWidth =285
                    LayoutCachedHeight =6623
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =9205
                    Top =6083
                    Width =300
                    Height =315
                    Name ="Caixa4066"
                    GridlineColor =10921638
                    LayoutCachedLeft =9205
                    LayoutCachedTop =6083
                    LayoutCachedWidth =9505
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8754
                    Top =6083
                    Width =445
                    Height =315
                    Name ="Caixa4067"
                    GridlineColor =10921638
                    LayoutCachedLeft =8754
                    LayoutCachedTop =6083
                    LayoutCachedWidth =9199
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8422
                    Top =6083
                    Width =330
                    Height =315
                    Name ="Caixa4068"
                    GridlineColor =10921638
                    LayoutCachedLeft =8422
                    LayoutCachedTop =6083
                    LayoutCachedWidth =8752
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4515
                    Top =6083
                    Width =1590
                    Height =315
                    Name ="Caixa4069"
                    GridlineColor =10921638
                    LayoutCachedLeft =4515
                    LayoutCachedTop =6083
                    LayoutCachedWidth =6105
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =6105
                    Top =6083
                    Width =1635
                    Height =315
                    Name ="Caixa4070"
                    GridlineColor =10921638
                    LayoutCachedLeft =6105
                    LayoutCachedTop =6083
                    LayoutCachedWidth =7740
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15750
                    Top =6083
                    Width =525
                    Height =315
                    Name ="Caixa4071"
                    GridlineColor =10921638
                    LayoutCachedLeft =15750
                    LayoutCachedTop =6083
                    LayoutCachedWidth =16275
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14175
                    Top =6083
                    Width =450
                    Height =315
                    Name ="Caixa4072"
                    GridlineColor =10921638
                    LayoutCachedLeft =14175
                    LayoutCachedTop =6083
                    LayoutCachedWidth =14625
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13830
                    Top =6083
                    Width =346
                    Height =315
                    Name ="Caixa4073"
                    GridlineColor =10921638
                    LayoutCachedLeft =13830
                    LayoutCachedTop =6083
                    LayoutCachedWidth =14176
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13320
                    Top =6083
                    Width =510
                    Height =315
                    Name ="Caixa4074"
                    GridlineColor =10921638
                    LayoutCachedLeft =13320
                    LayoutCachedTop =6083
                    LayoutCachedWidth =13830
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7740
                    Top =6083
                    Width =345
                    Height =315
                    Name ="Caixa4075"
                    GridlineColor =10921638
                    LayoutCachedLeft =7740
                    LayoutCachedTop =6083
                    LayoutCachedWidth =8085
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14970
                    Top =6083
                    Width =375
                    Height =315
                    Name ="Caixa4076"
                    GridlineColor =10921638
                    LayoutCachedLeft =14970
                    LayoutCachedTop =6083
                    LayoutCachedWidth =15345
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14625
                    Top =6083
                    Width =361
                    Height =315
                    Name ="Caixa4077"
                    GridlineColor =10921638
                    LayoutCachedLeft =14625
                    LayoutCachedTop =6083
                    LayoutCachedWidth =14986
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2715
                    Top =6083
                    Width =1830
                    Height =315
                    Name ="Caixa4078"
                    GridlineColor =10921638
                    LayoutCachedLeft =2715
                    LayoutCachedTop =6083
                    LayoutCachedWidth =4545
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8080
                    Top =6083
                    Width =340
                    Height =315
                    Name ="Caixa4079"
                    GridlineColor =10921638
                    LayoutCachedLeft =8080
                    LayoutCachedTop =6083
                    LayoutCachedWidth =8420
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9490
                    Top =6083
                    Width =345
                    Height =315
                    Name ="Caixa4080"
                    GridlineColor =10921638
                    LayoutCachedLeft =9490
                    LayoutCachedTop =6083
                    LayoutCachedWidth =9835
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15337
                    Top =6083
                    Width =420
                    Height =315
                    Name ="Caixa4081"
                    GridlineColor =10921638
                    LayoutCachedLeft =15337
                    LayoutCachedTop =6083
                    LayoutCachedWidth =15757
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11142
                    Top =6083
                    Width =345
                    Height =315
                    Name ="Caixa4082"
                    GridlineColor =10921638
                    LayoutCachedLeft =11142
                    LayoutCachedTop =6083
                    LayoutCachedWidth =11487
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11481
                    Top =6083
                    Width =1845
                    Height =315
                    Name ="Caixa4083"
                    GridlineColor =10921638
                    LayoutCachedLeft =11481
                    LayoutCachedTop =6083
                    LayoutCachedWidth =13326
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10512
                    Top =6083
                    Width =300
                    Height =315
                    Name ="Caixa4084"
                    GridlineColor =10921638
                    LayoutCachedLeft =10512
                    LayoutCachedTop =6083
                    LayoutCachedWidth =10812
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10122
                    Top =6083
                    Width =385
                    Height =315
                    Name ="Caixa4085"
                    GridlineColor =10921638
                    LayoutCachedLeft =10122
                    LayoutCachedTop =6083
                    LayoutCachedWidth =10507
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9819
                    Top =6083
                    Width =300
                    Height =315
                    Name ="Caixa4086"
                    GridlineColor =10921638
                    LayoutCachedLeft =9819
                    LayoutCachedTop =6083
                    LayoutCachedWidth =10119
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10800
                    Top =6083
                    Width =345
                    Height =315
                    Name ="Caixa4087"
                    GridlineColor =10921638
                    LayoutCachedLeft =10800
                    LayoutCachedTop =6083
                    LayoutCachedWidth =11145
                    LayoutCachedHeight =6398
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    TextAlign =1
                    Top =5820
                    Width =16290
                    Height =240
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4088"
                    Caption ="Data:  _______________________________   NOME: _________________________________"
                        "________________________________________________________________________________"
                        "____________________________________________"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =5820
                    LayoutCachedWidth =16290
                    LayoutCachedHeight =6060
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =6908
                    Width =16221
                    Name ="Linha4089"
                    GridlineColor =10921638
                    LayoutCachedTop =6908
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =6908
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =6563
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4090"
                    Caption ="OBS.: __________________________________________________________________________"
                        "________________________________________________________________________________"
                        "_____________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =6563
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =6833
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =7725
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4091"
                    Caption ="5"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =7725
                    LayoutCachedWidth =285
                    LayoutCachedHeight =8010
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =9205
                    Top =7343
                    Width =300
                    Height =315
                    Name ="Caixa4092"
                    GridlineColor =10921638
                    LayoutCachedLeft =9205
                    LayoutCachedTop =7343
                    LayoutCachedWidth =9505
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8754
                    Top =7343
                    Width =445
                    Height =315
                    Name ="Caixa4093"
                    GridlineColor =10921638
                    LayoutCachedLeft =8754
                    LayoutCachedTop =7343
                    LayoutCachedWidth =9199
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8422
                    Top =7343
                    Width =330
                    Height =315
                    Name ="Caixa4094"
                    GridlineColor =10921638
                    LayoutCachedLeft =8422
                    LayoutCachedTop =7343
                    LayoutCachedWidth =8752
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4515
                    Top =7343
                    Width =1590
                    Height =315
                    Name ="Caixa4095"
                    GridlineColor =10921638
                    LayoutCachedLeft =4515
                    LayoutCachedTop =7343
                    LayoutCachedWidth =6105
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =6105
                    Top =7343
                    Width =1635
                    Height =315
                    Name ="Caixa4096"
                    GridlineColor =10921638
                    LayoutCachedLeft =6105
                    LayoutCachedTop =7343
                    LayoutCachedWidth =7740
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15750
                    Top =7343
                    Width =525
                    Height =315
                    Name ="Caixa4097"
                    GridlineColor =10921638
                    LayoutCachedLeft =15750
                    LayoutCachedTop =7343
                    LayoutCachedWidth =16275
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14175
                    Top =7343
                    Width =450
                    Height =315
                    Name ="Caixa4098"
                    GridlineColor =10921638
                    LayoutCachedLeft =14175
                    LayoutCachedTop =7343
                    LayoutCachedWidth =14625
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13830
                    Top =7343
                    Width =346
                    Height =315
                    Name ="Caixa4099"
                    GridlineColor =10921638
                    LayoutCachedLeft =13830
                    LayoutCachedTop =7343
                    LayoutCachedWidth =14176
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13320
                    Top =7343
                    Width =510
                    Height =315
                    Name ="Caixa4100"
                    GridlineColor =10921638
                    LayoutCachedLeft =13320
                    LayoutCachedTop =7343
                    LayoutCachedWidth =13830
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7740
                    Top =7343
                    Width =345
                    Height =315
                    Name ="Caixa4101"
                    GridlineColor =10921638
                    LayoutCachedLeft =7740
                    LayoutCachedTop =7343
                    LayoutCachedWidth =8085
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14970
                    Top =7343
                    Width =375
                    Height =315
                    Name ="Caixa4102"
                    GridlineColor =10921638
                    LayoutCachedLeft =14970
                    LayoutCachedTop =7343
                    LayoutCachedWidth =15345
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14625
                    Top =7343
                    Width =361
                    Height =315
                    Name ="Caixa4103"
                    GridlineColor =10921638
                    LayoutCachedLeft =14625
                    LayoutCachedTop =7343
                    LayoutCachedWidth =14986
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2715
                    Top =7343
                    Width =1830
                    Height =315
                    Name ="Caixa4104"
                    GridlineColor =10921638
                    LayoutCachedLeft =2715
                    LayoutCachedTop =7343
                    LayoutCachedWidth =4545
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8080
                    Top =7343
                    Width =340
                    Height =315
                    Name ="Caixa4105"
                    GridlineColor =10921638
                    LayoutCachedLeft =8080
                    LayoutCachedTop =7343
                    LayoutCachedWidth =8420
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9490
                    Top =7343
                    Width =345
                    Height =315
                    Name ="Caixa4106"
                    GridlineColor =10921638
                    LayoutCachedLeft =9490
                    LayoutCachedTop =7343
                    LayoutCachedWidth =9835
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15337
                    Top =7343
                    Width =420
                    Height =315
                    Name ="Caixa4107"
                    GridlineColor =10921638
                    LayoutCachedLeft =15337
                    LayoutCachedTop =7343
                    LayoutCachedWidth =15757
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11142
                    Top =7343
                    Width =345
                    Height =315
                    Name ="Caixa4108"
                    GridlineColor =10921638
                    LayoutCachedLeft =11142
                    LayoutCachedTop =7343
                    LayoutCachedWidth =11487
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11481
                    Top =7343
                    Width =1845
                    Height =315
                    Name ="Caixa4109"
                    GridlineColor =10921638
                    LayoutCachedLeft =11481
                    LayoutCachedTop =7343
                    LayoutCachedWidth =13326
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10512
                    Top =7343
                    Width =300
                    Height =315
                    Name ="Caixa4110"
                    GridlineColor =10921638
                    LayoutCachedLeft =10512
                    LayoutCachedTop =7343
                    LayoutCachedWidth =10812
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10122
                    Top =7343
                    Width =385
                    Height =315
                    Name ="Caixa4111"
                    GridlineColor =10921638
                    LayoutCachedLeft =10122
                    LayoutCachedTop =7343
                    LayoutCachedWidth =10507
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9819
                    Top =7343
                    Width =300
                    Height =315
                    Name ="Caixa4112"
                    GridlineColor =10921638
                    LayoutCachedLeft =9819
                    LayoutCachedTop =7343
                    LayoutCachedWidth =10119
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10800
                    Top =7343
                    Width =345
                    Height =315
                    Name ="Caixa4113"
                    GridlineColor =10921638
                    LayoutCachedLeft =10800
                    LayoutCachedTop =7343
                    LayoutCachedWidth =11145
                    LayoutCachedHeight =7658
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    TextAlign =1
                    Top =7080
                    Width =16290
                    Height =240
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4114"
                    Caption ="Data:  _______________________________   NOME: _________________________________"
                        "________________________________________________________________________________"
                        "____________________________________________"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =7080
                    LayoutCachedWidth =16290
                    LayoutCachedHeight =7320
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =8168
                    Width =16221
                    Name ="Linha4115"
                    GridlineColor =10921638
                    LayoutCachedTop =8168
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =8168
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =7823
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4116"
                    Caption ="OBS.: __________________________________________________________________________"
                        "________________________________________________________________________________"
                        "_____________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =7823
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =8093
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =5760
                    Width =16221
                    Name ="Linha4142"
                    GridlineColor =10921638
                    LayoutCachedTop =5760
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =5760
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =8910
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4143"
                    Caption ="6"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =8910
                    LayoutCachedWidth =285
                    LayoutCachedHeight =9195
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =9205
                    Top =8528
                    Width =300
                    Height =315
                    Name ="Caixa4144"
                    GridlineColor =10921638
                    LayoutCachedLeft =9205
                    LayoutCachedTop =8528
                    LayoutCachedWidth =9505
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8754
                    Top =8528
                    Width =445
                    Height =315
                    Name ="Caixa4145"
                    GridlineColor =10921638
                    LayoutCachedLeft =8754
                    LayoutCachedTop =8528
                    LayoutCachedWidth =9199
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8422
                    Top =8528
                    Width =330
                    Height =315
                    Name ="Caixa4146"
                    GridlineColor =10921638
                    LayoutCachedLeft =8422
                    LayoutCachedTop =8528
                    LayoutCachedWidth =8752
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =4515
                    Top =8528
                    Width =1590
                    Height =315
                    Name ="Caixa4147"
                    GridlineColor =10921638
                    LayoutCachedLeft =4515
                    LayoutCachedTop =8528
                    LayoutCachedWidth =6105
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =6105
                    Top =8528
                    Width =1635
                    Height =315
                    Name ="Caixa4148"
                    GridlineColor =10921638
                    LayoutCachedLeft =6105
                    LayoutCachedTop =8528
                    LayoutCachedWidth =7740
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15750
                    Top =8528
                    Width =525
                    Height =315
                    Name ="Caixa4149"
                    GridlineColor =10921638
                    LayoutCachedLeft =15750
                    LayoutCachedTop =8528
                    LayoutCachedWidth =16275
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14175
                    Top =8528
                    Width =450
                    Height =315
                    Name ="Caixa4150"
                    GridlineColor =10921638
                    LayoutCachedLeft =14175
                    LayoutCachedTop =8528
                    LayoutCachedWidth =14625
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13830
                    Top =8528
                    Width =346
                    Height =315
                    Name ="Caixa4151"
                    GridlineColor =10921638
                    LayoutCachedLeft =13830
                    LayoutCachedTop =8528
                    LayoutCachedWidth =14176
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13320
                    Top =8528
                    Width =510
                    Height =315
                    Name ="Caixa4152"
                    GridlineColor =10921638
                    LayoutCachedLeft =13320
                    LayoutCachedTop =8528
                    LayoutCachedWidth =13830
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =7740
                    Top =8528
                    Width =345
                    Height =315
                    Name ="Caixa4153"
                    GridlineColor =10921638
                    LayoutCachedLeft =7740
                    LayoutCachedTop =8528
                    LayoutCachedWidth =8085
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14970
                    Top =8528
                    Width =375
                    Height =315
                    Name ="Caixa4154"
                    GridlineColor =10921638
                    LayoutCachedLeft =14970
                    LayoutCachedTop =8528
                    LayoutCachedWidth =15345
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14625
                    Top =8528
                    Width =361
                    Height =315
                    Name ="Caixa4155"
                    GridlineColor =10921638
                    LayoutCachedLeft =14625
                    LayoutCachedTop =8528
                    LayoutCachedWidth =14986
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2715
                    Top =8528
                    Width =1830
                    Height =315
                    Name ="Caixa4156"
                    GridlineColor =10921638
                    LayoutCachedLeft =2715
                    LayoutCachedTop =8528
                    LayoutCachedWidth =4545
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8080
                    Top =8528
                    Width =340
                    Height =315
                    Name ="Caixa4157"
                    GridlineColor =10921638
                    LayoutCachedLeft =8080
                    LayoutCachedTop =8528
                    LayoutCachedWidth =8420
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9490
                    Top =8528
                    Width =345
                    Height =315
                    Name ="Caixa4158"
                    GridlineColor =10921638
                    LayoutCachedLeft =9490
                    LayoutCachedTop =8528
                    LayoutCachedWidth =9835
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15337
                    Top =8528
                    Width =420
                    Height =315
                    Name ="Caixa4159"
                    GridlineColor =10921638
                    LayoutCachedLeft =15337
                    LayoutCachedTop =8528
                    LayoutCachedWidth =15757
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11142
                    Top =8528
                    Width =345
                    Height =315
                    Name ="Caixa4160"
                    GridlineColor =10921638
                    LayoutCachedLeft =11142
                    LayoutCachedTop =8528
                    LayoutCachedWidth =11487
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11481
                    Top =8528
                    Width =1845
                    Height =315
                    Name ="Caixa4161"
                    GridlineColor =10921638
                    LayoutCachedLeft =11481
                    LayoutCachedTop =8528
                    LayoutCachedWidth =13326
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10512
                    Top =8528
                    Width =300
                    Height =315
                    Name ="Caixa4162"
                    GridlineColor =10921638
                    LayoutCachedLeft =10512
                    LayoutCachedTop =8528
                    LayoutCachedWidth =10812
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10122
                    Top =8528
                    Width =385
                    Height =315
                    Name ="Caixa4163"
                    GridlineColor =10921638
                    LayoutCachedLeft =10122
                    LayoutCachedTop =8528
                    LayoutCachedWidth =10507
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9819
                    Top =8528
                    Width =300
                    Height =315
                    Name ="Caixa4164"
                    GridlineColor =10921638
                    LayoutCachedLeft =9819
                    LayoutCachedTop =8528
                    LayoutCachedWidth =10119
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10800
                    Top =8528
                    Width =345
                    Height =315
                    Name ="Caixa4165"
                    GridlineColor =10921638
                    LayoutCachedLeft =10800
                    LayoutCachedTop =8528
                    LayoutCachedWidth =11145
                    LayoutCachedHeight =8843
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    TextAlign =1
                    Top =8265
                    Width =16290
                    Height =240
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4166"
                    Caption ="Data:  _______________________________   NOME: _________________________________"
                        "________________________________________________________________________________"
                        "____________________________________________"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =8265
                    LayoutCachedWidth =16290
                    LayoutCachedHeight =8505
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =9008
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4167"
                    Caption ="OBS.: __________________________________________________________________________"
                        "________________________________________________________________________________"
                        "_____________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =9008
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =9278
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =9345
                    Width =16221
                    Name ="Linha4168"
                    GridlineColor =10921638
                    LayoutCachedTop =9345
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =9345
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =12833
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4169"
                    Caption ="1"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =12833
                    LayoutCachedWidth =285
                    LayoutCachedHeight =13118
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =12180
                    Width =16221
                    Name ="Linha4217"
                    GridlineColor =10921638
                    LayoutCachedTop =12180
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =12180
                End
                Begin Line
                    BorderWidth =2
                    Top =13403
                    Width =16221
                    Name ="Linha4218"
                    GridlineColor =10921638
                    LayoutCachedTop =13403
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =13403
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =12360
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4219"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =12360
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =12630
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =14250
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4220"
                    Caption ="2"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =14250
                    LayoutCachedWidth =285
                    LayoutCachedHeight =14535
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =14693
                    Width =16221
                    Name ="Linha4244"
                    GridlineColor =10921638
                    LayoutCachedTop =14693
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =14693
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =15480
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4246"
                    Caption ="3"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =15480
                    LayoutCachedWidth =285
                    LayoutCachedHeight =15765
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =16493
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4271"
                    Caption ="4"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =16493
                    LayoutCachedWidth =285
                    LayoutCachedHeight =16778
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =17063
                    Width =16221
                    Name ="Linha4295"
                    GridlineColor =10921638
                    LayoutCachedTop =17063
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =17063
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =17880
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4297"
                    Caption ="5"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =17880
                    LayoutCachedWidth =285
                    LayoutCachedHeight =18165
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =18323
                    Width =16221
                    Name ="Linha4321"
                    GridlineColor =10921638
                    LayoutCachedTop =18323
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =18323
                End
                Begin Line
                    BorderWidth =2
                    Top =15915
                    Width =16221
                    Name ="Linha4323"
                    GridlineColor =10921638
                    LayoutCachedTop =15915
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =15915
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =105
                    Top =19065
                    Width =180
                    Height =285
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo4324"
                    Caption ="6"
                    GridlineColor =10921638
                    LayoutCachedLeft =105
                    LayoutCachedTop =19065
                    LayoutCachedWidth =285
                    LayoutCachedHeight =19350
                    ForeTint =100.0
                End
                Begin Line
                    BorderWidth =2
                    Top =19500
                    Width =16221
                    Name ="Linha4349"
                    GridlineColor =10921638
                    LayoutCachedTop =19500
                    LayoutCachedWidth =16221
                    LayoutCachedHeight =19500
                End
                Begin Label
                    TextAlign =2
                    Top =11295
                    Width =16155
                    Height =345
                    FontSize =14
                    BorderColor =8355711
                    Name ="Rótulo4350"
                    Caption ="DESDOBRAMENTOS - DEMANDAS"
                    GridlineColor =10921638
                    LayoutCachedTop =11295
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =11640
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =12705
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4351"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =12705
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =12975
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =13080
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4352"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =13080
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =13350
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =13650
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4353"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =13650
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =13920
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =13995
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4354"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =13995
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =14265
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =14370
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4355"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =14370
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =14640
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =14865
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4356"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =14865
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =15135
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =15210
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4357"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =15210
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =15480
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =15585
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4358"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =15585
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =15855
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =16050
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4359"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =16050
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =16320
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =16395
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4360"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =16395
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =16665
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =16770
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4361"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =16770
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =17040
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =17265
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4362"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =17265
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =17535
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =17610
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4363"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =17610
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =17880
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =17985
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4364"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =17985
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =18255
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =18450
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4365"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =18450
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =18720
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =18795
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4366"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =18795
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =19065
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =570
                    Top =19170
                    Width =15585
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo4367"
                    Caption ="________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =19170
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =19440
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Top =9465
                    Width =16155
                    Height =270
                    FontSize =8
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo1576"
                    Caption ="FAVOR PREENCHER OS NOMES DOS USUÁRIOS SEM ABREVIAÇÕES"
                    Tag ="DetachedLabel"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =9465
                    LayoutCachedWidth =16155
                    LayoutCachedHeight =9735
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =4
                    TextAlign =1
                    Top =105
                    Width =7785
                    Height =270
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Técnico de Referência_Rótulo"
                    Caption ="NOME DO SERVIDOR:   ____________________________________________________________"
                        "______"
                    Tag ="DetachedLabel"
                    EventProcPrefix ="Técnico_de_Referência_Rótulo"
                    GridlineStyleBottom =1
                    GridlineColor =10921638
                    LayoutCachedTop =105
                    LayoutCachedWidth =7785
                    LayoutCachedHeight =375
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
