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
    Width =11175
    DatasheetFontHeight =11
    ItemSuffix =191
    Left =4395
    Top =2775
    RecSrcDt = Begin
        0xcb093ce4bba6e540
    End
    RecordSource ="SumUnionEncamMonit"
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
        Begin ListBox
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
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
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
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
            Height =1814
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    Left =5102
                    Top =113
                    Width =6015
                    Height =375
                    FontSize =12
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo183"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL - "
                    GridlineColor =-2147483609
                    LayoutCachedLeft =5102
                    LayoutCachedTop =113
                    LayoutCachedWidth =11117
                    LayoutCachedHeight =488
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =5102
                    Top =510
                    Width =6006
                    Height =390
                    ColumnOrder =1
                    FontSize =13
                    FontWeight =700
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CRAS"
                    ControlSource ="NOME"
                    RowSourceType ="Value List"
                    RowSource ="Norte;Centro;Sul;Rocha Leão"
                    ColumnWidths ="1442"
                    GridlineColor =-2147483609

                    LayoutCachedLeft =5102
                    LayoutCachedTop =510
                    LayoutCachedWidth =11108
                    LayoutCachedHeight =900
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
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
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =5776
                    Top =1303
                    Width =1821
                    Height =315
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto432"
                    ControlSource ="@mês/ano"
                    GridlineColor =10921638

                    LayoutCachedLeft =5776
                    LayoutCachedTop =1303
                    LayoutCachedWidth =7597
                    LayoutCachedHeight =1618
                    Begin
                        Begin Label
                            OverlapFlags =4
                            Left =3685
                            Top =1303
                            Width =2070
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo433"
                            Caption ="PERÍODO (Mês/Ano): "
                            GridlineColor =10921638
                            LayoutCachedLeft =3685
                            LayoutCachedTop =1303
                            LayoutCachedWidth =5755
                            LayoutCachedHeight =1618
                        End
                    End
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =4365
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =690
                    Width =10470
                    Height =390
                    FontSize =13
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo0"
                    Caption ="ENCAMINHAMENTOS"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =690
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =390
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4206
                    Top =750
                    Width =1746
                    Height =315
                    Name ="SomaDeENGOV"
                    ControlSource ="SomaDeENGOV"
                    GridlineColor =10921638

                    LayoutCachedLeft =4206
                    LayoutCachedTop =750
                    LayoutCachedWidth =5952
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =694
                            Top =750
                            Width =3510
                            Height =315
                            Name ="Rótulo139"
                            Caption ="ENTIDADES NÃO GOVERNAMENTAIS"
                            GridlineColor =10921638
                            LayoutCachedLeft =694
                            LayoutCachedTop =750
                            LayoutCachedWidth =4204
                            LayoutCachedHeight =1065
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4206
                    Top =1065
                    Width =1746
                    Height =315
                    TabIndex =1
                    Name ="SomaDeRSASSIS"
                    ControlSource ="SomaDeRSASSIS"
                    GridlineColor =10921638

                    LayoutCachedLeft =4206
                    LayoutCachedTop =1065
                    LayoutCachedWidth =5952
                    LayoutCachedHeight =1380
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =694
                            Top =1065
                            Width =3510
                            Height =315
                            Name ="Rótulo140"
                            Caption ="REDE SOCIOASSISTENCIAL"
                            GridlineColor =10921638
                            LayoutCachedLeft =694
                            LayoutCachedTop =1065
                            LayoutCachedWidth =4204
                            LayoutCachedHeight =1380
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4206
                    Top =1380
                    Width =1746
                    Height =315
                    TabIndex =2
                    Name ="SomaDeREDU"
                    ControlSource ="SomaDeREDU"
                    GridlineColor =10921638

                    LayoutCachedLeft =4206
                    LayoutCachedTop =1380
                    LayoutCachedWidth =5952
                    LayoutCachedHeight =1695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =694
                            Top =1380
                            Width =3510
                            Height =315
                            Name ="Rótulo141"
                            Caption ="REDE DE EDUCAÇÃO"
                            GridlineColor =10921638
                            LayoutCachedLeft =694
                            LayoutCachedTop =1380
                            LayoutCachedWidth =4204
                            LayoutCachedHeight =1695
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4206
                    Top =1695
                    Width =1746
                    Height =315
                    TabIndex =3
                    Name ="SomaDeRSAUD"
                    ControlSource ="SomaDeRSAUD"
                    GridlineColor =10921638

                    LayoutCachedLeft =4206
                    LayoutCachedTop =1695
                    LayoutCachedWidth =5952
                    LayoutCachedHeight =2010
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =694
                            Top =1695
                            Width =3510
                            Height =315
                            Name ="Rótulo142"
                            Caption ="REDE DE SAÚDE"
                            GridlineColor =10921638
                            LayoutCachedLeft =694
                            LayoutCachedTop =1695
                            LayoutCachedWidth =4204
                            LayoutCachedHeight =2010
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4206
                    Top =1995
                    Width =1746
                    Height =315
                    TabIndex =4
                    Name ="SomaDeSFAZ"
                    ControlSource ="SomaDeSFAZ"
                    GridlineColor =10921638

                    LayoutCachedLeft =4206
                    LayoutCachedTop =1995
                    LayoutCachedWidth =5952
                    LayoutCachedHeight =2310
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =694
                            Top =1995
                            Width =3510
                            Height =315
                            Name ="Rótulo143"
                            Caption ="SECRETARIA DE FAZENDA"
                            GridlineColor =10921638
                            LayoutCachedLeft =694
                            LayoutCachedTop =1995
                            LayoutCachedWidth =4204
                            LayoutCachedHeight =2310
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4206
                    Top =2310
                    Width =1746
                    Height =315
                    TabIndex =5
                    Name ="SomaDeOPOL"
                    ControlSource ="SomaDeOPOL"
                    GridlineColor =10921638

                    LayoutCachedLeft =4206
                    LayoutCachedTop =2310
                    LayoutCachedWidth =5952
                    LayoutCachedHeight =2625
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =694
                            Top =2310
                            Width =3510
                            Height =315
                            Name ="Rótulo144"
                            Caption ="OUTRAS POLÍTICAS"
                            GridlineColor =10921638
                            LayoutCachedLeft =694
                            LayoutCachedTop =2310
                            LayoutCachedWidth =4204
                            LayoutCachedHeight =2625
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =690
                    Top =390
                    Width =3510
                    Height =345
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo151"
                    Caption ="DESCRIÇÃO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =690
                    LayoutCachedTop =390
                    LayoutCachedWidth =4200
                    LayoutCachedHeight =735
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
                    Left =4206
                    Top =396
                    Width =1755
                    Height =345
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo152"
                    Caption ="TOTAL NO PERÍODO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =4206
                    LayoutCachedTop =396
                    LayoutCachedWidth =5961
                    LayoutCachedHeight =741
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
                    Left =8670
                    Top =390
                    Width =1026
                    Height =345
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo153"
                    Caption ="ATENDIDOS"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =8670
                    LayoutCachedTop =390
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =735
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4206
                    Top =2622
                    Width =1746
                    Height =315
                    FontWeight =700
                    TabIndex =6
                    BackColor =14277081
                    Name ="Texto154"
                    ControlSource ="=Sum([SomaDeENGOV]+[SomaDeRSASSIS]+[SomaDeREDU]+[SomaDeRSAUD]+[SomaDeSFAZ]+[Soma"
                        "DeOPOL])"
                    GridlineColor =10921638

                    LayoutCachedLeft =4206
                    LayoutCachedTop =2622
                    LayoutCachedWidth =5952
                    LayoutCachedHeight =2937
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =690
                            Top =2622
                            Width =3525
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo155"
                            Caption ="TOTAIS......................................................"
                            GridlineColor =10921638
                            LayoutCachedLeft =690
                            LayoutCachedTop =2622
                            LayoutCachedWidth =4215
                            LayoutCachedHeight =2937
                        End
                    End
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5955
                    Top =750
                    Width =1365
                    Height =315
                    TabIndex =7
                    Name ="SomaDeENGMON"
                    ControlSource ="SomaDeENGMON"
                    GridlineColor =10921638

                    LayoutCachedLeft =5955
                    LayoutCachedTop =750
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5952
                    Top =1065
                    Width =1365
                    Height =315
                    TabIndex =8
                    Name ="SomaDeRSAMON"
                    ControlSource ="SomaDeRSAMON"
                    GridlineColor =10921638

                    LayoutCachedLeft =5952
                    LayoutCachedTop =1065
                    LayoutCachedWidth =7317
                    LayoutCachedHeight =1380
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5952
                    Top =1380
                    Width =1365
                    Height =315
                    TabIndex =9
                    Name ="SomaDeREMON"
                    ControlSource ="SomaDeREMON"
                    GridlineColor =10921638

                    LayoutCachedLeft =5952
                    LayoutCachedTop =1380
                    LayoutCachedWidth =7317
                    LayoutCachedHeight =1695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5952
                    Top =1695
                    Width =1365
                    Height =315
                    TabIndex =10
                    Name ="SomaDeRSMON"
                    ControlSource ="SomaDeRSMON"
                    GridlineColor =10921638

                    LayoutCachedLeft =5952
                    LayoutCachedTop =1695
                    LayoutCachedWidth =7317
                    LayoutCachedHeight =2010
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5955
                    Top =1995
                    Width =1365
                    Height =315
                    TabIndex =11
                    Name ="SomaDeSFMON"
                    ControlSource ="SomaDeSFMON"
                    GridlineColor =10921638

                    LayoutCachedLeft =5955
                    LayoutCachedTop =1995
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =2310
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5955
                    Top =2310
                    Width =1365
                    Height =315
                    TabIndex =12
                    Name ="SomaDeOPMON"
                    ControlSource ="SomaDeOPMON"
                    GridlineColor =10921638

                    LayoutCachedLeft =5955
                    LayoutCachedTop =2310
                    LayoutCachedWidth =7320
                    LayoutCachedHeight =2625
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =9690
                    Top =390
                    Width =1470
                    Height =345
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo164"
                    Caption ="NÃO ATENDIDOS"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =9690
                    LayoutCachedTop =390
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =735
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
                    Left =7313
                    Top =396
                    Width =1371
                    Height =345
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo165"
                    Caption ="SEM ÊXITO"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =7313
                    LayoutCachedTop =396
                    LayoutCachedWidth =8684
                    LayoutCachedHeight =741
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
                    Left =5952
                    Top =396
                    Width =1365
                    Height =345
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo166"
                    Caption ="MONITORADOS"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5952
                    LayoutCachedTop =396
                    LayoutCachedWidth =7317
                    LayoutCachedHeight =741
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7313
                    Top =750
                    Width =1371
                    Height =315
                    TabIndex =13
                    Name ="SomaDeENGSEM"
                    ControlSource ="SomaDeENGSEM"
                    GridlineColor =10921638

                    LayoutCachedLeft =7313
                    LayoutCachedTop =750
                    LayoutCachedWidth =8684
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7313
                    Top =1065
                    Width =1371
                    Height =315
                    TabIndex =14
                    Name ="SomaDeRSASEM"
                    ControlSource ="SomaDeRSASEM"
                    GridlineColor =10921638

                    LayoutCachedLeft =7313
                    LayoutCachedTop =1065
                    LayoutCachedWidth =8684
                    LayoutCachedHeight =1380
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7313
                    Top =1380
                    Width =1371
                    Height =315
                    TabIndex =15
                    Name ="SomaDeRESEM"
                    ControlSource ="SomaDeRESEM"
                    GridlineColor =10921638

                    LayoutCachedLeft =7313
                    LayoutCachedTop =1380
                    LayoutCachedWidth =8684
                    LayoutCachedHeight =1695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7313
                    Top =1695
                    Width =1371
                    Height =315
                    TabIndex =16
                    Name ="SomaDeRSSEM"
                    ControlSource ="SomaDeRSSEM"
                    GridlineColor =10921638

                    LayoutCachedLeft =7313
                    LayoutCachedTop =1695
                    LayoutCachedWidth =8684
                    LayoutCachedHeight =2010
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7313
                    Top =1995
                    Width =1371
                    Height =315
                    TabIndex =17
                    Name ="SomaDeSFSEM"
                    ControlSource ="SomaDeSFSEM"
                    GridlineColor =10921638

                    LayoutCachedLeft =7313
                    LayoutCachedTop =1995
                    LayoutCachedWidth =8684
                    LayoutCachedHeight =2310
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7313
                    Top =2310
                    Width =1371
                    Height =315
                    TabIndex =18
                    Name ="SomaDeOPSEM"
                    ControlSource ="SomaDeOPSEM"
                    GridlineColor =10921638

                    LayoutCachedLeft =7313
                    LayoutCachedTop =2310
                    LayoutCachedWidth =8684
                    LayoutCachedHeight =2625
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8670
                    Top =750
                    Width =1026
                    Height =315
                    TabIndex =19
                    Name ="SomaDeENGATEN"
                    ControlSource ="SomaDeENGATEN"
                    GridlineColor =10921638

                    LayoutCachedLeft =8670
                    LayoutCachedTop =750
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8670
                    Top =1065
                    Width =1026
                    Height =315
                    TabIndex =20
                    Name ="SomaDeRSAATEN"
                    ControlSource ="SomaDeRSAATEN"
                    GridlineColor =10921638

                    LayoutCachedLeft =8670
                    LayoutCachedTop =1065
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =1380
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8670
                    Top =1380
                    Width =1026
                    Height =315
                    TabIndex =21
                    Name ="SomaDeREATEN"
                    ControlSource ="SomaDeREATEN"
                    GridlineColor =10921638

                    LayoutCachedLeft =8670
                    LayoutCachedTop =1380
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =1695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8670
                    Top =1695
                    Width =1026
                    Height =315
                    TabIndex =22
                    Name ="SomaDeRSATEN"
                    ControlSource ="SomaDeRSATEN"
                    GridlineColor =10921638

                    LayoutCachedLeft =8670
                    LayoutCachedTop =1695
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =2010
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8670
                    Top =1995
                    Width =1026
                    Height =315
                    TabIndex =23
                    Name ="SomaDeSFATEN"
                    ControlSource ="SomaDeSFATEN"
                    GridlineColor =10921638

                    LayoutCachedLeft =8670
                    LayoutCachedTop =1995
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =2310
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8670
                    Top =2310
                    Width =1026
                    Height =315
                    TabIndex =24
                    Name ="SomaDeOPATEN"
                    ControlSource ="SomaDeOPATEN"
                    GridlineColor =10921638

                    LayoutCachedLeft =8670
                    LayoutCachedTop =2310
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =2625
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9690
                    Top =750
                    Width =1470
                    Height =315
                    TabIndex =25
                    Name ="SomaDeENGNAO"
                    ControlSource ="SomaDeENGNAO"
                    GridlineColor =10921638

                    LayoutCachedLeft =9690
                    LayoutCachedTop =750
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =1065
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9690
                    Top =1065
                    Width =1470
                    Height =315
                    TabIndex =26
                    Name ="SomaDeRSANAO"
                    ControlSource ="SomaDeRSANAO"
                    GridlineColor =10921638

                    LayoutCachedLeft =9690
                    LayoutCachedTop =1065
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =1380
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9690
                    Top =1380
                    Width =1470
                    Height =315
                    TabIndex =27
                    Name ="SomaDeRENAO"
                    ControlSource ="SomaDeRENAO"
                    GridlineColor =10921638

                    LayoutCachedLeft =9690
                    LayoutCachedTop =1380
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =1695
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9690
                    Top =1695
                    Width =1470
                    Height =315
                    TabIndex =28
                    Name ="SomaDeRSNAO"
                    ControlSource ="SomaDeRSNAO"
                    GridlineColor =10921638

                    LayoutCachedLeft =9690
                    LayoutCachedTop =1695
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =2010
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9690
                    Top =1995
                    Width =1470
                    Height =315
                    TabIndex =29
                    Name ="SomaDeSFNAO"
                    ControlSource ="SomaDeSFNAO"
                    GridlineColor =10921638

                    LayoutCachedLeft =9690
                    LayoutCachedTop =1995
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =2310
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9690
                    Top =2310
                    Width =1470
                    Height =315
                    TabIndex =30
                    Name ="SomaDeOPNAO"
                    ControlSource ="SomaDeOPNAO"
                    GridlineColor =10921638

                    LayoutCachedLeft =9690
                    LayoutCachedTop =2310
                    LayoutCachedWidth =11160
                    LayoutCachedHeight =2625
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5952
                    Top =2622
                    Width =1371
                    Height =315
                    FontWeight =700
                    TabIndex =31
                    BackColor =14277081
                    Name ="Texto186"
                    ControlSource ="=[SomaDeENGMON]+[SomaDeRSAMON]+[SomaDeREMON]+[SomaDeRSMON]+[SomaDeSFMON]+[SomaDe"
                        "OPMON]"
                    GridlineColor =10921638

                    LayoutCachedLeft =5952
                    LayoutCachedTop =2622
                    LayoutCachedWidth =7323
                    LayoutCachedHeight =2937
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7313
                    Top =2622
                    Width =1371
                    Height =315
                    FontWeight =700
                    TabIndex =32
                    BackColor =14277081
                    Name ="Texto188"
                    ControlSource ="=[SomaDeENGSEM]+[SomaDeRSASEM]+[SomaDeRESEM]+[SomaDeRSSEM]+[SomaDeSFSEM]+[SomaDe"
                        "OPSEM]"
                    GridlineColor =10921638

                    LayoutCachedLeft =7313
                    LayoutCachedTop =2622
                    LayoutCachedWidth =8684
                    LayoutCachedHeight =2937
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8670
                    Top =2622
                    Width =1026
                    Height =315
                    FontWeight =700
                    TabIndex =33
                    BackColor =14277081
                    Name ="Texto189"
                    ControlSource ="=[SomaDeENGATEN]+[SomaDeRSAATEN]+[SomaDeREATEN]+[SomaDeRSATEN]+[SomaDeSFATEN]+[S"
                        "omaDeOPATEN]"
                    GridlineColor =10921638

                    LayoutCachedLeft =8670
                    LayoutCachedTop =2622
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =2937
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9694
                    Top =2622
                    Width =1470
                    Height =315
                    FontWeight =700
                    TabIndex =34
                    BackColor =14277081
                    Name ="Texto190"
                    ControlSource ="=[SomaDeENGNAO]+[SomaDeRSANAO]+[SomaDeRENAO]+[SomaDeRSNAO]+[SomaDeSFNAO]+[SomaDe"
                        "OPNAO]"
                    GridlineColor =10921638

                    LayoutCachedLeft =9694
                    LayoutCachedTop =2622
                    LayoutCachedWidth =11164
                    LayoutCachedHeight =2937
                    BackShade =85.0
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
            End
        End
        Begin PageFooter
            Height =1020
            Name ="PageFooterSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1140
                    Width =9636
                    Height =270
                    FontSize =10
                    FontWeight =700
                    BorderColor =10921638
                    Name ="DIRETOR(A)"
                    ControlSource ="DIRETOR(A)"
                    Format =">"
                    EventProcPrefix ="DIRETOR_A_"
                    GridlineColor =10921638

                    LayoutCachedLeft =1140
                    LayoutCachedWidth =10776
                    LayoutCachedHeight =270
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1140
                    Top =285
                    Width =9636
                    FontSize =8
                    TabIndex =1
                    BorderColor =10921638
                    Name ="FUNÇÃO"
                    ControlSource ="FUNÇÃO"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1140
                    LayoutCachedTop =285
                    LayoutCachedWidth =10776
                    LayoutCachedHeight =525
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1140
                    Top =495
                    Width =9636
                    FontSize =8
                    TabIndex =2
                    BorderColor =10921638
                    Name ="MATRICULA"
                    ControlSource ="MATRICULA"
                    GridlineColor =10921638

                    LayoutCachedLeft =1140
                    LayoutCachedTop =495
                    LayoutCachedWidth =10776
                    LayoutCachedHeight =735
                    ForeTint =100.0
                End
            End
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
