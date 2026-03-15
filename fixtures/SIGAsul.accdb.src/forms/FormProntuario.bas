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
    Width =6576
    DatasheetFontHeight =11
    ItemSuffix =10
    Left =6840
    Top =2700
    Right =13410
    Bottom =5745
    RecSrcDt = Begin
        0xed71a571aafce540
    End
    Caption ="VIZUALIZAR PRONTUÁRIO"
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
        Begin Section
            Height =3061
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin CommandButton
                    OverlapFlags =85
                    Left =963
                    Top =1927
                    Width =2331
                    Height =463
                    TabIndex =1
                    Name ="BtVizualizar"
                    Caption ="Imprimir Prontuário"
                    OnClick ="[Event Procedure]"
                    LeftPadding =75
                    TopPadding =60
                    RightPadding =90
                    BottomPadding =105
                    GridlineColor =10921638

                    CursorOnHover =1
                    LayoutCachedLeft =963
                    LayoutCachedTop =1927
                    LayoutCachedWidth =3294
                    LayoutCachedHeight =2390
                    ForeTint =100.0
                    UseTheme =1
                    Bevel =1
                    Gradient =0
                    BackThemeColorIndex =9
                    BackTint =40.0
                    OldBorderStyle =0
                    BorderThemeColorIndex =5
                    BorderTint =100.0
                    HoverThemeColorIndex =9
                    HoverTint =40.0
                    PressedThemeColorIndex =9
                    PressedTint =40.0
                    HoverForeThemeColorIndex =0
                    PressedForeThemeColorIndex =0
                    QuickStyle =31
                    QuickStyleMask =-882
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =4425
                    Top =1927
                    Width =1191
                    Height =463
                    Name ="BtFechar"
                    Caption ="Fechar "
                    OnClick ="[Event Procedure]"
                    LeftPadding =75
                    TopPadding =60
                    RightPadding =90
                    BottomPadding =105
                    GridlineColor =10921638

                    CursorOnHover =1
                    LayoutCachedLeft =4425
                    LayoutCachedTop =1927
                    LayoutCachedWidth =5616
                    LayoutCachedHeight =2390
                    ForeTint =100.0
                    UseTheme =1
                    Bevel =1
                    Gradient =0
                    BackThemeColorIndex =9
                    BackTint =40.0
                    OldBorderStyle =0
                    BorderThemeColorIndex =5
                    BorderTint =100.0
                    HoverThemeColorIndex =9
                    HoverTint =40.0
                    PressedThemeColorIndex =9
                    PressedTint =40.0
                    HoverForeThemeColorIndex =0
                    PressedForeThemeColorIndex =0
                    QuickStyle =31
                    QuickStyleMask =-882
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =3341
                    Top =1927
                    Width =1026
                    Height =463
                    TabIndex =2
                    Name ="Comando6"
                    Caption ="Limpar"
                    OnClick ="[Event Procedure]"
                    LeftPadding =75
                    TopPadding =60
                    RightPadding =90
                    BottomPadding =105
                    GridlineColor =10921638

                    CursorOnHover =1
                    LayoutCachedLeft =3341
                    LayoutCachedTop =1927
                    LayoutCachedWidth =4367
                    LayoutCachedHeight =2390
                    ForeTint =100.0
                    UseTheme =1
                    Bevel =1
                    Gradient =0
                    BackThemeColorIndex =9
                    BackTint =40.0
                    OldBorderStyle =0
                    BorderThemeColorIndex =5
                    BorderTint =100.0
                    HoverThemeColorIndex =9
                    HoverTint =40.0
                    PressedThemeColorIndex =9
                    PressedTint =40.0
                    HoverForeThemeColorIndex =0
                    PressedForeThemeColorIndex =0
                    QuickStyle =31
                    QuickStyleMask =-882
                    Overlaps =1
                End
                Begin TextBox
                    OverlapFlags =85
                    TextAlign =1
                    IMESentenceMode =3
                    Left =2381
                    Top =1133
                    Height =315
                    FontWeight =700
                    TabIndex =3
                    BorderColor =10921638
                    Name ="CodFamTxt"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =2381
                    LayoutCachedTop =1133
                    LayoutCachedWidth =4082
                    LayoutCachedHeight =1448
                    ForeThemeColorIndex =5
                    ForeTint =100.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            TextAlign =2
                            Left =6
                            Top =516
                            Width =6525
                            Height =510
                            FontWeight =700
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo1"
                            Caption ="DIGITE O CÓD. FAMILIAR PARA IMPRIMIR TODO O PRONTUÁRIO:"
                            GridlineColor =10921638
                            LayoutCachedLeft =6
                            LayoutCachedTop =516
                            LayoutCachedWidth =6531
                            LayoutCachedHeight =1026
                        End
                    End
                End
            End
        End
    End
End
CodeBehindForm
' See "FormProntuario.cls"
