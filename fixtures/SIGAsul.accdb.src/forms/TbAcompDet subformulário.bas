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
    Width =18595
    DatasheetFontHeight =11
    ItemSuffix =42
    Left =315
    Top =3405
    Right =19755
    Bottom =5865
    RecSrcDt = Begin
        0x142f159672d2e540
    End
    RecordSource ="SELECT TbAcompDet.CodAcompDet, TbAcompDet.CodAcomp, TbAcompDet.[PAF inicio], TbA"
        "compDet.[PAF fim], TbAcompDet.extpbz, TbAcompDet.trabinf, TbAcompDet.servacol, T"
        "bAcompDet.Defic, TbAcompDet.Idoso, TbAcompDet.Gest, TbAcompDet.Criança, TbAcompD"
        "et.Adol, TbAcompDet.[Alcool/Drogas], TbAcompDet.ConflitoFam, TbAcompDet.descPBF,"
        " TbAcompDet.FragilSocioEcon, TbAcompDet.DataDesl, TbAcompDet.[Motivo Deslig], Tb"
        "AcompDet.Coletivo, TbAcompDet.Particular, TbAcompDet.CodTecnico, TbAcompDet.Nome"
        "Tec, TbAcompDet.Grupo FROM TbAcompDet ORDER BY TbAcompDet.[PAF inicio] DESC; "
    Caption ="TbAcompDet subformulário"
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
            Height =8802
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
                    Left =2892
                    Top =342
                    Width =1101
                    Height =315
                    ColumnWidth =1095
                    ColumnOrder =0
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodAcompDet"
                    ControlSource ="CodAcompDet"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =342
                    LayoutCachedWidth =3993
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
                            Name ="CodAcompDet_Rótulo"
                            Caption ="CodAcompDet"
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
                    Width =1140
                    Height =330
                    ColumnWidth =1065
                    ColumnOrder =1
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodAcomp"
                    ControlSource ="CodAcomp"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbAcomp].[CodAcomp] FROM TbAcomp ORDER BY [CodAcomp]; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =741
                    LayoutCachedWidth =4032
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
                            Name ="CodAcomp_Rótulo"
                            Caption ="CodAcomp"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =93
                    IMESentenceMode =3
                    Left =2900
                    Top =2317
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    ColumnOrder =4
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PAF inicio"
                    ControlSource ="PAF inicio"
                    EventProcPrefix ="PAF_inicio"
                    GridlineColor =10921638

                    LayoutCachedLeft =2900
                    LayoutCachedTop =2317
                    LayoutCachedWidth =4520
                    LayoutCachedHeight =2647
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =350
                            Top =2317
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="PAF inicio_Rótulo"
                            Caption ="PAF inicio"
                            EventProcPrefix ="PAF_inicio_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =350
                            LayoutCachedTop =2317
                            LayoutCachedWidth =2810
                            LayoutCachedHeight =2647
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2900
                    Top =2716
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    ColumnOrder =5
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PAF fim"
                    ControlSource ="PAF fim"
                    EventProcPrefix ="PAF_fim"
                    GridlineColor =10921638

                    LayoutCachedLeft =2900
                    LayoutCachedTop =2716
                    LayoutCachedWidth =4520
                    LayoutCachedHeight =3046
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =350
                            Top =2716
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="PAF fim_Rótulo"
                            Caption ="PAF fim"
                            EventProcPrefix ="PAF_fim_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =350
                            LayoutCachedTop =2716
                            LayoutCachedWidth =2810
                            LayoutCachedHeight =3046
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =93
                    Left =2895
                    Top =4083
                    ColumnOrder =12
                    TabIndex =12
                    BorderColor =10921638
                    Name ="Defic"
                    ControlSource ="Defic"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =4083
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =4323
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =4083
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Defic_Rótulo"
                            Caption ="Deficiente"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =4083
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =4413
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =4482
                    ColumnOrder =13
                    TabIndex =13
                    BorderColor =10921638
                    Name ="Idoso"
                    ControlSource ="Idoso"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =4482
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =4722
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =4482
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Idoso_Rótulo"
                            Caption ="Idoso"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =4482
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =4812
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =4881
                    ColumnOrder =14
                    TabIndex =14
                    BorderColor =10921638
                    Name ="Gest"
                    ControlSource ="Gest"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =4881
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =5121
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =4881
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Gest_Rótulo"
                            Caption ="Gestante"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =4881
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =5211
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =5280
                    ColumnOrder =15
                    TabIndex =15
                    BorderColor =10921638
                    Name ="Criança"
                    ControlSource ="Criança"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =5280
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =5520
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =5280
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Criança_Rótulo"
                            Caption ="Criança"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =5280
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =5610
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =5679
                    ColumnOrder =16
                    TabIndex =16
                    BorderColor =10921638
                    Name ="Adol"
                    ControlSource ="Adol"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =5679
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =5919
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =5679
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Adol_Rótulo"
                            Caption ="Adolesc"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =5679
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =6009
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =6078
                    ColumnOrder =17
                    TabIndex =17
                    BorderColor =10921638
                    Name ="Alcool/Drogas"
                    ControlSource ="Alcool/Drogas"
                    EventProcPrefix ="Alcool_Drogas"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =6078
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =6318
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =6078
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Alcool/Drogas_Rótulo"
                            Caption ="Alcool/Drogas"
                            EventProcPrefix ="Alcool_Drogas_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =6078
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =6408
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =6477
                    ColumnOrder =19
                    TabIndex =18
                    BorderColor =10921638
                    Name ="ConflitoFam"
                    ControlSource ="ConflitoFam"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =6477
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =6717
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =6477
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="ConflitoFam_Rótulo"
                            Caption ="Conflito Fam"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =6477
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =6807
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =7260
                    TabIndex =20
                    BorderColor =10921638
                    Name ="FragilSocioEcon"
                    ControlSource ="FragilSocioEcon"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =7260
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =7500
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =7260
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="FragilSocioEcon_Rótulo"
                            Caption ="Fragil. SocioEcon"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =7260
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =7590
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2895
                    Top =7659
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =21
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataDesl"
                    ControlSource ="DataDesl"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =7659
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =7989
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =7659
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataDesl_Rótulo"
                            Caption ="DataDesl"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =7659
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =7989
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1443
                    Left =2895
                    Top =8058
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =22
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Motivo Deslig"
                    ControlSource ="Motivo Deslig"
                    RowSourceType ="Value List"
                    ColumnWidths ="1443"
                    EventProcPrefix ="Motivo_Deslig"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =8058
                    LayoutCachedWidth =6555
                    LayoutCachedHeight =8388
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =8058
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Motivo Deslig_Rótulo"
                            Caption ="Motivo Deslig"
                            EventProcPrefix ="Motivo_Deslig_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =8058
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =8388
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =93
                    Left =2895
                    Top =8457
                    ColumnOrder =7
                    TabIndex =7
                    BorderColor =10921638
                    Name ="Coletivo"
                    ControlSource ="Coletivo"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =8457
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =8697
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =345
                            Top =8457
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Coletivo_Rótulo"
                            Caption ="Coletivo"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =8457
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =8787
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =247
                    Left =2895
                    Top =8472
                    ColumnOrder =6
                    TabIndex =6
                    BorderColor =10921638
                    Name ="Particular"
                    ControlSource ="Particular"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =8472
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =8712
                    Begin
                        Begin Label
                            OverlapFlags =215
                            Left =345
                            Top =8472
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Particular_Rótulo"
                            Caption ="Particular"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =8472
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =8802
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =2880
                    Left =2890
                    Top =1190
                    Width =3660
                    Height =330
                    ColumnWidth =990
                    ColumnOrder =2
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodTecnicotxt"
                    ControlSource ="CodTecnico"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbCadFuncionario].[CodFunc], [TbCadFuncionario].[Nome] FROM TbCadFuncion"
                        "ario ORDER BY [CodFunc]; "
                    ColumnWidths ="1442;1442"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2890
                    LayoutCachedTop =1190
                    LayoutCachedWidth =6550
                    LayoutCachedHeight =1520
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =340
                            Top =1190
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodTecnico_Rótulo"
                            Caption ="CodTecnico"
                            GridlineColor =10921638
                            LayoutCachedLeft =340
                            LayoutCachedTop =1190
                            LayoutCachedWidth =2800
                            LayoutCachedHeight =1520
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2890
                    Top =1589
                    Width =7260
                    Height =345
                    ColumnWidth =3660
                    ColumnOrder =3
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NomeTectxt"
                    ControlSource ="NomeTec"
                    GridlineColor =10921638

                    LayoutCachedLeft =2890
                    LayoutCachedTop =1589
                    LayoutCachedWidth =10150
                    LayoutCachedHeight =1934
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =340
                            Top =1589
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NomeTec_Rótulo"
                            Caption ="NomeTec"
                            GridlineColor =10921638
                            LayoutCachedLeft =340
                            LayoutCachedTop =1589
                            LayoutCachedWidth =2800
                            LayoutCachedHeight =1919
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =247
                    IMESentenceMode =3
                    Left =2895
                    Top =1980
                    Width =7260
                    Height =345
                    ColumnWidth =870
                    ColumnOrder =8
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Grupo"
                    ControlSource ="Grupo"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =1980
                    LayoutCachedWidth =10155
                    LayoutCachedHeight =2325
                    Begin
                        Begin Label
                            OverlapFlags =87
                            Left =345
                            Top =1980
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Grupo_Rótulo"
                            Caption ="Grupo"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =1980
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =2310
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2891
                    Top =3118
                    ColumnOrder =9
                    TabIndex =9
                    BorderColor =10921638
                    Name ="extpbz"
                    ControlSource ="extpbz"
                    GridlineColor =10921638

                    LayoutCachedLeft =2891
                    LayoutCachedTop =3118
                    LayoutCachedWidth =3151
                    LayoutCachedHeight =3358
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3121
                            Top =3088
                            Width =1635
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo38"
                            Caption ="Extrema Pobreza"
                            GridlineColor =10921638
                            LayoutCachedLeft =3121
                            LayoutCachedTop =3088
                            LayoutCachedWidth =4756
                            LayoutCachedHeight =3403
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2891
                    Top =3458
                    ColumnOrder =10
                    TabIndex =10
                    BorderColor =10921638
                    Name ="trabinf"
                    ControlSource ="trabinf"
                    GridlineColor =10921638

                    LayoutCachedLeft =2891
                    LayoutCachedTop =3458
                    LayoutCachedWidth =3151
                    LayoutCachedHeight =3698
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3121
                            Top =3428
                            Width =1260
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo39"
                            Caption ="Trab. Infantil"
                            GridlineColor =10921638
                            LayoutCachedLeft =3121
                            LayoutCachedTop =3428
                            LayoutCachedWidth =4381
                            LayoutCachedHeight =3743
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2891
                    Top =3798
                    ColumnOrder =11
                    TabIndex =11
                    BorderColor =10921638
                    Name ="servacol"
                    ControlSource ="servacol"
                    GridlineColor =10921638

                    LayoutCachedLeft =2891
                    LayoutCachedTop =3798
                    LayoutCachedWidth =3151
                    LayoutCachedHeight =4038
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3121
                            Top =3768
                            Width =1785
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo40"
                            Caption ="Serv. Acolhimento"
                            GridlineColor =10921638
                            LayoutCachedLeft =3121
                            LayoutCachedTop =3768
                            LayoutCachedWidth =4906
                            LayoutCachedHeight =4083
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2891
                    Top =6803
                    ColumnOrder =18
                    TabIndex =19
                    BorderColor =10921638
                    Name ="descPBF"
                    ControlSource ="descPBF"
                    GridlineColor =10921638

                    LayoutCachedLeft =2891
                    LayoutCachedTop =6803
                    LayoutCachedWidth =3151
                    LayoutCachedHeight =7043
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3121
                            Top =6773
                            Width =840
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo41"
                            Caption ="descPBF"
                            GridlineColor =10921638
                            LayoutCachedLeft =3121
                            LayoutCachedTop =6773
                            LayoutCachedWidth =3961
                            LayoutCachedHeight =7088
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
' See "TbAcompDet subformulário.cls"
