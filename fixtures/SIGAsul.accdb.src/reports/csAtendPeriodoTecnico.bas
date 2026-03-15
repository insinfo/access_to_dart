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
    Width =26160
    DatasheetFontHeight =11
    ItemSuffix =1830
    Left =660
    Top =2985
    RecSrcDt = Begin
        0x3a0664df6ed8e540
    End
    RecordSource ="csAtendPeriodoTecnico"
    Caption ="csAtendPeriodoTecnico"
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
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin BreakLevel
            GroupHeader = NotDefault
            GroupFooter = NotDefault
            ControlSource ="TbCadFuncionario.Nome"
        End
        Begin BreakLevel
            ControlSource ="Data"
        End
        Begin BreakLevel
            ControlSource ="TbPessoa.Nome"
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
            Height =3150
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    Left =5272
                    Top =56
                    Width =5265
                    Height =390
                    FontSize =14
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo183"
                    Caption ="RELATÓRIO DE ATENDIMENTO POR TÉCNICO"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =5272
                    LayoutCachedTop =56
                    LayoutCachedWidth =10537
                    LayoutCachedHeight =446
                    ForeTint =50.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    TextAlign =2
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =5102
                    Top =623
                    Width =5781
                    Height =390
                    FontSize =14
                    FontWeight =700
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CRAS"
                    ControlSource ="UNIDADE"
                    RowSourceType ="Value List"
                    RowSource ="Norte;Centro;Sul;Rocha Leão"
                    ColumnWidths ="1443"
                    GridlineColor =-2147483609

                    LayoutCachedLeft =5102
                    LayoutCachedTop =623
                    LayoutCachedWidth =10883
                    LayoutCachedHeight =1013
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Width =4875
                    Height =1305
                    BorderColor =16777215
                    Name ="LOGO"
                    ControlSource ="LOGO"
                    GridlineColor =10921638
                    TabIndex =1

                    LayoutCachedWidth =4875
                    LayoutCachedHeight =1305
                    BorderShade =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4320
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo650"
                    Caption ="AcolhidaPartic"
                    GridlineColor =10921638
                    LayoutCachedLeft =4320
                    LayoutCachedTop =1860
                    LayoutCachedWidth =4695
                    LayoutCachedHeight =3150
                    ColumnStart =1
                    ColumnEnd =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4695
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo651"
                    Caption ="AtRemoto"
                    GridlineColor =10921638
                    LayoutCachedLeft =4695
                    LayoutCachedTop =1860
                    LayoutCachedWidth =5070
                    LayoutCachedHeight =3150
                    ColumnStart =2
                    ColumnEnd =2
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5070
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo652"
                    Caption ="Acoremoto"
                    GridlineColor =10921638
                    LayoutCachedLeft =5070
                    LayoutCachedTop =1860
                    LayoutCachedWidth =5445
                    LayoutCachedHeight =3150
                    ColumnStart =3
                    ColumnEnd =3
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5445
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo653"
                    Caption ="Volante"
                    GridlineColor =10921638
                    LayoutCachedLeft =5445
                    LayoutCachedTop =1860
                    LayoutCachedWidth =5820
                    LayoutCachedHeight =3150
                    ColumnStart =4
                    ColumnEnd =4
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =5805
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo654"
                    Caption ="VD"
                    GridlineColor =10921638
                    LayoutCachedLeft =5805
                    LayoutCachedTop =1860
                    LayoutCachedWidth =6180
                    LayoutCachedHeight =3150
                    ColumnStart =5
                    ColumnEnd =5
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6180
                    Top =1860
                    Width =450
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo655"
                    Caption ="ESTUDO SOCIAL"
                    GridlineColor =10921638
                    LayoutCachedLeft =6180
                    LayoutCachedTop =1860
                    LayoutCachedWidth =6630
                    LayoutCachedHeight =3150
                    ColumnStart =6
                    ColumnEnd =6
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6630
                    Top =1860
                    Width =420
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo656"
                    Caption ="Acolhida Coletiva"
                    GridlineColor =10921638
                    LayoutCachedLeft =6630
                    LayoutCachedTop =1860
                    LayoutCachedWidth =7050
                    LayoutCachedHeight =3150
                    ColumnStart =7
                    ColumnEnd =7
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7050
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo657"
                    Caption ="ART INSTITUC"
                    GridlineColor =10921638
                    LayoutCachedLeft =7050
                    LayoutCachedTop =1860
                    LayoutCachedWidth =7425
                    LayoutCachedHeight =3150
                    ColumnStart =8
                    ColumnEnd =8
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7425
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo658"
                    Caption ="RELATORIO"
                    GridlineColor =10921638
                    LayoutCachedLeft =7425
                    LayoutCachedTop =1860
                    LayoutCachedWidth =7800
                    LayoutCachedHeight =3150
                    ColumnStart =9
                    ColumnEnd =9
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7800
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo999"
                    Caption ="VDLFR"
                    GridlineColor =10921638
                    LayoutCachedLeft =7800
                    LayoutCachedTop =1860
                    LayoutCachedWidth =8175
                    LayoutCachedHeight =3150
                    ColumnStart =10
                    ColumnEnd =10
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8175
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1015"
                    Caption ="VDCDL"
                    GridlineColor =10921638
                    LayoutCachedLeft =8175
                    LayoutCachedTop =1860
                    LayoutCachedWidth =8550
                    LayoutCachedHeight =3150
                    ColumnStart =11
                    ColumnEnd =11
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8550
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1016"
                    Caption ="VDDCP"
                    GridlineColor =10921638
                    LayoutCachedLeft =8550
                    LayoutCachedTop =1860
                    LayoutCachedWidth =8925
                    LayoutCachedHeight =3150
                    ColumnStart =12
                    ColumnEnd =12
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8925
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1017"
                    Caption ="VDDPAF"
                    GridlineColor =10921638
                    LayoutCachedLeft =8925
                    LayoutCachedTop =1860
                    LayoutCachedWidth =9300
                    LayoutCachedHeight =3150
                    ColumnStart =13
                    ColumnEnd =13
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9300
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1018"
                    Caption ="VDAMF"
                    GridlineColor =10921638
                    LayoutCachedLeft =9300
                    LayoutCachedTop =1860
                    LayoutCachedWidth =9675
                    LayoutCachedHeight =3150
                    ColumnStart =14
                    ColumnEnd =14
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9675
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1019"
                    Caption ="VDFVI"
                    GridlineColor =10921638
                    LayoutCachedLeft =9675
                    LayoutCachedTop =1860
                    LayoutCachedWidth =10050
                    LayoutCachedHeight =3150
                    ColumnStart =15
                    ColumnEnd =15
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10050
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1020"
                    Caption ="VDAMD"
                    GridlineColor =10921638
                    LayoutCachedLeft =10050
                    LayoutCachedTop =1860
                    LayoutCachedWidth =10425
                    LayoutCachedHeight =3150
                    ColumnStart =16
                    ColumnEnd =16
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10425
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1021"
                    Caption ="VDASF"
                    GridlineColor =10921638
                    LayoutCachedLeft =10425
                    LayoutCachedTop =1860
                    LayoutCachedWidth =10800
                    LayoutCachedHeight =3150
                    ColumnStart =17
                    ColumnEnd =17
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10800
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1022"
                    Caption ="VDPBF"
                    GridlineColor =10921638
                    LayoutCachedLeft =10800
                    LayoutCachedTop =1860
                    LayoutCachedWidth =11175
                    LayoutCachedHeight =3150
                    ColumnStart =18
                    ColumnEnd =18
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11175
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1023"
                    Caption ="VDSCFV"
                    GridlineColor =10921638
                    LayoutCachedLeft =11175
                    LayoutCachedTop =1860
                    LayoutCachedWidth =11550
                    LayoutCachedHeight =3150
                    ColumnStart =19
                    ColumnEnd =19
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11550
                    Top =1860
                    Width =375
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1024"
                    Caption ="VDOUT"
                    GridlineColor =10921638
                    LayoutCachedLeft =11550
                    LayoutCachedTop =1860
                    LayoutCachedWidth =11925
                    LayoutCachedHeight =3150
                    ColumnStart =20
                    ColumnEnd =20
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11925
                    Top =1860
                    Width =1050
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1531"
                    Caption ="QUAL VD"
                    GridlineColor =10921638
                    LayoutCachedLeft =11925
                    LayoutCachedTop =1860
                    LayoutCachedWidth =12975
                    LayoutCachedHeight =3150
                    ColumnStart =21
                    ColumnEnd =21
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12975
                    Top =1860
                    Width =525
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1532"
                    Caption ="VD NAO LOCALIZADA"
                    GridlineColor =10921638
                    LayoutCachedLeft =12975
                    LayoutCachedTop =1860
                    LayoutCachedWidth =13500
                    LayoutCachedHeight =3150
                    ColumnStart =22
                    ColumnEnd =22
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13500
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1545"
                    Caption ="Administrativo"
                    GridlineColor =10921638
                    LayoutCachedLeft =13500
                    LayoutCachedTop =1860
                    LayoutCachedWidth =13905
                    LayoutCachedHeight =3150
                    ColumnStart =23
                    ColumnEnd =23
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13905
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1546"
                    Caption ="Social"
                    GridlineColor =10921638
                    LayoutCachedLeft =13905
                    LayoutCachedTop =1860
                    LayoutCachedWidth =14310
                    LayoutCachedHeight =3150
                    ColumnStart =24
                    ColumnEnd =24
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14310
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1547"
                    Caption ="Psicologico"
                    GridlineColor =10921638
                    LayoutCachedLeft =14310
                    LayoutCachedTop =1860
                    LayoutCachedWidth =14715
                    LayoutCachedHeight =3150
                    ColumnStart =25
                    ColumnEnd =25
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =14715
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1548"
                    Caption ="Multidisciplinar"
                    GridlineColor =10921638
                    LayoutCachedLeft =14715
                    LayoutCachedTop =1860
                    LayoutCachedWidth =15120
                    LayoutCachedHeight =3150
                    ColumnStart =26
                    ColumnEnd =26
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =15120
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1549"
                    Caption ="OrientadorSoc"
                    GridlineColor =10921638
                    LayoutCachedLeft =15120
                    LayoutCachedTop =1860
                    LayoutCachedWidth =15525
                    LayoutCachedHeight =3150
                    ColumnStart =27
                    ColumnEnd =27
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =15525
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1550"
                    Caption ="AtGestao"
                    GridlineColor =10921638
                    LayoutCachedLeft =15525
                    LayoutCachedTop =1860
                    LayoutCachedWidth =15930
                    LayoutCachedHeight =3150
                    ColumnStart =28
                    ColumnEnd =28
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =17010
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1551"
                    Caption ="DemandaBPC"
                    GridlineColor =10921638
                    LayoutCachedLeft =17010
                    LayoutCachedTop =1860
                    LayoutCachedWidth =17415
                    LayoutCachedHeight =3150
                    ColumnStart =29
                    ColumnEnd =29
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =17415
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1552"
                    Caption ="DemandaINSS"
                    GridlineColor =10921638
                    LayoutCachedLeft =17415
                    LayoutCachedTop =1860
                    LayoutCachedWidth =17820
                    LayoutCachedHeight =3150
                    ColumnStart =30
                    ColumnEnd =30
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =17805
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1553"
                    Caption ="DemandaSCFV"
                    GridlineColor =10921638
                    LayoutCachedLeft =17805
                    LayoutCachedTop =1860
                    LayoutCachedWidth =18210
                    LayoutCachedHeight =3150
                    ColumnStart =31
                    ColumnEnd =31
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =18210
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1554"
                    Caption ="DemandaEduc"
                    GridlineColor =10921638
                    LayoutCachedLeft =18210
                    LayoutCachedTop =1860
                    LayoutCachedWidth =18615
                    LayoutCachedHeight =3150
                    ColumnStart =32
                    ColumnEnd =32
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =18615
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1555"
                    Caption ="DemandaSaude"
                    GridlineColor =10921638
                    LayoutCachedLeft =18615
                    LayoutCachedTop =1860
                    LayoutCachedWidth =19020
                    LayoutCachedHeight =3150
                    ColumnStart =33
                    ColumnEnd =33
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =19020
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1556"
                    Caption ="DemandaJustiça"
                    GridlineColor =10921638
                    LayoutCachedLeft =19020
                    LayoutCachedTop =1860
                    LayoutCachedWidth =19425
                    LayoutCachedHeight =3150
                    ColumnStart =34
                    ColumnEnd =34
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =19425
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1557"
                    Caption ="DemandaBenefMun"
                    GridlineColor =10921638
                    LayoutCachedLeft =19425
                    LayoutCachedTop =1860
                    LayoutCachedWidth =19830
                    LayoutCachedHeight =3150
                    ColumnStart =35
                    ColumnEnd =35
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =19830
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1558"
                    Caption ="DemandaAuxNatal"
                    GridlineColor =10921638
                    LayoutCachedLeft =19830
                    LayoutCachedTop =1860
                    LayoutCachedWidth =20235
                    LayoutCachedHeight =3150
                    ColumnStart =36
                    ColumnEnd =36
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =20235
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1559"
                    Caption ="DemandaGratTransp"
                    GridlineColor =10921638
                    LayoutCachedLeft =20235
                    LayoutCachedTop =1860
                    LayoutCachedWidth =20640
                    LayoutCachedHeight =3150
                    ColumnStart =37
                    ColumnEnd =37
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =20640
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1560"
                    Caption ="DemandaRecJus"
                    GridlineColor =10921638
                    LayoutCachedLeft =20640
                    LayoutCachedTop =1860
                    LayoutCachedWidth =21045
                    LayoutCachedHeight =3150
                    ColumnStart =38
                    ColumnEnd =38
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =21045
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1561"
                    Caption ="DemandaDocCivil"
                    GridlineColor =10921638
                    LayoutCachedLeft =21045
                    LayoutCachedTop =1860
                    LayoutCachedWidth =21450
                    LayoutCachedHeight =3150
                    ColumnStart =39
                    ColumnEnd =39
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =21450
                    Top =1860
                    Width =420
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1562"
                    Caption ="DemandaApoioAlim"
                    GridlineColor =10921638
                    LayoutCachedLeft =21450
                    LayoutCachedTop =1860
                    LayoutCachedWidth =21870
                    LayoutCachedHeight =3150
                    ColumnStart =40
                    ColumnEnd =40
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =21870
                    Top =1860
                    Width =405
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1563"
                    Caption ="Outra Demanda"
                    GridlineColor =10921638
                    LayoutCachedLeft =21870
                    LayoutCachedTop =1860
                    LayoutCachedWidth =22275
                    LayoutCachedHeight =3150
                    ColumnStart =41
                    ColumnEnd =41
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =22275
                    Top =1860
                    Width =1665
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1564"
                    Caption ="Especif Outra"
                    GridlineColor =10921638
                    LayoutCachedLeft =22275
                    LayoutCachedTop =1860
                    LayoutCachedWidth =23940
                    LayoutCachedHeight =3150
                    ColumnStart =42
                    ColumnEnd =42
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =23940
                    Top =1860
                    Width =2220
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1565"
                    Caption ="OBS"
                    GridlineColor =10921638
                    LayoutCachedLeft =23940
                    LayoutCachedTop =1860
                    LayoutCachedWidth =26160
                    LayoutCachedHeight =3150
                    ColumnStart =43
                    ColumnEnd =43
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    HideDuplicates = NotDefault
                    DecimalPlaces =0
                    OldBorderStyle =0
                    OverlapFlags =4
                    BackStyle =0
                    IMESentenceMode =3
                    Top =1360
                    Width =6399
                    Height =390
                    ColumnWidth =2250
                    FontSize =12
                    FontWeight =700
                    TabIndex =2
                    BorderColor =10921638
                    Name ="TbCadFuncionario.Nome"
                    ControlSource ="TbCadFuncionario.Nome"
                    Format =">"
                    EventProcPrefix ="TbCadFuncionario_Nome"
                    GridlineColor =10921638

                    LayoutCachedTop =1360
                    LayoutCachedWidth =6399
                    LayoutCachedHeight =1750
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =990
                    Top =1860
                    Width =3330
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1827"
                    Caption ="USUÁRIO"
                    GridlineColor =10921638
                    LayoutCachedLeft =990
                    LayoutCachedTop =1860
                    LayoutCachedWidth =4320
                    LayoutCachedHeight =3150
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Top =1860
                    Width =990
                    Height =1290
                    FontSize =8
                    BackColor =14277081
                    Name ="Rótulo1828"
                    Caption ="DATA"
                    GridlineColor =10921638
                    LayoutCachedTop =1860
                    LayoutCachedWidth =990
                    LayoutCachedHeight =3150
                    ColumnStart =21
                    ColumnEnd =21
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    OverlapFlags =4
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =8609
                    Top =1417
                    Width =1386
                    Height =315
                    FontWeight =700
                    TabIndex =3
                    BorderColor =10921638
                    Name ="Carga Horária"
                    ControlSource ="Carga Horária"
                    EventProcPrefix ="Carga_Horária"
                    GridlineColor =10921638

                    LayoutCachedLeft =8609
                    LayoutCachedTop =1417
                    LayoutCachedWidth =9995
                    LayoutCachedHeight =1732
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =7088
                            Top =1417
                            Width =1425
                            Height =315
                            BorderColor =8355711
                            ForeColor =6710886
                            Name ="Rótulo1829"
                            Caption ="Carga Horária: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7088
                            LayoutCachedTop =1417
                            LayoutCachedWidth =8513
                            LayoutCachedHeight =1732
                        End
                    End
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
                Begin CheckBox
                    Left =4380
                    Top =30
                    Width =225
                    Height =210
                    Name ="AcolhidaPartic"
                    ControlSource ="AcolhidaPartic"
                    GridlineColor =10921638

                    LayoutCachedLeft =4380
                    LayoutCachedTop =30
                    LayoutCachedWidth =4605
                    LayoutCachedHeight =240
                    ColumnStart =1
                    ColumnEnd =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =4755
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =1
                    Name ="AtRemoto"
                    ControlSource ="AtRemoto"
                    GridlineColor =10921638

                    LayoutCachedLeft =4755
                    LayoutCachedTop =30
                    LayoutCachedWidth =4980
                    LayoutCachedHeight =240
                    ColumnStart =2
                    ColumnEnd =2
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =5130
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =2
                    Name ="Acoremoto"
                    ControlSource ="Acoremoto"
                    GridlineColor =10921638

                    LayoutCachedLeft =5130
                    LayoutCachedTop =30
                    LayoutCachedWidth =5355
                    LayoutCachedHeight =240
                    ColumnStart =3
                    ColumnEnd =3
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =5505
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =3
                    Name ="Volante"
                    ControlSource ="Volante"
                    GridlineColor =10921638

                    LayoutCachedLeft =5505
                    LayoutCachedTop =30
                    LayoutCachedWidth =5730
                    LayoutCachedHeight =240
                    ColumnStart =4
                    ColumnEnd =4
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =5865
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =4
                    Name ="VD"
                    ControlSource ="VD"
                    GridlineColor =10921638

                    LayoutCachedLeft =5865
                    LayoutCachedTop =30
                    LayoutCachedWidth =6090
                    LayoutCachedHeight =240
                    ColumnStart =5
                    ColumnEnd =5
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =6240
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =5
                    Name ="ESTUDO SOCIAL"
                    ControlSource ="ESTUDO SOCIAL"
                    EventProcPrefix ="ESTUDO_SOCIAL"
                    GridlineColor =10921638

                    LayoutCachedLeft =6240
                    LayoutCachedTop =30
                    LayoutCachedWidth =6465
                    LayoutCachedHeight =240
                    ColumnStart =6
                    ColumnEnd =6
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =6690
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =6
                    Name ="Acolhida Coletiva"
                    ControlSource ="Acolhida Coletiva"
                    EventProcPrefix ="Acolhida_Coletiva"
                    GridlineColor =10921638

                    LayoutCachedLeft =6690
                    LayoutCachedTop =30
                    LayoutCachedWidth =6915
                    LayoutCachedHeight =240
                    ColumnStart =7
                    ColumnEnd =7
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =7110
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =7
                    Name ="ART INSTITUC"
                    ControlSource ="ART INSTITUC"
                    EventProcPrefix ="ART_INSTITUC"
                    GridlineColor =10921638

                    LayoutCachedLeft =7110
                    LayoutCachedTop =30
                    LayoutCachedWidth =7335
                    LayoutCachedHeight =240
                    ColumnStart =8
                    ColumnEnd =8
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =7485
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =8
                    Name ="RELATORIO"
                    ControlSource ="RELATORIO"
                    GridlineColor =10921638

                    LayoutCachedLeft =7485
                    LayoutCachedTop =30
                    LayoutCachedWidth =7710
                    LayoutCachedHeight =240
                    ColumnStart =9
                    ColumnEnd =9
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =7860
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =9
                    Name ="VDLFR"
                    ControlSource ="VDLFR"
                    GridlineColor =10921638

                    LayoutCachedLeft =7860
                    LayoutCachedTop =30
                    LayoutCachedWidth =8085
                    LayoutCachedHeight =240
                    ColumnStart =10
                    ColumnEnd =10
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =8235
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =10
                    Name ="VDCDL"
                    ControlSource ="VDCDL"
                    GridlineColor =10921638

                    LayoutCachedLeft =8235
                    LayoutCachedTop =30
                    LayoutCachedWidth =8460
                    LayoutCachedHeight =240
                    ColumnStart =11
                    ColumnEnd =11
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =8610
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =11
                    Name ="VDDCP"
                    ControlSource ="VDDCP"
                    GridlineColor =10921638

                    LayoutCachedLeft =8610
                    LayoutCachedTop =30
                    LayoutCachedWidth =8835
                    LayoutCachedHeight =240
                    ColumnStart =12
                    ColumnEnd =12
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =8985
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =12
                    Name ="VDDPAF"
                    ControlSource ="VDDPAF"
                    GridlineColor =10921638

                    LayoutCachedLeft =8985
                    LayoutCachedTop =30
                    LayoutCachedWidth =9210
                    LayoutCachedHeight =240
                    ColumnStart =13
                    ColumnEnd =13
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =9360
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =13
                    Name ="VDAMF"
                    ControlSource ="VDAMF"
                    GridlineColor =10921638

                    LayoutCachedLeft =9360
                    LayoutCachedTop =30
                    LayoutCachedWidth =9585
                    LayoutCachedHeight =240
                    ColumnStart =14
                    ColumnEnd =14
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =9735
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =14
                    Name ="VDFVI"
                    ControlSource ="VDFVI"
                    GridlineColor =10921638

                    LayoutCachedLeft =9735
                    LayoutCachedTop =30
                    LayoutCachedWidth =9960
                    LayoutCachedHeight =240
                    ColumnStart =15
                    ColumnEnd =15
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =10110
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =15
                    Name ="VDAMD"
                    ControlSource ="VDAMD"
                    GridlineColor =10921638

                    LayoutCachedLeft =10110
                    LayoutCachedTop =30
                    LayoutCachedWidth =10335
                    LayoutCachedHeight =240
                    ColumnStart =16
                    ColumnEnd =16
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =10485
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =16
                    Name ="VDASF"
                    ControlSource ="VDASF"
                    GridlineColor =10921638

                    LayoutCachedLeft =10485
                    LayoutCachedTop =30
                    LayoutCachedWidth =10710
                    LayoutCachedHeight =240
                    ColumnStart =17
                    ColumnEnd =17
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =10860
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =17
                    Name ="VDPBF"
                    ControlSource ="VDPBF"
                    GridlineColor =10921638

                    LayoutCachedLeft =10860
                    LayoutCachedTop =30
                    LayoutCachedWidth =11085
                    LayoutCachedHeight =240
                    ColumnStart =18
                    ColumnEnd =18
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =11235
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =18
                    Name ="VDSCFV"
                    ControlSource ="VDSCFV"
                    GridlineColor =10921638

                    LayoutCachedLeft =11235
                    LayoutCachedTop =30
                    LayoutCachedWidth =11460
                    LayoutCachedHeight =240
                    ColumnStart =19
                    ColumnEnd =19
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =11610
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =19
                    Name ="VDOUT"
                    ControlSource ="VDOUT"
                    GridlineColor =10921638

                    LayoutCachedLeft =11610
                    LayoutCachedTop =30
                    LayoutCachedWidth =11835
                    LayoutCachedHeight =240
                    ColumnStart =20
                    ColumnEnd =20
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =11925
                    Top =30
                    Width =1056
                    Height =210
                    FontSize =8
                    TabIndex =20
                    Name ="QUAL VD"
                    ControlSource ="QUAL VD"
                    EventProcPrefix ="QUAL_VD"
                    GridlineColor =10921638

                    LayoutCachedLeft =11925
                    LayoutCachedTop =30
                    LayoutCachedWidth =12981
                    LayoutCachedHeight =240
                    ColumnStart =21
                    ColumnEnd =21
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin CheckBox
                    Left =13095
                    Top =60
                    Width =225
                    Height =210
                    TabIndex =21
                    Name ="VD NAO LOCALIZADA"
                    ControlSource ="VD NAO LOCALIZADA"
                    EventProcPrefix ="VD_NAO_LOCALIZADA"
                    GridlineColor =10921638

                    LayoutCachedLeft =13095
                    LayoutCachedTop =60
                    LayoutCachedWidth =13320
                    LayoutCachedHeight =270
                    ColumnStart =22
                    ColumnEnd =22
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =13620
                    Top =60
                    Width =225
                    Height =210
                    TabIndex =22
                    Name ="Administrativo"
                    ControlSource ="Administrativo"
                    GridlineColor =10921638

                    LayoutCachedLeft =13620
                    LayoutCachedTop =60
                    LayoutCachedWidth =13845
                    LayoutCachedHeight =270
                    ColumnStart =23
                    ColumnEnd =23
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =14025
                    Top =60
                    Width =225
                    Height =210
                    TabIndex =23
                    Name ="Social"
                    ControlSource ="Social"
                    GridlineColor =10921638

                    LayoutCachedLeft =14025
                    LayoutCachedTop =60
                    LayoutCachedWidth =14250
                    LayoutCachedHeight =270
                    ColumnStart =24
                    ColumnEnd =24
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =14430
                    Top =60
                    Width =225
                    Height =210
                    TabIndex =24
                    Name ="Psicologico"
                    ControlSource ="Psicologico"
                    GridlineColor =10921638

                    LayoutCachedLeft =14430
                    LayoutCachedTop =60
                    LayoutCachedWidth =14655
                    LayoutCachedHeight =270
                    ColumnStart =25
                    ColumnEnd =25
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =14835
                    Top =60
                    Width =225
                    Height =210
                    TabIndex =25
                    Name ="Multidisciplinar"
                    ControlSource ="Multidisciplinar"
                    GridlineColor =10921638

                    LayoutCachedLeft =14835
                    LayoutCachedTop =60
                    LayoutCachedWidth =15060
                    LayoutCachedHeight =270
                    ColumnStart =26
                    ColumnEnd =26
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =15240
                    Top =60
                    Width =225
                    Height =210
                    TabIndex =26
                    Name ="OrientadorSoc"
                    ControlSource ="OrientadorSoc"
                    GridlineColor =10921638

                    LayoutCachedLeft =15240
                    LayoutCachedTop =60
                    LayoutCachedWidth =15465
                    LayoutCachedHeight =270
                    ColumnStart =27
                    ColumnEnd =27
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =15645
                    Top =60
                    Width =225
                    Height =210
                    TabIndex =27
                    Name ="AtGestao"
                    ControlSource ="AtGestao"
                    GridlineColor =10921638

                    LayoutCachedLeft =15645
                    LayoutCachedTop =60
                    LayoutCachedWidth =15870
                    LayoutCachedHeight =270
                    ColumnStart =28
                    ColumnEnd =28
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =17070
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =28
                    Name ="DemandaBPC"
                    ControlSource ="DemandaBPC"
                    GridlineColor =10921638

                    LayoutCachedLeft =17070
                    LayoutCachedTop =30
                    LayoutCachedWidth =17295
                    LayoutCachedHeight =240
                    ColumnStart =29
                    ColumnEnd =29
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =17475
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =29
                    Name ="DemandaINSS"
                    ControlSource ="DemandaINSS"
                    GridlineColor =10921638

                    LayoutCachedLeft =17475
                    LayoutCachedTop =30
                    LayoutCachedWidth =17700
                    LayoutCachedHeight =240
                    ColumnStart =30
                    ColumnEnd =30
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =17865
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =30
                    Name ="DemandaSCFV"
                    ControlSource ="DemandaSCFV"
                    GridlineColor =10921638

                    LayoutCachedLeft =17865
                    LayoutCachedTop =30
                    LayoutCachedWidth =18090
                    LayoutCachedHeight =240
                    ColumnStart =31
                    ColumnEnd =31
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =18270
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =31
                    Name ="DemandaEduc"
                    ControlSource ="DemandaEduc"
                    GridlineColor =10921638

                    LayoutCachedLeft =18270
                    LayoutCachedTop =30
                    LayoutCachedWidth =18495
                    LayoutCachedHeight =240
                    ColumnStart =32
                    ColumnEnd =32
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =18675
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =32
                    Name ="DemandaSaude"
                    ControlSource ="DemandaSaude"
                    GridlineColor =10921638

                    LayoutCachedLeft =18675
                    LayoutCachedTop =30
                    LayoutCachedWidth =18900
                    LayoutCachedHeight =240
                    ColumnStart =33
                    ColumnEnd =33
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =19080
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =33
                    Name ="DemandaJustiça"
                    ControlSource ="DemandaJustiça"
                    GridlineColor =10921638

                    LayoutCachedLeft =19080
                    LayoutCachedTop =30
                    LayoutCachedWidth =19305
                    LayoutCachedHeight =240
                    ColumnStart =34
                    ColumnEnd =34
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =19485
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =34
                    Name ="DemandaBenefMun"
                    ControlSource ="DemandaBenefMun"
                    GridlineColor =10921638

                    LayoutCachedLeft =19485
                    LayoutCachedTop =30
                    LayoutCachedWidth =19710
                    LayoutCachedHeight =240
                    ColumnStart =35
                    ColumnEnd =35
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =19890
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =35
                    Name ="DemandaAuxNatal"
                    ControlSource ="DemandaAuxNatal"
                    GridlineColor =10921638

                    LayoutCachedLeft =19890
                    LayoutCachedTop =30
                    LayoutCachedWidth =20115
                    LayoutCachedHeight =240
                    ColumnStart =36
                    ColumnEnd =36
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =20295
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =36
                    Name ="DemandaGratTransp"
                    ControlSource ="DemandaGratTransp"
                    GridlineColor =10921638

                    LayoutCachedLeft =20295
                    LayoutCachedTop =30
                    LayoutCachedWidth =20520
                    LayoutCachedHeight =240
                    ColumnStart =37
                    ColumnEnd =37
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =20700
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =37
                    Name ="DemandaRecJus"
                    ControlSource ="DemandaRecJus"
                    GridlineColor =10921638

                    LayoutCachedLeft =20700
                    LayoutCachedTop =30
                    LayoutCachedWidth =20925
                    LayoutCachedHeight =240
                    ColumnStart =38
                    ColumnEnd =38
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =21105
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =38
                    Name ="DemandaDocCivil"
                    ControlSource ="DemandaDocCivil"
                    GridlineColor =10921638

                    LayoutCachedLeft =21105
                    LayoutCachedTop =30
                    LayoutCachedWidth =21330
                    LayoutCachedHeight =240
                    ColumnStart =39
                    ColumnEnd =39
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =21510
                    Top =30
                    Width =240
                    Height =210
                    TabIndex =39
                    Name ="DemandaApoioAlim"
                    ControlSource ="DemandaApoioAlim"
                    GridlineColor =10921638

                    LayoutCachedLeft =21510
                    LayoutCachedTop =30
                    LayoutCachedWidth =21750
                    LayoutCachedHeight =240
                    ColumnStart =40
                    ColumnEnd =40
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin CheckBox
                    Left =21930
                    Top =30
                    Width =225
                    Height =210
                    TabIndex =40
                    Name ="Outra Demanda"
                    ControlSource ="Outra Demanda"
                    EventProcPrefix ="Outra_Demanda"
                    GridlineColor =10921638

                    LayoutCachedLeft =21930
                    LayoutCachedTop =30
                    LayoutCachedWidth =22155
                    LayoutCachedHeight =240
                    ColumnStart =41
                    ColumnEnd =41
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =22275
                    Width =1665
                    Height =315
                    FontSize =8
                    TabIndex =41
                    Name ="Especif Outra"
                    ControlSource ="Especif Outra"
                    EventProcPrefix ="Especif_Outra"
                    GridlineColor =10921638

                    LayoutCachedLeft =22275
                    LayoutCachedWidth =23940
                    LayoutCachedHeight =315
                    ColumnStart =42
                    ColumnEnd =42
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    IMESentenceMode =3
                    Left =23940
                    Width =2220
                    Height =315
                    FontSize =8
                    TabIndex =42
                    Name ="OBS"
                    ControlSource ="OBS"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =23940
                    LayoutCachedWidth =26160
                    LayoutCachedHeight =315
                    ColumnStart =43
                    ColumnEnd =43
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =990
                    Width =3330
                    Height =315
                    ColumnWidth =3945
                    FontSize =8
                    TabIndex =43
                    Name ="TbAtend.Nome"
                    ControlSource ="TbPessoa.Nome"
                    EventProcPrefix ="TbAtend_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =990
                    LayoutCachedWidth =4320
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Width =990
                    Height =315
                    FontSize =8
                    TabIndex =44
                    ForeColor =4210752
                    Name ="Data"
                    ControlSource ="Data"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedWidth =990
                    LayoutCachedHeight =315
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
            Name ="RodapéDoGrupo1"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4695
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    Name ="AccessTotalsAtRemoto"
                    ControlSource ="=-Sum([AtRemoto])"
                    ControlTipText ="AtRemoto Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =4695
                    LayoutCachedWidth =5070
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4320
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =1
                    Name ="AccessTotalsAcolhidaPartic"
                    ControlSource ="=-Sum([AcolhidaPartic])"
                    ControlTipText ="AcolhidaPartic Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =4320
                    LayoutCachedWidth =4695
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5070
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =2
                    Name ="AccessTotalsAcoremoto"
                    ControlSource ="=-Sum([Acoremoto])"
                    ControlTipText ="Acoremoto Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =5070
                    LayoutCachedWidth =5445
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5445
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =3
                    Name ="AccessTotalsVolante"
                    ControlSource ="=-Sum([Volante])"
                    ControlTipText ="Volante Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =5445
                    LayoutCachedWidth =5820
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =5805
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =4
                    Name ="AccessTotalsVD"
                    ControlSource ="=-Sum([VD])"
                    ControlTipText ="VD Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =5805
                    LayoutCachedWidth =6180
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6180
                    Width =450
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =5
                    Name ="AccessTotalsESTUDO SOCIAL"
                    ControlSource ="=-Sum([ESTUDO SOCIAL])"
                    EventProcPrefix ="AccessTotalsESTUDO_SOCIAL"
                    ControlTipText ="ESTUDO SOCIAL Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =6180
                    LayoutCachedWidth =6630
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6630
                    Width =420
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =6
                    Name ="AccessTotalsAcolhida Coletiva"
                    ControlSource ="=-Sum([Acolhida Coletiva])"
                    EventProcPrefix ="AccessTotalsAcolhida_Coletiva"
                    ControlTipText ="Acolhida Coletiva Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =6630
                    LayoutCachedWidth =7050
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7050
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =7
                    Name ="AccessTotalsART INSTITUC"
                    ControlSource ="=-Sum([ART INSTITUC])"
                    EventProcPrefix ="AccessTotalsART_INSTITUC"
                    ControlTipText ="ART INSTITUC Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =7050
                    LayoutCachedWidth =7425
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7425
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =8
                    Name ="AccessTotalsRELATORIO"
                    ControlSource ="=-Sum([RELATORIO])"
                    ControlTipText ="RELATORIO Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =7425
                    LayoutCachedWidth =7800
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7800
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =9
                    Name ="AccessTotalsVDLFR"
                    ControlSource ="=-Sum([VDLFR])"
                    ControlTipText ="VDLFR Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =7800
                    LayoutCachedWidth =8175
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8175
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =10
                    Name ="AccessTotalsVDCDL"
                    ControlSource ="=-Sum([VDCDL])"
                    ControlTipText ="VDCDL Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =8175
                    LayoutCachedWidth =8550
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8550
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =11
                    Name ="AccessTotalsVDDCP"
                    ControlSource ="=-Sum([VDDCP])"
                    ControlTipText ="VDDCP Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =8550
                    LayoutCachedWidth =8925
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8925
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =12
                    Name ="AccessTotalsVDDPAF"
                    ControlSource ="=-Sum([VDDPAF])"
                    ControlTipText ="VDDPAF Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =8925
                    LayoutCachedWidth =9300
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9300
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =13
                    Name ="AccessTotalsVDAMF"
                    ControlSource ="=-Sum([VDAMF])"
                    ControlTipText ="VDAMF Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =9300
                    LayoutCachedWidth =9675
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =9675
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =14
                    Name ="AccessTotalsVDFVI"
                    ControlSource ="=-Sum([VDFVI])"
                    ControlTipText ="VDFVI Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =9675
                    LayoutCachedWidth =10050
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =10050
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =15
                    Name ="AccessTotalsVDAMD"
                    ControlSource ="=-Sum([VDAMD])"
                    ControlTipText ="VDAMD Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =10050
                    LayoutCachedWidth =10425
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =10425
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =16
                    Name ="AccessTotalsVDASF"
                    ControlSource ="=-Sum([VDASF])"
                    ControlTipText ="VDASF Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =10425
                    LayoutCachedWidth =10800
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =10800
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =17
                    Name ="AccessTotalsVDPBF"
                    ControlSource ="=-Sum([VDPBF])"
                    ControlTipText ="VDPBF Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =10800
                    LayoutCachedWidth =11175
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =11175
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =18
                    Name ="AccessTotalsVDSCFV"
                    ControlSource ="=-Sum([VDSCFV])"
                    ControlTipText ="VDSCFV Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =11175
                    LayoutCachedWidth =11550
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =11550
                    Width =375
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =19
                    Name ="AccessTotalsVDOUT"
                    ControlSource ="=-Sum([VDOUT])"
                    ControlTipText ="VDOUT Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =11550
                    LayoutCachedWidth =11925
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =12975
                    Width =525
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =20
                    Name ="AccessTotalsVD NAO LOCALIZADA"
                    ControlSource ="=-Sum([VD NAO LOCALIZADA])"
                    EventProcPrefix ="AccessTotalsVD_NAO_LOCALIZADA"
                    ControlTipText ="VD NAO LOCALIZADA Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =12975
                    LayoutCachedWidth =13500
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =13500
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =21
                    Name ="AccessTotalsAdministrativo"
                    ControlSource ="=-Sum([Administrativo])"
                    ControlTipText ="Administrativo Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =13500
                    LayoutCachedWidth =13905
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =13905
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =22
                    Name ="AccessTotalsSocial"
                    ControlSource ="=-Sum([Social])"
                    ControlTipText ="Social Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =13905
                    LayoutCachedWidth =14310
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =14310
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =23
                    Name ="AccessTotalsPsicologico"
                    ControlSource ="=-Sum([Psicologico])"
                    ControlTipText ="Psicologico Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =14310
                    LayoutCachedWidth =14715
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =14715
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =24
                    Name ="AccessTotalsMultidisciplinar"
                    ControlSource ="=-Sum([Multidisciplinar])"
                    ControlTipText ="Multidisciplinar Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =14715
                    LayoutCachedWidth =15120
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =15120
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =25
                    Name ="AccessTotalsOrientadorSoc"
                    ControlSource ="=-Sum([OrientadorSoc])"
                    ControlTipText ="OrientadorSoc Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =15120
                    LayoutCachedWidth =15525
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =15525
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =26
                    Name ="AccessTotalsAtGestao"
                    ControlSource ="=-Sum([AtGestao])"
                    ControlTipText ="AtGestao Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =15525
                    LayoutCachedWidth =15930
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =17010
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =27
                    Name ="AccessTotalsDemandaBPC"
                    ControlSource ="=-Sum([DemandaBPC])"
                    ControlTipText ="DemandaBPC Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =17010
                    LayoutCachedWidth =17415
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =17415
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =28
                    Name ="AccessTotalsDemandaINSS"
                    ControlSource ="=-Sum([DemandaINSS])"
                    ControlTipText ="DemandaINSS Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =17415
                    LayoutCachedWidth =17820
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =17820
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =29
                    Name ="AccessTotalsDemandaSCFV"
                    ControlSource ="=-Sum([DemandaSCFV])"
                    ControlTipText ="DemandaSCFV Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =17820
                    LayoutCachedWidth =18225
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =18210
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =30
                    Name ="AccessTotalsDemandaEduc"
                    ControlSource ="=-Sum([DemandaEduc])"
                    ControlTipText ="DemandaEduc Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =18210
                    LayoutCachedTop =5
                    LayoutCachedWidth =18615
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =18615
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =31
                    Name ="AccessTotalsDemandaSaude"
                    ControlSource ="=-Sum([DemandaSaude])"
                    ControlTipText ="DemandaSaude Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =18615
                    LayoutCachedTop =5
                    LayoutCachedWidth =19020
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =19020
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =32
                    Name ="AccessTotalsDemandaJustiça"
                    ControlSource ="=-Sum([DemandaJustiça])"
                    ControlTipText ="DemandaJustiça Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =19020
                    LayoutCachedTop =5
                    LayoutCachedWidth =19425
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =19425
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =33
                    Name ="AccessTotalsDemandaBenefMun"
                    ControlSource ="=-Sum([DemandaBenefMun])"
                    ControlTipText ="DemandaBenefMun Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =19425
                    LayoutCachedTop =5
                    LayoutCachedWidth =19830
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =19830
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =34
                    Name ="AccessTotalsDemandaAuxNatal"
                    ControlSource ="=-Sum([DemandaAuxNatal])"
                    ControlTipText ="DemandaAuxNatal Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =19830
                    LayoutCachedTop =5
                    LayoutCachedWidth =20235
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =20235
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =35
                    Name ="AccessTotalsDemandaGratTransp"
                    ControlSource ="=-Sum([DemandaGratTransp])"
                    ControlTipText ="DemandaGratTransp Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =20235
                    LayoutCachedTop =5
                    LayoutCachedWidth =20640
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =20640
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =36
                    Name ="AccessTotalsDemandaRecJus"
                    ControlSource ="=-Sum([DemandaRecJus])"
                    ControlTipText ="DemandaRecJus Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =20640
                    LayoutCachedTop =5
                    LayoutCachedWidth =21045
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =21045
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =37
                    Name ="AccessTotalsDemandaDocCivil"
                    ControlSource ="=-Sum([DemandaDocCivil])"
                    ControlTipText ="DemandaDocCivil Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =21045
                    LayoutCachedTop =5
                    LayoutCachedWidth =21450
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =21450
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =38
                    Name ="AccessTotalsDemandaApoioAlim"
                    ControlSource ="=-Sum([DemandaApoioAlim])"
                    ControlTipText ="DemandaApoioAlim Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =21450
                    LayoutCachedTop =5
                    LayoutCachedWidth =21855
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =21870
                    Top =5
                    Width =405
                    Height =315
                    FontSize =7
                    FontWeight =700
                    TabIndex =39
                    Name ="AccessTotalsOutra Demanda"
                    ControlSource ="=-Sum([Outra Demanda])"
                    EventProcPrefix ="AccessTotalsOutra_Demanda"
                    ControlTipText ="Outra Demanda Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =21870
                    LayoutCachedTop =5
                    LayoutCachedWidth =22275
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =990
                    Top =5
                    Width =3330
                    Height =315
                    FontSize =8
                    TabIndex =40
                    Name ="AccessTotalsTbAtend.Nome"
                    ControlSource ="=Count([TbPessoa].[Nome])"
                    EventProcPrefix ="AccessTotalsTbAtend_Nome"
                    ControlTipText ="TbPessoa.Nome Contagem de Valores"
                    GridlineColor =10921638

                    LayoutCachedLeft =990
                    LayoutCachedTop =5
                    LayoutCachedWidth =4320
                    LayoutCachedHeight =320
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
            End
        End
        Begin PageFooter
            Height =735
            Name ="PageFooterSection"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2324
                    Width =10206
                    Height =270
                    FontSize =10
                    FontWeight =700
                    BorderColor =10921638
                    Name ="DIRETOR(A)"
                    ControlSource ="DIRETOR(A)"
                    Format =">"
                    EventProcPrefix ="DIRETOR_A_"
                    GridlineColor =10921638

                    LayoutCachedLeft =2324
                    LayoutCachedWidth =12530
                    LayoutCachedHeight =270
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2324
                    Top =285
                    Width =10206
                    FontSize =8
                    TabIndex =1
                    BorderColor =10921638
                    Name ="FUNÇÃO"
                    ControlSource ="FUNÇÃO"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2324
                    LayoutCachedTop =285
                    LayoutCachedWidth =12530
                    LayoutCachedHeight =525
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =2324
                    Top =495
                    Width =10206
                    FontSize =8
                    TabIndex =2
                    BorderColor =10921638
                    Name ="MATRICULA"
                    ControlSource ="MATRICULA"
                    GridlineColor =10921638

                    LayoutCachedLeft =2324
                    LayoutCachedTop =495
                    LayoutCachedWidth =12530
                    LayoutCachedHeight =735
                    ForeTint =100.0
                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            Height =0
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
