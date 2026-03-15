Version =20
VersionRequired =20
Begin Form
    MaxButton = NotDefault
    MinButton = NotDefault
    ControlBox = NotDefault
    AutoCenter = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    OrderByOn = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =6609
    DatasheetFontHeight =11
    ItemSuffix =10
    Left =2010
    Top =3750
    Right =17985
    Bottom =9105
    FrozenColumns =6
    OrderBy ="[Lookup_Nometxt].[Nome]"
    RecSrcDt = Begin
        0x9d424b9d76b0e540
    End
    RecordSource ="SELECT TbDiarioDet.CodDiarioDet, TbDiarioDet.CodDiario, TbDiarioDet.Nome, TbDiar"
        "ioDet.DNasc FROM TbDiarioDet ORDER BY TbDiarioDet.Nome; "
    Caption ="DIARIO SUBFORM"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
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
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =5272
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =342
                    Height =315
                    ColumnWidth =1245
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodDiarioDet"
                    ControlSource ="CodDiarioDet"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =342
                    LayoutCachedWidth =4593
                    LayoutCachedHeight =657
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =342
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodDiarioDet_Rótulo"
                            Caption ="CodDiarioDet"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin ComboBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2892
                    Top =741
                    Width =3660
                    Height =330
                    ColumnWidth =1005
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodDiario"
                    ControlSource ="CodDiario"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbDiario].[CodDiario] FROM TbDiario ORDER BY [CodDiario]; "
                    ColumnWidths ="1440"
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
                            Name ="CodDiario_Rótulo"
                            Caption ="CodDiario"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2901
                    Top =1530
                    Height =315
                    ColumnWidth =1725
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DNasctxt"
                    ControlSource ="DNasc"
                    GridlineColor =10921638

                    LayoutCachedLeft =2901
                    LayoutCachedTop =1530
                    LayoutCachedWidth =4602
                    LayoutCachedHeight =1845
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1200
                            Top =1530
                            Width =645
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo7"
                            Caption ="DNasc"
                            GridlineColor =10921638
                            LayoutCachedLeft =1200
                            LayoutCachedTop =1530
                            LayoutCachedWidth =1845
                            LayoutCachedHeight =1845
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    EnterKeyBehavior = NotDefault
                    DecimalPlaces =1
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2373
                    Top =1965
                    Width =2802
                    Height =330
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Idadetxt"
                    ControlSource ="=(Date()-([DNasc]))/365.25"
                    Format ="Standard"
                    GridlineColor =10921638

                    LayoutCachedLeft =2373
                    LayoutCachedTop =1965
                    LayoutCachedWidth =5175
                    LayoutCachedHeight =2295
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =1200
                            Top =1965
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Idade_Rótulo"
                            Caption ="Idade"
                            GridlineColor =10921638
                            LayoutCachedLeft =1200
                            LayoutCachedTop =1965
                            LayoutCachedWidth =2283
                            LayoutCachedHeight =2295
                        End
                    End
                End
                Begin ComboBox
                    ColumnHeads = NotDefault
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =4
                    ListWidth =5295
                    Left =2901
                    Top =1140
                    Width =3111
                    Height =315
                    ColumnWidth =7305
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nometxt"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT TbPessoa.CodPessoa, TbPessoa.Nome, TbPessoa.DNasc, TbPessoa.DataDesligPes"
                        " FROM TbPessoa ORDER BY TbPessoa.[Nome]; "
                    ColumnWidths ="0;3855;1441;1701"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =2901
                    LayoutCachedTop =1140
                    LayoutCachedWidth =6012
                    LayoutCachedHeight =1455
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1200
                            Top =1140
                            Width =645
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo9"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =1200
                            LayoutCachedTop =1140
                            LayoutCachedWidth =1845
                            LayoutCachedHeight =1455
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
CodeBehindForm
' See "DIARIO SUBFORM.cls"
