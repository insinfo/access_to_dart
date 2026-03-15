Version =20
VersionRequired =20
Begin Form
    AllowFilters = NotDefault
    AutoResize = NotDefault
    PopUp = NotDefault
    AutoCenter = NotDefault
    AllowDeletions = NotDefault
    DividingLines = NotDefault
    AllowAdditions = NotDefault
    AllowEdits = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =10209
    DatasheetFontHeight =11
    ItemSuffix =21
    Left =8430
    Top =2505
    Right =20130
    Bottom =9600
    FrozenColumns =7
    RecSrcDt = Begin
        0x1009f30e4bf5e540
    End
    RecordSource ="RETORNO ACO"
    Caption ="RETORNO ACO"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    OnCloseEmMacro = Begin
        Version =196611
        ColumnsShown =0
        Begin
            Action ="OpenForm"
            Argument ="FrmAco"
            Argument ="0"
            Argument =""
            Argument =""
            Argument ="-1"
            Argument ="0"
        End
        Begin
            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                "nterfaceMacro Event=\"OnClose\" xmlns=\"http://schemas.microsoft.com/office/acce"
                "ssservices/2009/11/application\"><Statements><Action Name=\"OpenForm\"><Argument"
                " Name=\"FormName\">FrmAco </Argum"
        End
        Begin
            Comment ="_AXL:ent></Action></Statements></UserInterfaceMacro>"
        End
    End
    ShowPageMargins =0
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
        Begin FormHeader
            Height =0
            Name ="CabeçalhoDoFormulário"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =5787
            Name ="Detalhe"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2835
                    Left =2892
                    Top =741
                    Width =3660
                    Height =330
                    ColumnWidth =4815
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nome"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome] FROM TbPessoa ORDER BY [Nome]; "
                    ColumnWidths ="0;2835"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =741
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =1071
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =741
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Nome_Rótulo"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1539
                    Width =7260
                    Height =600
                    ColumnWidth =2700
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NomeTec"
                    ControlSource ="NomeTec"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1539
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =2139
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1539
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NomeTec_Rótulo"
                            Caption ="NomeTec"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1539
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1869
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2223
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataRetorno"
                    ControlSource ="DataRetorno"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2223
                    LayoutCachedWidth =4512
                    LayoutCachedHeight =2553
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2223
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataRetorno_Rótulo"
                            Caption ="DataRetorno"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2223
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2553
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =2622
                    TabIndex =3
                    BorderColor =10921638
                    Name ="Compareceu"
                    ControlSource ="Compareceu"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2622
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =2862
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2622
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Compareceu_Rótulo"
                            Caption ="Compareceu"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2622
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2952
                        End
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="RodapéDoFormulário"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
