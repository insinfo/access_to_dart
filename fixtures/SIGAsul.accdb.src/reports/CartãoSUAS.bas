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
    Width =11225
    DatasheetFontHeight =11
    ItemSuffix =17
    Left =4950
    Top =3045
    RecSrcDt = Begin
        0xf5cdc184c9f3e540
    End
    RecordSource ="csCARTÂOsuas"
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
        Begin BoundObjectFrame
            AddColon = NotDefault
            SizeMode =3
            BorderLineStyle =0
            Width =4536
            Height =2835
            LabelX =-1701
            BackThemeColorIndex =1
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
        Begin PageHeader
            Height =0
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin Section
            KeepTogether = NotDefault
            Height =3912
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Attachment
                    Width =11225
                    Height =3912
                    BorderColor =10921638
                    Name ="imgCartaoSuas"
                    ControlSource ="imgCartaoSuas"
                    GridlineColor =10921638
                    TabIndex =7

                    LayoutCachedWidth =11225
                    LayoutCachedHeight =3912
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =570
                    Top =2610
                    Width =4986
                    Height =315
                    FontSize =9
                    FontWeight =700
                    BorderColor =10921638
                    Name ="TbPessoa.Nome"
                    ControlSource ="TbPessoa.Nome"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    FontName ="Times New Roman"
                    EventProcPrefix ="TbPessoa_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =570
                    LayoutCachedTop =2610
                    LayoutCachedWidth =5556
                    LayoutCachedHeight =2925
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =7060
                    Top =1160
                    Width =3861
                    Height =300
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    Name ="TbUnidade.Nome"
                    ControlSource ="TbUnidade.Nome"
                    Format =">"
                    FontName ="Times New Roman"
                    EventProcPrefix ="TbUnidade_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =7060
                    LayoutCachedTop =1160
                    LayoutCachedWidth =10921
                    LayoutCachedHeight =1460
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =7755
                    Top =840
                    Width =3186
                    Height =300
                    FontWeight =700
                    TabIndex =2
                    BorderColor =10921638
                    Name ="CodFam"
                    ControlSource ="CodFam"
                    FontName ="Times New Roman"
                    GridlineColor =10921638

                    LayoutCachedLeft =7755
                    LayoutCachedTop =840
                    LayoutCachedWidth =10941
                    LayoutCachedHeight =1140
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =6750
                    Top =2130
                    Width =4191
                    Height =300
                    FontWeight =700
                    TabIndex =3
                    BorderColor =10921638
                    Name ="NIS"
                    ControlSource ="NIS"
                    FontName ="Times New Roman"
                    GridlineColor =10921638

                    LayoutCachedLeft =6750
                    LayoutCachedTop =2130
                    LayoutCachedWidth =10941
                    LayoutCachedHeight =2430
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin BoundObjectFrame
                    OldBorderStyle =0
                    BackStyle =0
                    Left =566
                    Top =2948
                    Width =3690
                    Height =855
                    TabIndex =4
                    BorderColor =10921638
                    Name ="CODBARRAS"
                    ControlSource ="CODBARRAS"
                    GridlineColor =10921638

                    LayoutCachedLeft =566
                    LayoutCachedTop =2948
                    LayoutCachedWidth =4256
                    LayoutCachedHeight =3803
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =7995
                    Top =1485
                    Height =300
                    FontWeight =700
                    TabIndex =5
                    BorderColor =10921638
                    Name ="CodCREAS"
                    ControlSource ="CodCREAS"
                    FontName ="Times New Roman"
                    GridlineColor =10921638

                    LayoutCachedLeft =7995
                    LayoutCachedTop =1485
                    LayoutCachedWidth =9696
                    LayoutCachedHeight =1785
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =18
                    BackStyle =0
                    IMESentenceMode =3
                    Left =7860
                    Top =1815
                    Height =300
                    FontWeight =700
                    TabIndex =6
                    BorderColor =10921638
                    Name ="CodCEAM"
                    ControlSource ="CodCEAM"
                    FontName ="Times New Roman"
                    GridlineColor =10921638

                    LayoutCachedLeft =7860
                    LayoutCachedTop =1815
                    LayoutCachedWidth =9561
                    LayoutCachedHeight =2115
                    ThemeFontIndex =-1
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
    End
End
