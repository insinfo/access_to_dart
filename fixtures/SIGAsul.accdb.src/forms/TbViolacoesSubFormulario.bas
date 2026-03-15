Version =20
VersionRequired =20
Begin Form
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =2
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =11520
    DatasheetFontHeight =11
    ItemSuffix =82
    Top =2070
    Right =16095
    Bottom =7050
    RecSrcDt = Begin
        0xd074c48e3097e540
    End
    RecordSource ="SELECT TbViolacoesSubF.CodVSF, TbViolacoesSubF.CodViol, TbViolacoesSubF.DataReto"
        "rno, TbViolacoesSubF.TrabInf, TbViolacoesSubF.SupTrabInf, TbViolacoesSubF.ExplSe"
        "x, TbViolacoesSubF.SupExplSex, TbViolacoesSubF.AbuViolSex, TbViolacoesSubF.SupAb"
        "uViolSex, TbViolacoesSubF.ViolFis, TbViolacoesSubF.SupViolFis, TbViolacoesSubF.V"
        "ioPsic, TbViolacoesSubF.SupVioPsic, TbViolacoesSubF.NeglIdoso, TbViolacoesSubF.S"
        "upNeglIdoso, TbViolacoesSubF.NegliCri, TbViolacoesSubF.SupNegliCri, TbViolacoesS"
        "ubF.NegliPCD, TbViolacoesSubF.SupNegliPCD, TbViolacoesSubF.TrajRua, TbViolacoesS"
        "ubF.SupTrajRua, TbViolacoesSubF.TrafPess, TbViolacoesSubF.SupTrafPess, TbViolaco"
        "esSubF.ViolPatrIdoso, TbViolacoesSubF.SupViolPatrIdoso, TbViolacoesSubF.ViolPatr"
        "iPCD, TbViolacoesSubF.SupViolPatriPCD, TbViolacoesSubF.Outra, TbViolacoesSubF.Su"
        "pOutra FROM TbViolacoesSubF; "
    Caption ="TbViolacoesSubFormulario"
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
            Height =8652
            Name ="Detalhe"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2199
                    Top =342
                    Height =315
                    ColumnWidth =1701
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodVSF"
                    ControlSource ="CodVSF"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =342
                    LayoutCachedWidth =3900
                    LayoutCachedHeight =657
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =342
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodVSF_Rótulo"
                            Caption ="CodVSF"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =342
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =672
                        End
                    End
                End
                Begin ComboBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2199
                    Top =741
                    Width =2589
                    Height =330
                    ColumnWidth =1065
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodViol"
                    ControlSource ="CodViol"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbViolacoes].[CodViol] FROM TbViolacoes ORDER BY [CodViol]; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =741
                    LayoutCachedWidth =4788
                    LayoutCachedHeight =1071
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =741
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodViol_Rótulo"
                            Caption ="CodViol"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =741
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =1071
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2199
                    Top =1140
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataTrabInf"
                    ControlSource ="DataRetorno"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =1140
                    LayoutCachedWidth =3819
                    LayoutCachedHeight =1470
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1140
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataTrabInf_Rótulo"
                            Caption ="Data de Retorno"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =1470
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =1539
                    TabIndex =3
                    BorderColor =10921638
                    Name ="TrabInf"
                    ControlSource ="TrabInf"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =1539
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =1779
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1539
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="TrabInf_Rótulo"
                            Caption ="Trabalho Infantil"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1539
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =1869
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =1938
                    TabIndex =4
                    BorderColor =10921638
                    Name ="SupTrabInf"
                    ControlSource ="SupTrabInf"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =1938
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =2178
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1938
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupTrabInf_Rótulo"
                            Caption ="Superou Trab. Inf"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1938
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =2268
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =2736
                    TabIndex =5
                    BorderColor =10921638
                    Name ="ExplSex"
                    ControlSource ="ExplSex"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =2736
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =2976
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2736
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="ExplSex_Rótulo"
                            Caption ="Exploração Sexual"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2736
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =3066
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =3135
                    TabIndex =6
                    BorderColor =10921638
                    Name ="SupExplSex"
                    ControlSource ="SupExplSex"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =3135
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =3375
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3135
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupExplSex_Rótulo"
                            Caption ="Superou Expl. Sex"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3135
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =3465
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =3933
                    TabIndex =7
                    BorderColor =10921638
                    Name ="AbuViolSex"
                    ControlSource ="AbuViolSex"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =3933
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =4173
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =342
                            Top =3933
                            Width =1890
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="AbuViolSex_Rótulo"
                            Caption ="Abuso/Viol. Sexual "
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3933
                            LayoutCachedWidth =2232
                            LayoutCachedHeight =4248
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =4332
                    TabIndex =8
                    BorderColor =10921638
                    Name ="SupAbuViolSex"
                    ControlSource ="SupAbuViolSex"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =4332
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =4572
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =342
                            Top =4332
                            Width =2340
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupAbuViolSex_Rótulo"
                            Caption ="Superou Abuso/Viol.Sex"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =4332
                            LayoutCachedWidth =2682
                            LayoutCachedHeight =4647
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =5130
                    TabIndex =9
                    BorderColor =10921638
                    Name ="ViolFis"
                    ControlSource ="ViolFis"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =5130
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =5370
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =5130
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="ViolFis_Rótulo"
                            Caption ="Violencia Fisica"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =5130
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =5460
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =5529
                    TabIndex =10
                    BorderColor =10921638
                    Name ="SupViolFis"
                    ControlSource ="SupViolFis"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =5529
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =5769
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =5529
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupViolFis_Rótulo"
                            Caption ="Superou Viol. Fis"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =5529
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =5859
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =6327
                    TabIndex =11
                    BorderColor =10921638
                    Name ="VioPsic"
                    ControlSource ="VioPsic"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =6327
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =6567
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =342
                            Top =6327
                            Width =2055
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="VioPsic_Rótulo"
                            Caption ="Violencia Psicologica "
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =6327
                            LayoutCachedWidth =2397
                            LayoutCachedHeight =6642
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =6726
                    TabIndex =12
                    BorderColor =10921638
                    Name ="SupVioPsic"
                    ControlSource ="SupVioPsic"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =6726
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =6966
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =6726
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupVioPsic_Rótulo"
                            Caption ="Superou Viol. Psic"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =6726
                            LayoutCachedWidth =2109
                            LayoutCachedHeight =7056
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =7524
                    TabIndex =13
                    BorderColor =10921638
                    Name ="NeglIdoso"
                    ControlSource ="NeglIdoso"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =7524
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =7764
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =342
                            Top =7524
                            Width =2355
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NeglIdoso_Rótulo"
                            Caption ="NeglIgencia contra Idoso"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =7524
                            LayoutCachedWidth =2697
                            LayoutCachedHeight =7839
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2199
                    Top =7923
                    TabIndex =14
                    BorderColor =10921638
                    Name ="SupNeglIdoso"
                    ControlSource ="SupNeglIdoso"
                    GridlineColor =10921638

                    LayoutCachedLeft =2199
                    LayoutCachedTop =7923
                    LayoutCachedWidth =2459
                    LayoutCachedHeight =8163
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =342
                            Top =7923
                            Width =2115
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupNeglIdoso_Rótulo"
                            Caption ="Superou Neglig. Idoso"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =7923
                            LayoutCachedWidth =2457
                            LayoutCachedHeight =8238
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =342
                    TabIndex =15
                    BorderColor =10921638
                    Name ="NegliCri"
                    ControlSource ="NegliCri"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =342
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =582
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =342
                            Width =1890
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NegliCri_Rótulo"
                            Caption ="Negligencia Criança"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =342
                            LayoutCachedWidth =6858
                            LayoutCachedHeight =657
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =741
                    TabIndex =16
                    BorderColor =10921638
                    Name ="SupNegliCri"
                    ControlSource ="SupNegliCri"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =741
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =981
                    Begin
                        Begin Label
                            OverlapFlags =119
                            Left =4968
                            Top =741
                            Width =1860
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupNegliCri_Rótulo"
                            Caption ="Superou Neglig. Cri"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =741
                            LayoutCachedWidth =6828
                            LayoutCachedHeight =1056
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =1539
                    TabIndex =17
                    BorderColor =10921638
                    Name ="NegliPCD"
                    ControlSource ="NegliPCD"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =1539
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =1779
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =4968
                            Top =1539
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NegliPCD_Rótulo"
                            Caption ="Negligencia PCD"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =1539
                            LayoutCachedWidth =6735
                            LayoutCachedHeight =1869
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =1938
                    TabIndex =18
                    BorderColor =10921638
                    Name ="SupNegliPCD"
                    ControlSource ="SupNegliPCD"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =1938
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =2178
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =1938
                            Width =2025
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupNegliPCD_Rótulo"
                            Caption ="Superou Neglig. PCD "
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =1938
                            LayoutCachedWidth =6993
                            LayoutCachedHeight =2253
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =2736
                    TabIndex =19
                    BorderColor =10921638
                    Name ="TrajRua"
                    ControlSource ="TrajRua"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =2736
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =2976
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =4968
                            Top =2736
                            Width =1767
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="TrajRua_Rótulo"
                            Caption ="Trajetoria de Rua"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =2736
                            LayoutCachedWidth =6735
                            LayoutCachedHeight =3066
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =3135
                    TabIndex =20
                    BorderColor =10921638
                    Name ="SupTrajRua"
                    ControlSource ="SupTrajRua"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =3135
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =3375
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =3135
                            Width =1980
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupTrajRua_Rótulo"
                            Caption ="Superou Traj. de Rua"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =3135
                            LayoutCachedWidth =6948
                            LayoutCachedHeight =3450
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =3933
                    TabIndex =21
                    BorderColor =10921638
                    Name ="TrafPess"
                    ControlSource ="TrafPess"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =3933
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =4173
                    Begin
                        Begin Label
                            OverlapFlags =119
                            Left =4968
                            Top =3933
                            Width =1860
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="TrafPess_Rótulo"
                            Caption ="Trafico de Pessoas  "
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =3933
                            LayoutCachedWidth =6828
                            LayoutCachedHeight =4248
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =4332
                    TabIndex =22
                    BorderColor =10921638
                    Name ="SupTrafPess"
                    ControlSource ="SupTrafPess"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =4332
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =4572
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =4332
                            Width =2340
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupTrafPess_Rótulo"
                            Caption ="Superou Trafico de Pess."
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =4332
                            LayoutCachedWidth =7308
                            LayoutCachedHeight =4647
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =5130
                    TabIndex =23
                    BorderColor =10921638
                    Name ="ViolPatrIdoso"
                    ControlSource ="ViolPatrIdoso"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =5130
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =5370
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =5130
                            Width =2850
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="ViolPatrIdoso_Rótulo"
                            Caption ="Violencia Patrim. contra Idoso"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =5130
                            LayoutCachedWidth =7818
                            LayoutCachedHeight =5445
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =5529
                    TabIndex =24
                    BorderColor =10921638
                    Name ="SupViolPatrIdoso"
                    ControlSource ="SupViolPatrIdoso"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =5529
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =5769
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =5529
                            Width =2610
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupViolPatrIdoso_Rótulo"
                            Caption ="Superou Viol. Patrim. Idoso"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =5529
                            LayoutCachedWidth =7578
                            LayoutCachedHeight =5844
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =6327
                    TabIndex =25
                    BorderColor =10921638
                    Name ="ViolPatriPCD"
                    ControlSource ="ViolPatriPCD"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =6327
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =6567
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =6327
                            Width =3120
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="ViolPatriPCD_Rótulo"
                            Caption ="Violencia Patrimonial contra PCD"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =6327
                            LayoutCachedWidth =8088
                            LayoutCachedHeight =6642
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =6726
                    TabIndex =26
                    BorderColor =10921638
                    Name ="SupViolPatriPCD"
                    ControlSource ="SupViolPatriPCD"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =6726
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =6966
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =6726
                            Width =2415
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupViolPatriPCD_Rótulo"
                            Caption ="Superou Viol. Patrim PCD"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =6726
                            LayoutCachedWidth =7383
                            LayoutCachedHeight =7041
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =6825
                    Top =7524
                    Width =4638
                    Height =600
                    ColumnWidth =3000
                    TabIndex =27
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Outra"
                    ControlSource ="Outra"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =7524
                    LayoutCachedWidth =11463
                    LayoutCachedHeight =8124
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =4968
                            Top =7524
                            Width =2400
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Outra_Rótulo"
                            Caption ="Outra Violencia/Violação"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =7524
                            LayoutCachedWidth =7368
                            LayoutCachedHeight =7839
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6825
                    Top =8208
                    TabIndex =28
                    BorderColor =10921638
                    Name ="SupOutra"
                    ControlSource ="SupOutra"
                    GridlineColor =10921638

                    LayoutCachedLeft =6825
                    LayoutCachedTop =8208
                    LayoutCachedWidth =7085
                    LayoutCachedHeight =8448
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4968
                            Top =8208
                            Width =3225
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SupOutra_Rótulo"
                            Caption ="Superou Outra Violencia/Violação"
                            GridlineColor =10921638
                            LayoutCachedLeft =4968
                            LayoutCachedTop =8208
                            LayoutCachedWidth =8193
                            LayoutCachedHeight =8523
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
