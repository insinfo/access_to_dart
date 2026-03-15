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
    Width =10209
    DatasheetFontHeight =11
    ItemSuffix =14
    Top =2235
    Right =18810
    Bottom =7740
    FrozenColumns =8
    RecSrcDt = Begin
        0xf23145667088e540
    End
    RecordSource ="SELECT [TbReuniaoDet].[CodReuniaoDet], [TbReuniaoDet].[CodReuniao], [TbReuniaoDe"
        "t].[Nome], [TbReuniaoDet].[Função], [TbReuniaoDet].[Celular], [TbReuniaoDet].[Em"
        "ail], [TbReuniaoDet].[Local de trabalho] FROM TbReuniaoDet; "
    Caption ="TbReuniaoDet subformulário1"
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
            Height =3750
            Name ="Detalhe"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =342
                    Height =315
                    ColumnWidth =945
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodReuniaoDet"
                    ControlSource ="CodReuniaoDet"
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
                            Name ="CodReuniaoDet_Rótulo"
                            Caption ="CodReuniaoDet"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2892
                    Top =741
                    Width =3660
                    Height =330
                    ColumnWidth =1200
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodReuniao"
                    ControlSource ="CodReuniao"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbReuniao].[CodReuniao] FROM TbReuniao ORDER BY [CodReuniao]; "
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
                            Name ="CodReuniao_Rótulo"
                            Caption ="CodReuniao"
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
                    Top =1140
                    Width =7260
                    Height =600
                    ColumnWidth =4770
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Nome"
                    ControlSource ="Nome"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1140
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =1740
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1140
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Nome_Rótulo"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1470
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1824
                    Width =7260
                    Height =600
                    ColumnWidth =3690
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Função"
                    ControlSource ="Função"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1824
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =2424
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1824
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Função_Rótulo"
                            Caption ="Função"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1824
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2154
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2508
                    Width =1860
                    Height =330
                    ColumnWidth =1860
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Celular"
                    ControlSource ="Celular"
                    InputMask ="!\\(99\") \"!99000\\-0000;0;"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2508
                    LayoutCachedWidth =4752
                    LayoutCachedHeight =2838
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2508
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Celular_Rótulo"
                            Caption ="Celular"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2508
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2838
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2907
                    Width =5460
                    Height =330
                    ColumnWidth =3000
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Email"
                    ControlSource ="Email"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2907
                    LayoutCachedWidth =8352
                    LayoutCachedHeight =3237
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2907
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Email_Rótulo"
                            Caption ="Email"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2907
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3237
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =3306
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Local de trabalho"
                    ControlSource ="Local de trabalho"
                    Format =">"
                    EventProcPrefix ="Local_de_trabalho"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3306
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =3636
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3306
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Local de trabalho_Rótulo"
                            Caption ="Local de trabalho"
                            EventProcPrefix ="Local_de_trabalho_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3306
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3636
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
