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
    Width =16157
    DatasheetFontHeight =11
    ItemSuffix =274
    Left =5190
    Top =2760
    RecSrcDt = Begin
        0x9265240cf5c8e540
    End
    RecordSource ="LISTA-INTERNA-PRESENÇA-ENTREGA-KITS"
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
            ControlSource ="NomePessoa"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin PageHeader
            Height =2670
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =1
                    Left =5550
                    Width =5385
                    Height =390
                    FontSize =13
                    BorderColor =8355711
                    Name ="Rótulo38"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL "
                    GridlineColor =-2147483609
                    LayoutCachedLeft =5550
                    LayoutCachedWidth =10935
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
                    Left =5550
                    Top =510
                    Width =5391
                    Height =315
                    FontSize =13
                    FontWeight =700
                    BorderColor =10921638
                    Name ="CRAS"
                    ControlSource ="TbUnidade.NOME"
                    RowSourceType ="Value List"
                    ColumnWidths ="1443"
                    GridlineColor =10921638

                    LayoutCachedLeft =5550
                    LayoutCachedTop =510
                    LayoutCachedWidth =10941
                    LayoutCachedHeight =825
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =285
                    Top =2025
                    Width =15465
                    Height =315
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo16"
                    Caption ="DATA: __________/___________/_____________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =2025
                    LayoutCachedWidth =15750
                    LayoutCachedHeight =2340
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =2320
                    Top =1637
                    Width =12045
                    Height =345
                    FontSize =12
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo228"
                    Caption ="ENTREGA DE ___________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =2320
                    LayoutCachedTop =1637
                    LayoutCachedWidth =14365
                    LayoutCachedHeight =1982
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =6166
                    Top =1140
                    Width =4350
                    Height =390
                    FontSize =14
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo229"
                    Caption ="LISTA DE PRESENÇA - SCFV INTERNO"
                    GridlineColor =10921638
                    LayoutCachedLeft =6166
                    LayoutCachedTop =1140
                    LayoutCachedWidth =10516
                    LayoutCachedHeight =1530
                    ForeTint =100.0
                End
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Width =5220
                    Height =1140
                    BorderColor =16777215
                    Name ="LOGO"
                    ControlSource ="LOGO"
                    GridlineColor =10921638
                    TabIndex =1

                    LayoutCachedWidth =5220
                    LayoutCachedHeight =1140
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =810
                    Top =2385
                    Width =3045
                    Height =285
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo259"
                    Caption ="NOME DA CRIANÇA"
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =810
                    LayoutCachedTop =2385
                    LayoutCachedWidth =3855
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =4365
                    Top =2385
                    Width =3195
                    Height =285
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo261"
                    Caption ="NOME DO RESPONSAVEL"
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =4365
                    LayoutCachedTop =2385
                    LayoutCachedWidth =7560
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =8895
                    Top =2385
                    Width =1311
                    Height =285
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo264"
                    Caption ="RG DO RESP "
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =8895
                    LayoutCachedTop =2385
                    LayoutCachedWidth =10206
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =7545
                    Top =2385
                    Width =1356
                    Height =285
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo263"
                    Caption ="CPF DO RESP "
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =7545
                    LayoutCachedTop =2385
                    LayoutCachedWidth =8901
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =1
                    TextFontFamily =18
                    Left =10215
                    Top =2385
                    Width =5085
                    Height =285
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo265"
                    Caption ="REPRESENTANTE / RG/ CPF "
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =10215
                    LayoutCachedTop =2385
                    LayoutCachedWidth =15300
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =15300
                    Top =2385
                    Width =840
                    Height =285
                    FontSize =7
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo267"
                    Caption ="PRESENTE"
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =15300
                    LayoutCachedTop =2385
                    LayoutCachedWidth =16140
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    TextFontFamily =18
                    Left =12660
                    Top =2400
                    Width =2685
                    Height =240
                    FontSize =8
                    BorderColor =8355711
                    Name ="Rótulo269"
                    Caption ="(Em caso de ausência do Responsável)"
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =12660
                    LayoutCachedTop =2400
                    LayoutCachedWidth =15345
                    LayoutCachedHeight =2640
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =3855
                    Top =2385
                    Width =525
                    Height =285
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo273"
                    Caption ="Idade"
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =3855
                    LayoutCachedTop =2385
                    LayoutCachedWidth =4380
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =285
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =810
                    Width =3041
                    Height =285
                    ColumnWidth =3180
                    FontSize =8
                    ForeColor =4210752
                    Name ="PrincipalSCFVExterno.NOME"
                    ControlSource ="NomePessoa"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    FontName ="Times New Roman"
                    EventProcPrefix ="PrincipalSCFVExterno_NOME"
                    GridlineColor =10921638

                    LayoutCachedLeft =810
                    LayoutCachedWidth =3851
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =4365
                    Width =3195
                    Height =285
                    ColumnWidth =3180
                    FontSize =8
                    TabIndex =1
                    ForeColor =4210752
                    Name ="CS RESPONSAVEL FAMILIAR.NOME"
                    ControlSource ="RESPONSAVEL"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    FontName ="Times New Roman"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_NOME"
                    GridlineColor =10921638

                    LayoutCachedLeft =4365
                    LayoutCachedWidth =7560
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =7545
                    Width =1356
                    Height =285
                    FontSize =8
                    TabIndex =2
                    ForeColor =4210752
                    Name ="CPF"
                    ControlSource ="CPF"
                    FontName ="Times New Roman"
                    InputMask ="000\\.000\\.000\\-00;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =7545
                    LayoutCachedWidth =8901
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =8895
                    Width =1311
                    Height =285
                    FontSize =8
                    TabIndex =3
                    ForeColor =4210752
                    Name ="RG"
                    ControlSource ="RG"
                    FontName ="Times New Roman"
                    GridlineColor =10921638

                    LayoutCachedLeft =8895
                    LayoutCachedWidth =10206
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
                Begin Rectangle
                    Left =10215
                    Width =5085
                    Height =285
                    Name ="Caixa266"
                    GridlineColor =10921638
                    LayoutCachedLeft =10215
                    LayoutCachedWidth =15300
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15303
                    Width =840
                    Height =285
                    Name ="Caixa268"
                    GridlineColor =10921638
                    LayoutCachedLeft =15303
                    LayoutCachedWidth =16143
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =3855
                    Width =525
                    Height =285
                    FontSize =8
                    TabIndex =4
                    Name ="Idade"
                    ControlSource ="Idade"
                    FontName ="Times New Roman"
                    GridlineColor =10921638

                    LayoutCachedLeft =3855
                    LayoutCachedWidth =4380
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
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
            Height =485
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =4
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =810
                    Top =5
                    Width =3041
                    Height =315
                    FontSize =8
                    ForeColor =4210752
                    Name ="AccessTotalsPrincipalSCFVExterno.NOME"
                    ControlSource ="=Count([NomePessoa])"
                    FontName ="Times New Roman"
                    EventProcPrefix ="AccessTotalsPrincipalSCFVExterno_NOME"
                    ControlTipText ="NomePessoa Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =810
                    LayoutCachedTop =5
                    LayoutCachedWidth =3851
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
            End
        End
    End
End
