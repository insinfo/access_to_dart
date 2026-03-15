Version =20
VersionRequired =20
Begin Report
    LayoutForPrint = NotDefault
    PopUp = NotDefault
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    DateGrouping =1
    GrpKeepTogether =1
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =16100
    DatasheetFontHeight =11
    ItemSuffix =524
    Left =4440
    Top =2460
    RecSrcDt = Begin
        0x2d65cb4d90b0e540
    End
    RecordSource ="SISC exclusoes periodo"
    Caption ="FICHA GERAL DE INSCRIÇÃO SCFV"
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
        Begin Rectangle
            BorderLineStyle =0
            Width =850
            Height =850
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Line
            BorderLineStyle =0
            Width =1701
            BorderThemeColorIndex =0
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
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin UnboundObjectFrame
            OldBorderStyle =1
            Width =4536
            Height =2835
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
            ControlSource ="TbPessoa.NOME"
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
            Height =2185
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    Left =4809
                    Width =5670
                    Height =315
                    LeftMargin =22
                    TopMargin =22
                    RightMargin =22
                    BottomMargin =22
                    BorderColor =8355711
                    Name ="Rótulo160"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL "
                    GridlineColor =-2147483609
                    LayoutCachedLeft =4809
                    LayoutCachedWidth =10479
                    LayoutCachedHeight =315
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Top =1080
                    Width =1140
                    Height =405
                    FontSize =18
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo432"
                    Caption ="SISC"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedTop =1080
                    LayoutCachedWidth =1140
                    LayoutCachedHeight =1485
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    Top =1477
                    Width =6224
                    Height =284
                    FontSize =8
                    LeftMargin =22
                    TopMargin =22
                    RightMargin =22
                    BottomMargin =22
                    BorderColor =8355711
                    Name ="Rótulo433"
                    Caption ="SISTEMA DE INFORMAÇÕES DO SERVIÇO DE CONVIVÊNCIA E FORTALECIMENTO DE VÍNCULOS"
                    GridlineColor =-2147483609
                    LayoutCachedTop =1477
                    LayoutCachedWidth =6224
                    LayoutCachedHeight =1761
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Top =1870
                    Width =2616
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo516"
                    Caption ="NOME"
                    GridlineColor =10921638
                    LayoutCachedTop =1870
                    LayoutCachedWidth =2616
                    LayoutCachedHeight =2185
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =2612
                    Top =1870
                    Width =1701
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo517"
                    Caption ="DATA NASC"
                    GridlineColor =10921638
                    LayoutCachedLeft =2612
                    LayoutCachedTop =1870
                    LayoutCachedWidth =4313
                    LayoutCachedHeight =2185
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =4313
                    Top =1870
                    Width =1701
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo518"
                    Caption ="IDADE"
                    GridlineColor =10921638
                    LayoutCachedLeft =4313
                    LayoutCachedTop =1870
                    LayoutCachedWidth =6014
                    LayoutCachedHeight =2185
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =6014
                    Top =1870
                    Width =1701
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo519"
                    Caption ="NIS"
                    GridlineColor =10921638
                    LayoutCachedLeft =6014
                    LayoutCachedTop =1870
                    LayoutCachedWidth =7715
                    LayoutCachedHeight =2185
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =7715
                    Top =1870
                    Width =1701
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo515"
                    Caption ="DATA DESLIG"
                    GridlineColor =10921638
                    LayoutCachedLeft =7715
                    LayoutCachedTop =1870
                    LayoutCachedWidth =9416
                    LayoutCachedHeight =2185
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =9415
                    Top =1870
                    Width =1701
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo520"
                    Caption ="MOTIVO DESLIG"
                    GridlineColor =10921638
                    LayoutCachedLeft =9415
                    LayoutCachedTop =1870
                    LayoutCachedWidth =11116
                    LayoutCachedHeight =2185
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =11116
                    Top =1870
                    Width =1695
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo521"
                    Caption ="ENCAMINHADO"
                    GridlineColor =10921638
                    LayoutCachedLeft =11116
                    LayoutCachedTop =1870
                    LayoutCachedWidth =12811
                    LayoutCachedHeight =2185
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =12810
                    Top =1870
                    Width =3231
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo522"
                    Caption ="LOCAL ENCAMINHAMENTO"
                    GridlineColor =10921638
                    LayoutCachedLeft =12810
                    LayoutCachedTop =1870
                    LayoutCachedWidth =16041
                    LayoutCachedHeight =2185
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =3
                    Left =5490
                    Top =522
                    Width =960
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo108"
                    Caption ="PERÍODO: "
                    GridlineColor =10921638
                    LayoutCachedLeft =5490
                    LayoutCachedTop =522
                    LayoutCachedWidth =6450
                    LayoutCachedHeight =807
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =3
                    IMESentenceMode =3
                    Left =6570
                    Top =510
                    Width =1131
                    Height =315
                    FontWeight =700
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto113"
                    ControlSource ="@Data_Inicial datetime"
                    GridlineColor =10921638

                    LayoutCachedLeft =6570
                    LayoutCachedTop =510
                    LayoutCachedWidth =7701
                    LayoutCachedHeight =825
                End
                Begin Label
                    TextAlign =2
                    Left =7710
                    Top =510
                    Width =465
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo116"
                    Caption ="- "
                    GridlineColor =10921638
                    LayoutCachedLeft =7710
                    LayoutCachedTop =510
                    LayoutCachedWidth =8175
                    LayoutCachedHeight =795
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =8104
                    Top =522
                    Width =1821
                    Height =315
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto117"
                    ControlSource ="@Data_Final datetime"
                    GridlineColor =10921638

                    LayoutCachedLeft =8104
                    LayoutCachedTop =522
                    LayoutCachedWidth =9925
                    LayoutCachedHeight =837
                End
                Begin Image
                    PictureType =2
                    Width =4535
                    Height =1077
                    BorderColor =10921638
                    Name ="Imagem523"
                    Picture ="5_LOGO-SEMAS"
                    GridlineColor =10921638

                    LayoutCachedWidth =4535
                    LayoutCachedHeight =1077
                    TabIndex =2
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =315
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7715
                    Height =315
                    FontSize =9
                    Name ="DataDesl"
                    ControlSource ="DataDesl"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =7715
                    LayoutCachedWidth =9416
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Width =2616
                    Height =315
                    ColumnWidth =3180
                    FontSize =9
                    TabIndex =1
                    Name ="TbPessoa.NOME"
                    ControlSource ="TbPessoa.NOME"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    EventProcPrefix ="TbPessoa_NOME"
                    GridlineColor =10921638

                    LayoutCachedWidth =2616
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2612
                    Height =315
                    FontSize =9
                    TabIndex =2
                    Name ="DNasPessoa"
                    ControlSource ="DNasPessoa"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =2612
                    LayoutCachedWidth =4313
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4313
                    Height =315
                    FontSize =9
                    TabIndex =3
                    Name ="Idade"
                    ControlSource ="Idade"
                    GridlineColor =10921638

                    LayoutCachedLeft =4313
                    LayoutCachedWidth =6014
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6014
                    Height =315
                    FontSize =9
                    TabIndex =4
                    Name ="NIS"
                    ControlSource ="NIS"
                    GridlineColor =10921638

                    LayoutCachedLeft =6014
                    LayoutCachedWidth =7715
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    TextAlign =1
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =9415
                    Height =315
                    FontSize =9
                    TabIndex =5
                    Name ="MotivoDesl"
                    ControlSource ="MotivoDesl"
                    RowSourceType ="Value List"
                    RowSource ="\"MUDANÇA DE MUNICIPIO\";\"FALECIMENTO\";\"SOLICITAÇÃO POR PARTE DO USUARIO\";\""
                        "FORA DAS FX ETARIAS ATENDIDAS PELO MUNICIPIO\";\"AVALIAÇÃO TECNICA COM O USUARIO"
                        "\""
                    ColumnWidths ="1440"
                    GridlineColor =10921638

                    LayoutCachedLeft =9415
                    LayoutCachedWidth =11116
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin CheckBox
                    Left =11626
                    TabIndex =6
                    Name ="Encaminhado"
                    ControlSource ="Encaminhado"
                    GridlineColor =10921638

                    LayoutCachedLeft =11626
                    LayoutCachedWidth =11886
                    LayoutCachedHeight =240
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =12810
                    Width =3231
                    Height =315
                    FontSize =9
                    TabIndex =7
                    Name ="Onde"
                    ControlSource ="Onde"
                    GridlineColor =10921638

                    LayoutCachedLeft =12810
                    LayoutCachedWidth =16041
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
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
        Begin FormFooter
            KeepTogether = NotDefault
            Height =320
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =1
                    TextFontFamily =18
                    IMESentenceMode =3
                    Width =2610
                    Height =315
                    FontSize =8
                    Name ="AccessTotalsSISC SCFV EXTERNO.NOME1"
                    ControlSource ="=Count(*)"
                    FontName ="Cambria"
                    EventProcPrefix ="AccessTotalsSISC_SCFV_EXTERNO_NOME1"
                    ControlTipText ="Contagem de Registros"
                    GridlineColor =10921638

                    LayoutCachedWidth =2610
                    LayoutCachedHeight =315
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
            End
        End
    End
End
