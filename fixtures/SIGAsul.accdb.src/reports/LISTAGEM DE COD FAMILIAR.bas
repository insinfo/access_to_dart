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
    Width =10601
    DatasheetFontHeight =11
    ItemSuffix =23
    Left =4245
    Top =2985
    RecSrcDt = Begin
        0x820068ae34fae540
    End
    RecordSource ="CS RESPONSAVEL FAMILIAR"
    Caption ="LISTAGEM DE COD FAMILIAR"
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
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin BreakLevel
            ControlSource ="Nome"
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
            Height =817
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            BackShade =75.0
            Begin
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =960
                    Top =510
                    Width =1185
                    Height =285
                    FontSize =9
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="CodFam_Rótulo"
                    Caption ="CodFam"
                    Tag ="DetachedLabel"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =960
                    LayoutCachedTop =510
                    LayoutCachedWidth =2145
                    LayoutCachedHeight =795
                    LayoutGroup =1
                    BackShade =75.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =2205
                    Top =510
                    Width =5325
                    Height =285
                    FontSize =9
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="Nome_Rótulo"
                    Caption ="Nome"
                    Tag ="DetachedLabel"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =2205
                    LayoutCachedTop =510
                    LayoutCachedWidth =7530
                    LayoutCachedHeight =795
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    BackShade =75.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =7590
                    Top =510
                    Width =1410
                    Height =285
                    FontSize =9
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="CodPessoa_Rótulo"
                    Caption ="CodPessoa"
                    Tag ="DetachedLabel"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =7590
                    LayoutCachedTop =510
                    LayoutCachedWidth =9000
                    LayoutCachedHeight =795
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    BackShade =75.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =9060
                    Top =510
                    Width =1365
                    Height =285
                    FontSize =9
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="DataCadPes_Rótulo"
                    Caption ="DataCadPes"
                    Tag ="DetachedLabel"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9060
                    LayoutCachedTop =510
                    LayoutCachedWidth =10425
                    LayoutCachedHeight =795
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    BackShade =75.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    TextAlign =2
                    Left =780
                    Width =9765
                    Height =390
                    FontSize =14
                    BorderColor =8355711
                    Name ="Rótulo8"
                    Caption ="LISTAGEM DE COD FAMILIAR"
                    GridlineColor =10921638
                    LayoutCachedLeft =780
                    LayoutCachedWidth =10545
                    LayoutCachedHeight =390
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =307
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =85.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    HideDuplicates = NotDefault
                    OldBorderStyle =0
                    TextAlign =2
                    IMESentenceMode =3
                    Left =960
                    Top =30
                    Width =1185
                    Height =255
                    FontSize =9
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodFam"
                    ControlSource ="CodFam"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =960
                    LayoutCachedTop =30
                    LayoutCachedWidth =2145
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OldBorderStyle =0
                    IMESentenceMode =3
                    Left =2205
                    Top =30
                    Width =5325
                    Height =255
                    ColumnWidth =3180
                    FontSize =9
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Nome"
                    ControlSource ="Nome"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =2205
                    LayoutCachedTop =30
                    LayoutCachedWidth =7530
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7590
                    Top =30
                    Width =1410
                    Height =255
                    FontSize =9
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodPessoa"
                    ControlSource ="CodPessoa"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =7590
                    LayoutCachedTop =30
                    LayoutCachedWidth =9000
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9060
                    Top =30
                    Width =1365
                    Height =255
                    FontSize =9
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataCadPes"
                    ControlSource ="DataCadPes"
                    GroupTable =1
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =9060
                    LayoutCachedTop =30
                    LayoutCachedWidth =10425
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
            End
        End
        Begin PageFooter
            Height =330
            Name ="PageFooterSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =390
                    Width =5040
                    Height =330
                    FontSize =7
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto9"
                    ControlSource ="=Now()"
                    Format ="Long Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =390
                    LayoutCachedWidth =5430
                    LayoutCachedHeight =330
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =3
                    IMESentenceMode =3
                    Left =5492
                    Width =5040
                    Height =330
                    FontSize =7
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto10"
                    ControlSource ="=\"Página \" & [Page] & \" de \" & [Pages]"
                    GridlineColor =10921638

                    LayoutCachedLeft =5492
                    LayoutCachedWidth =10532
                    LayoutCachedHeight =330
                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            Height =457
            Name ="RodapéDoRelatório"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2205
                    Top =195
                    Width =5325
                    FontSize =9
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="AccessTotalsNome"
                    ControlSource ="=Count(*)"
                    ControlTipText ="Contagem de Registros"
                    GroupTable =1
                    GridlineStyleTop =1
                    GridlineColor =10921638
                    GridlineWidthTop =2

                    LayoutCachedLeft =2205
                    LayoutCachedTop =195
                    LayoutCachedWidth =7530
                    LayoutCachedHeight =435
                    RowStart =2
                    RowEnd =2
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =960
                    Top =195
                    Width =1185
                    Name ="CélulaVazia19"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =960
                    LayoutCachedTop =195
                    LayoutCachedWidth =2145
                    LayoutCachedHeight =435
                    RowStart =2
                    RowEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =7590
                    Top =195
                    Width =1410
                    Name ="CélulaVazia21"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =7590
                    LayoutCachedTop =195
                    LayoutCachedWidth =9000
                    LayoutCachedHeight =435
                    RowStart =2
                    RowEnd =2
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =9060
                    Top =195
                    Width =1365
                    Name ="CélulaVazia22"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =9060
                    LayoutCachedTop =195
                    LayoutCachedWidth =10425
                    LayoutCachedHeight =435
                    RowStart =2
                    RowEnd =2
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
            End
        End
    End
End
