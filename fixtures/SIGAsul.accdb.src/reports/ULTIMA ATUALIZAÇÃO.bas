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
    Width =11281
    DatasheetFontHeight =11
    ItemSuffix =15
    Left =5385
    Top =3045
    RecSrcDt = Begin
        0xcc14d67fcf98e540
    End
    RecordSource ="csAtualizaçãoCadResid"
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
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            SizeMode =3
            PictureAlignment =2
            Width =1701
            Height =1701
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
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
        Begin PageHeader
            Height =0
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin Section
            KeepTogether = NotDefault
            Height =4289
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin ComboBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =2955
                    Top =3180
                    Width =3681
                    Height =390
                    FontSize =16
                    FontWeight =700
                    BorderColor =10921638
                    Name ="CodResid"
                    ControlSource ="CodFam"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [CadResidencia].[CodResid] FROM CadResidencia ORDER BY [CodResid]; "
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =2955
                    LayoutCachedTop =3180
                    LayoutCachedWidth =6636
                    LayoutCachedHeight =3570
                    ForeThemeColorIndex =4
                    ForeShade =75.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2955
                    Top =3691
                    Width =2256
                    Height =270
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    Name ="Nº UNIDADE"
                    ControlSource ="Nº Cras"
                    EventProcPrefix ="Nº_UNIDADE"
                    GridlineColor =10921638

                    LayoutCachedLeft =2955
                    LayoutCachedTop =3691
                    LayoutCachedWidth =5211
                    LayoutCachedHeight =3961
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2955
                    Top =3974
                    Width =2046
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    BorderColor =10921638
                    Name ="TbUnidade.Nome"
                    ControlSource ="NOME"
                    EventProcPrefix ="TbUnidade_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =2955
                    LayoutCachedTop =3974
                    LayoutCachedWidth =5001
                    LayoutCachedHeight =4289
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =75.0
                End
                Begin Label
                    Left =2895
                    Top =1920
                    Width =7020
                    Height =420
                    FontSize =14
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo10"
                    Caption ="DATA DA ÚLTIMA TUALIZAÇÃO:  "
                    GridlineColor =10921638
                    LayoutCachedLeft =2895
                    LayoutCachedTop =1920
                    LayoutCachedWidth =9915
                    LayoutCachedHeight =2340
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =50.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2910
                    Top =2325
                    Width =3291
                    Height =390
                    FontSize =14
                    FontWeight =700
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =255
                    Name ="ÚltimoDeDATA ATUALIZ"
                    ControlSource ="ÚltimoDeDATA ATUALIZ"
                    EventProcPrefix ="ÚltimoDeDATA_ATUALIZ"
                    GridlineColor =10921638

                    LayoutCachedLeft =2910
                    LayoutCachedTop =2325
                    LayoutCachedWidth =6201
                    LayoutCachedHeight =2715
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    Left =2895
                    Top =2715
                    Width =7020
                    Height =420
                    FontSize =14
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo14"
                    Caption ="CÓD. FAMILIAR:  "
                    GridlineColor =10921638
                    LayoutCachedLeft =2895
                    LayoutCachedTop =2715
                    LayoutCachedWidth =9915
                    LayoutCachedHeight =3135
                    ForeThemeColorIndex =9
                    ForeTint =100.0
                    ForeShade =50.0
                End
            End
        End
        Begin PageFooter
            Height =0
            Name ="PageFooterSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
