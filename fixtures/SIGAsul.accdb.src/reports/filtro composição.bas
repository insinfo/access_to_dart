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
    Width =9645
    DatasheetFontHeight =11
    ItemSuffix =144
    Left =4245
    Top =2985
    RecSrcDt = Begin
        0x8dadf02512f2e540
    End
    RecordSource ="filtro composição casa da criança"
    Caption ="filtro composição"
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
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin EmptyCell
            Height =240
            GridlineColor =12632256
            GridlineShade =65.0
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="CodFam"
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
            Height =855
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin ComboBox
                    IMESentenceMode =3
                    ListWidth =1440
                    Width =2211
                    Height =315
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CodFam"
                    ControlSource ="CodFam"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT CadResidencia.CodFam, CadResidencia.DataCad FROM CadResidencia ORDER BY C"
                        "adResidencia.[CodFam]; "
                    ColumnWidths ="1441"
                    GridlineColor =10921638

                    LayoutCachedWidth =2211
                    LayoutCachedHeight =315
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =2430
                    Top =510
                    Width =3405
                    Height =345
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Rótulo49"
                    Caption ="filtro composição.Nome"
                    GridlineColor =10921638
                    LayoutCachedLeft =2430
                    LayoutCachedTop =510
                    LayoutCachedWidth =5835
                    LayoutCachedHeight =855
                    BackShade =85.0
                End
                Begin Label
                    BackStyle =1
                    TextAlign =2
                    Left =5895
                    Top =510
                    Width =1380
                    Height =345
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Rótulo65"
                    Caption ="Parentesco"
                    GridlineColor =10921638
                    LayoutCachedLeft =5895
                    LayoutCachedTop =510
                    LayoutCachedWidth =7275
                    LayoutCachedHeight =855
                    ColumnStart =1
                    ColumnEnd =1
                    BackShade =85.0
                End
                Begin Label
                    TextAlign =1
                    Left =7335
                    Top =510
                    Width =1440
                    Height =345
                    BorderColor =8355711
                    ForeColor =6710886
                    Name ="Rótulo111"
                    Caption ="Idade"
                    GridlineColor =10921638
                    LayoutCachedLeft =7335
                    LayoutCachedTop =510
                    LayoutCachedWidth =8775
                    LayoutCachedHeight =855
                    ColumnStart =2
                    ColumnEnd =2
                End
                Begin TextBox
                    OverlapFlags =4
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2430
                    Width =3405
                    Height =285
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="AccessTotalsNome"
                    ControlSource ="=Count(*)"
                    ControlTipText ="Contagem de Registros"
                    GridlineColor =10921638

                    LayoutCachedLeft =2430
                    LayoutCachedWidth =5835
                    LayoutCachedHeight =285
                    RowStart =1
                    RowEnd =1
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =375
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    IMESentenceMode =3
                    Left =2430
                    Top =30
                    Width =3405
                    Height =315
                    ColumnWidth =3180
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="filtro composição.Nome"
                    ControlSource ="Nome"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    EventProcPrefix ="filtro_composição_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =2430
                    LayoutCachedTop =30
                    LayoutCachedWidth =5835
                    LayoutCachedHeight =345
                    RowStart =2
                    RowEnd =2
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    IMESentenceMode =3
                    ListWidth =2640
                    Left =5895
                    Top =30
                    Width =1380
                    Height =315
                    TabIndex =1
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

                    LayoutCachedLeft =5895
                    LayoutCachedTop =30
                    LayoutCachedWidth =7275
                    LayoutCachedHeight =345
                    RowStart =2
                    RowEnd =2
                    ColumnStart =1
                    ColumnEnd =1
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =7335
                    Top =30
                    Width =1440
                    Height =315
                    TabIndex =2
                    BorderColor =10921638
                    Name ="Idade"
                    ControlSource ="Idade"
                    GridlineColor =10921638

                    LayoutCachedLeft =7335
                    LayoutCachedTop =30
                    LayoutCachedWidth =8775
                    LayoutCachedHeight =345
                    RowStart =2
                    RowEnd =2
                    ColumnStart =2
                    ColumnEnd =2
                    ForeThemeColorIndex =2
                    ForeTint =100.0
                    ForeShade =50.0
                End
            End
        End
        Begin BreakFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =0
            Name ="RodapéDoGrupo1"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin PageFooter
            Height =0
            Name ="PageFooterSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin FormFooter
            KeepTogether = NotDefault
            Height =457
            Name ="RodapéDoRelatório"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
