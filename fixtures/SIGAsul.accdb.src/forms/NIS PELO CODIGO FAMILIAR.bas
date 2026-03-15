Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =14400
    DatasheetFontHeight =11
    ItemSuffix =12
    Left =2415
    Top =1275
    Right =17565
    Bottom =5400
    FrozenColumns =7
    RecSrcDt = Begin
        0x5af72d0ed4dee540
    End
    RecordSource ="NIS PELO CODIGO FAMILIAR"
    Caption ="NIS PELO CODIGO FAMILIAR"
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
            ForeTint =60.0
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
        Begin FormHeader
            Height =0
            Name ="CabeçalhoDoFormulário"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =3206
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2715
                    Top =450
                    Width =1305
                    Height =360
                    ColumnWidth =1410
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Identificação"
                    ControlSource ="Identificação"
                    Format ="General Number"
                    GridlineColor =10921638

                    LayoutCachedLeft =2715
                    LayoutCachedTop =450
                    LayoutCachedWidth =4020
                    LayoutCachedHeight =810
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =450
                            Width =2295
                            Height =360
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Identificação_Rótulo"
                            Caption ="Identificação"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =450
                            LayoutCachedWidth =2640
                            LayoutCachedHeight =810
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2715
                    Top =906
                    Width =1305
                    Height =360
                    ColumnWidth =1740
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CODFAM"
                    ControlSource ="CODFAM"
                    Format ="General Number"
                    GridlineColor =10921638

                    LayoutCachedLeft =2715
                    LayoutCachedTop =906
                    LayoutCachedWidth =4020
                    LayoutCachedHeight =1266
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =906
                            Width =2295
                            Height =360
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="CODFAM_Rótulo"
                            Caption ="CÓDIGO FAMILIAR"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =906
                            LayoutCachedWidth =2640
                            LayoutCachedHeight =1266
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2715
                    Top =1362
                    Width =1305
                    Height =360
                    ColumnWidth =1950
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NISCADUNICO"
                    ControlSource ="NIS"
                    Format ="General Number"
                    GridlineColor =10921638

                    LayoutCachedLeft =2715
                    LayoutCachedTop =1362
                    LayoutCachedWidth =4020
                    LayoutCachedHeight =1722
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =1362
                            Width =2295
                            Height =360
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="NISCADUNICO_Rótulo"
                            Caption ="NIS"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =1362
                            LayoutCachedWidth =2640
                            LayoutCachedHeight =1722
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2715
                    Top =1818
                    Width =6240
                    Height =660
                    ColumnWidth =3765
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NOME-CAUNICO"
                    ControlSource ="nom_pessoa"
                    Format ="@"
                    EventProcPrefix ="NOME_CAUNICO"
                    GridlineColor =10921638

                    LayoutCachedLeft =2715
                    LayoutCachedTop =1818
                    LayoutCachedWidth =8955
                    LayoutCachedHeight =2478
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =1818
                            Width =2295
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="NOME-CAUNICO_Rótulo"
                            Caption ="COMPOSIÇÃO FAMILIAR"
                            EventProcPrefix ="NOME_CAUNICO_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =1818
                            LayoutCachedWidth =2640
                            LayoutCachedHeight =2133
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2721
                    Top =2494
                    Height =315
                    ColumnWidth =2535
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="MÃE"
                    ControlSource ="MAE"
                    Format ="@"
                    GridlineColor =10921638

                    LayoutCachedLeft =2721
                    LayoutCachedTop =2494
                    LayoutCachedWidth =4422
                    LayoutCachedHeight =2809
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1020
                            Top =2494
                            Width =495
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Rótulo10"
                            Caption ="MÃE"
                            GridlineColor =10921638
                            LayoutCachedLeft =1020
                            LayoutCachedTop =2494
                            LayoutCachedWidth =1515
                            LayoutCachedHeight =2809
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2721
                    Top =2891
                    Height =315
                    ColumnWidth =3015
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PAI"
                    ControlSource ="PAI"
                    Format ="@"
                    GridlineColor =10921638

                    LayoutCachedLeft =2721
                    LayoutCachedTop =2891
                    LayoutCachedWidth =4422
                    LayoutCachedHeight =3206
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1020
                            Top =2891
                            Width =390
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Rótulo11"
                            Caption ="PAI"
                            GridlineColor =10921638
                            LayoutCachedLeft =1020
                            LayoutCachedTop =2891
                            LayoutCachedWidth =1410
                            LayoutCachedHeight =3206
                        End
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="RodapéDoFormulário"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
