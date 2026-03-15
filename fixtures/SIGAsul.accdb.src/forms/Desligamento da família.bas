Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =9014
    DatasheetFontHeight =11
    ItemSuffix =9
    Left =5295
    Top =225
    Right =14850
    Bottom =3495
    RecSrcDt = Begin
        0x9ec0753aeaade540
    End
    DatasheetFontName ="Calibri"
    FilterOnLoad =0
    OnCloseEmMacro = Begin
        Version =196611
        ColumnsShown =0
        Begin
            Action ="OpenForm"
            Argument ="FrmCadGeral"
            Argument ="0"
            Argument =""
            Argument =""
            Argument ="-1"
            Argument ="0"
        End
        Begin
            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                "nterfaceMacro Event=\"OnClose\" xmlns=\"http://schemas.microsoft.com/office/acce"
                "ssservices/2009/11/application\"><Statements><Action Name=\"OpenForm\"><Argument"
                " Name=\"FormName\">FrmCadGeral</A"
        End
        Begin
            Comment ="_AXL:rgument></Action></Statements></UserInterfaceMacro>"
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
        Begin Section
            Height =3288
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    BackStyle =1
                    OverlapFlags =85
                    TextAlign =2
                    Left =165
                    Top =165
                    Width =8685
                    Height =315
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =2366701
                    Name ="Rótulo0"
                    Caption ="ATENÇÃO PARA O PROCEDIMENTO DE DESLIGAMENTO DO CÓDIGO FAMILIAR!"
                    GridlineColor =10921638
                    LayoutCachedLeft =165
                    LayoutCachedTop =165
                    LayoutCachedWidth =8850
                    LayoutCachedHeight =480
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =60
                    Top =690
                    Width =2580
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo1"
                    Caption ="1-Imprimir o prontuário 1.  "
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =690
                    LayoutCachedWidth =2640
                    LayoutCachedHeight =1005
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =60
                    Top =1020
                    Width =7770
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo2"
                    Caption ="2-Escrever à mão a data de desligamento e o motivo que se encontra na página 2. "
                        "    "
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =1020
                    LayoutCachedWidth =7830
                    LayoutCachedHeight =1335
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =60
                    Top =1350
                    Width =8953
                    Height =570
                    BorderColor =8355711
                    Name ="Rótulo3"
                    Caption ="3-Preencher no sistema a data de desligamento do código familiar e a mesma data "
                        "e motivo para toda a composição familiar."
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =1350
                    LayoutCachedWidth =9013
                    LayoutCachedHeight =1920
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OverlapFlags =85
                    TextAlign =1
                    Left =60
                    Top =1935
                    Width =8953
                    Height =675
                    BorderColor =8355711
                    Name ="Rótulo4"
                    Caption ="4-Caso algum membro da família permaneça no mesmo endereço ou permaneça no CRAS,"
                        " trocar a titularidade e colocar data de saída somente para o restante da compos"
                        "ição familiar."
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =1935
                    LayoutCachedWidth =9013
                    LayoutCachedHeight =2610
                    ForeTint =100.0
                End
                Begin CommandButton
                    OverlapFlags =85
                    Left =283
                    Top =2777
                    Width =3450
                    Height =405
                    ForeColor =4210752
                    Name ="Comando8"
                    Caption ="Consultar desligamentos realizados"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =0
                        Begin
                            Action ="OpenQuery"
                            Argument ="csDataDesligCodFamiliar"
                            Argument ="0"
                            Argument ="2"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"Comando8\" Event=\"OnClick\" xmlns=\"http://schemas.microsof"
                                "t.com/office/accessservices/2009/11/application\"><Statements><Action Name=\"Ope"
                                "nQuery\"><Argument Name=\"QueryNam"
                        End
                        Begin
                            Comment ="_AXL:e\">csDataDesligCodFamiliar</Argument><Argument Name=\"DataMode\">Read Only"
                                "</Argument></Action></Statements></UserInterfaceMacro>"
                        End
                    End

                    LayoutCachedLeft =283
                    LayoutCachedTop =2777
                    LayoutCachedWidth =3733
                    LayoutCachedHeight =3182
                    BackColor =14461583
                    BorderColor =14461583
                    HoverColor =15189940
                    PressedColor =9917743
                    HoverForeColor =4210752
                    PressedForeColor =4210752
                End
            End
        End
    End
End
