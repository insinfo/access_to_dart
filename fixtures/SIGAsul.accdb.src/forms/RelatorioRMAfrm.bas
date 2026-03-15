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
    TabularCharSet =177
    TabularFamily =0
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =5782
    DatasheetFontHeight =11
    ItemSuffix =9
    Left =4800
    Top =4155
    Right =11130
    Bottom =6435
    RecSrcDt = Begin
        0x4e8d0ce1d3d2e440
    End
    Caption ="VISUALIZAR RELATÓRIO POR PERÍODO"
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    AfterUpdateEmMacro = Begin
        Version =196611
        ColumnsShown =0
        Begin
            Action ="GoToControl"
            Argument ="TxtDataInicial"
        End
        Begin
            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                "nterfaceMacro Event=\"AfterUpdate\" xmlns=\"http://schemas.microsoft.com/office/"
                "accessservices/2009/11/application\"><Statements><Action Name=\"GoToControl\"><A"
                "rgument Name=\"ControlName\">TxtD"
        End
        Begin
            Comment ="_AXL:ataInicial</Argument></Action></Statements></UserInterfaceMacro>"
        End
    End
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
        Begin Section
            Height =1490
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    TextFontCharSet =177
                    TextAlign =1
                    TextFontFamily =0
                    IMESentenceMode =3
                    Left =630
                    Top =400
                    Height =315
                    FontWeight =700
                    BorderColor =10921638
                    ForeColor =1643706
                    Name ="TxtDataInicial"
                    Format ="Short Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =630
                    LayoutCachedTop =400
                    LayoutCachedWidth =2331
                    LayoutCachedHeight =715
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextFontCharSet =177
                            TextFontFamily =0
                            Left =630
                            Top =60
                            Width =1701
                            Height =315
                            FontWeight =700
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo1"
                            Caption ="DATA INICIAL"
                            GridlineColor =10921638
                            LayoutCachedLeft =630
                            LayoutCachedTop =60
                            LayoutCachedWidth =2331
                            LayoutCachedHeight =375
                        End
                    End
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontCharSet =177
                    TextFontFamily =0
                    Left =1140
                    Top =960
                    Width =1191
                    Height =463
                    FontWeight =700
                    TabIndex =2
                    Name ="BtVizualizar"
                    Caption ="Visualizar"
                    OnClick ="[Event Procedure]"
                    LeftPadding =75
                    TopPadding =60
                    RightPadding =90
                    BottomPadding =105
                    GridlineColor =10921638
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272b700000000000000000000000000000000727272ffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7d7d7ff ,
                        0x727272ff00000000727272ffffffffffb3b3b3ffffffffffb3b3b3ffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0x727272ff00000000727272ffffffffffffffffff727272ffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0x727272ff00000000727272ffffffffffffffffff727272ffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0x727272ff00000000727272ffffffffffb3b3b3ffffffffffb3b3b3ffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0x727272ff00000000727272ffffffffffffffffff727272ffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0x727272ff00000000727272ffffffffffffffffff727272ffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0x727272ff00000000727272ffffffffffb3b3b3ffffffffffb3b3b3ffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0x727272ff00000000727272ffffffffffffffffff727272ffffffffffffffffff ,
                        0x90a468ff90a468ff90a468ff90a468ff90a468ff90a468ff90a468ffffffffff ,
                        0x727272ff00000000727272ffffffffffffffffff727272ffffffffffffffffff ,
                        0x90a468ff90a468ff90a468ff90a468ff90a468ff90a468ff90a468ffffffffff ,
                        0x727272ff00000000727272ffffffffffb3b3b3ffffffffffb3b3b3ffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0x727272ff00000000727272ffffffffffffffffff727272ffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffdbdbdbff ,
                        0x727272ff00000000727272ffffffffffffffffff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272bd00000000727272ffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000 ,
                        0x0000000000000000727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff0000000000000000 ,
                        0x0000000000000000
                    End
                    BackStyle =0

                    CursorOnHover =1
                    LayoutCachedLeft =1140
                    LayoutCachedTop =960
                    LayoutCachedWidth =2331
                    LayoutCachedHeight =1423
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    Bevel =1
                    Gradient =0
                    BackColor =13684166
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    OldBorderStyle =0
                    BorderColor =8156261
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    HoverColor =-2
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedColor =-2
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    QuickStyle =31
                    QuickStyleMask =-882
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontCharSet =177
                    TextFontFamily =0
                    Left =3465
                    Top =960
                    Width =1191
                    Height =463
                    FontWeight =700
                    TabIndex =3
                    Name ="BtFechar"
                    Caption ="Fechar "
                    OnClick ="[Event Procedure]"
                    LeftPadding =75
                    TopPadding =60
                    RightPadding =90
                    BottomPadding =105
                    GridlineColor =10921638
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000727272ff727272ff ,
                        0x00000000000000000000000000000000727272ff727272ff0000000000000000 ,
                        0x000000000000000000000000000000000000000000000000727272ff727272ff ,
                        0x727272ff0000000000000000727272ff727272ff727272ff0000000000000000 ,
                        0x00000000000000000000000000000000000000000000000000000000727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x727272ff727272ff727272ff727272ff00000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x727272ff727272ff727272ff727272ff00000000000000000000000000000000 ,
                        0x00000000000000000000000000000000000000000000000000000000727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000727272ff727272ff ,
                        0x727272ff0000000000000000727272ff727272ff727272ff0000000000000000 ,
                        0x000000000000000000000000000000000000000000000000727272ff727272ff ,
                        0x00000000000000000000000000000000727272ff727272ff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    BackStyle =0

                    CursorOnHover =1
                    LayoutCachedLeft =3465
                    LayoutCachedTop =960
                    LayoutCachedWidth =4656
                    LayoutCachedHeight =1423
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    Bevel =1
                    Gradient =0
                    BackColor =13684166
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    OldBorderStyle =0
                    BorderColor =8156261
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    HoverColor =-2
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedColor =-2
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    QuickStyle =31
                    QuickStyleMask =-882
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    TextFontCharSet =177
                    TextFontFamily =0
                    Left =2381
                    Top =963
                    Width =1026
                    Height =463
                    FontWeight =700
                    TabIndex =4
                    Name ="Comando6"
                    Caption ="Limpar"
                    OnClick ="[Event Procedure]"
                    LeftPadding =75
                    TopPadding =60
                    RightPadding =90
                    BottomPadding =105
                    GridlineColor =10921638
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000003255d6ab3255d65a0000000000000000000000000000000000000000 ,
                        0x3255d62d3255d693000000000000000000000000000000000000000000000000 ,
                        0x000000003255d6ae3255d6f93255d6360000000000000000000000003255d62d ,
                        0x3255d6db3255d61e000000000000000000000000000000000000000000000000 ,
                        0x000000003255d6153255d6db3255d6f03255d630000000003255d6303255d6ea ,
                        0x3255d66300000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000003255d61b3255d6c33255d6ed3255d66f3255d6ea3255d6ae ,
                        0x00000000000000000000000000000000000000000000000000000000727272ff ,
                        0x727272ff727272ff000000003255d6033255d6c63255d6ff3255d6de3255d60c ,
                        0x00000000000000000000000000000000000000000000000000000000727272ff ,
                        0x7272727e000000003255d6153255d6ab3255d6ff3255d6cf3255d6bd3255d696 ,
                        0x3255d609000000000000000000000000000000000000000000000000727272ff ,
                        0x000000003255d64e3255d6ed3255d6ff3255d6b73255d60c000000003255d645 ,
                        0x3255d6a53255d6420000000000000000000000000000000000000000727272ff ,
                        0x000000003255d6753255d6de3255d65a00000000000000000000000000000000 ,
                        0x000000003255d6270000000000000000000000000000000000000000727272ff ,
                        0x7272728100000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000007272726c727272ff ,
                        0x727272ff727272ff727272780000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000000000007272724e727272fc727272ff ,
                        0x727272ff727272ff727272ff7272725a00000000000000000000000000000000 ,
                        0x0000000000000000000000000000000072727236727272f6727272ff727272ff ,
                        0x727272ff727272ff727272ff727272f972727242000000000000000000000000 ,
                        0x00000000000000000000000072727224727272ea727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272f07272722d0000000000000000 ,
                        0x000000000000000000000000727272d2727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272e40000000000000000 ,
                        0x000000000000000000000000727272f0727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End
                    BackStyle =0

                    CursorOnHover =1
                    LayoutCachedLeft =2381
                    LayoutCachedTop =963
                    LayoutCachedWidth =3407
                    LayoutCachedHeight =1426
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    Bevel =1
                    Gradient =0
                    BackColor =13684166
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    OldBorderStyle =0
                    BorderColor =8156261
                    BorderThemeColorIndex =-1
                    BorderTint =100.0
                    HoverColor =-2
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedColor =-2
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    QuickStyle =31
                    QuickStyleMask =-882
                    Overlaps =1
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2437
                    Top =396
                    Height =315
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =1643706
                    Name ="TxtDataFinal"
                    Format ="Short Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =2437
                    LayoutCachedTop =396
                    LayoutCachedWidth =4138
                    LayoutCachedHeight =711
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =2437
                            Top =56
                            Width =1701
                            Height =315
                            FontWeight =700
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo8"
                            Caption ="DATA FINAL"
                            GridlineColor =10921638
                            LayoutCachedLeft =2437
                            LayoutCachedTop =56
                            LayoutCachedWidth =4138
                            LayoutCachedHeight =371
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "RelatorioRMAfrm.cls"
