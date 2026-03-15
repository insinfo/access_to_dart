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
    Width =15850
    DatasheetFontHeight =11
    ItemSuffix =76
    Left =3675
    Top =2505
    RecSrcDt = Begin
        0x053fd217baa6e540
    End
    RecordSource ="DIARIO OFICINA SOCIOEDUC"
    Caption ="DIARIO 6 ANOS ATIV_ARTES"
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
            ControlSource ="[DIARIO CS OFICINA SOCIOEDUC].Nome"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin PageHeader
            Height =3105
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =5610
                    Top =855
                    Width =4905
                    Height =405
                    FontSize =15
                    BorderColor =8355711
                    Name ="Rótulo160"
                    Caption ="DIÁRIO - OFICINA SOCIOEDUCATIVA "
                    FontName ="Cambria"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =5610
                    LayoutCachedTop =855
                    LayoutCachedWidth =10515
                    LayoutCachedHeight =1260
                    ThemeFontIndex =-1
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    TextAlign =1
                    Left =5610
                    Width =6825
                    Height =390
                    FontSize =14
                    BorderColor =8355711
                    Name ="Rótulo38"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL                  "
                    GridlineColor =-2147483609
                    LayoutCachedLeft =5610
                    LayoutCachedWidth =12435
                    LayoutCachedHeight =390
                    ForeTint =100.0
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
                    Left =5610
                    Top =390
                    Width =4761
                    Height =420
                    ColumnOrder =2
                    FontSize =14
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CRAS"
                    ControlSource ="TbUnidade.Nome"
                    RowSourceType ="Value List"
                    RowSource ="Central;Sul;Norte;Rocha Leão"
                    ColumnWidths ="1446"
                    GridlineColor =10921638

                    LayoutCachedLeft =5610
                    LayoutCachedTop =390
                    LayoutCachedWidth =10371
                    LayoutCachedHeight =810
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Left =5610
                    Top =1305
                    Width =4485
                    Height =375
                    FontSize =14
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo43"
                    Caption ="Mês/Ano: ______________________________"
                    FontName ="Cambria"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =5610
                    LayoutCachedTop =1305
                    LayoutCachedWidth =10095
                    LayoutCachedHeight =1680
                    ThemeFontIndex =-1
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =6975
                    Top =1305
                    Width =2621
                    Height =315
                    ColumnOrder =0
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto49"
                    ControlSource ="Mês/Ano"
                    GridlineColor =10921638

                    LayoutCachedLeft =6975
                    LayoutCachedTop =1305
                    LayoutCachedWidth =9596
                    LayoutCachedHeight =1620
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8775
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo6"
                    Caption ="01"
                    GridlineColor =10921638
                    LayoutCachedLeft =8775
                    LayoutCachedTop =2595
                    LayoutCachedWidth =9015
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9013
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo21"
                    Caption ="02"
                    GridlineColor =10921638
                    LayoutCachedLeft =9013
                    LayoutCachedTop =2595
                    LayoutCachedWidth =9253
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9240
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo22"
                    Caption ="03"
                    GridlineColor =10921638
                    LayoutCachedLeft =9240
                    LayoutCachedTop =2595
                    LayoutCachedWidth =9480
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9448
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo23"
                    Caption ="04"
                    GridlineColor =10921638
                    LayoutCachedLeft =9448
                    LayoutCachedTop =2595
                    LayoutCachedWidth =9688
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9693
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo24"
                    Caption ="05"
                    GridlineColor =10921638
                    LayoutCachedLeft =9693
                    LayoutCachedTop =2595
                    LayoutCachedWidth =9933
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9935
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo25"
                    Caption ="06"
                    GridlineColor =10921638
                    LayoutCachedLeft =9935
                    LayoutCachedTop =2595
                    LayoutCachedWidth =10175
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10162
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo26"
                    Caption ="07"
                    GridlineColor =10921638
                    LayoutCachedLeft =10162
                    LayoutCachedTop =2595
                    LayoutCachedWidth =10402
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10388
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo27"
                    Caption ="08"
                    GridlineColor =10921638
                    LayoutCachedLeft =10388
                    LayoutCachedTop =2595
                    LayoutCachedWidth =10628
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10615
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo28"
                    Caption ="09"
                    GridlineColor =10921638
                    LayoutCachedLeft =10615
                    LayoutCachedTop =2595
                    LayoutCachedWidth =10855
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10842
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo30"
                    Caption ="10"
                    GridlineColor =10921638
                    LayoutCachedLeft =10842
                    LayoutCachedTop =2595
                    LayoutCachedWidth =11082
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11069
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo31"
                    Caption ="11"
                    GridlineColor =10921638
                    LayoutCachedLeft =11069
                    LayoutCachedTop =2595
                    LayoutCachedWidth =11309
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11295
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo32"
                    Caption ="12"
                    GridlineColor =10921638
                    LayoutCachedLeft =11295
                    LayoutCachedTop =2595
                    LayoutCachedWidth =11535
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11522
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo33"
                    Caption ="13"
                    GridlineColor =10921638
                    LayoutCachedLeft =11522
                    LayoutCachedTop =2595
                    LayoutCachedWidth =11762
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11749
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo34"
                    Caption ="14"
                    GridlineColor =10921638
                    LayoutCachedLeft =11749
                    LayoutCachedTop =2595
                    LayoutCachedWidth =11989
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11985
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo35"
                    Caption ="15"
                    GridlineColor =10921638
                    LayoutCachedLeft =11985
                    LayoutCachedTop =2595
                    LayoutCachedWidth =12225
                    LayoutCachedHeight =3105
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
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo36"
                    Caption ="16"
                    GridlineColor =10921638
                    LayoutCachedLeft =12210
                    LayoutCachedTop =2595
                    LayoutCachedWidth =12450
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12421
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo37"
                    Caption ="17"
                    GridlineColor =10921638
                    LayoutCachedLeft =12421
                    LayoutCachedTop =2595
                    LayoutCachedWidth =12661
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12660
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo39"
                    Caption ="18"
                    GridlineColor =10921638
                    LayoutCachedLeft =12660
                    LayoutCachedTop =2595
                    LayoutCachedWidth =12900
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12886
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo40"
                    Caption ="19"
                    GridlineColor =10921638
                    LayoutCachedLeft =12886
                    LayoutCachedTop =2595
                    LayoutCachedWidth =13126
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13113
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo41"
                    Caption ="20"
                    GridlineColor =10921638
                    LayoutCachedLeft =13113
                    LayoutCachedTop =2595
                    LayoutCachedWidth =13353
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13340
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo42"
                    Caption ="21"
                    GridlineColor =10921638
                    LayoutCachedLeft =13340
                    LayoutCachedTop =2595
                    LayoutCachedWidth =13580
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13567
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo44"
                    Caption ="22"
                    GridlineColor =10921638
                    LayoutCachedLeft =13567
                    LayoutCachedTop =2595
                    LayoutCachedWidth =13807
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13778
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo45"
                    Caption ="23"
                    GridlineColor =10921638
                    LayoutCachedLeft =13778
                    LayoutCachedTop =2595
                    LayoutCachedWidth =14018
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14020
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo46"
                    Caption ="24"
                    GridlineColor =10921638
                    LayoutCachedLeft =14020
                    LayoutCachedTop =2595
                    LayoutCachedWidth =14260
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14247
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo47"
                    Caption ="25"
                    GridlineColor =10921638
                    LayoutCachedLeft =14247
                    LayoutCachedTop =2595
                    LayoutCachedWidth =14487
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14474
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo48"
                    Caption ="26"
                    GridlineColor =10921638
                    LayoutCachedLeft =14474
                    LayoutCachedTop =2595
                    LayoutCachedWidth =14714
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14700
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo49"
                    Caption ="27"
                    GridlineColor =10921638
                    LayoutCachedLeft =14700
                    LayoutCachedTop =2595
                    LayoutCachedWidth =14940
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14927
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo50"
                    Caption ="28"
                    GridlineColor =10921638
                    LayoutCachedLeft =14927
                    LayoutCachedTop =2595
                    LayoutCachedWidth =15167
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =15154
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo51"
                    Caption ="29"
                    GridlineColor =10921638
                    LayoutCachedLeft =15154
                    LayoutCachedTop =2595
                    LayoutCachedWidth =15394
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =15378
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo52"
                    Caption ="30"
                    GridlineColor =10921638
                    LayoutCachedLeft =15378
                    LayoutCachedTop =2595
                    LayoutCachedWidth =15618
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =15600
                    Top =2595
                    Width =240
                    Height =510
                    FontSize =8
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo68"
                    Caption ="31"
                    GridlineColor =10921638
                    LayoutCachedLeft =15600
                    LayoutCachedTop =2595
                    LayoutCachedWidth =15840
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =323
                    Top =2595
                    Width =6120
                    Height =510
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo54"
                    Caption ="NOME"
                    GridlineColor =10921638
                    LayoutCachedLeft =323
                    LayoutCachedTop =2595
                    LayoutCachedWidth =6443
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6431
                    Top =2595
                    Width =2346
                    Height =510
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo57"
                    Caption ="TELEFONE"
                    GridlineColor =10921638
                    LayoutCachedLeft =6431
                    LayoutCachedTop =2595
                    LayoutCachedWidth =8777
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =1440
                    Left =1071
                    Top =1757
                    Width =6576
                    Height =315
                    FontWeight =700
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Oficineiro"
                    ControlSource ="NomeOrientador"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =1071
                    LayoutCachedTop =1757
                    LayoutCachedWidth =7647
                    LayoutCachedHeight =2072
                    Begin
                        Begin Label
                            Top =1757
                            Width =1065
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo69"
                            Caption ="Oficineiro"
                            GridlineColor =10921638
                            LayoutCachedTop =1757
                            LayoutCachedWidth =1065
                            LayoutCachedHeight =2072
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =1656
                    Top =2154
                    Width =1761
                    Height =315
                    FontWeight =700
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Combinação71"
                    ControlSource ="Dia"
                    RowSourceType ="Value List"
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =1656
                    LayoutCachedTop =2154
                    LayoutCachedWidth =3417
                    LayoutCachedHeight =2469
                    Begin
                        Begin Label
                            Left =15
                            Top =2154
                            Width =1650
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo72"
                            Caption ="DIA DA SEMANA"
                            GridlineColor =10921638
                            LayoutCachedLeft =15
                            LayoutCachedTop =2154
                            LayoutCachedWidth =1665
                            LayoutCachedHeight =2469
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =4594
                    Top =2154
                    Width =2451
                    Height =315
                    FontWeight =700
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="HORARIO"
                    ControlSource ="Horario"
                    RowSourceType ="Value List"
                    RowSource ="\"8H\";\"9H\";\"10H\";\"11H\";\"13H\";\"14H\";\"15H\""
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =4594
                    LayoutCachedTop =2154
                    LayoutCachedWidth =7045
                    LayoutCachedHeight =2469
                    Begin
                        Begin Label
                            Left =3643
                            Top =2154
                            Width =1020
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo73"
                            Caption ="HORARIO"
                            GridlineColor =10921638
                            LayoutCachedLeft =3643
                            LayoutCachedTop =2154
                            LayoutCachedWidth =4663
                            LayoutCachedHeight =2469
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Top =2595
                    Width =345
                    Height =510
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo29"
                    Caption ="Nº"
                    GridlineColor =10921638
                    LayoutCachedTop =2595
                    LayoutCachedWidth =345
                    LayoutCachedHeight =3105
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =8451
                    Top =1755
                    Width =4746
                    Height =315
                    FontWeight =700
                    TabIndex =5
                    BorderColor =10921638
                    Name ="Grupo"
                    ControlSource ="Grupo"
                    GridlineColor =10921638

                    LayoutCachedLeft =8451
                    LayoutCachedTop =1755
                    LayoutCachedWidth =13197
                    LayoutCachedHeight =2070
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =7755
                            Top =1755
                            Width =630
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo74"
                            Caption ="Grupo"
                            GridlineColor =10921638
                            LayoutCachedLeft =7755
                            LayoutCachedTop =1755
                            LayoutCachedWidth =8385
                            LayoutCachedHeight =2070
                        End
                    End
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =13266
                    Top =1757
                    Height =315
                    FontWeight =700
                    TabIndex =6
                    BorderColor =10921638
                    Name ="FxEtaria"
                    ControlSource ="FxEtaria"
                    GridlineColor =10921638

                    LayoutCachedLeft =13266
                    LayoutCachedTop =1757
                    LayoutCachedWidth =14967
                    LayoutCachedHeight =2072
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
                    TabIndex =7

                    LayoutCachedWidth =5445
                    LayoutCachedHeight =1200
                    BorderShade =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =391
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    DecimalPlaces =0
                    RunningSum =2
                    TextAlign =2
                    IMESentenceMode =3
                    Width =345
                    Height =391
                    FontSize =9
                    ForeColor =4210752
                    Name ="numitemtxt"
                    ControlSource ="=1"
                    Format ="#"
                    GridlineColor =10921638

                    LayoutCachedWidth =345
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =8775
                    Width =242
                    Height =391
                    Name ="Caixa11"
                    GridlineColor =10921638
                    LayoutCachedLeft =8775
                    LayoutCachedWidth =9017
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9013
                    Width =242
                    Height =391
                    Name ="Caixa69"
                    GridlineColor =10921638
                    LayoutCachedLeft =9013
                    LayoutCachedWidth =9255
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9240
                    Width =242
                    Height =391
                    Name ="Caixa70"
                    GridlineColor =10921638
                    LayoutCachedLeft =9240
                    LayoutCachedWidth =9482
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9463
                    Width =242
                    Height =391
                    Name ="Caixa71"
                    GridlineColor =10921638
                    LayoutCachedLeft =9463
                    LayoutCachedWidth =9705
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9690
                    Width =242
                    Height =391
                    Name ="Caixa72"
                    GridlineColor =10921638
                    LayoutCachedLeft =9690
                    LayoutCachedWidth =9932
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =9933
                    Width =242
                    Height =391
                    Name ="Caixa73"
                    GridlineColor =10921638
                    LayoutCachedLeft =9933
                    LayoutCachedWidth =10175
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10160
                    Width =242
                    Height =391
                    Name ="Caixa74"
                    GridlineColor =10921638
                    LayoutCachedLeft =10160
                    LayoutCachedWidth =10402
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10386
                    Width =242
                    Height =391
                    Name ="Caixa75"
                    GridlineColor =10921638
                    LayoutCachedLeft =10386
                    LayoutCachedWidth =10628
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10613
                    Width =242
                    Height =391
                    Name ="Caixa76"
                    GridlineColor =10921638
                    LayoutCachedLeft =10613
                    LayoutCachedWidth =10855
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =10840
                    Width =242
                    Height =391
                    Name ="Caixa77"
                    GridlineColor =10921638
                    LayoutCachedLeft =10840
                    LayoutCachedWidth =11082
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11067
                    Width =242
                    Height =391
                    Name ="Caixa78"
                    GridlineColor =10921638
                    LayoutCachedLeft =11067
                    LayoutCachedWidth =11309
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11293
                    Width =242
                    Height =391
                    Name ="Caixa79"
                    GridlineColor =10921638
                    LayoutCachedLeft =11293
                    LayoutCachedWidth =11535
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11520
                    Width =242
                    Height =391
                    Name ="Caixa80"
                    GridlineColor =10921638
                    LayoutCachedLeft =11520
                    LayoutCachedWidth =11762
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11747
                    Width =242
                    Height =391
                    Name ="Caixa81"
                    GridlineColor =10921638
                    LayoutCachedLeft =11747
                    LayoutCachedWidth =11989
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =11983
                    Width =242
                    Height =391
                    Name ="Caixa82"
                    GridlineColor =10921638
                    LayoutCachedLeft =11983
                    LayoutCachedWidth =12225
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12208
                    Width =242
                    Height =391
                    Name ="Caixa83"
                    GridlineColor =10921638
                    LayoutCachedLeft =12208
                    LayoutCachedWidth =12450
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12419
                    Width =242
                    Height =391
                    Name ="Caixa84"
                    GridlineColor =10921638
                    LayoutCachedLeft =12419
                    LayoutCachedWidth =12661
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12658
                    Width =242
                    Height =391
                    Name ="Caixa85"
                    GridlineColor =10921638
                    LayoutCachedLeft =12658
                    LayoutCachedWidth =12900
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =12884
                    Width =242
                    Height =391
                    Name ="Caixa86"
                    GridlineColor =10921638
                    LayoutCachedLeft =12884
                    LayoutCachedWidth =13126
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13111
                    Width =242
                    Height =391
                    Name ="Caixa87"
                    GridlineColor =10921638
                    LayoutCachedLeft =13111
                    LayoutCachedWidth =13353
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13338
                    Width =242
                    Height =391
                    Name ="Caixa88"
                    GridlineColor =10921638
                    LayoutCachedLeft =13338
                    LayoutCachedWidth =13580
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13565
                    Width =242
                    Height =391
                    Name ="Caixa89"
                    GridlineColor =10921638
                    LayoutCachedLeft =13565
                    LayoutCachedWidth =13807
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13761
                    Width =257
                    Height =391
                    Name ="Caixa90"
                    GridlineColor =10921638
                    LayoutCachedLeft =13761
                    LayoutCachedWidth =14018
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14018
                    Width =242
                    Height =391
                    Name ="Caixa91"
                    GridlineColor =10921638
                    LayoutCachedLeft =14018
                    LayoutCachedWidth =14260
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14245
                    Width =242
                    Height =391
                    Name ="Caixa92"
                    GridlineColor =10921638
                    LayoutCachedLeft =14245
                    LayoutCachedWidth =14487
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14472
                    Width =242
                    Height =391
                    Name ="Caixa93"
                    GridlineColor =10921638
                    LayoutCachedLeft =14472
                    LayoutCachedWidth =14714
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14698
                    Width =242
                    Height =391
                    Name ="Caixa94"
                    GridlineColor =10921638
                    LayoutCachedLeft =14698
                    LayoutCachedWidth =14940
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =14925
                    Width =242
                    Height =391
                    Name ="Caixa95"
                    GridlineColor =10921638
                    LayoutCachedLeft =14925
                    LayoutCachedWidth =15167
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15152
                    Width =242
                    Height =391
                    Name ="Caixa96"
                    GridlineColor =10921638
                    LayoutCachedLeft =15152
                    LayoutCachedWidth =15394
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15378
                    Width =240
                    Height =391
                    Name ="Caixa97"
                    GridlineColor =10921638
                    LayoutCachedLeft =15378
                    LayoutCachedWidth =15618
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15613
                    Width =227
                    Height =391
                    Name ="Caixa98"
                    GridlineColor =10921638
                    LayoutCachedLeft =15613
                    LayoutCachedWidth =15840
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =1440
                    Left =346
                    Width =6105
                    Height =391
                    FontSize =8
                    TabIndex =1
                    ForeColor =3484194
                    Name ="TTULAR"
                    ControlSource ="[DIARIO CS OFICINA SOCIOEDUC].Nome"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1442"
                    GridlineColor =10921638

                    LayoutCachedLeft =346
                    LayoutCachedWidth =6451
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6431
                    Width =2346
                    Height =391
                    FontSize =8
                    TabIndex =2
                    ForeColor =4210752
                    Name ="TELEFONE"
                    ControlSource ="Celular"
                    Format ="@"
                    GridlineColor =10921638

                    LayoutCachedLeft =6431
                    LayoutCachedWidth =8777
                    LayoutCachedHeight =391
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
            End
        End
        Begin PageFooter
            Height =558
            Name ="PageFooterSection"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =57
                    Top =228
                    Width =5040
                    Height =330
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto27"
                    ControlSource ="=Now()"
                    Format ="Long Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =57
                    LayoutCachedTop =228
                    LayoutCachedWidth =5097
                    LayoutCachedHeight =558
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =3
                    IMESentenceMode =3
                    Left =6087
                    Top =228
                    Width =5040
                    Height =330
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto28"
                    ControlSource ="=\"Página \" & [Page] & \" de \" & [Pages]"
                    GridlineColor =10921638

                    LayoutCachedLeft =6087
                    LayoutCachedTop =228
                    LayoutCachedWidth =11127
                    LayoutCachedHeight =558
                End
            End
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
