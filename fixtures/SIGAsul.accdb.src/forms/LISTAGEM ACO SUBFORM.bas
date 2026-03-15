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
    Width =17971
    DatasheetFontHeight =11
    ItemSuffix =113
    Left =405
    Top =1035
    Right =19680
    Bottom =7500
    RecSrcDt = Begin
        0x4e1b0f637b88e540
    End
    RecordSource ="SELECT TbAcodet.CodAcoDet, TbAcodet.CodAco, TbAcodet.DataCadastro, TbAcodet.[PAF"
        " inicio], TbAcodet.[PAF fim], TbAcodet.Nome, TbAcodet.CodFamilia, TbAcodet.Defic"
        ", TbAcodet.Idoso, TbAcodet.Gest, TbAcodet.Criança, TbAcodet.Adol, TbAcodet.[Alco"
        "ol/Drogas], TbAcodet.ConflitoFam, TbAcodet.FragilSocioEcon, TbAcodet.DataDesl, T"
        "bAcodet.[Motivo Deslig] FROM TbAcodet; "
    Caption ="LISTAGEM ACO SUBFORM"
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
            Height =7653
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Height =315
                    ColumnWidth =975
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodAcoDet"
                    ControlSource ="CodAcoDet"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =315
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Width =1110
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo88"
                            Caption ="CodAcoDet"
                            GridlineColor =10921638
                            LayoutCachedWidth =1110
                            LayoutCachedHeight =315
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =1303
                    Top =396
                    Height =315
                    ColumnWidth =1155
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodAco"
                    ControlSource ="CodAco"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbAco].[codAco] FROM TbAco ORDER BY [codAco]; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =396
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =711
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =396
                            Width =780
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo89"
                            Caption ="CodAco"
                            GridlineColor =10921638
                            LayoutCachedTop =396
                            LayoutCachedWidth =780
                            LayoutCachedHeight =711
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =1303
                    Top =793
                    Height =315
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataCadastro"
                    ControlSource ="DataCadastro"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =793
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =1108
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Top =793
                            Width =1305
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo90"
                            Caption ="DataCadastro"
                            GridlineColor =10921638
                            LayoutCachedTop =793
                            LayoutCachedWidth =1305
                            LayoutCachedHeight =1108
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =1994
                    Height =315
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PAF inicio"
                    ControlSource ="PAF inicio"
                    EventProcPrefix ="PAF_inicio"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =1994
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =2309
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =1994
                            Width =990
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo91"
                            Caption ="PAF inicio"
                            GridlineColor =10921638
                            LayoutCachedTop =1994
                            LayoutCachedWidth =990
                            LayoutCachedHeight =2309
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =2391
                    Height =315
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="PAF fim"
                    ControlSource ="PAF fim"
                    EventProcPrefix ="PAF_fim"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =2391
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =2706
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =2391
                            Width =795
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo92"
                            Caption ="PAF fim"
                            GridlineColor =10921638
                            LayoutCachedTop =2391
                            LayoutCachedWidth =795
                            LayoutCachedHeight =2706
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1303
                    Top =1606
                    Height =315
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodFamiliaTXT"
                    ControlSource ="CodFamilia"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =1606
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =1921
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =1606
                            Width =1110
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo95"
                            Caption ="CodFamilia"
                            GridlineColor =10921638
                            LayoutCachedTop =1606
                            LayoutCachedWidth =1110
                            LayoutCachedHeight =1921
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =2787
                    TabIndex =7
                    BorderColor =10921638
                    Name ="Defic"
                    ControlSource ="Defic"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =2787
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =3027
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =2757
                            Width =555
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo96"
                            Caption ="Defic"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =2757
                            LayoutCachedWidth =2088
                            LayoutCachedHeight =3072
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =3127
                    TabIndex =8
                    BorderColor =10921638
                    Name ="Idoso"
                    ControlSource ="Idoso"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =3127
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =3367
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =3097
                            Width =585
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo97"
                            Caption ="Idoso"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =3097
                            LayoutCachedWidth =2118
                            LayoutCachedHeight =3412
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =3468
                    TabIndex =9
                    BorderColor =10921638
                    Name ="Gest"
                    ControlSource ="Gest"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =3468
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =3708
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =3438
                            Width =495
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo98"
                            Caption ="Gest"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =3438
                            LayoutCachedWidth =2028
                            LayoutCachedHeight =3753
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =3808
                    TabIndex =10
                    BorderColor =10921638
                    Name ="Criança"
                    ControlSource ="Criança"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =3808
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =4048
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =3778
                            Width =750
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo99"
                            Caption ="Criança"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =3778
                            LayoutCachedWidth =2283
                            LayoutCachedHeight =4093
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =4148
                    TabIndex =11
                    BorderColor =10921638
                    Name ="Adol"
                    ControlSource ="Adol"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =4148
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =4388
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =4118
                            Width =510
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo100"
                            Caption ="Adol"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =4118
                            LayoutCachedWidth =2043
                            LayoutCachedHeight =4433
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =4488
                    TabIndex =12
                    BorderColor =10921638
                    Name ="Alcool/Drogas"
                    ControlSource ="Alcool/Drogas"
                    EventProcPrefix ="Alcool_Drogas"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =4488
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =4728
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =4458
                            Width =1380
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo101"
                            Caption ="Alcool/Drogas"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =4458
                            LayoutCachedWidth =2913
                            LayoutCachedHeight =4773
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =4828
                    TabIndex =13
                    BorderColor =10921638
                    Name ="ConflitoFam"
                    ControlSource ="ConflitoFam"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =4828
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =5068
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =4798
                            Width =1215
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo102"
                            Caption ="ConflitoFam"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =4798
                            LayoutCachedWidth =2748
                            LayoutCachedHeight =5113
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1303
                    Top =5509
                    TabIndex =14
                    BorderColor =10921638
                    Name ="FragilSocioEcon"
                    ControlSource ="FragilSocioEcon"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =5509
                    LayoutCachedWidth =1563
                    LayoutCachedHeight =5749
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1533
                            Top =5479
                            Width =1515
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo104"
                            Caption ="FragilSocioEcon"
                            GridlineColor =10921638
                            LayoutCachedLeft =1533
                            LayoutCachedTop =5479
                            LayoutCachedWidth =3048
                            LayoutCachedHeight =5794
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1529
                    Top =5849
                    Height =315
                    TabIndex =15
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataDesl"
                    ControlSource ="DataDesl"
                    GridlineColor =10921638

                    LayoutCachedLeft =1529
                    LayoutCachedTop =5849
                    LayoutCachedWidth =3230
                    LayoutCachedHeight =6164
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =226
                            Top =5849
                            Width =900
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo110"
                            Caption ="DataDesl"
                            GridlineColor =10921638
                            LayoutCachedLeft =226
                            LayoutCachedTop =5849
                            LayoutCachedWidth =1126
                            LayoutCachedHeight =6164
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =215
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =1529
                    Top =6245
                    Height =315
                    TabIndex =16
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Motivo Deslig"
                    ControlSource ="Motivo Deslig"
                    RowSourceType ="Value List"
                    ColumnWidths ="1441"
                    EventProcPrefix ="Motivo_Deslig"
                    GridlineColor =10921638

                    LayoutCachedLeft =1529
                    LayoutCachedTop =6245
                    LayoutCachedWidth =3230
                    LayoutCachedHeight =6560
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =226
                            Top =6245
                            Width =1350
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo111"
                            Caption ="Motivo Deslig"
                            GridlineColor =10921638
                            LayoutCachedLeft =226
                            LayoutCachedTop =6245
                            LayoutCachedWidth =1576
                            LayoutCachedHeight =6560
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =1440
                    Left =1303
                    Top =1200
                    Height =315
                    ColumnWidth =4020
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nometxt"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT TbPessoa.CodPessoa, TbPessoa.Nome, CadResidencia.CodFam FROM TbPessoa INN"
                        "ER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam ORDER BY TbPesso"
                        "a.[Nome]; "
                    ColumnWidths ="0;1440"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =1303
                    LayoutCachedTop =1200
                    LayoutCachedWidth =3004
                    LayoutCachedHeight =1515
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =1200
                            Width =645
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo112"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedTop =1200
                            LayoutCachedWidth =645
                            LayoutCachedHeight =1515
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
CodeBehindForm
' See "LISTAGEM ACO SUBFORM.cls"
