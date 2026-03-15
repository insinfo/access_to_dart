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
    Width =18651
    DatasheetFontHeight =11
    ItemSuffix =44
    Top =2820
    Right =15510
    Bottom =6930
    RecSrcDt = Begin
        0xfc53202ff38fe540
    End
    RecordSource ="SELECT TbOfSocioEduDetalhe.CodOfSEDet, TbOfSocioEduDetalhe.CodOfSEduc, TbOfSocio"
        "EduDetalhe.DataInsc, TbOfSocioEduDetalhe.Nome, TbOfSocioEduDetalhe.DNasPessoa, T"
        "bOfSocioEduDetalhe.Idade, TbOfSocioEduDetalhe.SituaçãoUsuario, TbOfSocioEduDetal"
        "he.[Nome Respons Criança], TbOfSocioEduDetalhe.[CPF Resp], TbOfSocioEduDetalhe.["
        "Cel Resp], TbOfSocioEduDetalhe.[Parentesco Resp], TbOfSocioEduDetalhe.Aco, TbOfS"
        "ocioEduDetalhe.PAF, TbOfSocioEduDetalhe.Obs, TbOfSocioEduDetalhe.DataDesl, TbOfS"
        "ocioEduDetalhe.MotivoDesl, TbOfSocioEduDetalhe.Encaminhado, TbOfSocioEduDetalhe."
        "Onde, TbOfSocioEduDetalhe.[Motivo busca serviço], TbOfSocioEduDetalhe.[Qual poli"
        "tica encaminhou], TbOfSocioEduDetalhe.[Cuidador exclusivo], TbOfSocioEduDetalhe."
        "[Cuidador exclusivo trabalha], TbOfSocioEduDetalhe.[Familia dentro perfil] FROM "
        "TbOfSocioEduDetalhe; "
    Caption ="OFICINASOCEDUC SUBFORM"
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
            Height =11451
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
                    ColumnWidth =1530
                    ColumnOrder =0
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodOfSEDet"
                    ControlSource ="CodOfSEDet"
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
                            Name ="CodOfSEDet_Rótulo"
                            Caption ="CodOfSEDet"
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
                    ColumnWidth =1575
                    ColumnOrder =1
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodOfSEduc"
                    ControlSource ="CodOfSEduc"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbOfSocioEduc].[CodOfSEduc] FROM TbOfSocioEduc ORDER BY [CodOfSEduc]; "
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
                            Name ="CodOfSEduc_Rótulo"
                            Caption ="CodOfSEduc"
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
                    Left =2895
                    Top =1920
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    ColumnOrder =4
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DNasPessoaTXT"
                    ControlSource ="DNasPessoa"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =1920
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =2250
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =1920
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DNasPessoa_Rótulo"
                            Caption ="DNasPessoa"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =1920
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =2250
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2898
                    Top =2757
                    Width =3660
                    Height =330
                    ColumnWidth =2175
                    ColumnOrder =6
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="SituaçãoUsuario"
                    ControlSource ="SituaçãoUsuario"
                    RowSourceType ="Value List"
                    RowSource ="\"Não está em situação de prioridade\";\"Em situação de isolamento\";\"Trabalho "
                        "infantil\";\"Vivência de violência e/ou negligência\";\"Fora da escola defasagem"
                        " sup 2 anos\";\"Em situação de acolhimento\";\"Situação de abuso e/ou exploração"
                        " sexual\";\"Com medidas protetivas do ECA\";\"Crianças e adolescentes em situaçã"
                        "o de rua\";\"Vulnerabilidade de pessoa com deficiência\""
                    ColumnWidths ="1440"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2898
                    LayoutCachedTop =2757
                    LayoutCachedWidth =6558
                    LayoutCachedHeight =3087
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =348
                            Top =2757
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SituaçãoUsuario_Rótulo"
                            Caption ="SituaçãoUsuario"
                            GridlineColor =10921638
                            LayoutCachedLeft =348
                            LayoutCachedTop =2757
                            LayoutCachedWidth =2808
                            LayoutCachedHeight =3087
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2895
                    Top =5895
                    Width =1620
                    Height =330
                    ColumnWidth =1980
                    ColumnOrder =7
                    TabIndex =7
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataDesl"
                    ControlSource ="DataDesl"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =5895
                    LayoutCachedWidth =4515
                    LayoutCachedHeight =6225
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =5895
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataDesl_Rótulo"
                            Caption ="DataDesl"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =5895
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =6225
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =6573
                    ColumnOrder =9
                    TabIndex =9
                    BorderColor =10921638
                    Name ="Encaminhado"
                    ControlSource ="Encaminhado"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =6573
                    LayoutCachedWidth =3155
                    LayoutCachedHeight =6813
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =6573
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Encaminhado_Rótulo"
                            Caption ="Encaminhado"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =6573
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =6903
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2895
                    Top =6972
                    Width =7260
                    Height =600
                    ColumnWidth =2205
                    ColumnOrder =10
                    TabIndex =10
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Onde"
                    ControlSource ="Onde"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =6972
                    LayoutCachedWidth =10155
                    LayoutCachedHeight =7572
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =6972
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Onde_Rótulo"
                            Caption ="Onde"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =6972
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =7302
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2895
                    Top =5445
                    Width =6750
                    Height =345
                    ColumnWidth =2460
                    ColumnOrder =11
                    TabIndex =11
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Obs"
                    ControlSource ="Obs"
                    GridlineColor =10921638

                    LayoutCachedLeft =2895
                    LayoutCachedTop =5445
                    LayoutCachedWidth =9645
                    LayoutCachedHeight =5790
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =345
                            Top =5445
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Obs_Rótulo"
                            Caption ="Obs"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =5445
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =5775
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
                    Left =2933
                    Top =2304
                    Width =2862
                    Height =330
                    ColumnWidth =885
                    ColumnOrder =5
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Idadetxt"
                    ControlSource ="=(Date()-([DNasPessoa]))/365.25"
                    Format ="Standard"
                    GridlineColor =10921638

                    LayoutCachedLeft =2933
                    LayoutCachedTop =2304
                    LayoutCachedWidth =5795
                    LayoutCachedHeight =2634
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =1760
                            Top =2304
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Idade_Rótulo"
                            Caption ="Idade"
                            GridlineColor =10921638
                            LayoutCachedLeft =1760
                            LayoutCachedTop =2304
                            LayoutCachedWidth =2843
                            LayoutCachedHeight =2634
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2895
                    Top =9495
                    Width =283
                    Height =227
                    ColumnWidth =2160
                    TabIndex =12
                    BorderColor =10921638
                    Name ="Seleção27"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =0
                        Begin
                            Action ="OpenForm"
                            Argument ="FrmDadosEspeciaisSCFV"
                            Argument ="0"
                            Argument =""
                            Argument =""
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"Seleção27\" Event=\"OnClick\" xmlns=\"http://schemas.microso"
                                "ft.com/office/accessservices/2009/11/application\"><Statements><Action Name=\"Op"
                                "enForm\"><Argument Name=\"FormName"
                        End
                        Begin
                            Comment ="_AXL:\">FrmDadosEspeciaisSCFV</Argument></Action></Statements></UserInterfaceMac"
                                "ro>"
                        End
                    End

                    LayoutCachedLeft =2895
                    LayoutCachedTop =9495
                    LayoutCachedWidth =3178
                    LayoutCachedHeight =9722
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3125
                            Top =9465
                            Width =4740
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo28"
                            Caption ="Peencher dados especiais da criança/adolescente  "
                            GridlineColor =10921638
                            LayoutCachedLeft =3125
                            LayoutCachedTop =9465
                            LayoutCachedWidth =7865
                            LayoutCachedHeight =9780
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2891
                    Top =6239
                    Width =2841
                    Height =315
                    ColumnOrder =8
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="MotivoDesl"
                    ControlSource ="MotivoDesl"
                    RowSourceType ="Value List"
                    RowSource ="\"Mudança de município\";\"Mudança de CRAS\";\"Falecimento\";\"Solcitação de des"
                        "vinculação por parte do usuário\";\"Fora das faixas etárias atendidas pelo munic"
                        "ípio\";\"Duplicidade de cadastro\";\"Avaliação da equipe técnica com part do usu"
                        "ário\";\"Avaliação da equipe técnica sem part do usuário\";\"Alteração de grupo\""
                    ColumnWidths ="1440"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =2891
                    LayoutCachedTop =6239
                    LayoutCachedWidth =5732
                    LayoutCachedHeight =6554
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1190
                            Top =6239
                            Width =1140
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo29"
                            Caption ="MotivoDesl"
                            GridlineColor =10921638
                            LayoutCachedLeft =1190
                            LayoutCachedTop =6239
                            LayoutCachedWidth =2330
                            LayoutCachedHeight =6554
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2041
                    Top =1133
                    Height =315
                    ColumnOrder =2
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataInsc"
                    ControlSource ="DataInsc"
                    GridlineColor =10921638

                    LayoutCachedLeft =2041
                    LayoutCachedTop =1133
                    LayoutCachedWidth =3742
                    LayoutCachedHeight =1448
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =340
                            Top =1133
                            Width =855
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo30"
                            Caption ="DataInsc"
                            GridlineColor =10921638
                            LayoutCachedLeft =340
                            LayoutCachedTop =1133
                            LayoutCachedWidth =1195
                            LayoutCachedHeight =1448
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =3
                    ListWidth =5295
                    Left =2040
                    Top =1530
                    Width =3456
                    Height =315
                    ColumnWidth =3450
                    ColumnOrder =3
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nometxt"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome], [TbPessoa].[DNasc] FROM TbPess"
                        "oa ORDER BY [Nome]; "
                    ColumnWidths ="0;3855;1440"
                    OnGotFocus ="[Event Procedure]"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =2040
                    LayoutCachedTop =1530
                    LayoutCachedWidth =5496
                    LayoutCachedHeight =1845
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =339
                            Top =1530
                            Width =645
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo32"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =339
                            LayoutCachedTop =1530
                            LayoutCachedWidth =984
                            LayoutCachedHeight =1845
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =2901
                    Top =3180
                    Height =315
                    TabIndex =13
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Nome Respons Criança"
                    ControlSource ="Nome Respons Criança"
                    EventProcPrefix ="Nome_Respons_Criança"
                    GridlineColor =10921638

                    LayoutCachedLeft =2901
                    LayoutCachedTop =3180
                    LayoutCachedWidth =4602
                    LayoutCachedHeight =3495
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =1200
                            Top =3180
                            Width =2190
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo33"
                            Caption ="Nome Respons Criança"
                            GridlineColor =10921638
                            LayoutCachedLeft =1200
                            LayoutCachedTop =3180
                            LayoutCachedWidth =3390
                            LayoutCachedHeight =3495
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2901
                    Top =3577
                    Height =315
                    TabIndex =14
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CPF Resp"
                    ControlSource ="CPF Resp"
                    InputMask ="000,000,000\\-00;0;"
                    EventProcPrefix ="CPF_Resp"
                    GridlineColor =10921638

                    LayoutCachedLeft =2901
                    LayoutCachedTop =3577
                    LayoutCachedWidth =4602
                    LayoutCachedHeight =3892
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1200
                            Top =3577
                            Width =915
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo34"
                            Caption ="CPF Resp"
                            GridlineColor =10921638
                            LayoutCachedLeft =1200
                            LayoutCachedTop =3577
                            LayoutCachedWidth =2115
                            LayoutCachedHeight =3892
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2901
                    Top =3974
                    Height =315
                    TabIndex =15
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Cel Resp"
                    ControlSource ="Cel Resp"
                    InputMask ="!\\(99\") \"!00000\\-0000;0;_"
                    EventProcPrefix ="Cel_Resp"
                    GridlineColor =10921638

                    LayoutCachedLeft =2901
                    LayoutCachedTop =3974
                    LayoutCachedWidth =4602
                    LayoutCachedHeight =4289
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1200
                            Top =3974
                            Width =870
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo35"
                            Caption ="Cel Resp"
                            GridlineColor =10921638
                            LayoutCachedLeft =1200
                            LayoutCachedTop =3974
                            LayoutCachedWidth =2070
                            LayoutCachedHeight =4289
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =2880
                    Left =2901
                    Top =4370
                    Height =315
                    TabIndex =16
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Parentesco Resp"
                    ControlSource ="Parentesco Resp"
                    RowSourceType ="Value List"
                    RowSource ="\"Mãe/Pai\";\"Madrasta/Padrasto\";\"Avó/Avô\";\"Tia/Tio\";\"Outro\""
                    ColumnWidths ="2880"
                    EventProcPrefix ="Parentesco_Resp"
                    GridlineColor =10921638

                    LayoutCachedLeft =2901
                    LayoutCachedTop =4370
                    LayoutCachedWidth =4602
                    LayoutCachedHeight =4685
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1200
                            Top =4370
                            Width =1605
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo36"
                            Caption ="Parentesco Resp"
                            GridlineColor =10921638
                            LayoutCachedLeft =1200
                            LayoutCachedTop =4370
                            LayoutCachedWidth =2805
                            LayoutCachedHeight =4685
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2381
                    Top =4761
                    TabIndex =17
                    BorderColor =10921638
                    Name ="Aco"
                    ControlSource ="Aco"
                    GridlineColor =10921638

                    LayoutCachedLeft =2381
                    LayoutCachedTop =4761
                    LayoutCachedWidth =2641
                    LayoutCachedHeight =5001
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =2611
                            Top =4731
                            Width =420
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo37"
                            Caption ="Aco"
                            GridlineColor =10921638
                            LayoutCachedLeft =2611
                            LayoutCachedTop =4731
                            LayoutCachedWidth =3031
                            LayoutCachedHeight =5046
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2381
                    Top =5101
                    TabIndex =18
                    BorderColor =10921638
                    Name ="PAF"
                    ControlSource ="PAF"
                    GridlineColor =10921638

                    LayoutCachedLeft =2381
                    LayoutCachedTop =5101
                    LayoutCachedWidth =2641
                    LayoutCachedHeight =5341
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =2611
                            Top =5071
                            Width =435
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo38"
                            Caption ="PAF"
                            GridlineColor =10921638
                            LayoutCachedLeft =2611
                            LayoutCachedTop =5071
                            LayoutCachedWidth =3046
                            LayoutCachedHeight =5386
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =215
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2961
                    Top =7650
                    Height =315
                    TabIndex =19
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Motivo busca serviço"
                    ControlSource ="Motivo busca serviço"
                    RowSourceType ="Value List"
                    RowSource ="\"Demanda espontanea\";\"Direcionamento do PAIF\";\"Direcionamento do PAEFI\";\""
                        "Encam Sistema Garantia de Direitos\";\"Encam de Outras Politicas\""
                    ColumnWidths ="1440"
                    EventProcPrefix ="Motivo_busca_serviço"
                    GridlineColor =10921638

                    LayoutCachedLeft =2961
                    LayoutCachedTop =7650
                    LayoutCachedWidth =4662
                    LayoutCachedHeight =7965
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =1260
                            Top =7650
                            Width =2010
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo39"
                            Caption ="Motivo busca serviço"
                            GridlineColor =10921638
                            LayoutCachedLeft =1260
                            LayoutCachedTop =7650
                            LayoutCachedWidth =3270
                            LayoutCachedHeight =7965
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =2961
                    Top =8047
                    Height =315
                    TabIndex =20
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Qual politica encaminhou"
                    ControlSource ="Qual politica encaminhou"
                    EventProcPrefix ="Qual_politica_encaminhou"
                    GridlineColor =10921638

                    LayoutCachedLeft =2961
                    LayoutCachedTop =8047
                    LayoutCachedWidth =4662
                    LayoutCachedHeight =8362
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =1260
                            Top =8047
                            Width =2445
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo40"
                            Caption ="Qual politica encaminhou"
                            GridlineColor =10921638
                            LayoutCachedLeft =1260
                            LayoutCachedTop =8047
                            LayoutCachedWidth =3705
                            LayoutCachedHeight =8362
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2961
                    Top =8443
                    TabIndex =21
                    BorderColor =10921638
                    Name ="Cuidador exclusivo"
                    ControlSource ="Cuidador exclusivo"
                    EventProcPrefix ="Cuidador_exclusivo"
                    GridlineColor =10921638

                    LayoutCachedLeft =2961
                    LayoutCachedTop =8443
                    LayoutCachedWidth =3221
                    LayoutCachedHeight =8683
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3191
                            Top =8413
                            Width =1830
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo41"
                            Caption ="Cuidador exclusivo"
                            GridlineColor =10921638
                            LayoutCachedLeft =3191
                            LayoutCachedTop =8413
                            LayoutCachedWidth =5021
                            LayoutCachedHeight =8728
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2961
                    Top =8784
                    TabIndex =22
                    BorderColor =10921638
                    Name ="Cuidador exclusivo trabalha"
                    ControlSource ="Cuidador exclusivo trabalha"
                    EventProcPrefix ="Cuidador_exclusivo_trabalha"
                    GridlineColor =10921638

                    LayoutCachedLeft =2961
                    LayoutCachedTop =8784
                    LayoutCachedWidth =3221
                    LayoutCachedHeight =9024
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3191
                            Top =8754
                            Width =2640
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo42"
                            Caption ="Cuidador exclusivo trabalha"
                            GridlineColor =10921638
                            LayoutCachedLeft =3191
                            LayoutCachedTop =8754
                            LayoutCachedWidth =5831
                            LayoutCachedHeight =9069
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2961
                    Top =9124
                    TabIndex =23
                    BorderColor =10921638
                    Name ="Familia dentro perfil"
                    ControlSource ="Familia dentro perfil"
                    EventProcPrefix ="Familia_dentro_perfil"
                    GridlineColor =10921638

                    LayoutCachedLeft =2961
                    LayoutCachedTop =9124
                    LayoutCachedWidth =3221
                    LayoutCachedHeight =9364
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =3191
                            Top =9094
                            Width =1980
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo43"
                            Caption ="Familia dentro perfil"
                            GridlineColor =10921638
                            LayoutCachedLeft =3191
                            LayoutCachedTop =9094
                            LayoutCachedWidth =5171
                            LayoutCachedHeight =9409
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
' See "OFICINASOCEDUC SUBFORM.cls"
