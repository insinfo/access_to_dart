Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =12359
    DatasheetFontHeight =11
    ItemSuffix =14
    Left =7245
    Top =480
    Right =20340
    Bottom =9660
    FrozenColumns =7
    RecSrcDt = Begin
        0x4c34340e8a9ce540
    End
    RecordSource ="SELECT TbAtColetivoDet.CodAtColetDet, TbAtColetivoDet.CodColetivo, TbAtColetivoD"
        "et.Nome, TbAtColetivoDet.NomeVisitante, TbAtColetivoDet.TelVisitante FROM TbAtCo"
        "letivoDet; "
    Caption ="ATCOLETIVO SUBFORM"
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
            Height =3628
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
                    ColumnWidth =840
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodAtColetDet"
                    ControlSource ="CodAtColetDet"
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
                            Name ="CodAtColetDet_Rótulo"
                            Caption ="CodAtColetDet"
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
                    ColumnWidth =765
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodColetivo"
                    ControlSource ="CodColetivo"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbAtColetivo].[CodColetivo] FROM TbAtColetivo ORDER BY [CodColetivo]; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638
                    AllowValueListEdits =0

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
                            Name ="CodColetivo_Rótulo"
                            Caption ="CodColetivo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2891
                    Top =1587
                    Height =315
                    ColumnWidth =2775
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NomeVisitante"
                    ControlSource ="NomeVisitante"
                    GridlineColor =10921638

                    LayoutCachedLeft =2891
                    LayoutCachedTop =1587
                    LayoutCachedWidth =4592
                    LayoutCachedHeight =1902
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1190
                            Top =1587
                            Width =1485
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo8"
                            Caption ="NomeVisitante"
                            GridlineColor =10921638
                            LayoutCachedLeft =1190
                            LayoutCachedTop =1587
                            LayoutCachedWidth =2675
                            LayoutCachedHeight =1902
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2891
                    Top =1984
                    Height =315
                    ColumnWidth =1785
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="TelVisitante"
                    ControlSource ="TelVisitante"
                    GridlineColor =10921638

                    LayoutCachedLeft =2891
                    LayoutCachedTop =1984
                    LayoutCachedWidth =4592
                    LayoutCachedHeight =2299
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1190
                            Top =1984
                            Width =1200
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo9"
                            Caption ="TelVisitante"
                            GridlineColor =10921638
                            LayoutCachedLeft =1190
                            LayoutCachedTop =1984
                            LayoutCachedWidth =2390
                            LayoutCachedHeight =2299
                        End
                    End
                End
                Begin ComboBox
                    ColumnHeads = NotDefault
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =5
                    ListWidth =1440
                    Left =2891
                    Top =1190
                    Width =4986
                    Height =315
                    ColumnWidth =6795
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nometxt"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT TbPessoa.CodPessoa, TbPessoa.Nome, TbPessoa.DNasc, TbPessoa.Celular, TbPe"
                        "ssoa.DataDesligPes FROM TbPessoa ORDER BY TbPessoa.Nome; "
                    ColumnWidths ="0;2268;1134;1134;1134"
                    OnGotFocus ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =2891
                    LayoutCachedTop =1190
                    LayoutCachedWidth =7877
                    LayoutCachedHeight =1505
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1190
                            Top =1190
                            Width =645
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo13"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =1190
                            LayoutCachedTop =1190
                            LayoutCachedWidth =1835
                            LayoutCachedHeight =1505
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
' See "ATCOLETIVO SUBFORM.cls"
