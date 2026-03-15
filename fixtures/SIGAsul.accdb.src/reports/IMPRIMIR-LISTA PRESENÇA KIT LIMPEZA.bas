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
    Left =4590
    Top =2415
    RecSrcDt = Begin
        0xedce28da12ace540
    End
    RecordSource ="LISTA-PRESENÇA-ENTREGA-KITS"
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
            GroupHeader = NotDefault
            KeepTogether =1
            ControlSource ="UNIDADE"
        End
        Begin BreakLevel
            KeepTogether =1
            ControlSource ="PrincipalSCFVExterno.NOME"
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
                    Left =3429
                    Top =1140
                    Width =9825
                    Height =390
                    FontSize =14
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo229"
                    Caption ="LISTA DE PRESENÇA - SCFV EXTERNO"
                    GridlineColor =10921638
                    LayoutCachedLeft =3429
                    LayoutCachedTop =1140
                    LayoutCachedWidth =13254
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
                    Left =570
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
                    LayoutCachedLeft =570
                    LayoutCachedTop =2385
                    LayoutCachedWidth =3615
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
                    Left =4125
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
                    LayoutCachedLeft =4125
                    LayoutCachedTop =2385
                    LayoutCachedWidth =7320
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
                    Left =8655
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
                    LayoutCachedLeft =8655
                    LayoutCachedTop =2385
                    LayoutCachedWidth =9966
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
                    Left =7305
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
                    LayoutCachedLeft =7305
                    LayoutCachedTop =2385
                    LayoutCachedWidth =8661
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
                    Left =9975
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
                    LayoutCachedLeft =9975
                    LayoutCachedTop =2385
                    LayoutCachedWidth =15060
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
                    Left =15060
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
                    LayoutCachedLeft =15060
                    LayoutCachedTop =2385
                    LayoutCachedWidth =15900
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    TextFontFamily =18
                    Left =12420
                    Top =2400
                    Width =2685
                    Height =240
                    FontSize =8
                    BorderColor =8355711
                    Name ="Rótulo269"
                    Caption ="(Em caso de ausência do Responsável)"
                    FontName ="Times New Roman"
                    GridlineColor =10921638
                    LayoutCachedLeft =12420
                    LayoutCachedTop =2400
                    LayoutCachedWidth =15105
                    LayoutCachedHeight =2640
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =3615
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
                    LayoutCachedLeft =3615
                    LayoutCachedTop =2385
                    LayoutCachedWidth =4140
                    LayoutCachedHeight =2670
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            RepeatSection = NotDefault
            Height =450
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ComboBox
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    IMESentenceMode =3
                    ListWidth =1442
                    Left =2835
                    Width =8511
                    Height =450
                    FontSize =15
                    FontWeight =700
                    BorderColor =10921638
                    ForeColor =255
                    Name ="UNIDADE"
                    ControlSource ="UNIDADE"
                    RowSourceType ="Value List"
                    RowSource ="CASA DA CRIANÇA ÂNCORA;CASA DA CRIANÇA C.PRAIANA;CIC APRENDIZ DE FUTURO;CIC DR G"
                        "ILBERTOSOBRAL"
                    ColumnWidths ="1986"
                    GridlineColor =10921638

                    LayoutCachedLeft =2835
                    LayoutCachedWidth =11346
                    LayoutCachedHeight =450
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                End
                Begin Label
                    Left =56
                    Width =2775
                    Height =450
                    FontSize =15
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo272"
                    Caption ="NOME DA UNIDADE: "
                    GridlineColor =10921638
                    LayoutCachedLeft =56
                    LayoutCachedWidth =2831
                    LayoutCachedHeight =450
                End
                Begin TextBox
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =11338
                    Width =1266
                    Height =450
                    FontSize =15
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =255
                    Name ="AccessTotalsUNIDADE"
                    ControlSource ="=Count([UNIDADE])"
                    ControlTipText ="UNIDADE Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =11338
                    LayoutCachedWidth =12604
                    LayoutCachedHeight =450
                    ForeThemeColorIndex =-1
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
                    Left =570
                    Width =3041
                    Height =285
                    ColumnWidth =3180
                    FontSize =8
                    ForeColor =4210752
                    Name ="PrincipalSCFVExterno.NOME"
                    ControlSource ="PrincipalSCFVExterno.NOME"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    FontName ="Times New Roman"
                    EventProcPrefix ="PrincipalSCFVExterno_NOME"
                    GridlineColor =10921638

                    LayoutCachedLeft =570
                    LayoutCachedWidth =3611
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =4125
                    Width =3195
                    Height =285
                    ColumnWidth =3180
                    FontSize =8
                    TabIndex =1
                    ForeColor =4210752
                    Name ="CS RESPONSAVEL FAMILIAR.NOME"
                    ControlSource ="[CS RESPONSAVEL FAMILIAR].NOME"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    FontName ="Times New Roman"
                    EventProcPrefix ="CS_RESPONSAVEL_FAMILIAR_NOME"
                    GridlineColor =10921638

                    LayoutCachedLeft =4125
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =7305
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

                    LayoutCachedLeft =7305
                    LayoutCachedWidth =8661
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =8655
                    Width =1311
                    Height =285
                    FontSize =8
                    TabIndex =3
                    ForeColor =4210752
                    Name ="RG"
                    ControlSource ="RG"
                    FontName ="Times New Roman"
                    GridlineColor =10921638

                    LayoutCachedLeft =8655
                    LayoutCachedWidth =9966
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
                Begin Rectangle
                    Left =9975
                    Width =5085
                    Height =285
                    Name ="Caixa266"
                    GridlineColor =10921638
                    LayoutCachedLeft =9975
                    LayoutCachedWidth =15060
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =15063
                    Width =840
                    Height =285
                    Name ="Caixa268"
                    GridlineColor =10921638
                    LayoutCachedLeft =15063
                    LayoutCachedWidth =15903
                    LayoutCachedHeight =285
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =3615
                    Width =525
                    Height =285
                    FontSize =8
                    TabIndex =4
                    Name ="Idade"
                    ControlSource ="Idade"
                    FontName ="Times New Roman"
                    GridlineColor =10921638

                    LayoutCachedLeft =3615
                    LayoutCachedWidth =4140
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
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =570
                    Width =3041
                    Height =315
                    FontSize =9
                    FontWeight =700
                    ForeColor =4210752
                    Name ="AccessTotalsPrincipalSCFVExterno.NOME"
                    ControlSource ="=Count([PrincipalSCFVExterno].[NOME])"
                    FontName ="Times New Roman"
                    EventProcPrefix ="AccessTotalsPrincipalSCFVExterno_NOME"
                    ControlTipText ="PrincipalSCFVExterno.NOME Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =570
                    LayoutCachedWidth =3611
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                End
            End
        End
    End
End
