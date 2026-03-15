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
    Width =6609
    DatasheetFontHeight =11
    ItemSuffix =24
    Left =420
    Top =3570
    Right =19635
    Bottom =6645
    RecSrcDt = Begin
        0x01d1a6fd6e95e540
    End
    RecordSource ="SELECT TbRegSint.CodRegSint, TbRegSint.CodAcomp, TbRegSint.DataRegSint, TbRegSin"
        "t.NomeTecnico, TbRegSint.[Foram efetivamente disponibilizadas], TbRegSint.[Em re"
        "lação aos encaminhamentos], TbRegSint.[A familia reconhece o Serviço de Aco], Tb"
        "RegSint.[Houve agravamento], TbRegSint.[A situação atual é equivalente à sit ini"
        "cial], TbRegSint.[Houve avanço mas não justifica desligamento], TbRegSint.[Houve"
        " significativo avanço e justifica desligamento], TbRegSint.[Acompanhamento PAIF "
        "sem sucesso não aderiu ao PAF] FROM TbRegSint; "
    Caption ="TbRegSint subformulário"
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
            Height =5175
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
                    ColumnWidth =1701
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodRegSint"
                    ControlSource ="CodRegSint"
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
                            Name ="CodRegSint_Rótulo"
                            Caption ="CodRegSint"
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
                    ColumnWidth =1395
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodAcomp"
                    ControlSource ="CodAcomp"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbAcomp].[CodAcomp] FROM TbAcomp ORDER BY [CodAcomp]; "
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
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =1140
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataRegSint"
                    ControlSource ="DataRegSint"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1140
                    LayoutCachedWidth =4512
                    LayoutCachedHeight =1470
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1140
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataRegSint_Rótulo"
                            Caption ="DataRegSint"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1470
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =1440
                    Left =2892
                    Top =1539
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="NomeTecnico"
                    ControlSource ="NomeTecnico"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbCadFuncionario].[CodFunc], [TbCadFuncionario].[Nome] FROM TbCadFuncion"
                        "ario ORDER BY [Nome]; "
                    ColumnWidths ="0;1440"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1539
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =1869
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1539
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NomeTecnico_Rótulo"
                            Caption ="NomeTecnico"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1539
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1869
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2892
                    Top =1938
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Foram edetivamente disponibilizadas"
                    ControlSource ="Foram efetivamente disponibilizadas"
                    RowSourceType ="Value List"
                    RowSource ="\"Sim\";\"Parcialmente\";\"Não\""
                    ColumnWidths ="1440"
                    EventProcPrefix ="Foram_edetivamente_disponibilizadas"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =1938
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =2268
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =1938
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Foram edetivamente disponibilizadas_Rótulo"
                            Caption ="Foram efetivamente disponibilizadas"
                            EventProcPrefix ="Foram_edetivamente_disponibilizadas_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1938
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2268
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2892
                    Top =2337
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Em relação aos encaminhamentos"
                    ControlSource ="Em relação aos encaminhamentos"
                    RowSourceType ="Value List"
                    RowSource ="\"Sim\";\"Parcialmente\";\"Não\""
                    ColumnWidths ="1440"
                    EventProcPrefix ="Em_relação_aos_encaminhamentos"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2337
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =2667
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2337
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Em relação aos encaminhamentos_Rótulo"
                            Caption ="Em relação aos encaminhamentos"
                            EventProcPrefix ="Em_relação_aos_encaminhamentos_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2337
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2667
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2892
                    Top =2736
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="A familia reconhece o Serviço de Aco"
                    ControlSource ="A familia reconhece o Serviço de Aco"
                    RowSourceType ="Value List"
                    RowSource ="\"Sim\";\"Parcialmente\";\"Não\""
                    ColumnWidths ="1440"
                    EventProcPrefix ="A_familia_reconhece_o_Serviço_de_Aco"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2736
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =3066
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2736
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="A familia reconhece o Serviço de Aco_Rótulo"
                            Caption ="A familia reconhece o Serviço de Aco"
                            EventProcPrefix ="A_familia_reconhece_o_Serviço_de_Aco_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2736
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3066
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =3135
                    ColumnWidth =2370
                    TabIndex =7
                    BorderColor =10921638
                    Name ="Houve agravamento"
                    ControlSource ="Houve agravamento"
                    EventProcPrefix ="Houve_agravamento"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3135
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =3375
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3135
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Houve agravamento_Rótulo"
                            Caption ="Houve agravamento"
                            EventProcPrefix ="Houve_agravamento_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3135
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3465
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =3534
                    TabIndex =8
                    BorderColor =10921638
                    Name ="A situação atual é equivalente à sit inicial"
                    ControlSource ="A situação atual é equivalente à sit inicial"
                    EventProcPrefix ="A_situação_atual_é_equivalente_à_sit_inicial"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3534
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =3774
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3534
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="A situação atual é equivalente à sit inicial_Rótulo"
                            Caption ="A situação atual é equivalente à sit inicial"
                            EventProcPrefix ="A_situação_atual_é_equivalente_à_sit_inicial_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3534
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3864
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =3933
                    TabIndex =9
                    BorderColor =10921638
                    Name ="Houve avanço mas não justifica desligamento"
                    ControlSource ="Houve avanço mas não justifica desligamento"
                    EventProcPrefix ="Houve_avanço_mas_não_justifica_desligamento"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3933
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =4173
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3933
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Houve avanço mas não justifica desligamento_Rótulo"
                            Caption ="Houve avanço mas não justifica desligamento"
                            EventProcPrefix ="Houve_avanço_mas_não_justifica_desligamento_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3933
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4263
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =4332
                    TabIndex =10
                    BorderColor =10921638
                    Name ="Houve significativo avanço e justifica desligamento"
                    ControlSource ="Houve significativo avanço e justifica desligamento"
                    EventProcPrefix ="Houve_significativo_avanço_e_justifica_desligamento"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =4332
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =4572
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4332
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Houve significativo avanço e justifica desligamento_Rótulo"
                            Caption ="Houve significativo avanço e justifica desligamento"
                            EventProcPrefix ="Houve_significativo_avanço_e_justifica_desligamento_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =4332
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4662
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =4731
                    ColumnWidth =6885
                    TabIndex =11
                    BorderColor =10921638
                    Name ="Acompanhamento PAIF sem sucesso não aderiu ao PAF"
                    ControlSource ="Acompanhamento PAIF sem sucesso não aderiu ao PAF"
                    EventProcPrefix ="Acompanhamento_PAIF_sem_sucesso_não_aderiu_ao_PAF"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =4731
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =4971
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4731
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Acompanhamento PAIF sem sucesso não aderiu ao PAF_Rótulo"
                            Caption ="Acompanhamento PAIF sem sucesso não aderiu ao PAF"
                            EventProcPrefix ="Acompanhamento_PAIF_sem_sucesso_não_aderiu_ao_PAF_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =4731
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =5061
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
