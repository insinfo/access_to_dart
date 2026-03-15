Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    PopUp = NotDefault
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11007
    DatasheetFontHeight =11
    ItemSuffix =429
    Left =3675
    Top =2460
    RecSrcDt = Begin
        0xc5add1fc6fa7e540
    End
    RecordSource ="CS ATIVIDADES DO SCFV"
    Caption ="FICHA GERAL DE INSCRIÇÃO SCFV"
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
            ControlSource ="TbPessoa.Nome"
        End
        Begin PageHeader
            Height =4281
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    Left =915
                    Top =1660
                    Width =5235
                    Height =315
                    LeftMargin =22
                    TopMargin =22
                    RightMargin =22
                    BottomMargin =22
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo160"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL - CRAS  "
                    GridlineColor =-2147483609
                    LayoutCachedLeft =915
                    LayoutCachedTop =1660
                    LayoutCachedWidth =6150
                    LayoutCachedHeight =1975
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =6122
                    Top =226
                    Width =3810
                    Height =345
                    FontSize =13
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo21"
                    Caption ="FICHA DE CADASTRO SCFV"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =6122
                    LayoutCachedTop =226
                    LayoutCachedWidth =9932
                    LayoutCachedHeight =571
                    ThemeFontIndex =-1
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =6180
                    Top =1665
                    Width =4311
                    Height =315
                    ColumnWidth =2385
                    FontWeight =700
                    BorderColor =10921638
                    Name ="TbUnidade.Nome"
                    ControlSource ="TbUnidade.Nome"
                    Format =">"
                    EventProcPrefix ="TbUnidade_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =6180
                    LayoutCachedTop =1665
                    LayoutCachedWidth =10491
                    LayoutCachedHeight =1980
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =5100
                    Top =1303
                    Width =2565
                    Height =345
                    FontSize =13
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo420"
                    Caption ="GRUPO/ATIVIDADES"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5100
                    LayoutCachedTop =1303
                    LayoutCachedWidth =7665
                    LayoutCachedHeight =1648
                    ThemeFontIndex =-1
                End
                Begin Label
                    BackStyle =1
                    Top =2940
                    Width =1530
                    Height =315
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo314"
                    Caption ="FAIXA ETÁRIA"
                    GridlineColor =10921638
                    LayoutCachedTop =2940
                    LayoutCachedWidth =1530
                    LayoutCachedHeight =3255
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =960
                    Top =3960
                    Width =3471
                    Height =315
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo421"
                    Caption ="GRUPO/ATIVIDADE"
                    GridlineColor =10921638
                    LayoutCachedLeft =960
                    LayoutCachedTop =3960
                    LayoutCachedWidth =4431
                    LayoutCachedHeight =4275
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6810
                    Top =3960
                    Width =2841
                    Height =315
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo424"
                    Caption ="DIA DA SEMANA"
                    GridlineColor =10921638
                    LayoutCachedLeft =6810
                    LayoutCachedTop =3960
                    LayoutCachedWidth =9651
                    LayoutCachedHeight =4275
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9645
                    Top =3960
                    Width =1320
                    Height =315
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo425"
                    Caption ="HORÁRIO "
                    GridlineColor =10921638
                    LayoutCachedLeft =9645
                    LayoutCachedTop =3960
                    LayoutCachedWidth =10965
                    LayoutCachedHeight =4275
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Top =2430
                    Width =750
                    Height =315
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo426"
                    Caption ="Nome: "
                    GridlineColor =10921638
                    LayoutCachedTop =2430
                    LayoutCachedWidth =750
                    LayoutCachedHeight =2745
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =6236
                    Top =2430
                    Width =1365
                    Height =315
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    Name ="Rótulo427"
                    Caption ="Data de Nasc: "
                    GridlineColor =10921638
                    LayoutCachedLeft =6236
                    LayoutCachedTop =2430
                    LayoutCachedWidth =7601
                    LayoutCachedHeight =2745
                    BackShade =85.0
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TextAlign =1
                    IMESentenceMode =3
                    ColumnCount =3
                    ListWidth =5295
                    Left =737
                    Top =2430
                    Width =5496
                    Height =315
                    TabIndex =1
                    BorderColor =10921638
                    Name ="Nome"
                    ControlSource ="TbPessoa.Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome], [TbPessoa].[DNasc] FROM TbPess"
                        "oa ORDER BY [Nome]; "
                    ColumnWidths ="0;3855;1441"
                    GridlineColor =10921638

                    LayoutCachedLeft =737
                    LayoutCachedTop =2430
                    LayoutCachedWidth =6233
                    LayoutCachedHeight =2745
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =7596
                    Top =2430
                    Width =1476
                    Height =315
                    TabIndex =2
                    BorderColor =10921638
                    Name ="DNasc"
                    ControlSource ="DNasc"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =7596
                    LayoutCachedTop =2430
                    LayoutCachedWidth =9072
                    LayoutCachedHeight =2745
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1530
                    Top =2940
                    Width =1911
                    Height =315
                    TabIndex =3
                    BorderColor =10921638
                    Name ="FxEtaria"
                    ControlSource ="FxEtaria"
                    GridlineColor =10921638

                    LayoutCachedLeft =1530
                    LayoutCachedTop =2940
                    LayoutCachedWidth =3441
                    LayoutCachedHeight =3255
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5047
                    Top =3960
                    Width =1140
                    Height =315
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo428"
                    Caption ="Faixa Etária"
                    GridlineColor =10921638
                    LayoutCachedLeft =5047
                    LayoutCachedTop =3960
                    LayoutCachedWidth =6187
                    LayoutCachedHeight =4275
                    BackShade =85.0
                    BorderTint =100.0
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
                    TabIndex =4

                    LayoutCachedWidth =5445
                    LayoutCachedHeight =1200
                    BorderShade =100.0
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =0
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
        End
        Begin Section
            KeepTogether = NotDefault
            Height =315
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6810
                    Width =2841
                    Height =315
                    FontSize =9
                    Name ="DiaSemana"
                    ControlSource ="DIA DA SEMANA"
                    GridlineColor =10921638

                    LayoutCachedLeft =6810
                    LayoutCachedWidth =9651
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9645
                    Width =1320
                    Height =315
                    FontSize =9
                    TabIndex =1
                    Name ="Horario"
                    ControlSource ="Horario"
                    GridlineColor =10921638

                    LayoutCachedLeft =9645
                    LayoutCachedWidth =10965
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    TextAlign =2
                    IMESentenceMode =3
                    ColumnCount =5
                    ListWidth =5761
                    Left =960
                    Width =3471
                    Height =315
                    ColumnWidth =3660
                    FontSize =9
                    TabIndex =2
                    Name ="Grupo"
                    ControlSource ="Atividade"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1441;1441;1441;1441"
                    GridlineColor =10921638

                    LayoutCachedLeft =960
                    LayoutCachedWidth =4431
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4425
                    Width =2385
                    Height =315
                    FontSize =9
                    TabIndex =3
                    Name ="Tipo"
                    ControlSource ="FxEtaria"
                    GridlineColor =10921638

                    LayoutCachedLeft =4425
                    LayoutCachedWidth =6810
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
    End
End
