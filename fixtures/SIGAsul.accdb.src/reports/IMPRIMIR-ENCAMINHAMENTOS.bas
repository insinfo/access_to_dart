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
    Width =11115
    DatasheetFontHeight =11
    ItemSuffix =210
    Left =3675
    Top =2970
    RecSrcDt = Begin
        0x7367b055bca6e540
    End
    RecordSource ="SELECT TbUnidade.NOME, TbUnidade.LOGO, TbUnidade.RODAPE FROM TbUnidade; "
    Caption ="CONSULTA PARTE TÉCNICA"
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
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
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
            Height =14229
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Label
                    Left =345
                    Top =1860
                    Width =10725
                    Height =4155
                    BorderColor =8355711
                    Name ="Rótulo197"
                    Caption ="\015\012Encaminhamento___________                                               "
                        "                        Data   _________/_________/__________\015\012Para_______"
                        "________________________________________________________________________________"
                        "____\015\012Endereço____________________________________________________________"
                        "___________________________\015\012Solicitação__________________________________"
                        "____________________________________________________\015\012\015\012Usuário_____"
                        "________________________________________________________________________________"
                        "___\015\012Endereço_____________________________________________________________"
                        "__________________________\015\012\015\012Observação____________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "________\015\012                                                                "
                        "                              \015\012                                          "
                        "                                                                                "
                        "\015\012"
                    GridlineColor =10921638
                    LayoutCachedLeft =345
                    LayoutCachedTop =1860
                    LayoutCachedWidth =11070
                    LayoutCachedHeight =6015
                    ForeTint =100.0
                End
                Begin Label
                    Left =225
                    Top =10492
                    Width =10830
                    Height =3585
                    BorderColor =8355711
                    Name ="Rótulo202"
                    Caption ="\015\012Encaminhamento________                                               Dat"
                        "a   _______/______/_________\015\012Usuário_____________________________________"
                        "_________________________________________________\015\012Responsável pelo atendi"
                        "mento____________________________________________________________________\015\012"
                        "Solicitação atendida     (    ) SIM           (    ) NÃO\015\012Justificar em ca"
                        "so da impossibilidade de atendimento:\015\012___________________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "________________________________________________________________________________"
                        "_____________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =225
                    LayoutCachedTop =10492
                    LayoutCachedWidth =11055
                    LayoutCachedHeight =14077
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =1140
                    Top =10087
                    Width =8895
                    Height =345
                    FontSize =13
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo203"
                    Caption ="CONTRA REFERÊNCIA"
                    GridlineColor =10921638
                    LayoutCachedLeft =1140
                    LayoutCachedTop =10087
                    LayoutCachedWidth =10035
                    LayoutCachedHeight =10432
                    ForeTint =100.0
                End
                Begin Label
                    Left =915
                    Top =8055
                    Width =10140
                    Height =285
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo204"
                    Caption ="------------------------------------------------------------recortar------------"
                        "-----------------------------------------------------"
                    GridlineColor =10921638
                    LayoutCachedLeft =915
                    LayoutCachedTop =8055
                    LayoutCachedWidth =11055
                    LayoutCachedHeight =8340
                End
                Begin Label
                    Left =4980
                    Top =6465
                    Width =5640
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo207"
                    Caption ="_____________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =4980
                    LayoutCachedTop =6465
                    LayoutCachedWidth =10620
                    LayoutCachedHeight =6750
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =4980
                    Top =6810
                    Width =5670
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo208"
                    Caption ="  Assinatura e carimbo"
                    GridlineColor =10921638
                    LayoutCachedLeft =4980
                    LayoutCachedTop =6810
                    LayoutCachedWidth =10650
                    LayoutCachedHeight =7095
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
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Top =8503
                    Width =5445
                    Height =1200
                    BorderColor =16777215
                    Name ="Anexo209"
                    ControlSource ="LOGO"
                    GridlineColor =10921638
                    TabIndex =1

                    LayoutCachedTop =8503
                    LayoutCachedWidth =5445
                    LayoutCachedHeight =9703
                    BorderShade =100.0
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
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
