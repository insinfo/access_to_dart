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
    Width =11061
    DatasheetFontHeight =11
    ItemSuffix =9
    Left =4395
    Top =2775
    RecSrcDt = Begin
        0xccfe534c6fa7e540
    End
    RecordSource ="RECIBO DOAÇÃO"
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
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin PageHeader
            Height =3225
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    Left =285
                    Top =1365
                    Width =5970
                    Height =375
                    FontSize =14
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo183"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL - "
                    GridlineColor =-2147483609
                    LayoutCachedLeft =285
                    LayoutCachedTop =1365
                    LayoutCachedWidth =6255
                    LayoutCachedHeight =1740
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =6234
                    Top =1365
                    Width =4656
                    Height =390
                    FontSize =13
                    FontWeight =700
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CRAS"
                    ControlSource ="TbUnidade.NOME"
                    RowSourceType ="Value List"
                    RowSource ="Norte;Centro;Sul;Rocha Leão"
                    ColumnWidths ="1444"
                    GridlineColor =-2147483609

                    LayoutCachedLeft =6234
                    LayoutCachedTop =1365
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =1755
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Top =2895
                    Width =1485
                    Height =330
                    FontSize =9
                    FontWeight =700
                    BackColor =12566463
                    Name ="Rótulo0"
                    Caption ="DATA"
                    GridlineColor =10921638
                    LayoutCachedTop =2895
                    LayoutCachedWidth =1485
                    LayoutCachedHeight =3225
                    BackShade =75.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1492
                    Top =2895
                    Width =4470
                    Height =330
                    FontSize =9
                    FontWeight =700
                    BackColor =12566463
                    Name ="Rótulo1"
                    Caption ="NOME DO TITULAR"
                    GridlineColor =10921638
                    LayoutCachedLeft =1492
                    LayoutCachedTop =2895
                    LayoutCachedWidth =5962
                    LayoutCachedHeight =3225
                    BackShade =75.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5968
                    Top =2895
                    Width =1680
                    Height =330
                    FontSize =9
                    FontWeight =700
                    BackColor =12566463
                    Name ="Rótulo3"
                    Caption ="CPF"
                    GridlineColor =10921638
                    LayoutCachedLeft =5968
                    LayoutCachedTop =2895
                    LayoutCachedWidth =7648
                    LayoutCachedHeight =3225
                    BackShade =75.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9645
                    Top =2895
                    Width =1290
                    Height =330
                    FontSize =9
                    FontWeight =700
                    BackColor =12566463
                    Name ="Rótulo4"
                    Caption ="QUANTIDADE"
                    GridlineColor =10921638
                    LayoutCachedLeft =9645
                    LayoutCachedTop =2895
                    LayoutCachedWidth =10935
                    LayoutCachedHeight =3225
                    BackShade =75.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =4912
                    Top =1980
                    Width =1050
                    Height =345
                    FontSize =12
                    BorderColor =8355711
                    Name ="Rótulo5"
                    Caption ="DOAÇÕES"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =4912
                    LayoutCachedTop =1980
                    LayoutCachedWidth =5962
                    LayoutCachedHeight =2325
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7650
                    Top =2895
                    Width =1980
                    Height =330
                    FontSize =9
                    FontWeight =700
                    BackColor =12566463
                    Name ="Rótulo7"
                    Caption ="DESCRIÇÃO"
                    GridlineColor =10921638
                    LayoutCachedLeft =7650
                    LayoutCachedTop =2895
                    LayoutCachedWidth =9630
                    LayoutCachedHeight =3225
                    BackShade =75.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Width =4875
                    Height =1305
                    BorderColor =16777215
                    Name ="LOGO"
                    ControlSource ="LOGO"
                    GridlineColor =10921638
                    TabIndex =1

                    LayoutCachedWidth =4875
                    LayoutCachedHeight =1305
                    BorderShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =5436
                    Top =2385
                    Width =1821
                    Height =315
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto432"
                    ControlSource ="@mês/ano"
                    GridlineColor =10921638

                    LayoutCachedLeft =5436
                    LayoutCachedTop =2385
                    LayoutCachedWidth =7257
                    LayoutCachedHeight =2700
                    Begin
                        Begin Label
                            OverlapFlags =4
                            Left =3345
                            Top =2385
                            Width =2070
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo433"
                            Caption ="PERÍODO (Mês/Ano): "
                            GridlineColor =10921638
                            LayoutCachedLeft =3345
                            LayoutCachedTop =2385
                            LayoutCachedWidth =5415
                            LayoutCachedHeight =2700
                        End
                    End
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =315
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Width =1491
                    Height =315
                    Name ="Data"
                    ControlSource ="DataBenef"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedWidth =1491
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1485
                    Width =4476
                    Height =315
                    ColumnWidth =5475
                    TabIndex =1
                    Name ="LETRAS AZ.Nome"
                    ControlSource ="TbPessoa.NOME"
                    Format =">"
                    EventProcPrefix ="LETRAS_AZ_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =1485
                    LayoutCachedWidth =5961
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5955
                    Width =1686
                    Height =315
                    ColumnWidth =1800
                    TabIndex =2
                    Name ="CPF"
                    ControlSource ="CPF"
                    InputMask ="000\\.000\\.000\\-00;;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =5955
                    LayoutCachedWidth =7641
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9651
                    Width =1281
                    Height =315
                    TabIndex =3
                    Name ="KITHIGIENE"
                    ControlSource ="Qtd"
                    GridlineColor =10921638

                    LayoutCachedLeft =9651
                    LayoutCachedWidth =10932
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7650
                    Width =1986
                    Height =315
                    TabIndex =4
                    Name ="Texto8"
                    ControlSource ="DescreverItem"
                    InputMask ="000\\.000\\.000\\-00;;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =7650
                    LayoutCachedWidth =9636
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
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
            Height =566
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9651
                    Top =5
                    Width =1281
                    Height =315
                    FontWeight =700
                    Name ="AccessTotalsCesta Básica"
                    ControlSource ="=Sum([Qtd])"
                    EventProcPrefix ="AccessTotalsCesta_Básica"
                    ControlTipText ="Cesta Básica Total"
                    GridlineColor =10921638

                    LayoutCachedLeft =9651
                    LayoutCachedTop =5
                    LayoutCachedWidth =10932
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Top =5
                    Width =1491
                    Height =315
                    TabIndex =1
                    Name ="AccessTotalsData"
                    ControlSource ="=Count(*)"
                    ControlTipText ="Contagem de Registros"
                    GridlineColor =10921638

                    LayoutCachedTop =5
                    LayoutCachedWidth =1491
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =3
                    Left =6690
                    Width =2895
                    Height =285
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo6"
                    Caption ="TOTAL ..............."
                    GridlineColor =10921638
                    LayoutCachedLeft =6690
                    LayoutCachedWidth =9585
                    LayoutCachedHeight =285
                End
            End
        End
    End
End
