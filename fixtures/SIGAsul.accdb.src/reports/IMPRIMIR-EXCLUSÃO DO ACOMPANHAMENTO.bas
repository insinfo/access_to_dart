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
    Width =16040
    DatasheetFontHeight =11
    ItemSuffix =348
    Left =5280
    Top =2610
    RecSrcDt = Begin
        0x40d2305bbca6e540
    End
    RecordSource ="SELECT TbUnidade.NOME, TbUnidade.LOGO, TbUnidade.RODAPE FROM TbUnidade; "
    Caption ="Consulta Total Acompanhamento Coletivo"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    OnOpenEmMacro = Begin
        Version =196611
        ColumnsShown =0
        Begin
            Action ="Maximize"
        End
        Begin
            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                "nterfaceMacro Event=\"OnOpen\" xmlns=\"http://schemas.microsoft.com/office/acces"
                "sservices/2009/11/application\" xmlns:a=\"http://schemas.microsoft.com/office/ac"
                "cessservices/2009/11/forms\"><S"
        End
        Begin
            Comment ="_AXL:tatements><Action Name=\"MaximizeWindow\"/></Statements></UserInterfaceMacr"
                "o>"
        End
    End
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
        Begin EmptyCell
            Height =240
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
        End
        Begin PageHeader
            Height =1980
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =7426
                    Top =56
                    Width =5550
                    Height =465
                    FontSize =18
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo21"
                    Caption ="Exclusão do Acompanhamento"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =7426
                    LayoutCachedTop =56
                    LayoutCachedWidth =12976
                    LayoutCachedHeight =521
                    ThemeFontIndex =-1
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =1
                    Left =570
                    Top =1260
                    Width =10830
                    Height =345
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo109"
                    Caption ="TÉCNICO: "
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =1260
                    LayoutCachedWidth =11400
                    LayoutCachedHeight =1605
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =2265
                    Top =1605
                    Width =7950
                    Height =375
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo122"
                    Caption ="NOME E CÓDIGO FAMILIAR"
                    GridlineColor =10921638
                    LayoutCachedLeft =2265
                    LayoutCachedTop =1605
                    LayoutCachedWidth =10215
                    LayoutCachedHeight =1980
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =10200
                    Top =1605
                    Width =3405
                    Height =375
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo127"
                    Caption ="MOTIVO"
                    GridlineColor =10921638
                    LayoutCachedLeft =10200
                    LayoutCachedTop =1605
                    LayoutCachedWidth =13605
                    LayoutCachedHeight =1980
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =13610
                    Top =1605
                    Width =2430
                    Height =375
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo128"
                    Caption ="OBS"
                    GridlineColor =10921638
                    LayoutCachedLeft =13610
                    LayoutCachedTop =1605
                    LayoutCachedWidth =16040
                    LayoutCachedHeight =1980
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    Left =570
                    Top =1605
                    Width =1695
                    Height =375
                    FontWeight =700
                    BackColor =14675966
                    Name ="Rótulo126"
                    Caption ="DATA EXCLUSÃO"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =1605
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =1980
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Width =5445
                    Height =1200
                    BorderColor =16777215
                    Name ="LOGO"
                    ControlSource ="LOGO"
                    GridlineColor =10921638

                    LayoutCachedWidth =5445
                    LayoutCachedHeight =1200
                    BorderShade =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =7560
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Rectangle
                    Left =570
                    Width =1695
                    Height =1260
                    Name ="Caixa143"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =1260
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2265
                    Width =7950
                    Height =1260
                    Name ="Caixa146"
                    GridlineColor =10921638
                    LayoutCachedLeft =2265
                    LayoutCachedWidth =10215
                    LayoutCachedHeight =1260
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13605
                    Width =2415
                    Height =1260
                    Name ="Caixa149"
                    GridlineColor =10921638
                    LayoutCachedLeft =13605
                    LayoutCachedWidth =16020
                    LayoutCachedHeight =1260
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =10200
                    Width =3405
                    Height =1260
                    FontSize =6
                    FontWeight =700
                    Name ="Rótulo302"
                    Caption ="(     ) RECUSA DE ACOMPANHAMENTO\015\012(     ) DATA FINAL DO PAF\015\012(     )"
                        " SOLICITAÇÃO POR PARTE DO USUÁRIO\015\012(     ) ACOMPANHAMENTO PELO CREAS\015\012"
                        "(     ) MUDANÇA DE MUNICÍPIO\015\012(     ) FALECIMENTO\015\012(     ) MUDANÇA D"
                        "E TERRITÓRIO DENTRO DO MUNICÍPIO\015\012(     ) OUTRO - DESCREVA EM \"OBS\""
                    GridlineColor =10921638
                    LayoutCachedLeft =10200
                    LayoutCachedWidth =13605
                    LayoutCachedHeight =1260
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =570
                    Top =1260
                    Width =1695
                    Height =1260
                    Name ="Caixa318"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =1260
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =2520
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2265
                    Top =1260
                    Width =7950
                    Height =1260
                    Name ="Caixa319"
                    GridlineColor =10921638
                    LayoutCachedLeft =2265
                    LayoutCachedTop =1260
                    LayoutCachedWidth =10215
                    LayoutCachedHeight =2520
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13605
                    Top =1260
                    Width =2415
                    Height =1260
                    Name ="Caixa321"
                    GridlineColor =10921638
                    LayoutCachedLeft =13605
                    LayoutCachedTop =1260
                    LayoutCachedWidth =16020
                    LayoutCachedHeight =2520
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =10200
                    Top =1260
                    Width =3405
                    Height =1260
                    FontSize =6
                    FontWeight =700
                    Name ="Rótulo322"
                    Caption ="(     ) RECUSA DE ACOMPANHAMENTO\015\012(     ) DATA FINAL DO PAF\015\012(     )"
                        " SOLICITAÇÃO POR PARTE DO USUÁRIO\015\012(     ) ACOMPANHAMENTO PELO CREAS\015\012"
                        "(     ) MUDANÇA DE MUNICÍPIO\015\012(     ) FALECIMENTO\015\012(     ) MUDANÇA D"
                        "E TERRITÓRIO DENTRO DO MUNICÍPIO\015\012(     ) OUTRO - DESCREVA EM \"OBS\""
                    GridlineColor =10921638
                    LayoutCachedLeft =10200
                    LayoutCachedTop =1260
                    LayoutCachedWidth =13605
                    LayoutCachedHeight =2520
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =570
                    Top =2520
                    Width =1695
                    Height =1260
                    Name ="Caixa323"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =2520
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =3780
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2265
                    Top =2520
                    Width =7950
                    Height =1260
                    Name ="Caixa324"
                    GridlineColor =10921638
                    LayoutCachedLeft =2265
                    LayoutCachedTop =2520
                    LayoutCachedWidth =10215
                    LayoutCachedHeight =3780
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13605
                    Top =2520
                    Width =2415
                    Height =1260
                    Name ="Caixa326"
                    GridlineColor =10921638
                    LayoutCachedLeft =13605
                    LayoutCachedTop =2520
                    LayoutCachedWidth =16020
                    LayoutCachedHeight =3780
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =10200
                    Top =2520
                    Width =3405
                    Height =1260
                    FontSize =6
                    FontWeight =700
                    Name ="Rótulo327"
                    Caption ="(     ) RECUSA DE ACOMPANHAMENTO\015\012(     ) DATA FINAL DO PAF\015\012(     )"
                        " SOLICITAÇÃO POR PARTE DO USUÁRIO\015\012(     ) ACOMPANHAMENTO PELO CREAS\015\012"
                        "(     ) MUDANÇA DE MUNICÍPIO\015\012(     ) FALECIMENTO\015\012(     ) MUDANÇA D"
                        "E TERRITÓRIO DENTRO DO MUNICÍPIO\015\012(     ) OUTRO - DESCREVA EM \"OBS\""
                    GridlineColor =10921638
                    LayoutCachedLeft =10200
                    LayoutCachedTop =2520
                    LayoutCachedWidth =13605
                    LayoutCachedHeight =3780
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =570
                    Top =3780
                    Width =1695
                    Height =1260
                    Name ="Caixa328"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =3780
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =5040
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2265
                    Top =3780
                    Width =7950
                    Height =1260
                    Name ="Caixa329"
                    GridlineColor =10921638
                    LayoutCachedLeft =2265
                    LayoutCachedTop =3780
                    LayoutCachedWidth =10215
                    LayoutCachedHeight =5040
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13605
                    Top =3780
                    Width =2415
                    Height =1260
                    Name ="Caixa331"
                    GridlineColor =10921638
                    LayoutCachedLeft =13605
                    LayoutCachedTop =3780
                    LayoutCachedWidth =16020
                    LayoutCachedHeight =5040
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =10200
                    Top =3780
                    Width =3405
                    Height =1260
                    FontSize =6
                    FontWeight =700
                    Name ="Rótulo332"
                    Caption ="(     ) RECUSA DE ACOMPANHAMENTO\015\012(     ) DATA FINAL DO PAF\015\012(     )"
                        " SOLICITAÇÃO POR PARTE DO USUÁRIO\015\012(     ) ACOMPANHAMENTO PELO CREAS\015\012"
                        "(     ) MUDANÇA DE MUNICÍPIO\015\012(     ) FALECIMENTO\015\012(     ) MUDANÇA D"
                        "E TERRITÓRIO DENTRO DO MUNICÍPIO\015\012(     ) OUTRO - DESCREVA EM \"OBS\""
                    GridlineColor =10921638
                    LayoutCachedLeft =10200
                    LayoutCachedTop =3780
                    LayoutCachedWidth =13605
                    LayoutCachedHeight =5040
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =570
                    Top =5040
                    Width =1695
                    Height =1260
                    Name ="Caixa333"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =5040
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =6300
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2265
                    Top =5040
                    Width =7950
                    Height =1260
                    Name ="Caixa334"
                    GridlineColor =10921638
                    LayoutCachedLeft =2265
                    LayoutCachedTop =5040
                    LayoutCachedWidth =10215
                    LayoutCachedHeight =6300
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13605
                    Top =5040
                    Width =2415
                    Height =1260
                    Name ="Caixa336"
                    GridlineColor =10921638
                    LayoutCachedLeft =13605
                    LayoutCachedTop =5040
                    LayoutCachedWidth =16020
                    LayoutCachedHeight =6300
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =10200
                    Top =5040
                    Width =3405
                    Height =1260
                    FontSize =6
                    FontWeight =700
                    Name ="Rótulo337"
                    Caption ="(     ) RECUSA DE ACOMPANHAMENTO\015\012(     ) DATA FINAL DO PAF\015\012(     )"
                        " SOLICITAÇÃO POR PARTE DO USUÁRIO\015\012(     ) ACOMPANHAMENTO PELO CREAS\015\012"
                        "(     ) MUDANÇA DE MUNICÍPIO\015\012(     ) FALECIMENTO\015\012(     ) MUDANÇA D"
                        "E TERRITÓRIO DENTRO DO MUNICÍPIO\015\012(     ) OUTRO - DESCREVA EM \"OBS\""
                    GridlineColor =10921638
                    LayoutCachedLeft =10200
                    LayoutCachedTop =5040
                    LayoutCachedWidth =13605
                    LayoutCachedHeight =6300
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Rectangle
                    Left =570
                    Top =6300
                    Width =1695
                    Height =1260
                    Name ="Caixa338"
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =6300
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =7560
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =2265
                    Top =6300
                    Width =7950
                    Height =1260
                    Name ="Caixa339"
                    GridlineColor =10921638
                    LayoutCachedLeft =2265
                    LayoutCachedTop =6300
                    LayoutCachedWidth =10215
                    LayoutCachedHeight =7560
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Rectangle
                    Left =13605
                    Top =6300
                    Width =2415
                    Height =1260
                    Name ="Caixa341"
                    GridlineColor =10921638
                    LayoutCachedLeft =13605
                    LayoutCachedTop =6300
                    LayoutCachedWidth =16020
                    LayoutCachedHeight =7560
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =10200
                    Top =6300
                    Width =3405
                    Height =1260
                    FontSize =6
                    FontWeight =700
                    Name ="Rótulo342"
                    Caption ="(     ) RECUSA DE ACOMPANHAMENTO\015\012(     ) DATA FINAL DO PAF\015\012(     )"
                        " SOLICITAÇÃO POR PARTE DO USUÁRIO\015\012(     ) ACOMPANHAMENTO PELO CREAS\015\012"
                        "(     ) MUDANÇA DE MUNICÍPIO\015\012(     ) FALECIMENTO\015\012(     ) MUDANÇA D"
                        "E TERRITÓRIO DENTRO DO MUNICÍPIO\015\012(     ) OUTRO - DESCREVA EM \"OBS\""
                    GridlineColor =10921638
                    LayoutCachedLeft =10200
                    LayoutCachedTop =6300
                    LayoutCachedWidth =13605
                    LayoutCachedHeight =7560
                    BorderTint =100.0
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
            Height =0
            Name ="RodapéDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
