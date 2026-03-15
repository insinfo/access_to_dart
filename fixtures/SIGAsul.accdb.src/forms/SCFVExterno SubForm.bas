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
    Width =10209
    DatasheetFontHeight =11
    ItemSuffix =29
    Left =-6315
    Top =2280
    Right =7485
    Bottom =9015
    RecSrcDt = Begin
        0x8644787f4c8ce540
    End
    RecordSource ="SELECT TbSCFVExtDetalhe.CodSCDVEDet, TbSCFVExtDetalhe.CodSCFVExterno, TbSCFVExtD"
        "etalhe.DataInsc, TbSCFVExtDetalhe.Nome, TbSCFVExtDetalhe.DNascPessoa, TbSCFVExtD"
        "etalhe.NIS, TbSCFVExtDetalhe.NomeMae, TbSCFVExtDetalhe.CelularMae, TbSCFVExtDeta"
        "lhe.SitUsuario, TbSCFVExtDetalhe.DataExcl, TbSCFVExtDetalhe.MotivExcl, TbSCFVExt"
        "Detalhe.EncaminhadoPosExcl, TbSCFVExtDetalhe.LocalEncamPosExcl FROM TbSCFVExtDet"
        "alhe; "
    Caption ="SCFVExterno SubForm"
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
            Height =10091
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
                    ColumnWidth =1035
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodSCDVEDet"
                    ControlSource ="CodSCDVEDet"
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
                            Name ="CodSCDVEDet_Rótulo"
                            Caption ="CodSCDVEDet"
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
                    ColumnWidth =975
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodSCFVExterno"
                    ControlSource ="CodSCFVExterno"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbSCFVExterno].[CodSCFVExterno] FROM TbSCFVExterno ORDER BY [CodSCFVExte"
                        "rno]; "
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
                            Name ="CodSCFVExterno_Rótulo"
                            Caption ="CodSCFVExterno"
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
                    ColumnWidth =1365
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataInsc"
                    ControlSource ="DataInsc"
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
                            Name ="DataInsc_Rótulo"
                            Caption ="DataInsc"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =1140
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =1470
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =2622
                    Width =1620
                    Height =330
                    ColumnWidth =1440
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DNascPessoatxt"
                    ControlSource ="DNascPessoa"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =2622
                    LayoutCachedWidth =4512
                    LayoutCachedHeight =2952
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =2622
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DNascPessoa_Rótulo"
                            Caption ="DNascPessoa"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =2622
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =2952
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =3021
                    Width =7260
                    Height =600
                    ColumnWidth =1605
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NIStxt"
                    ControlSource ="NIS"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3021
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =3621
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3021
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NIS_Rótulo"
                            Caption ="NIS"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3021
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =3351
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =3705
                    Width =7260
                    Height =600
                    ColumnWidth =2925
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NomeMaetxt"
                    ControlSource ="NomeMae"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =3705
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =4305
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =3705
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NomeMae_Rótulo"
                            Caption ="NomeMae"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =3705
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4035
                        End
                    End
                End
                Begin TextBox
                    Enabled = NotDefault
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =4389
                    Width =7260
                    Height =600
                    ColumnWidth =1920
                    TabIndex =7
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CelularMaetxt"
                    ControlSource ="CelularMae"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =4389
                    LayoutCachedWidth =10152
                    LayoutCachedHeight =4989
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =4389
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CelularMae_Rótulo"
                            Caption ="CelularMae"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =4389
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =4719
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1442
                    Left =2892
                    Top =5073
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="SitUsuario"
                    ControlSource ="SitUsuario"
                    RowSourceType ="Value List"
                    RowSource ="\"Não está em situação de prioridade\";\"Em situação de isolamento\";\"Trabalho "
                        "infantil\";\"Vivência de violência e/ou negligência\";\"Fora da escola defasagem"
                        " sup 2 anos\";\"Em situação de acolhimento\";\"Situação de abuso e/ou exploração"
                        " sexual\";\"Com medidas protetivas do ECA\";\"Crianças e adolescentes em situaçã"
                        "o de rua\";\"Vulnerabilidade de pessoa com deficiência\""
                    ColumnWidths ="1442"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =5073
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =5403
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =5073
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SitUsuario_Rótulo"
                            Caption ="SitUsuario"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =5073
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =5403
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2892
                    Top =5472
                    Width =1620
                    Height =330
                    ColumnWidth =1620
                    TabIndex =9
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataExcl"
                    ControlSource ="DataExcl"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =5472
                    LayoutCachedWidth =4512
                    LayoutCachedHeight =5802
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =5472
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataExcl_Rótulo"
                            Caption ="DataExcl"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =5472
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =5802
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1443
                    Left =2892
                    Top =5871
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =10
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="MotivExcl"
                    ControlSource ="MotivExcl"
                    RowSourceType ="Value List"
                    RowSource ="\"Mudança de município\";\"Falecimento\";\"Solicitação de desvinculação por part"
                        "e do usuário\";\"Fora das faixas etárias atendidas pelo município\";\"Duplicidad"
                        "e de cadastro\";\"Avaliação da equipe técnica com part do usuário\";\"Alteração "
                        "de grupo\""
                    ColumnWidths ="1443"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =5871
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =6201
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =5871
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="MotivExcl_Rótulo"
                            Caption ="MotivExcl"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =5871
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =6201
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2892
                    Top =6270
                    TabIndex =11
                    BorderColor =10921638
                    Name ="EncaminhadoPosExcl"
                    ControlSource ="EncaminhadoPosExcl"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =6270
                    LayoutCachedWidth =3152
                    LayoutCachedHeight =6510
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =6270
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="EncaminhadoPosExcl_Rótulo"
                            Caption ="EncaminhadoPosExcl"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =6270
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =6600
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1443
                    Left =2892
                    Top =6669
                    Width =3660
                    Height =330
                    ColumnWidth =3000
                    TabIndex =12
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="LocalEncamPosExcl"
                    ControlSource ="LocalEncamPosExcl"
                    RowSourceType ="Value List"
                    RowSource ="\"Encaminhado a outro CRAS\";\"Encaminhado ao CREAS\";\"Encaminhadoo ao CRAS de "
                        "referência do grupo\""
                    ColumnWidths ="1443"
                    GridlineColor =10921638

                    LayoutCachedLeft =2892
                    LayoutCachedTop =6669
                    LayoutCachedWidth =6552
                    LayoutCachedHeight =6999
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =342
                            Top =6669
                            Width =2460
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="LocalEncamPosExcl_Rótulo"
                            Caption ="LocalEncamPosExcl"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =6669
                            LayoutCachedWidth =2802
                            LayoutCachedHeight =6999
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =6
                    ListWidth =9615
                    Left =2948
                    Top =1644
                    Width =2541
                    Height =315
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Nometxt"
                    ControlSource ="Nome"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome], [TbPessoa].[DNasc], [TbPessoa]"
                        ".[NIS], [TbPessoa].[NomeMae], [TbPessoa].[Celular] FROM TbPessoa ORDER BY [Nome]"
                        "; "
                    ColumnWidths ="0;3855;1440;1440;1440;1440"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =2948
                    LayoutCachedTop =1644
                    LayoutCachedWidth =5489
                    LayoutCachedHeight =1959
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1247
                            Top =1644
                            Width =645
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo28"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =1247
                            LayoutCachedTop =1644
                            LayoutCachedWidth =1892
                            LayoutCachedHeight =1959
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
' See "SCFVExterno SubForm.cls"
