Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    PopUp = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =15817
    DatasheetFontHeight =11
    ItemSuffix =51
    RecSrcDt = Begin
        0x33536ea2cbade540
    End
    RecordSource ="LISTAGEM ACOMPANHADOS COM BENEFICIOS"
    Caption ="LISTAGEM ACOMPANHADOS COM BENEFICIOS"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    FitToPage =1
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
            ShowDatePicker =0
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
        Begin Attachment
            BackStyle =0
            BorderLineStyle =0
            PictureSizeMode =3
            Width =1701
            Height =1701
            LabelX =-1701
            AddColon =0
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            KeepTogether =1
            ControlSource ="csAcompBenTransfRenda.csAcompBenef.NomeTec"
        End
        Begin BreakLevel
            KeepTogether =1
            ControlSource ="csAcompBenTransfRenda.csAcompBenef.Nome"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin PageHeader
            Height =0
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            RepeatSection = NotDefault
            Height =1596
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =390
                    Width =6240
                    Height =360
                    FontSize =13
                    FontWeight =700
                    BorderColor =10921638
                    Name ="TbCadFuncionario.Nome"
                    ControlSource ="csAcompBenTransfRenda.csAcompBenef.NomeTec"
                    Format =">"
                    EventProcPrefix ="TbCadFuncionario_Nome"
                    GridlineColor =-2147483609

                    LayoutCachedLeft =390
                    LayoutCachedWidth =6630
                    LayoutCachedHeight =360
                    RowStart =1
                    RowEnd =1
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6245
                    Top =390
                    Width =1125
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo84"
                    Caption ="IDADE"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =6245
                    LayoutCachedTop =390
                    LayoutCachedWidth =7370
                    LayoutCachedHeight =1590
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7371
                    Top =390
                    Width =1710
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo88"
                    Caption ="DEFICIENTE"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =7371
                    LayoutCachedTop =390
                    LayoutCachedWidth =9081
                    LayoutCachedHeight =1590
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9077
                    Top =396
                    Width =570
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo90"
                    Caption ="BPC-D"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =9077
                    LayoutCachedTop =396
                    LayoutCachedWidth =9647
                    LayoutCachedHeight =1596
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9644
                    Top =396
                    Width =555
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo91"
                    Caption ="BPC-I"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =9644
                    LayoutCachedTop =396
                    LayoutCachedWidth =10199
                    LayoutCachedHeight =1596
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10196
                    Top =396
                    Width =1155
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo92"
                    Caption ="TIPO BENEFICIO"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =10196
                    LayoutCachedTop =396
                    LayoutCachedWidth =11351
                    LayoutCachedHeight =1596
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11351
                    Top =390
                    Width =1110
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo93"
                    Caption ="EXTREMA POBREZA"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =11351
                    LayoutCachedTop =390
                    LayoutCachedWidth =12461
                    LayoutCachedHeight =1590
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13946
                    Top =396
                    Width =570
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo94"
                    Caption ="PBF"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =13946
                    LayoutCachedTop =396
                    LayoutCachedWidth =14516
                    LayoutCachedHeight =1596
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12465
                    Top =396
                    Width =1485
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo95"
                    Caption ="FRAGILIDADE SOCIOECONOMICA"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =12465
                    LayoutCachedTop =396
                    LayoutCachedWidth =13950
                    LayoutCachedHeight =1596
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1369
                    Top =390
                    Width =4875
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo83"
                    Caption ="NOME"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =1369
                    LayoutCachedTop =390
                    LayoutCachedWidth =6244
                    LayoutCachedHeight =1590
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14513
                    Top =396
                    Width =945
                    Height =1200
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo49"
                    Caption ="CADUNICO"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =14513
                    LayoutCachedTop =396
                    LayoutCachedWidth =15458
                    LayoutCachedHeight =1596
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =6633
                    Width =1860
                    Height =390
                    FontSize =13
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.NomeTec"
                    ControlSource ="=Count([csAcompBenTransfRenda].[csAcompBenef].[NomeTec])"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_NomeTec"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.NomeTec Contagem de Valores"
                    GridlineColor =-2147483609

                    LayoutCachedLeft =6633
                    LayoutCachedWidth =8493
                    LayoutCachedHeight =390
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =315
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =12
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1360
                    Width =4866
                    Height =315
                    ColumnWidth =3180
                    FontSize =9
                    FontWeight =700
                    Name ="csAcompBenTransfRenda.csAcompBenef.Nome"
                    ControlSource ="csAcompBenTransfRenda.csAcompBenef.Nome"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    EventProcPrefix ="csAcompBenTransfRenda_csAcompBenef_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =1360
                    LayoutCachedWidth =6226
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6225
                    Width =1131
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =1
                    Name ="csAcompBenTransfRenda.csAcompBenef.Idade"
                    ControlSource ="csAcompBenTransfRenda.csAcompBenef.Idade"
                    EventProcPrefix ="csAcompBenTransfRenda_csAcompBenef_Idade"
                    GridlineColor =10921638

                    LayoutCachedLeft =6225
                    LayoutCachedWidth =7356
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =8107
                    Top =56
                    TabIndex =2
                    Name ="csAcompBenTransfRenda.csAcompBenef.Defic"
                    ControlSource ="csAcompBenTransfRenda.csAcompBenef.Defic"
                    EventProcPrefix ="csAcompBenTransfRenda_csAcompBenef_Defic"
                    GridlineColor =10921638

                    LayoutCachedLeft =8107
                    LayoutCachedTop =56
                    LayoutCachedWidth =8367
                    LayoutCachedHeight =296
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =9225
                    Top =60
                    TabIndex =3
                    Name ="csAcompBenTransfRenda.csAcompBenef.BPCD"
                    ControlSource ="csAcompBenTransfRenda.csAcompBenef.BPCD"
                    EventProcPrefix ="csAcompBenTransfRenda_csAcompBenef_BPCD"
                    GridlineColor =10921638

                    LayoutCachedLeft =9225
                    LayoutCachedTop =60
                    LayoutCachedWidth =9485
                    LayoutCachedHeight =300
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =9792
                    Top =60
                    TabIndex =4
                    Name ="csAcompBenTransfRenda.csAcompBenef.BPCI"
                    ControlSource ="csAcompBenTransfRenda.csAcompBenef.BPCI"
                    EventProcPrefix ="csAcompBenTransfRenda_csAcompBenef_BPCI"
                    GridlineColor =10921638

                    LayoutCachedLeft =9792
                    LayoutCachedTop =60
                    LayoutCachedWidth =10052
                    LayoutCachedHeight =300
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =11572
                    Top =56
                    TabIndex =5
                    Name ="Seleção44"
                    ControlSource ="csAcompBenTransfRenda.[Fam Extrema Pb]"
                    GridlineColor =10921638

                    LayoutCachedLeft =11572
                    LayoutCachedTop =56
                    LayoutCachedWidth =11832
                    LayoutCachedHeight =296
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =13096
                    Top =56
                    TabIndex =6
                    Name ="Seleção45"
                    ControlSource ="csAcompBenTransfRenda.csAcompBenef.FragilSocioEcon"
                    GridlineColor =10921638

                    LayoutCachedLeft =13096
                    LayoutCachedTop =56
                    LayoutCachedWidth =13356
                    LayoutCachedHeight =296
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =14173
                    Top =56
                    TabIndex =7
                    Name ="Seleção46"
                    ControlSource ="csAcompBenTransfRenda.[PBF FAMILIA]"
                    GridlineColor =10921638

                    LayoutCachedLeft =14173
                    LayoutCachedTop =56
                    LayoutCachedWidth =14433
                    LayoutCachedHeight =296
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin ComboBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =10196
                    Width =1155
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =8
                    Name ="Combinação47"
                    ControlSource ="TipoBeneficio"
                    RowSourceType ="Table/Query"
                    GridlineColor =10921638

                    LayoutCachedLeft =10196
                    LayoutCachedWidth =11351
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin CheckBox
                    Left =14795
                    Top =56
                    TabIndex =9
                    Name ="Seleção50"
                    ControlSource ="csAcompBenTransfRenda.CADUNICO"
                    GridlineColor =10921638

                    LayoutCachedLeft =14795
                    LayoutCachedTop =56
                    LayoutCachedWidth =15055
                    LayoutCachedHeight =296
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =320
            Name ="RodapéDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7371
                    Top =5
                    Width =1710
                    Height =315
                    FontSize =10
                    FontWeight =700
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.Defic"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[csAcompBenef].[Defic])"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_Defic"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.Defic Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =7371
                    LayoutCachedTop =5
                    LayoutCachedWidth =9081
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9077
                    Top =5
                    Width =570
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.BPCD"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[csAcompBenef].[BPCD])"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_BPCD"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.BPCD Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =9077
                    LayoutCachedTop =5
                    LayoutCachedWidth =9647
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9644
                    Top =5
                    Width =555
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.BPCI"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[csAcompBenef].[BPCI])"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_BPCI"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.BPCI Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =9644
                    LayoutCachedTop =5
                    LayoutCachedWidth =10199
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =11351
                    Top =5
                    Width =1110
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="AccessTotalsSeleção44"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[Fam Extrema Pb])"
                    ControlTipText ="csAcompBenTransfRenda.[Fam Extrema Pb] Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =11351
                    LayoutCachedTop =5
                    LayoutCachedWidth =12461
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =12465
                    Top =5
                    Width =1485
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    Name ="AccessTotalsSeleção45"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[csAcompBenef].[FragilSocioEcon])"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.FragilSocioEcon Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =12465
                    LayoutCachedTop =5
                    LayoutCachedWidth =13950
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =13946
                    Top =5
                    Width =570
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =5
                    Name ="AccessTotalsSeleção46"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[PBF FAMILIA])"
                    ControlTipText ="csAcompBenTransfRenda.[PBF FAMILIA] Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =13946
                    LayoutCachedTop =5
                    LayoutCachedWidth =14516
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =14513
                    Top =5
                    Width =945
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =6
                    Name ="AccessTotalsSeleção50"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[CADUNICO])"
                    ControlTipText ="csAcompBenTransfRenda.CADUNICO Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =14513
                    LayoutCachedTop =5
                    LayoutCachedWidth =15458
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    OverlapFlags =4
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1360
                    Top =5
                    Width =4866
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =7
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.Nome"
                    ControlSource ="=Count(*)"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_Nome"
                    ControlTipText ="Contagem de Registros"
                    GridlineColor =10921638

                    LayoutCachedLeft =1360
                    LayoutCachedTop =5
                    LayoutCachedWidth =6226
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
            End
        End
        Begin PageFooter
            Height =558
            Name ="PageFooterSection"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =566
                    Top =226
                    Width =5040
                    Height =330
                    FontSize =8
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto39"
                    ControlSource ="=Now()"
                    Format ="Long Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedTop =226
                    LayoutCachedWidth =5606
                    LayoutCachedHeight =556
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =3
                    IMESentenceMode =3
                    Left =11852
                    Top =226
                    Width =3630
                    Height =330
                    FontSize =8
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto40"
                    ControlSource ="=\"Página \" & [Page] & \" de \" & [Pages]"
                    GridlineColor =10921638

                    LayoutCachedLeft =11852
                    LayoutCachedTop =226
                    LayoutCachedWidth =15482
                    LayoutCachedHeight =556
                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            Height =320
            Name ="RodapéDoRelatório"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7371
                    Top =5
                    Width =1710
                    Height =315
                    FontSize =10
                    FontWeight =700
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.Defic1"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[csAcompBenef].[Defic])"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_Defic1"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.Defic Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =7371
                    LayoutCachedTop =5
                    LayoutCachedWidth =9081
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9077
                    Top =5
                    Width =570
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.BPCD1"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[csAcompBenef].[BPCD])"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_BPCD1"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.BPCD Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =9077
                    LayoutCachedTop =5
                    LayoutCachedWidth =9647
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9644
                    Top =5
                    Width =570
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.BPCI1"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[csAcompBenef].[BPCI])"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_BPCI1"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.BPCI Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =9644
                    LayoutCachedTop =5
                    LayoutCachedWidth =10214
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =11351
                    Top =5
                    Width =1110
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="AccessTotalsSeleção441"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[Fam Extrema Pb])"
                    ControlTipText ="csAcompBenTransfRenda.[Fam Extrema Pb] Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =11351
                    LayoutCachedTop =5
                    LayoutCachedWidth =12461
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =12465
                    Top =5
                    Width =1485
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =4
                    Name ="AccessTotalsSeleção451"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[csAcompBenef].[FragilSocioEcon])"
                    ControlTipText ="csAcompBenTransfRenda.csAcompBenef.FragilSocioEcon Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =12465
                    LayoutCachedTop =5
                    LayoutCachedWidth =13950
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =13946
                    Top =5
                    Width =570
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =5
                    Name ="AccessTotalsSeleção461"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[PBF FAMILIA])"
                    ControlTipText ="csAcompBenTransfRenda.[PBF FAMILIA] Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =13946
                    LayoutCachedTop =5
                    LayoutCachedWidth =14516
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =14513
                    Top =5
                    Width =945
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =6
                    Name ="AccessTotalsSeleção501"
                    ControlSource ="=-Sum([csAcompBenTransfRenda].[CADUNICO])"
                    ControlTipText ="csAcompBenTransfRenda.CADUNICO Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =14513
                    LayoutCachedTop =5
                    LayoutCachedWidth =15458
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    OverlapFlags =4
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1360
                    Top =5
                    Width =4866
                    Height =315
                    FontSize =9
                    FontWeight =700
                    TabIndex =7
                    Name ="AccessTotalscsAcompBenTransfRenda.csAcompBenef.Nome1"
                    ControlSource ="=Count(*)"
                    EventProcPrefix ="AccessTotalscsAcompBenTransfRenda_csAcompBenef_Nome1"
                    ControlTipText ="Contagem de Registros"
                    GridlineColor =10921638

                    LayoutCachedLeft =1360
                    LayoutCachedTop =5
                    LayoutCachedWidth =6226
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
            End
        End
    End
End
