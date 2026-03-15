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
    Width =17404
    DatasheetFontHeight =11
    ItemSuffix =31
    Left =510
    Top =4065
    Right =18270
    Bottom =7125
    RecSrcDt = Begin
        0xf7ee41e30a88e540
    End
    RecordSource ="SELECT TbGestDet.Código, TbGestDet.CodGestante, TbGestDet.DataCad, TbGestDet.DPP"
        ", TbGestDet.DPSaida, TbGestDet.[Kit enxoval], TbGestDet.[data entrega kit enxova"
        "l], TbGestDet.[Kit masc], TbGestDet.[Kit fem], TbGestDet.obs, TbGestDet.DataDesl"
        " FROM TbGestDet; "
    Caption ="TbGestDet subformulário1"
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
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =4935
            Name ="Detalhe"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =56
                    Height =315
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Código"
                    ControlSource ="Código"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =56
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =371
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =56
                            Width =720
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo20"
                            Caption ="Código"
                            GridlineColor =10921638
                            LayoutCachedTop =56
                            LayoutCachedWidth =720
                            LayoutCachedHeight =371
                        End
                    End
                End
                Begin ComboBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =1303
                    Top =453
                    Height =315
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodGestante"
                    ControlSource ="CodGestante"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT TbGestante.CodGestante FROM TbGestante; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =453
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =768
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =453
                            Width =1275
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo21"
                            Caption ="CodGestante"
                            GridlineColor =10921638
                            LayoutCachedTop =453
                            LayoutCachedWidth =1275
                            LayoutCachedHeight =768
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =850
                    Height =315
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataCad"
                    ControlSource ="DataCad"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =850
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =1165
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =850
                            Width =840
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo22"
                            Caption ="DataCad"
                            GridlineColor =10921638
                            LayoutCachedTop =850
                            LayoutCachedWidth =840
                            LayoutCachedHeight =1165
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =1247
                    Height =315
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DPP"
                    ControlSource ="DPP"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =1247
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =1562
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =1247
                            Width =450
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo23"
                            Caption ="DPP"
                            GridlineColor =10921638
                            LayoutCachedTop =1247
                            LayoutCachedWidth =450
                            LayoutCachedHeight =1562
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =1644
                    Height =315
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DPSaida"
                    ControlSource ="DPSaida"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =1644
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =1959
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =1644
                            Width =825
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo24"
                            Caption ="DPSaida"
                            GridlineColor =10921638
                            LayoutCachedTop =1644
                            LayoutCachedWidth =825
                            LayoutCachedHeight =1959
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =2040
                    TabIndex =5
                    BorderColor =10921638
                    Name ="Kit enxoval"
                    ControlSource ="Kit enxoval"
                    EventProcPrefix ="Kit_enxoval"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =2040
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =2280
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =2010
                            Width =1110
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo25"
                            Caption ="Kit enxoval"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =2010
                            LayoutCachedWidth =2643
                            LayoutCachedHeight =2325
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =1303
                    Top =2381
                    Height =315
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="data entrega kit enxoval"
                    ControlSource ="data entrega kit enxoval"
                    EventProcPrefix ="data_entrega_kit_enxoval"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =2381
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =2696
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Top =2381
                            Width =2310
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo26"
                            Caption ="data entrega kit enxoval"
                            GridlineColor =10921638
                            LayoutCachedTop =2381
                            LayoutCachedWidth =2310
                            LayoutCachedHeight =2696
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =2777
                    TabIndex =7
                    BorderColor =10921638
                    Name ="Kit masc"
                    ControlSource ="Kit masc"
                    EventProcPrefix ="Kit_masc"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =2777
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =3017
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =2747
                            Width =840
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo27"
                            Caption ="Kit masc"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =2747
                            LayoutCachedWidth =2373
                            LayoutCachedHeight =3062
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =3118
                    TabIndex =8
                    BorderColor =10921638
                    Name ="Kit fem"
                    ControlSource ="Kit fem"
                    EventProcPrefix ="Kit_fem"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =3118
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =3358
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =3088
                            Width =750
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo28"
                            Caption ="Kit fem"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =3088
                            LayoutCachedWidth =2283
                            LayoutCachedHeight =3403
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =3458
                    Height =315
                    TabIndex =9
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="obs"
                    ControlSource ="obs"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =3458
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =3773
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =3458
                            Width =405
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo29"
                            Caption ="obs"
                            GridlineColor =10921638
                            LayoutCachedTop =3458
                            LayoutCachedWidth =405
                            LayoutCachedHeight =3773
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =3855
                    Height =315
                    TabIndex =10
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataDesl"
                    ControlSource ="DataDesl"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =3855
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =4170
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =3855
                            Width =900
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo30"
                            Caption ="DataDesl"
                            GridlineColor =10921638
                            LayoutCachedTop =3855
                            LayoutCachedWidth =900
                            LayoutCachedHeight =4170
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
