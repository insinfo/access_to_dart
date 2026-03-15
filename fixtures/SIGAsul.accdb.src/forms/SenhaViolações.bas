Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    RecordSelectors = NotDefault
    MaxButton = NotDefault
    MinButton = NotDefault
    ControlBox = NotDefault
    AutoCenter = NotDefault
    NavigationButtons = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =5839
    DatasheetFontHeight =11
    ItemSuffix =10
    Left =4125
    Top =2445
    Right =9960
    Bottom =5715
    RecSrcDt = Begin
        0x36b89aaa5927e540
    End
    Caption ="::CEAM::CENTRO ESPECIALIZADO DE ATENDIMENTO À MULHER"
    DatasheetFontName ="Calibri"
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
        Begin CommandButton
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
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
        Begin Section
            Height =3288
            BackColor =11594750
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2432
                    Top =1077
                    Width =2046
                    Height =300
                    FontWeight =700
                    BorderColor =10921638
                    ForeColor =8590273
                    Name ="txtSenha"
                    InputMask ="Password"
                    GridlineColor =10921638

                    LayoutCachedLeft =2432
                    LayoutCachedTop =1077
                    LayoutCachedWidth =4478
                    LayoutCachedHeight =1377
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =3
                            Left =1076
                            Top =1077
                            Width =1245
                            Height =315
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo3"
                            Caption ="Senha: "
                            GridlineColor =10921638
                            LayoutCachedLeft =1076
                            LayoutCachedTop =1077
                            LayoutCachedWidth =2321
                            LayoutCachedHeight =1392
                            ForeTint =100.0
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =2893
                    Top =1815
                    Width =1361
                    Height =453
                    FontWeight =700
                    TabIndex =2
                    Name ="btCancelar"
                    Caption ="Cancelar"
                    OnClick ="[Event Procedure]"
                    LeftPadding =105
                    TopPadding =60
                    RightPadding =120
                    BottomPadding =165
                    GridlineColor =10921638

                    CursorOnHover =1
                    LayoutCachedLeft =2893
                    LayoutCachedTop =1815
                    LayoutCachedWidth =4254
                    LayoutCachedHeight =2268
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    UseTheme =1
                    Shape =7
                    Bevel =1
                    Gradient =0
                    BackThemeColorIndex =0
                    BackTint =100.0
                    BorderThemeColorIndex =0
                    BorderTint =100.0
                    HoverThemeColorIndex =0
                    PressedThemeColorIndex =0
                    Shadow =-1
                    QuickStyle =36
                    QuickStyleMask =-50
                End
                Begin TextBox
                    Visible = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2834
                    Top =2835
                    Height =300
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="txtSenhaConf"
                    GridlineColor =10921638

                    LayoutCachedLeft =2834
                    LayoutCachedTop =2835
                    LayoutCachedWidth =4535
                    LayoutCachedHeight =3135
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =2
                    Top =345
                    Width =5775
                    Height =405
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo10"
                    Caption ="ÁREA RESTRITA. ENTRE COM A SENHA:"
                    GridlineColor =10921638
                    LayoutCachedTop =345
                    LayoutCachedWidth =5775
                    LayoutCachedHeight =750
                    ForeTint =100.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =1305
                    Top =1815
                    Width =1361
                    Height =453
                    FontWeight =700
                    TabIndex =1
                    Name ="Comando242"
                    Caption ="Login"
                    OnClick ="[Event Procedure]"
                    LeftPadding =105
                    TopPadding =60
                    RightPadding =120
                    BottomPadding =165
                    GridlineColor =10921638

                    CursorOnHover =1
                    LayoutCachedLeft =1305
                    LayoutCachedTop =1815
                    LayoutCachedWidth =2666
                    LayoutCachedHeight =2268
                    ForeThemeColorIndex =1
                    ForeTint =100.0
                    UseTheme =1
                    Shape =7
                    Bevel =1
                    Gradient =0
                    BackThemeColorIndex =0
                    BackTint =100.0
                    BorderThemeColorIndex =0
                    BorderTint =100.0
                    HoverThemeColorIndex =0
                    PressedThemeColorIndex =0
                    Shadow =-1
                    QuickStyle =36
                    QuickStyleMask =-50
                    Overlaps =1
                End
            End
        End
    End
End
CodeBehindForm
' See "SenhaViolações.cls"
