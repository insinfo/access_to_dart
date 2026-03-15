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
    Width =12215
    DatasheetFontHeight =11
    ItemSuffix =136
    Left =-1230
    Top =5610
    Right =18735
    Bottom =8685
    FrozenColumns =4
    RecSrcDt = Begin
        0x3b9ba353ba9ae540
    End
    RecordSource ="SELECT TbPessoa.CodPessoa, TbPessoa.CodFam, TbPessoa.DataCadPes, TbPessoa.Nome, "
        "TbPessoa.Apelido, TbPessoa.NomeMae, TbPessoa.NomePai, TbPessoa.Celular, TbPessoa"
        ".[Tel recado detalhes], TbPessoa.email, TbPessoa.NIS, TbPessoa.PROVICN, TbPessoa"
        ".PROVIRG, TbPessoa.PROVICTPS, TbPessoa.PROVICPF, TbPessoa.PROVITE, TbPessoa.CPF,"
        " TbPessoa.RG, TbPessoa.OrgaoRG, TbPessoa.DEmisRG, TbPessoa.[CERT LIVRO/FOLHA/TER"
        "MO], TbPessoa.[TITULO/ZONA/SEÇAO], TbPessoa.[Estado Civil], TbPessoa.Sexo, TbPes"
        "soa.[Raça/Cor], TbPessoa.DNasc, TbPessoa.Idade, TbPessoa.MunicNasc, TbPessoa.UFN"
        "asc, TbPessoa.Parentesco, TbPessoa.Autismo, TbPessoa.[Baixa visão], TbPessoa.Ceg"
        "ueira, TbPessoa.[Deficiencia fisica], TbPessoa.[Defic mental intelec], TbPessoa."
        "DoencaCronica, TbPessoa.[Qual DCronica], TbPessoa.[Sindrome down], TbPessoa.[Sur"
        "dez severa profunda], TbPessoa.[Surdez leve moderada], TbPessoa.[Transt doença m"
        "ental], TbPessoa.SituaçãoRua, TbPessoa.ServAco, TbPessoa.LerEscrever, TbPessoa.F"
        "reqEscola, TbPessoa.Escolaridade, TbPessoa.[NOME ESCOLA], TbPessoa.Turno, TbPess"
        "oa.CTPS, TbPessoa.[Nº CTPS], TbPessoa.[Condição Ocupação], TbPessoa.BPCD, TbPess"
        "oa.BPCI, TbPessoa.[Renda sem programas sociais], TbPessoa.[Renda per capita], Tb"
        "Pessoa.[Recebe programa social], TbPessoa.[Aposentado/pensionista], TbPessoa.Dat"
        "aDesligPes, TbPessoa.MotivoDeslPes FROM TbPessoa; "
    Caption ="COMPOSIÇÃO FAMILIAR SUBFORM"
    DatasheetFontName ="Calibri"
    OnKeyDown ="[Event Procedure]"
    OnLoad ="[Event Procedure]"
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
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin Section
            Height =15420
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1518
                    Top =735
                    Width =1021
                    Height =315
                    ColumnWidth =1050
                    ColumnOrder =1
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CodPessoa"
                    ControlSource ="CodPessoa"
                    GridlineColor =10921638

                    LayoutCachedLeft =1518
                    LayoutCachedTop =735
                    LayoutCachedWidth =2539
                    LayoutCachedHeight =1050
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =735
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodPessoa_Rótulo"
                            Caption ="CodPessoa"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =735
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =1065
                        End
                    End
                End
                Begin ComboBox
                    Enabled = NotDefault
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =1518
                    Top =285
                    Width =2931
                    Height =330
                    ColumnWidth =1425
                    ColumnOrder =0
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodFamtxt"
                    ControlSource ="CodFam"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT CadResidencia.CodFam, CadResidencia.DataCad FROM CadResidencia ORDER BY C"
                        "adResidencia.[CodFam]; "
                    ColumnWidths ="1021"
                    GridlineColor =10921638

                    LayoutCachedLeft =1518
                    LayoutCachedTop =285
                    LayoutCachedWidth =4449
                    LayoutCachedHeight =615
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =285
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CodResid_Rótulo"
                            Caption ="CodFam"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =285
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =615
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1518
                    Top =1260
                    Width =2931
                    Height =345
                    ColumnWidth =3780
                    ColumnOrder =2
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Nome"
                    ControlSource ="Nome"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF na frente do nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =1518
                    LayoutCachedTop =1260
                    LayoutCachedWidth =4449
                    LayoutCachedHeight =1605
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =1260
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Nome_Rótulo"
                            Caption ="Nome"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =1260
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =1590
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =223
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1518
                    Top =6300
                    Width =2931
                    Height =330
                    ColumnWidth =1785
                    ColumnOrder =9
                    TabIndex =12
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Apelido"
                    ControlSource ="Apelido"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1518
                    LayoutCachedTop =6300
                    LayoutCachedWidth =4449
                    LayoutCachedHeight =6630
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =1
                            Left =345
                            Top =6300
                            Width =1410
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Apelido_Rótulo"
                            Caption ="NOME SOCIAL "
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =6300
                            LayoutCachedWidth =1755
                            LayoutCachedHeight =6615
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =93
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1518
                    Top =6699
                    Width =2931
                    Height =330
                    ColumnWidth =2265
                    ColumnOrder =10
                    TabIndex =13
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NomeMae"
                    ControlSource ="NomeMae"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =1518
                    LayoutCachedTop =6699
                    LayoutCachedWidth =4449
                    LayoutCachedHeight =7029
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =6699
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NomeMae_Rótulo"
                            Caption ="NomeMae"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =6699
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =7029
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1518
                    Top =7770
                    Height =330
                    ColumnWidth =1725
                    ColumnOrder =12
                    TabIndex =15
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Celular"
                    ControlSource ="Celular"
                    InputMask ="!\\(99\")\"!99000\\-0000;0;"
                    GridlineColor =10921638

                    LayoutCachedLeft =1518
                    LayoutCachedTop =7770
                    LayoutCachedWidth =3219
                    LayoutCachedHeight =8100
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =7770
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Celular_Rótulo"
                            Caption ="Celular"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =7770
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =8100
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1515
                    Top =9015
                    Height =345
                    ColumnWidth =4020
                    ColumnOrder =15
                    TabIndex =18
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NIS"
                    ControlSource ="NIS"
                    GridlineColor =10921638

                    LayoutCachedLeft =1515
                    LayoutCachedTop =9015
                    LayoutCachedWidth =3216
                    LayoutCachedHeight =9360
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =342
                            Top =9015
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="NIS_Rótulo"
                            Caption ="NIS"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =9015
                            LayoutCachedWidth =1425
                            LayoutCachedHeight =9345
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1515
                    Top =11241
                    Width =1418
                    ColumnWidth =1200
                    ColumnOrder =21
                    TabIndex =24
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CPF"
                    ControlSource ="CPF"
                    InputMask ="000\\.000\\.000\\-00;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =1515
                    LayoutCachedTop =11241
                    LayoutCachedWidth =2933
                    LayoutCachedHeight =11481
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =342
                            Top =11241
                            Width =1083
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CPF_Rótulo"
                            Caption ="CPF"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =11241
                            LayoutCachedWidth =1425
                            LayoutCachedHeight =11481
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1515
                    Top =11571
                    Width =1418
                    ColumnWidth =1155
                    ColumnOrder =22
                    TabIndex =25
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="RG"
                    ControlSource ="RG"
                    GridlineColor =10921638

                    LayoutCachedLeft =1515
                    LayoutCachedTop =11571
                    LayoutCachedWidth =2933
                    LayoutCachedHeight =11811
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =342
                            Top =11571
                            Width =1083
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="RG_Rótulo"
                            Caption ="RG"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =11571
                            LayoutCachedWidth =1425
                            LayoutCachedHeight =11811
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1515
                    Top =11916
                    Width =1418
                    ColumnWidth =1125
                    ColumnOrder =23
                    TabIndex =26
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="OrgaoRG"
                    ControlSource ="OrgaoRG"
                    GridlineColor =10921638

                    LayoutCachedLeft =1515
                    LayoutCachedTop =11916
                    LayoutCachedWidth =2933
                    LayoutCachedHeight =12156
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =342
                            Top =11916
                            Width =1083
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="OrgaoRG_Rótulo"
                            Caption ="OrgaoRG"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =11916
                            LayoutCachedWidth =1425
                            LayoutCachedHeight =12156
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1515
                    Top =12261
                    Width =1620
                    ColumnWidth =1185
                    ColumnOrder =24
                    TabIndex =27
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DEmisRG"
                    ControlSource ="DEmisRG"
                    GridlineColor =10921638

                    LayoutCachedLeft =1515
                    LayoutCachedTop =12261
                    LayoutCachedWidth =3135
                    LayoutCachedHeight =12501
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =342
                            Top =12261
                            Width =1083
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DEmisRG_Rótulo"
                            Caption ="DEmisRG"
                            GridlineColor =10921638
                            LayoutCachedLeft =342
                            LayoutCachedTop =12261
                            LayoutCachedWidth =1425
                            LayoutCachedHeight =12501
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =2700
                    Left =1518
                    Top =5432
                    Width =2931
                    Height =330
                    ColumnWidth =1710
                    ColumnOrder =31
                    TabIndex =10
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Sexo"
                    ControlSource ="Sexo"
                    RowSourceType ="Value List"
                    RowSource ="\"M\";\"F\";\"Trans\""
                    ColumnWidths ="1134"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =1518
                    LayoutCachedTop =5432
                    LayoutCachedWidth =4449
                    LayoutCachedHeight =5762
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =5432
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Sexo_Rótulo"
                            Caption ="Sexo"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =5432
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =5762
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1518
                    Top =3915
                    Width =1134
                    Height =330
                    ColumnWidth =1380
                    ColumnOrder =7
                    TabIndex =7
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DNasc"
                    ControlSource ="DNasc"
                    GridlineColor =10921638

                    LayoutCachedLeft =1518
                    LayoutCachedTop =3915
                    LayoutCachedWidth =2652
                    LayoutCachedHeight =4245
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =3915
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DNasc_Rótulo"
                            Caption ="DNasc"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =3915
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =4245
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
                    Left =1518
                    Top =4320
                    Width =2517
                    Height =600
                    ColumnWidth =1095
                    ColumnOrder =8
                    TabIndex =8
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Idade"
                    ControlSource ="=(Date()-[DNASC])/365.25"
                    Format ="Standard"
                    GridlineColor =10921638

                    LayoutCachedLeft =1518
                    LayoutCachedTop =4320
                    LayoutCachedWidth =4035
                    LayoutCachedHeight =4920
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =4320
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Idade_Rótulo"
                            Caption ="Idade"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =4320
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =4650
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =2640
                    Left =1518
                    Top =1755
                    Width =2813
                    Height =330
                    ColumnWidth =3930
                    ColumnOrder =3
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Parentesco"
                    ControlSource ="Parentesco"
                    RowSourceType ="Value List"
                    RowSource ="\"Pessoa de Referencia\";\"Conjuge/Companheiro(a)\";\"Filho(a)\";\"Enteado(a)\";"
                        "\"Neto(a)/Bisneto(a)\";\"Pai/Mae\";\"Sogro(a)\";\"Irmão(ã)\";\"Genro/Nora\";\"Ou"
                        "tro\";\"Não Parente\""
                    ColumnWidths ="2640"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =1518
                    LayoutCachedTop =1755
                    LayoutCachedWidth =4331
                    LayoutCachedHeight =2085
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =345
                            Top =1755
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Parentesco_Rótulo"
                            Caption ="Parentesco"
                            GridlineColor =10921638
                            LayoutCachedLeft =345
                            LayoutCachedTop =1755
                            LayoutCachedWidth =1428
                            LayoutCachedHeight =2085
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5763
                    Top =4320
                    ColumnOrder =46
                    TabIndex =46
                    BorderColor =10921638
                    Name ="SituaçãoRua"
                    ControlSource ="SituaçãoRua"
                    GridlineColor =10921638

                    LayoutCachedLeft =5763
                    LayoutCachedTop =4320
                    LayoutCachedWidth =6023
                    LayoutCachedHeight =4560
                    Begin
                        Begin Label
                            OverlapFlags =247
                            TextAlign =1
                            Left =4590
                            Top =4320
                            Width =1245
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="SituaçãoRua_Rótulo"
                            Caption ="Situação Rua"
                            GridlineColor =10921638
                            LayoutCachedLeft =4590
                            LayoutCachedTop =4320
                            LayoutCachedWidth =5835
                            LayoutCachedHeight =4635
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5774
                    Top =5070
                    ColumnOrder =48
                    TabIndex =48
                    BorderColor =10921638
                    Name ="LerEscrever"
                    ControlSource ="LerEscrever"
                    GridlineColor =10921638

                    LayoutCachedLeft =5774
                    LayoutCachedTop =5070
                    LayoutCachedWidth =6034
                    LayoutCachedHeight =5310
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =4601
                            Top =5070
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="LerEscrever_Rótulo"
                            Caption ="LerEscrever"
                            GridlineColor =10921638
                            LayoutCachedLeft =4601
                            LayoutCachedTop =5070
                            LayoutCachedWidth =5684
                            LayoutCachedHeight =5400
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5774
                    Top =5469
                    ColumnOrder =49
                    TabIndex =49
                    BorderColor =10921638
                    Name ="FreqEscola"
                    ControlSource ="FreqEscola"
                    GridlineColor =10921638

                    LayoutCachedLeft =5774
                    LayoutCachedTop =5469
                    LayoutCachedWidth =6034
                    LayoutCachedHeight =5709
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =4601
                            Top =5469
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="FreqEscola_Rótulo"
                            Caption ="FreqEscola"
                            GridlineColor =10921638
                            LayoutCachedLeft =4601
                            LayoutCachedTop =5469
                            LayoutCachedWidth =5684
                            LayoutCachedHeight =5799
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =3885
                    Left =5774
                    Top =5868
                    Width =1418
                    Height =330
                    ColumnWidth =1815
                    ColumnOrder =50
                    TabIndex =50
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Escolaridade"
                    ControlSource ="Escolaridade"
                    RowSourceType ="Value List"
                    RowSource ="\"Nunca frequentou\";\"Crecha\";\"Educação Infantil\";\"1º ano fund\";\"2º ano f"
                        "und\";\"3º ano fund\";\"4º ano fund\";\"5º ano fund\";\"6º ano fund\";\"7º ano f"
                        "und\";\"8º ano fund\";\"9º ano fund\";\"1º ano medio\";\"2º ano medio\";\"3º ano"
                        " medio\";\"Sup Incompleto\";\"Sup Completo\";\"EJA Fundamental\";\"EJA Medio\";\""
                        "Outros\""
                    ColumnWidths ="3885"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =5774
                    LayoutCachedTop =5868
                    LayoutCachedWidth =7192
                    LayoutCachedHeight =6198
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =4601
                            Top =5868
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Escolaridade_Rótulo"
                            Caption ="Escolaridade"
                            GridlineColor =10921638
                            LayoutCachedLeft =4601
                            LayoutCachedTop =5868
                            LayoutCachedWidth =5684
                            LayoutCachedHeight =6198
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1580
                    Top =13456
                    ColumnOrder =27
                    TabIndex =30
                    BorderColor =10921638
                    Name ="CTPS"
                    ControlSource ="CTPS"
                    GridlineColor =10921638

                    LayoutCachedLeft =1580
                    LayoutCachedTop =13456
                    LayoutCachedWidth =1840
                    LayoutCachedHeight =13696
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =407
                            Top =13456
                            Width =1083
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="CTPS_Rótulo"
                            Caption ="CTPS"
                            GridlineColor =10921638
                            LayoutCachedLeft =407
                            LayoutCachedTop =13456
                            LayoutCachedWidth =1490
                            LayoutCachedHeight =13696
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =3780
                    Left =1580
                    Top =14227
                    Width =1962
                    ColumnWidth =1695
                    ColumnOrder =29
                    TabIndex =32
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Condição Ocupação"
                    ControlSource ="Condição Ocupação"
                    RowSourceType ="Value List"
                    RowSource ="\"Não trabalha\";\"Trabalha por conta propria\";\"Trabalhador temporario da area"
                        " rural\";\"Empregado sem CTPS\";\"Empregado com CTPS\";\"Empregado domestico sem"
                        " CTPS\";\"Empregado domestico com CTPS\";\"Trabalho não remunerado\";\"Militar/S"
                        "ervidor publico\";\"Empregador\";\"Estagiario\";\"Aprendiz legal\""
                    ColumnWidths ="3780"
                    EventProcPrefix ="Condição_Ocupação"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =1580
                    LayoutCachedTop =14227
                    LayoutCachedWidth =3542
                    LayoutCachedHeight =14467
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =407
                            Top =14227
                            Width =1083
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Condição Ocupação_Rótulo"
                            Caption ="Condição Ocupação"
                            EventProcPrefix ="Condição_Ocupação_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =407
                            LayoutCachedTop =14227
                            LayoutCachedWidth =1490
                            LayoutCachedHeight =14467
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5763
                    Top =7811
                    Width =1134
                    Height =330
                    ColumnWidth =1530
                    ColumnOrder =55
                    TabIndex =54
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Renda sem programas sociais"
                    ControlSource ="Renda sem programas sociais"
                    Format ="\"R$\"#,##0.00;\"-R$\"#,##0.00"
                    EventProcPrefix ="Renda_sem_programas_sociais"
                    GridlineColor =10921638

                    LayoutCachedLeft =5763
                    LayoutCachedTop =7811
                    LayoutCachedWidth =6897
                    LayoutCachedHeight =8141
                    CurrencySymbol ="R$"
                    ColLCID =1046
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =4590
                            Top =7811
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Renda sem programas sociais_Rótulo"
                            Caption ="Renda sem programas sociais"
                            EventProcPrefix ="Renda_sem_programas_sociais_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =4590
                            LayoutCachedTop =7811
                            LayoutCachedWidth =5673
                            LayoutCachedHeight =8141
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5763
                    Top =8210
                    Width =1134
                    Height =330
                    ColumnWidth =1785
                    ColumnOrder =56
                    TabIndex =55
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Renda per capita"
                    ControlSource ="Renda per capita"
                    Format ="\"R$\"#,##0.00;\"-R$\"#,##0.00"
                    EventProcPrefix ="Renda_per_capita"
                    GridlineColor =10921638

                    LayoutCachedLeft =5763
                    LayoutCachedTop =8210
                    LayoutCachedWidth =6897
                    LayoutCachedHeight =8540
                    CurrencySymbol ="R$"
                    ColLCID =1046
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =4590
                            Top =8210
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Renda per capita_Rótulo"
                            Caption ="Renda per capita"
                            EventProcPrefix ="Renda_per_capita_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =4590
                            LayoutCachedTop =8210
                            LayoutCachedWidth =5673
                            LayoutCachedHeight =8540
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5763
                    Top =8609
                    ColumnWidth =1800
                    ColumnOrder =57
                    TabIndex =56
                    BorderColor =10921638
                    Name ="Recebe programa social"
                    ControlSource ="Recebe programa social"
                    EventProcPrefix ="Recebe_programa_social"
                    GridlineColor =10921638

                    LayoutCachedLeft =5763
                    LayoutCachedTop =8609
                    LayoutCachedWidth =6023
                    LayoutCachedHeight =8849
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =4590
                            Top =8609
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Recebe programa social_Rótulo"
                            Caption ="Recebe programa social"
                            EventProcPrefix ="Recebe_programa_social_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =4590
                            LayoutCachedTop =8609
                            LayoutCachedWidth =5673
                            LayoutCachedHeight =8939
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5763
                    Top =9008
                    ColumnOrder =58
                    TabIndex =57
                    BorderColor =10921638
                    Name ="Aposentado/pensionista"
                    ControlSource ="Aposentado/pensionista"
                    EventProcPrefix ="Aposentado_pensionista"
                    GridlineColor =10921638

                    LayoutCachedLeft =5763
                    LayoutCachedTop =9008
                    LayoutCachedWidth =6023
                    LayoutCachedHeight =9248
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =4590
                            Top =9008
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Aposentado/pensionista_Rótulo"
                            Caption ="Aposentado/pensionista"
                            EventProcPrefix ="Aposentado_pensionista_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =4590
                            LayoutCachedTop =9008
                            LayoutCachedWidth =5673
                            LayoutCachedHeight =9338
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =1530
                    Top =5045
                    Height =315
                    ColumnOrder =30
                    TabIndex =9
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Estado Civil"
                    ControlSource ="Estado Civil"
                    RowSourceType ="Value List"
                    RowSource ="\"CASADO(A)\";\"SOLTEIRO(A)\";\"UNIÃO ESTAVEL\";\"DIVORCIADO(A)\";\"SEPARADO(A)\""
                        ";\"VIUVO(A)\";\"OUTROS\""
                    ColumnWidths ="1440"
                    EventProcPrefix ="Estado_Civil"
                    GridlineColor =10921638

                    LayoutCachedLeft =1530
                    LayoutCachedTop =5045
                    LayoutCachedWidth =3231
                    LayoutCachedHeight =5360
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =5045
                            Width =1140
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo85"
                            Caption ="Estado Civil"
                            GridlineColor =10921638
                            LayoutCachedTop =5045
                            LayoutCachedWidth =1140
                            LayoutCachedHeight =5360
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1530
                    Top =14571
                    ColumnWidth =1650
                    ColumnOrder =33
                    TabIndex =33
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="MunicNasc"
                    ControlSource ="MunicNasc"
                    GridlineColor =10921638

                    LayoutCachedLeft =1530
                    LayoutCachedTop =14571
                    LayoutCachedWidth =3231
                    LayoutCachedHeight =14811
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =14571
                            Width =1080
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo90"
                            Caption ="MunicNasc"
                            GridlineColor =10921638
                            LayoutCachedTop =14571
                            LayoutCachedWidth =1080
                            LayoutCachedHeight =14811
                        End
                    End
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =1444
                    Left =1530
                    Top =14968
                    ColumnOrder =34
                    TabIndex =34
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="UFNasc"
                    ControlSource ="UFNasc"
                    RowSourceType ="Value List"
                    RowSource ="\"AC\";\"AL\";\"AP\";\"AM\";\"BA\";\"CE\";\"DF\";\"ES\";\"GO\";\"MA\";\"MT\";\"M"
                        "S\";\"MG\";\"PA \";\"PB\";\"PR\";\"PE\";\"PI\";\"RJ\";\"RN\";\"RS\";\"RO\";\"RR\""
                        ";\"SC\";\"SP\";\"SE\";\"TO\""
                    ColumnWidths ="1444"
                    GridlineColor =10921638

                    LayoutCachedLeft =1530
                    LayoutCachedTop =14968
                    LayoutCachedWidth =3231
                    LayoutCachedHeight =15208
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =14968
                            Width =750
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo91"
                            Caption ="UFNasc"
                            GridlineColor =10921638
                            LayoutCachedTop =14968
                            LayoutCachedWidth =750
                            LayoutCachedHeight =15208
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =2625
                    Left =1530
                    Top =5839
                    Height =315
                    ColumnOrder =32
                    TabIndex =11
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Raça/Cor"
                    ControlSource ="Raça/Cor"
                    RowSourceType ="Value List"
                    RowSource ="\"BRANCA\";\"PRETA\";\"AMARELA\";\"PARDA\";\"INDIGENA\""
                    ColumnWidths ="2625"
                    EventProcPrefix ="Raça_Cor"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =1530
                    LayoutCachedTop =5839
                    LayoutCachedWidth =3231
                    LayoutCachedHeight =6154
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =5839
                            Width =900
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo92"
                            Caption ="Raça/Cor"
                            GridlineColor =10921638
                            LayoutCachedTop =5839
                            LayoutCachedWidth =900
                            LayoutCachedHeight =6154
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5442
                    Top =4723
                    ColumnOrder =47
                    TabIndex =47
                    BorderColor =10921638
                    Name ="ServAco"
                    ControlSource ="ServAco"
                    GridlineColor =10921638

                    LayoutCachedLeft =5442
                    LayoutCachedTop =4723
                    LayoutCachedWidth =5702
                    LayoutCachedHeight =4963
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =5672
                            Top =4693
                            Width =2610
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo93"
                            Caption ="Serviço Acolhimento"
                            GridlineColor =10921638
                            LayoutCachedLeft =5672
                            LayoutCachedTop =4693
                            LayoutCachedWidth =8282
                            LayoutCachedHeight =5008
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1530
                    Top =2154
                    Height =315
                    ColumnOrder =4
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataCadPes"
                    ControlSource ="DataCadPes"
                    GridlineColor =10921638

                    LayoutCachedLeft =1530
                    LayoutCachedTop =2154
                    LayoutCachedWidth =3231
                    LayoutCachedHeight =2469
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =2154
                            Width =1170
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo94"
                            Caption ="DataCadPes"
                            GridlineColor =10921638
                            LayoutCachedTop =2154
                            LayoutCachedWidth =1170
                            LayoutCachedHeight =2469
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =1587
                    Top =12606
                    ColumnOrder =25
                    TabIndex =28
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="CERT LIVRO/FOLHA/TERMO"
                    ControlSource ="CERT LIVRO/FOLHA/TERMO"
                    EventProcPrefix ="CERT_LIVRO_FOLHA_TERMO"
                    GridlineColor =10921638

                    LayoutCachedLeft =1587
                    LayoutCachedTop =12606
                    LayoutCachedWidth =3288
                    LayoutCachedHeight =12846
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Top =12606
                            Width =2580
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo95"
                            Caption ="CERT LIVRO/FOLHA/TERMO"
                            GridlineColor =10921638
                            LayoutCachedTop =12606
                            LayoutCachedWidth =2580
                            LayoutCachedHeight =12846
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1542
                    Top =13830
                    ColumnOrder =28
                    TabIndex =31
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Nº CTPS"
                    ControlSource ="Nº CTPS"
                    EventProcPrefix ="Nº_CTPS"
                    GridlineColor =10921638

                    LayoutCachedLeft =1542
                    LayoutCachedTop =13830
                    LayoutCachedWidth =3243
                    LayoutCachedHeight =14070
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =396
                            Top =13830
                            Width =1140
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo96"
                            Caption ="Nº CTPS"
                            GridlineColor =10921638
                            LayoutCachedLeft =396
                            LayoutCachedTop =13830
                            LayoutCachedWidth =1536
                            LayoutCachedHeight =14070
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =1587
                    Top =13060
                    ColumnOrder =26
                    TabIndex =29
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="TITULO/ZONA/SEÇAO"
                    ControlSource ="TITULO/ZONA/SEÇAO"
                    InputMask ="999999999999\\-999\\-9999;0;"
                    EventProcPrefix ="TITULO_ZONA_SEÇAO"
                    GridlineColor =10921638

                    LayoutCachedLeft =1587
                    LayoutCachedTop =13060
                    LayoutCachedWidth =3288
                    LayoutCachedHeight =13300
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Top =13060
                            Width =2055
                            Height =240
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo97"
                            Caption ="TITULO/ZONA/SEÇAO"
                            GridlineColor =10921638
                            LayoutCachedTop =13060
                            LayoutCachedWidth =2055
                            LayoutCachedHeight =13300
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5725
                    Top =7065
                    ColumnOrder =53
                    TabIndex =52
                    BorderColor =10921638
                    Name ="BPCD"
                    ControlSource ="BPCD"
                    GridlineColor =10921638

                    LayoutCachedLeft =5725
                    LayoutCachedTop =7065
                    LayoutCachedWidth =5985
                    LayoutCachedHeight =7305
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =5955
                            Top =7035
                            Width =570
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo98"
                            Caption ="BPCD"
                            GridlineColor =10921638
                            LayoutCachedLeft =5955
                            LayoutCachedTop =7035
                            LayoutCachedWidth =6525
                            LayoutCachedHeight =7350
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =5725
                    Top =7405
                    ColumnOrder =54
                    TabIndex =53
                    BorderColor =10921638
                    Name ="BPCI"
                    ControlSource ="BPCI"
                    GridlineColor =10921638

                    LayoutCachedLeft =5725
                    LayoutCachedTop =7405
                    LayoutCachedWidth =5985
                    LayoutCachedHeight =7645
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =5955
                            Top =7375
                            Width =495
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo99"
                            Caption ="BPCI"
                            GridlineColor =10921638
                            LayoutCachedLeft =5955
                            LayoutCachedTop =7375
                            LayoutCachedWidth =6450
                            LayoutCachedHeight =7690
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =150
                    ColumnOrder =35
                    TabIndex =35
                    BorderColor =10921638
                    Name ="Autismo"
                    ControlSource ="Autismo"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =150
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =390
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =120
                            Width =855
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo100"
                            Caption ="Autismo"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =120
                            LayoutCachedWidth =7211
                            LayoutCachedHeight =435
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =490
                    ColumnOrder =36
                    TabIndex =36
                    BorderColor =10921638
                    Name ="Baixa visão"
                    ControlSource ="Baixa visão"
                    EventProcPrefix ="Baixa_visão"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =490
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =730
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =460
                            Width =1095
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo101"
                            Caption ="Baixa visão"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =460
                            LayoutCachedWidth =7451
                            LayoutCachedHeight =775
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =830
                    ColumnOrder =37
                    TabIndex =37
                    BorderColor =10921638
                    Name ="Cegueira"
                    ControlSource ="Cegueira"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =830
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =1070
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =800
                            Width =900
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo102"
                            Caption ="Cegueira"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =800
                            LayoutCachedWidth =7256
                            LayoutCachedHeight =1115
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =1567
                    ColumnWidth =1770
                    ColumnOrder =38
                    TabIndex =38
                    BorderColor =10921638
                    Name ="Deficiencia fisica"
                    ControlSource ="Deficiencia fisica"
                    EventProcPrefix ="Deficiencia_fisica"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =1567
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =1807
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =1537
                            Width =1635
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo104"
                            Caption ="Deficiencia fisica"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =1537
                            LayoutCachedWidth =7991
                            LayoutCachedHeight =1852
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =1907
                    ColumnOrder =39
                    TabIndex =39
                    BorderColor =10921638
                    Name ="Defic mental intelec"
                    ControlSource ="Defic mental intelec"
                    EventProcPrefix ="Defic_mental_intelec"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =1907
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =2147
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =1877
                            Width =1950
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo105"
                            Caption ="Defic mental intelec"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =1877
                            LayoutCachedWidth =8306
                            LayoutCachedHeight =2192
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =2248
                    ColumnOrder =40
                    TabIndex =40
                    BorderColor =10921638
                    Name ="DoencaCronica"
                    ControlSource ="DoencaCronica"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =2248
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =2488
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =2218
                            Width =1455
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo106"
                            Caption ="DoencaCronica"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =2218
                            LayoutCachedWidth =7811
                            LayoutCachedHeight =2533
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =6126
                    Top =2588
                    Height =315
                    ColumnOrder =41
                    TabIndex =41
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Qual doença cronica"
                    ControlSource ="Qual DCronica"
                    EventProcPrefix ="Qual_doença_cronica"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =2588
                    LayoutCachedWidth =7827
                    LayoutCachedHeight =2903
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =4425
                            Top =2588
                            Width =1935
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo107"
                            Caption ="Qual doença cronica"
                            GridlineColor =10921638
                            LayoutCachedLeft =4425
                            LayoutCachedTop =2588
                            LayoutCachedWidth =6360
                            LayoutCachedHeight =2903
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =2985
                    ColumnOrder =42
                    TabIndex =42
                    BorderColor =10921638
                    Name ="Sindrome down"
                    ControlSource ="Sindrome down"
                    EventProcPrefix ="Sindrome_down"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =2985
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =3225
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =2955
                            Width =1545
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo108"
                            Caption ="Sindrome down"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =2955
                            LayoutCachedWidth =7901
                            LayoutCachedHeight =3270
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =3325
                    ColumnOrder =43
                    TabIndex =43
                    BorderColor =10921638
                    Name ="Surdez severa profunda"
                    ControlSource ="Surdez severa profunda"
                    EventProcPrefix ="Surdez_severa_profunda"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =3325
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =3565
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =3295
                            Width =2265
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo109"
                            Caption ="Surdez severa profunda"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =3295
                            LayoutCachedWidth =8621
                            LayoutCachedHeight =3610
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =3665
                    ColumnOrder =44
                    TabIndex =44
                    BorderColor =10921638
                    Name ="Surdez leve moderada"
                    ControlSource ="Surdez leve moderada"
                    EventProcPrefix ="Surdez_leve_moderada"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =3665
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =3905
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =3635
                            Width =2145
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo110"
                            Caption ="Surdez leve moderada"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =3635
                            LayoutCachedWidth =8501
                            LayoutCachedHeight =3950
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =6126
                    Top =4005
                    ColumnOrder =45
                    TabIndex =45
                    BorderColor =10921638
                    Name ="Transt doença mental"
                    ControlSource ="Transt doença mental"
                    EventProcPrefix ="Transt_doença_mental"
                    GridlineColor =10921638

                    LayoutCachedLeft =6126
                    LayoutCachedTop =4005
                    LayoutCachedWidth =6386
                    LayoutCachedHeight =4245
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =6356
                            Top =3975
                            Width =2070
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo111"
                            Caption ="Transt doença mental"
                            GridlineColor =10921638
                            LayoutCachedLeft =6356
                            LayoutCachedTop =3975
                            LayoutCachedWidth =8426
                            LayoutCachedHeight =4290
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =1474
                    Top =8153
                    Height =315
                    ColumnOrder =13
                    TabIndex =16
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Tel recado detalhes"
                    ControlSource ="Tel recado detalhes"
                    EventProcPrefix ="Tel_recado_detalhes"
                    GridlineColor =10921638

                    LayoutCachedLeft =1474
                    LayoutCachedTop =8153
                    LayoutCachedWidth =3175
                    LayoutCachedHeight =8468
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Top =8153
                            Width =1890
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo112"
                            Caption ="Tel recado detalhes"
                            GridlineColor =10921638
                            LayoutCachedTop =8153
                            LayoutCachedWidth =1890
                            LayoutCachedHeight =8468
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =93
                    IMESentenceMode =3
                    ListWidth =1443
                    Left =5782
                    Top =6292
                    Height =315
                    ColumnWidth =2175
                    ColumnOrder =51
                    TabIndex =51
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="NOME ESCOLA"
                    ControlSource ="NOME ESCOLA"
                    RowSourceType ="Value List"
                    RowSource ="\"CRECHE M. ALMIRA ROSA DE SOUZA DONA COTA\";\"CRECHE M. DONA SENHORINHA\";\"CRE"
                        "CHE MUN VALDIRA FLAUSINO RODRIGUES\";\"CRECHE ESC M. MARIA ROSA RIBEIRO PINHEIRO"
                        " \"\"TIA DIDI\"\"\";\"ESC MUN ALBERTO JORGE\";\"ESC MUN ALZIR DAVID PEREIRA\";\""
                        "ESC MUN SR. JOÃO BATISTA GOMES DA CRUZ \"\"ARCO-ÍRIS\"\"\";\"ESC MUN JOSÉ DE OLI"
                        "VEIRA MARTINS\";\"ESC MUN JOSÉ LUIZ DE LEMOS\";\"ESC MUN NELZIR PEREIRA MELLO\";"
                        "\"ESC MUN PREF CLÁUDIO RIBEIRO\";\"ESC MUN PREF PAULO PINHEIRO\";\"ESC MUN ONDIN"
                        "A PINTO MARCONDES\";\"ESC MUN ENEDINA FIDELIS MOREIRA\";\"ESC MUN ERNESTINA JORG"
                        "E PEREIRA\";\"ESC MUN NADIR DA SILVA SALVADOR\";\"ESC MUN RIO DAS OSTRAS\";\"ESC"
                        " MUN PROF NELI APARECIDA TÂMARA LUIZ\";\"ESC MUN ELSON PINHEIRO\";\"ESC MUN PREF"
                        " CÉLIO SARZEDAS\";\"ESC MUN HENRIQUE SARZEDAS\";\"ESC MUN TRINDADE\";\"ESC MUN J"
                        "OVENIL BASTOS DA SILVA\";\"ESC MUN ARY GOMES DE MARINS\";\"ESC MUN JERONYMO MEND"
                        "ES DA COSTA\";\"ESC MUN JOÃO BENTO DUARTE NETO\";\"ESC MUN MARIA DA PENHA DE OLI"
                        "VEIRA\";\"ESC MUN SIMAR MACHADO SODRÉ\";\"ESC MUN MARIA TEIXEIRA DE PAULA\";\"ES"
                        "C MUN INAYÁ MORAES D’COUTO\";\"ESC EST DOM BOSCO MUNICIPALIZADA\";\"ESC MUN ROCH"
                        "A LEÃO\";\"ESC EST FAZENDA DA PRAIA MUNICIPALIZADA\";\"ESC MUN NILTON BALTHAZAR\""
                        ";\"ESC MUN FRANCISCO DE ASSIS MEDEIROS RANGEL\";\"ESC MUN PADRE JOSÉ DILSON DÓRE"
                        "A\";\"ESC MUN PROF ROSÂNGELA DUARTE FARIA\";\"ESC MUN VEREADOR PEDRO MOREIRA DOS"
                        " SANTOS\";\"CIEP - BRIZOLÃO - MESTRE MARÇAL - MUNICIPALIZADO\";\"ESC MUN MARIA G"
                        "ORETE VICENTE JORGE\";\"ESC MUN ACERBAL PINTO MALHEIROS\";\"ESC MUN FANY BATISTA"
                        " ESTEVES\";\"ESC MUN PROF MARINETE COELHO DE SOUZA\";\"COLÉGIO MUN PROF AMÉRICA "
                        "ABDALLA\";\"ESC EST FAZENDAS REUNIDAS ATLÂNTICA MUNICIPALIZADA\";\"ESC MUN CIDAD"
                        "E PRAIANA\";\"INST MUN DE EDUC DE RIO DAS OSTRAS\";\"ESC AGRÍCOLA CARLOS MAURÍCI"
                        "O FRANCO\""
                    ColumnWidths ="1443"
                    EventProcPrefix ="NOME_ESCOLA"
                    GridlineColor =10921638

                    LayoutCachedLeft =5782
                    LayoutCachedTop =6292
                    LayoutCachedWidth =7483
                    LayoutCachedHeight =6607
                    Begin
                        Begin Label
                            OverlapFlags =255
                            Left =4081
                            Top =6292
                            Width =1410
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo116"
                            Caption ="NOME ESCOLA"
                            GridlineColor =10921638
                            LayoutCachedLeft =4081
                            LayoutCachedTop =6292
                            LayoutCachedWidth =5491
                            LayoutCachedHeight =6607
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =247
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =5782
                    Top =6576
                    Height =315
                    ColumnOrder =52
                    TabIndex =58
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="Turno"
                    ControlSource ="Turno"
                    RowSourceType ="Value List"
                    RowSource ="\"Manhã\";\"Tarde\";\"Noite\";\"Integral\""
                    ColumnWidths ="1441"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =5782
                    LayoutCachedTop =6576
                    LayoutCachedWidth =7483
                    LayoutCachedHeight =6891
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =4081
                            Top =6576
                            Width =615
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo117"
                            Caption ="Turno"
                            GridlineColor =10921638
                            LayoutCachedLeft =4081
                            LayoutCachedTop =6576
                            LayoutCachedWidth =4696
                            LayoutCachedHeight =6891
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1530
                    Top =7142
                    Height =315
                    ColumnOrder =11
                    TabIndex =14
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="NomePai"
                    ControlSource ="NomePai"
                    GridlineColor =10921638

                    LayoutCachedLeft =1530
                    LayoutCachedTop =7142
                    LayoutCachedWidth =3231
                    LayoutCachedHeight =7457
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =7142
                            Width =930
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo118"
                            Caption ="NomePai"
                            GridlineColor =10921638
                            LayoutCachedTop =7142
                            LayoutCachedWidth =930
                            LayoutCachedHeight =7457
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1529
                    Top =2610
                    Width =1134
                    Height =330
                    ColumnOrder =5
                    TabIndex =5
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="DataDesligPes"
                    ControlSource ="DataDesligPes"
                    GridlineColor =10921638

                    LayoutCachedLeft =1529
                    LayoutCachedTop =2610
                    LayoutCachedWidth =2663
                    LayoutCachedHeight =2940
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =356
                            Top =2610
                            Width =1083
                            Height =330
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="DataDesligPes_Rótulo"
                            Caption ="DataDesligPes"
                            GridlineColor =10921638
                            LayoutCachedLeft =356
                            LayoutCachedTop =2610
                            LayoutCachedWidth =1439
                            LayoutCachedHeight =2940
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2838
                    Top =9486
                    Width =440
                    ColumnWidth =2655
                    ColumnOrder =16
                    TabIndex =19
                    BorderColor =10921638
                    Name ="PROVIDCN"
                    ControlSource ="PROVICN"
                    GridlineColor =10921638

                    LayoutCachedLeft =2838
                    LayoutCachedTop =9486
                    LayoutCachedWidth =3278
                    LayoutCachedHeight =9726
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =1
                            Left =390
                            Top =9486
                            Width =2220
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo125"
                            Caption ="PROVIDENCIAR C.NSC "
                            GridlineColor =10921638
                            LayoutCachedLeft =390
                            LayoutCachedTop =9486
                            LayoutCachedWidth =2610
                            LayoutCachedHeight =9801
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2838
                    Top =9771
                    Width =440
                    ColumnWidth =3240
                    ColumnOrder =17
                    TabIndex =20
                    BorderColor =10921638
                    Name ="PROVIDRG"
                    ControlSource ="PROVIRG"
                    GridlineColor =10921638

                    LayoutCachedLeft =2838
                    LayoutCachedTop =9771
                    LayoutCachedWidth =3278
                    LayoutCachedHeight =10011
                    Begin
                        Begin Label
                            OverlapFlags =215
                            TextAlign =1
                            Left =390
                            Top =9771
                            Width =2220
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo127"
                            Caption ="PROVIDENCIAR RG "
                            GridlineColor =10921638
                            LayoutCachedLeft =390
                            LayoutCachedTop =9771
                            LayoutCachedWidth =2610
                            LayoutCachedHeight =10086
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2838
                    Top =10116
                    Width =440
                    ColumnWidth =2430
                    ColumnOrder =18
                    TabIndex =21
                    BorderColor =10921638
                    Name ="PROVIDCTPS"
                    ControlSource ="PROVICTPS"
                    GridlineColor =10921638

                    LayoutCachedLeft =2838
                    LayoutCachedTop =10116
                    LayoutCachedWidth =3278
                    LayoutCachedHeight =10356
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =1
                            Left =390
                            Top =10116
                            Width =2220
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo129"
                            Caption ="PROVIDENCIAR CTPS "
                            GridlineColor =10921638
                            LayoutCachedLeft =390
                            LayoutCachedTop =10116
                            LayoutCachedWidth =2610
                            LayoutCachedHeight =10431
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2838
                    Top =10446
                    Width =440
                    ColumnWidth =2130
                    ColumnOrder =19
                    TabIndex =22
                    BorderColor =10921638
                    Name ="PROVIDCPF"
                    ControlSource ="PROVICPF"
                    GridlineColor =10921638

                    LayoutCachedLeft =2838
                    LayoutCachedTop =10446
                    LayoutCachedWidth =3278
                    LayoutCachedHeight =10686
                    Begin
                        Begin Label
                            OverlapFlags =93
                            TextAlign =1
                            Left =390
                            Top =10446
                            Width =2220
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo131"
                            Caption ="PROVIDENCIAR CPF "
                            GridlineColor =10921638
                            LayoutCachedLeft =390
                            LayoutCachedTop =10446
                            LayoutCachedWidth =2610
                            LayoutCachedHeight =10761
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2838
                    Top =10716
                    Width =440
                    ColumnWidth =2610
                    ColumnOrder =20
                    TabIndex =23
                    BorderColor =10921638
                    Name ="PROVIDTE"
                    ControlSource ="PROVITE"
                    GridlineColor =10921638

                    LayoutCachedLeft =2838
                    LayoutCachedTop =10716
                    LayoutCachedWidth =3278
                    LayoutCachedHeight =10956
                    Begin
                        Begin Label
                            OverlapFlags =215
                            TextAlign =1
                            Left =390
                            Top =10716
                            Width =2055
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo133"
                            Caption ="PROVIDENCIAR T.ELEITOR "
                            GridlineColor =10921638
                            LayoutCachedLeft =390
                            LayoutCachedTop =10716
                            LayoutCachedWidth =2445
                            LayoutCachedHeight =11031
                        End
                    End
                End
                Begin TextBox
                    FontUnderline = NotDefault
                    IsHyperlink = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =1474
                    Top =8560
                    Width =2505
                    Height =315
                    ColumnOrder =14
                    TabIndex =17
                    BorderColor =10921638
                    Name ="email"
                    ControlSource ="email"
                    GridlineColor =10921638

                    LayoutCachedLeft =1474
                    LayoutCachedTop =8560
                    LayoutCachedWidth =3979
                    LayoutCachedHeight =8875
                    ForeThemeColorIndex =10
                    ForeTint =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =8560
                            Width =600
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo134"
                            Caption ="email"
                            GridlineColor =10921638
                            LayoutCachedTop =8560
                            LayoutCachedWidth =600
                            LayoutCachedHeight =8875
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OverlapFlags =85
                    IMESentenceMode =3
                    ListWidth =3315
                    Left =1530
                    Top =3118
                    Height =315
                    ColumnWidth =3015
                    ColumnOrder =6
                    TabIndex =6
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="MotivoDeslPes"
                    ControlSource ="MotivoDeslPes"
                    RowSourceType ="Value List"
                    RowSource ="\"MUDANÇA DE MUNICIPIO\";\"MUDANÇA DE TERRITORIO\";\"EXCLUSÃO DA COMPOSIÇÃO FAMI"
                        "LIAR\";\"OBITO\""
                    ColumnWidths ="3315"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =1530
                    LayoutCachedTop =3118
                    LayoutCachedWidth =3231
                    LayoutCachedHeight =3433
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Top =3118
                            Width =1470
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo135"
                            Caption ="MotivoDeslPes"
                            GridlineColor =10921638
                            LayoutCachedTop =3118
                            LayoutCachedWidth =1470
                            LayoutCachedHeight =3433
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
' See "COMPOSIÇÃO FAMILIAR SUBFORM.cls"
