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
    Width =10488
    DatasheetFontHeight =11
    ItemSuffix =22
    Left =5070
    Top =2985
    RecSrcDt = Begin
        0xe7066bd38cb8e540
    End
    RecordSource ="CS ATENDIMENTO POR BAIRRO"
    Caption ="CS ATENDIMENTO POR BAIRRO"
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
            ControlSource ="Bairro"
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
            Height =2925
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    Left =2324
                    Top =1133
                    Width =5925
                    Height =435
                    FontSize =16
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo8"
                    Caption ="TOTAL DE FAMÍLIAS ATENDIDAS POR BAIRRO"
                    GridlineColor =10921638
                    LayoutCachedLeft =2324
                    LayoutCachedTop =1133
                    LayoutCachedWidth =8249
                    LayoutCachedHeight =1568
                End
                Begin Image
                    PictureType =2
                    Left =56
                    Top =56
                    Width =4474
                    Height =1021
                    BorderColor =10921638
                    Name ="Imagem18"
                    Picture ="1_LOGO-SEMAS"
                    GridlineColor =10921638

                    LayoutCachedLeft =56
                    LayoutCachedTop =56
                    LayoutCachedWidth =4530
                    LayoutCachedHeight =1077
                    TabIndex =2
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    ListWidth =3165
                    Left =2324
                    Top =1700
                    Width =5901
                    Height =450
                    ColumnWidth =2385
                    FontSize =16
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="NOME"
                    ControlSource ="NOME"
                    RowSourceType ="Value List"
                    RowSource ="\"CRAS NORTE\";\"CRAS SUL\";\"CRAS CENTRAL\";\"CRAS ROCHA LEÃO\";\"UNIDADE CANTA"
                        "GALO\";\"UNIDADE MAR DO NORTE\""
                    ColumnWidths ="3165"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2324
                    LayoutCachedTop =1700
                    LayoutCachedWidth =8225
                    LayoutCachedHeight =2150
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =5436
                    Top =2430
                    Width =1821
                    Height =315
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto432"
                    ControlSource ="@mês/ano"
                    GridlineColor =10921638

                    LayoutCachedLeft =5436
                    LayoutCachedTop =2430
                    LayoutCachedWidth =7257
                    LayoutCachedHeight =2745
                    Begin
                        Begin Label
                            OverlapFlags =4
                            Left =3345
                            Top =2430
                            Width =2070
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo433"
                            Caption ="PERÍODO (Mês/Ano): "
                            GridlineColor =10921638
                            LayoutCachedLeft =3345
                            LayoutCachedTop =2430
                            LayoutCachedWidth =5415
                            LayoutCachedHeight =2745
                        End
                    End
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            Height =330
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    DecimalPlaces =0
                    IMESentenceMode =3
                    Left =2550
                    Width =4530
                    Height =330
                    ColumnWidth =2145
                    FontWeight =700
                    ForeColor =4210752
                    Name ="Bairro"
                    ControlSource ="Bairro"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2550
                    LayoutCachedWidth =7080
                    LayoutCachedHeight =330
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7080
                    Width =855
                    Height =330
                    FontWeight =700
                    TabIndex =1
                    ForeColor =4210752
                    Name ="AccessTotalsBairro"
                    ControlSource ="=Count([Bairro])"
                    ControlTipText ="Bairro Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =7080
                    LayoutCachedWidth =7935
                    LayoutCachedHeight =330
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =0
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =0
            Name ="RodapéDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
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
                    FontSize =8
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto9"
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
                    Left =5272
                    Top =226
                    Width =5040
                    Height =330
                    FontSize =8
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto10"
                    ControlSource ="=\"Página \" & [Page] & \" de \" & [Pages]"
                    GridlineColor =10921638

                    LayoutCachedLeft =5272
                    LayoutCachedTop =226
                    LayoutCachedWidth =10312
                    LayoutCachedHeight =556
                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            Height =660
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7080
                    Top =345
                    Width =855
                    Height =315
                    FontWeight =700
                    ForeColor =4210752
                    Name ="AccessTotalsBairro1"
                    ControlSource ="=Count([Bairro])"
                    ControlTipText ="Bairro Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =7080
                    LayoutCachedTop =345
                    LayoutCachedWidth =7935
                    LayoutCachedHeight =660
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =2550
                    Top =345
                    Width =4530
                    Height =315
                    ForeColor =8355711
                    Name ="Rótulo11"
                    Caption ="Total de famílias ..........................................."
                    GridlineColor =10921638
                    LayoutCachedLeft =2550
                    LayoutCachedTop =345
                    LayoutCachedWidth =7080
                    LayoutCachedHeight =660
                    BorderTint =100.0
                End
            End
        End
    End
End
