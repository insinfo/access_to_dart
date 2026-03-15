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
    Width =10735
    DatasheetFontHeight =11
    ItemSuffix =89
    Left =4725
    Top =2445
    RecSrcDt = Begin
        0x05ad72f4baa6e540
    End
    RecordSource ="SELECT TbGestante.CodGestante, TbUnidade.LOGO, TbUnidade.NOME, TbGestante.DataIn"
        "sc, TbGestante.Nome, TbGestante.Celular, TbGestDet.Código, TbGestDet.CodGestante"
        ", TbGestDet.DataCad, TbGestDet.DPP, TbGestDet.DPSaida, TbGestDet.[Kit enxoval], "
        "TbGestDet.[data entrega kit enxoval], TbGestDet.[Kit masc], TbGestDet.[Kit fem],"
        " TbGestDet.obs, TbGestDet.DataDesl, TbUnidade.NOME FROM TbUnidade, TbPessoa INNE"
        "R JOIN (TbGestante INNER JOIN TbGestDet ON TbGestante.CodGestante = TbGestDet.Co"
        "dGestante) ON TbPessoa.CodPessoa = TbGestante.Nome WHERE (((TbGestDet.DataDesl) "
        "Is Null)); "
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
            GridlineColor =-2147483609
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =50.0
        End
        Begin Rectangle
            BorderLineStyle =0
            Width =850
            Height =850
            GridlineColor =-2147483609
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
            GridlineColor =-2147483609
            BorderThemeColorIndex =0
        End
        Begin Image
            OldBorderStyle =0
            BorderLineStyle =0
            SizeMode =3
            PictureAlignment =2
            Width =1701
            Height =1701
            GridlineColor =-2147483609
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            GridlineColor =-2147483609
            ForeThemeColorIndex =0
            ForeTint =75.0
            UseTheme =1
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
        End
        Begin OptionButton
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            GridlineColor =-2147483609
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin CheckBox
            BorderLineStyle =0
            LabelX =230
            LabelY =-30
            GridlineColor =-2147483609
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin OptionGroup
            BorderLineStyle =0
            Width =1701
            Height =1701
            GridlineColor =-2147483609
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin BoundObjectFrame
            AddColon = NotDefault
            SizeMode =3
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
            GridlineColor =-2147483609
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
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
            GridlineColor =-2147483609
            ShowDatePicker =0
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
        End
        Begin ListBox
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            GridlineColor =-2147483609
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =0
            ForeTint =75.0
        End
        Begin ComboBox
            AddColon = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            GridlineColor =-2147483609
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
        End
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
            GridlineColor =-2147483609
        End
        Begin Chart
            OldBorderStyle =1
            Width =4536
            Height =2835
            GridlineColor =-2147483609
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
        End
        Begin UnboundObjectFrame
            OldBorderStyle =1
            Width =4536
            Height =2835
            GridlineColor =-2147483609
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =2
            ForeShade =50.0
        End
        Begin PageBreak
            Width =283
        End
        Begin CustomControl
            OldBorderStyle =1
            Width =4536
            Height =2835
            GridlineColor =-2147483609
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin ToggleButton
            Width =283
            Height =283
            GridlineColor =-2147483609
            ForeThemeColorIndex =0
            ForeTint =75.0
            UseTheme =1
            Shape =2
            Bevel =1
            BackColor =-1
            BackThemeColorIndex =4
            BackTint =60.0
            OldBorderStyle =0
            BorderLineStyle =0
            BorderColor =-1
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =1
        End
        Begin Tab
            Width =5103
            Height =3402
            FontSize =11
            FontName ="Calibri"
            GridlineColor =-2147483609
            ThemeFontIndex =0
            UseTheme =1
            Shape =3
            BackThemeColorIndex =1
            BackShade =85.0
            BorderLineStyle =0
            BorderThemeColorIndex =2
            BorderTint =60.0
            HoverThemeColorIndex =1
            PressedThemeColorIndex =1
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
            ForeThemeColorIndex =0
            ForeTint =75.0
        End
        Begin Page
            Width =1701
            Height =1701
            GridlineColor =-2147483609
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin Attachment
            BackStyle =0
            BorderLineStyle =0
            PictureSizeMode =3
            Width =1701
            Height =1701
            GridlineColor =-2147483609
            LabelX =-1701
            AddColon =0
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin EmptyCell
            Height =240
            GridlineColor =-2147483609
        End
        Begin WebBrowser
            OldBorderStyle =1
            Width =4536
            Height =2835
            GridlineColor =-2147483609
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
        End
        Begin NavigationControl
            BorderWidth =1
            BorderLineStyle =0
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            GridlineColor =-2147483609
        End
        Begin NavigationButton
            Width =283
            Height =283
            ForeColor =-2
            GridlineColor =-2147483609
            HoverColor =-2
            HoverThemeColorIndex =2
            HoverTint =20.0
            PressedColor =-2
            PressedThemeColorIndex =2
            PressedTint =60.0
            HoverForeColor =-2
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeColor =-2
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
            BackThemeColorIndex =1
            OldBorderStyle =0
            BorderLineStyle =0
            BorderThemeColorIndex =3
            BorderShade =90.0
            ThemeFontIndex =1
            FontName ="Calibri"
            FontWeight =400
            FontSize =11
            ForeThemeColorIndex =0
            ForeTint =75.0
        End
        Begin BreakLevel
            ControlSource ="DPSaida"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin PageHeader
            Height =2054
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =225
                    Top =1695
                    Width =1695
                    Height =329
                    FontSize =10
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    BackColor =10469818
                    ForeColor =0
                    Name ="Rótulo0"
                    Caption ="Data de Inscrição"
                    GroupTable =1
                    LayoutCachedLeft =225
                    LayoutCachedTop =1695
                    LayoutCachedWidth =1920
                    LayoutCachedHeight =2024
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =8550
                    Top =1695
                    Width =2010
                    Height =329
                    FontSize =10
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    BackColor =10469818
                    ForeColor =0
                    Name ="Rótulo1"
                    Caption ="Data Prevista da Saída"
                    GroupTable =1
                    LayoutCachedLeft =8550
                    LayoutCachedTop =1695
                    LayoutCachedWidth =10560
                    LayoutCachedHeight =2024
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =1980
                    Top =1695
                    Width =4410
                    Height =329
                    FontSize =10
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    BackColor =10469818
                    ForeColor =0
                    Name ="Rótulo2"
                    Caption ="Nome"
                    GroupTable =1
                    LayoutCachedLeft =1980
                    LayoutCachedTop =1695
                    LayoutCachedWidth =6390
                    LayoutCachedHeight =2024
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6450
                    Top =1695
                    Width =2038
                    Height =329
                    FontSize =10
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    BackColor =10469818
                    ForeColor =0
                    Name ="Rótulo4"
                    Caption ="Data Prevista do Parto"
                    GroupTable =1
                    LayoutCachedLeft =6450
                    LayoutCachedTop =1695
                    LayoutCachedWidth =8488
                    LayoutCachedHeight =2024
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    Left =5839
                    Top =623
                    Width =1050
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =0
                    Name ="Rótulo45"
                    Caption ="MÊS/ANO:"
                    LayoutCachedLeft =5839
                    LayoutCachedTop =623
                    LayoutCachedWidth =6889
                    LayoutCachedHeight =908
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =6979
                    Top =623
                    Width =1416
                    Height =285
                    ColumnOrder =0
                    FontWeight =700
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto113"
                    ControlSource ="@MÊS_ANO"

                    LayoutCachedLeft =6979
                    LayoutCachedTop =623
                    LayoutCachedWidth =8395
                    LayoutCachedHeight =908
                    GridlineThemeColorIndex =1
                    GridlineShade =65.0
                End
                Begin Label
                    TextAlign =2
                    Left =5215
                    Width =5520
                    Height =405
                    FontSize =13
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo68"
                    Caption =" GESTANTES COM DATA PREVISTA DE SAÍDA"
                    LayoutCachedLeft =5215
                    LayoutCachedWidth =10735
                    LayoutCachedHeight =405
                    GridlineThemeColorIndex =1
                    GridlineShade =65.0
                End
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Width =5445
                    Height =1200
                    BorderColor =16777215
                    Name ="LOGO"
                    ControlSource ="LOGO"
                    TabIndex =1

                    LayoutCachedWidth =5445
                    LayoutCachedHeight =1200
                    BorderShade =100.0
                    GridlineThemeColorIndex =1
                    GridlineShade =65.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =375
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =225
                    Top =30
                    Width =1695
                    Height =314
                    FontSize =9
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="DATA INSCRIÇÃO"
                    ControlSource ="DataInsc"
                    EventProcPrefix ="DATA_INSCRIÇÃO"
                    GroupTable =1
                    ShowDatePicker =1

                    LayoutCachedLeft =225
                    LayoutCachedTop =30
                    LayoutCachedWidth =1920
                    LayoutCachedHeight =344
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =8550
                    Top =30
                    Width =2010
                    Height =314
                    FontSize =9
                    FontWeight =700
                    TabIndex =3
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="DP SAÍDA"
                    ControlSource ="DPSaida"
                    EventProcPrefix ="DP_SAÍDA"
                    GroupTable =1
                    ShowDatePicker =1

                    LayoutCachedLeft =8550
                    LayoutCachedTop =30
                    LayoutCachedWidth =10560
                    LayoutCachedHeight =344
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    IMESentenceMode =3
                    ColumnCount =2
                    ListWidth =1440
                    Left =1980
                    Top =30
                    Width =4410
                    Height =314
                    ColumnWidth =2055
                    FontSize =9
                    FontWeight =700
                    TabIndex =1
                    Name ="TTULAR"
                    ControlSource ="TbGestante.NOME"
                    RowSourceType ="Table/Query"
                    ColumnWidths ="0;1440"
                    GroupTable =1
                    CanGrow =1
                    CanShrink =1
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22

                    LayoutCachedLeft =1980
                    LayoutCachedTop =30
                    LayoutCachedWidth =6390
                    LayoutCachedHeight =344
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                    GroupTable =1
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6450
                    Top =30
                    Width =2038
                    Height =314
                    FontSize =9
                    FontWeight =700
                    TabIndex =2
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="DPP"
                    ControlSource ="DPP"
                    GroupTable =1
                    ShowDatePicker =1

                    LayoutCachedLeft =6450
                    LayoutCachedTop =30
                    LayoutCachedWidth =8488
                    LayoutCachedHeight =344
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
            End
        End
        Begin PageFooter
            Height =315
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
                    Left =5102
                    Width =3600
                    Height =315
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto26"
                    ControlSource ="=\"Página \" & [Page] & \" de \" & [Pages]"

                    LayoutCachedLeft =5102
                    LayoutCachedWidth =8702
                    LayoutCachedHeight =315
                End
            End
        End
        Begin FormFooter
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            Height =540
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =1980
                    Top =195
                    Width =4410
                    Height =315
                    FontSize =9
                    FontWeight =700
                    LeftMargin =44
                    TopMargin =22
                    RightMargin =44
                    BottomMargin =22
                    Name ="AccessTotalsTTULAR"
                    ControlSource ="=Count([TbGestante.NOME])"
                    ControlTipText ="Nome Contagem de Valores"
                    GroupTable =1
                    GridlineStyleTop =1
                    GridlineWidthTop =2

                    LayoutCachedLeft =1980
                    LayoutCachedTop =195
                    LayoutCachedWidth =6390
                    LayoutCachedHeight =510
                    RowStart =2
                    RowEnd =2
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =225
                    Top =195
                    Width =1695
                    Height =315
                    Name ="CélulaVazia85"
                    GroupTable =1
                    LayoutCachedLeft =225
                    LayoutCachedTop =195
                    LayoutCachedWidth =1920
                    LayoutCachedHeight =510
                    RowStart =2
                    RowEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =6450
                    Top =195
                    Width =2038
                    Height =315
                    Name ="CélulaVazia87"
                    GroupTable =1
                    LayoutCachedLeft =6450
                    LayoutCachedTop =195
                    LayoutCachedWidth =8488
                    LayoutCachedHeight =510
                    RowStart =2
                    RowEnd =2
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    GroupTable =1
                End
                Begin EmptyCell
                    Left =8550
                    Top =195
                    Width =2010
                    Height =315
                    Name ="CélulaVazia88"
                    GroupTable =1
                    LayoutCachedLeft =8550
                    LayoutCachedTop =195
                    LayoutCachedWidth =10560
                    LayoutCachedHeight =510
                    RowStart =2
                    RowEnd =2
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    GroupTable =1
                End
            End
        End
    End
End
