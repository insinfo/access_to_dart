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
    ItemSuffix =512
    Left =4440
    Top =2505
    RecSrcDt = Begin
        0xa0444a76b3afe540
    End
    RecordSource ="SISC EXTERNO RELATORIO GERAL"
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
            GroupHeader = NotDefault
            KeepTogether =1
            ControlSource ="GRUPOEXT"
        End
        Begin BreakLevel
            ControlSource ="nomeusuario"
        End
        Begin PageHeader
            Height =1928
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    Left =5499
                    Width =4605
                    Height =315
                    LeftMargin =22
                    TopMargin =22
                    RightMargin =22
                    BottomMargin =22
                    BorderColor =8355711
                    Name ="Rótulo160"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL "
                    GridlineColor =-2147483609
                    LayoutCachedLeft =5499
                    LayoutCachedWidth =10104
                    LayoutCachedHeight =315
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Label
                    TextAlign =1
                    TextFontFamily =18
                    Top =1247
                    Width =1140
                    Height =405
                    FontSize =18
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo432"
                    Caption ="SISC"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedTop =1247
                    LayoutCachedWidth =1140
                    LayoutCachedHeight =1652
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin Label
                    Top =1644
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
                    LayoutCachedTop =1644
                    LayoutCachedWidth =6224
                    LayoutCachedHeight =1928
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =5901
                    Top =315
                    Width =3006
                    Height =315
                    FontSize =10
                    FontWeight =700
                    Name ="TbUnidade.UF"
                    ControlSource ="TbUnidade.UF"
                    Format =">"
                    EventProcPrefix ="TbUnidade_UF"
                    GridlineColor =10921638

                    LayoutCachedLeft =5901
                    LayoutCachedTop =315
                    LayoutCachedWidth =8907
                    LayoutCachedHeight =630
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =5505
                            Top =315
                            Width =390
                            Height =315
                            FontSize =10
                            Name ="Rótulo463"
                            Caption ="UF: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5505
                            LayoutCachedTop =315
                            LayoutCachedWidth =5895
                            LayoutCachedHeight =630
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =6636
                    Top =630
                    Width =2271
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    Name ="TbUnidade.MUNICIPIO"
                    ControlSource ="TbUnidade.MUNICIPIO"
                    EventProcPrefix ="TbUnidade_MUNICIPIO"
                    GridlineColor =10921638

                    LayoutCachedLeft =6636
                    LayoutCachedTop =630
                    LayoutCachedWidth =8907
                    LayoutCachedHeight =945
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =5505
                            Top =630
                            Width =1125
                            Height =315
                            FontSize =10
                            Name ="Rótulo464"
                            Caption ="MUNICIPIO: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5505
                            LayoutCachedTop =630
                            LayoutCachedWidth =6630
                            LayoutCachedHeight =945
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =6636
                    Top =1260
                    Width =2271
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    Name ="Nº UNIDADE"
                    ControlSource ="Nº UNIDADE"
                    EventProcPrefix ="Nº_UNIDADE"
                    GridlineColor =10921638

                    LayoutCachedLeft =6636
                    LayoutCachedTop =1260
                    LayoutCachedWidth =8907
                    LayoutCachedHeight =1575
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =5505
                            Top =1260
                            Width =1125
                            Height =315
                            FontSize =10
                            Name ="Rótulo465"
                            Caption ="ORDENAÇÃO: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5505
                            LayoutCachedTop =1260
                            LayoutCachedWidth =6630
                            LayoutCachedHeight =1575
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    IMESentenceMode =3
                    Left =6066
                    Top =945
                    Width =2841
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =3
                    Name ="Texto466"
                    ControlSource ="TbUnidade.NOME"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =6066
                    LayoutCachedTop =945
                    LayoutCachedWidth =8907
                    LayoutCachedHeight =1260
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            Left =5505
                            Top =945
                            Width =555
                            Height =315
                            FontSize =10
                            Name ="Rótulo467"
                            Caption ="CRAS: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5505
                            LayoutCachedTop =945
                            LayoutCachedWidth =6060
                            LayoutCachedHeight =1260
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
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
                    TabIndex =4

                    LayoutCachedWidth =5445
                    LayoutCachedHeight =1200
                    BorderShade =100.0
                End
            End
        End
        Begin BreakHeader
            KeepTogether = NotDefault
            CanGrow = NotDefault
            CanShrink = NotDefault
            RepeatSection = NotDefault
            Height =1080
            Name ="CabeçalhoDoGrupo0"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =85.0
            BackThemeColorIndex =1
            BackShade =85.0
            Begin
                Begin ComboBox
                    LimitToList = NotDefault
                    OldBorderStyle =0
                    TextFontFamily =18
                    IMESentenceMode =3
                    ColumnCount =4
                    ListWidth =1441
                    Left =919
                    Width =5316
                    Height =315
                    FontSize =10
                    FontWeight =700
                    BackColor =14277081
                    BorderColor =10921638
                    ForeColor =2366701
                    Name ="GRUPOEXT"
                    ControlSource ="GRUPOEXT"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT TbGrupoExterno.CodGrupo, TbGrupoExterno.NomeGrupo, TbGrupoExterno.FxEtari"
                        "aGr, TbGrupoExterno.Turno FROM TbGrupoExterno ORDER BY TbGrupoExterno.[NomeGrupo"
                        "]; "
                    ColumnWidths ="0;3402;1422;1422"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =919
                    LayoutCachedWidth =6235
                    LayoutCachedHeight =315
                    ThemeFontIndex =-1
                    BackShade =85.0
                    ForeThemeColorIndex =-1
                    ForeShade =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            TextFontFamily =18
                            Width =913
                            Height =315
                            FontSize =10
                            BackColor =14277081
                            BorderColor =8355711
                            ForeColor =2366701
                            Name ="Rótulo478"
                            Caption ="GRUPO: "
                            FontName ="Cambria"
                            GridlineColor =10921638
                            LayoutCachedWidth =913
                            LayoutCachedHeight =315
                            ThemeFontIndex =-1
                            BackShade =85.0
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =7716
                    Width =1926
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    BackColor =14277081
                    BorderColor =10921638
                    ForeColor =2366701
                    Name ="FXETARIA"
                    ControlSource ="FXETARIA"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =7716
                    LayoutCachedWidth =9642
                    LayoutCachedHeight =315
                    BackShade =85.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            TextFontFamily =18
                            Left =6240
                            Width =1485
                            Height =315
                            FontSize =10
                            BackColor =14277081
                            BorderColor =8355711
                            ForeColor =2366701
                            Name ="Rótulo479"
                            Caption ="FAIXA ETARIA:  "
                            FontName ="Cambria"
                            GridlineColor =10921638
                            LayoutCachedLeft =6240
                            LayoutCachedWidth =7725
                            LayoutCachedHeight =315
                            ThemeFontIndex =-1
                            BackShade =85.0
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                        End
                    End
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =120
                    Top =330
                    Width =2145
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo480"
                    Caption ="NOME"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =120
                    LayoutCachedTop =330
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =2265
                    Top =330
                    Width =840
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo481"
                    Caption ="DNasc"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =2265
                    LayoutCachedTop =330
                    LayoutCachedWidth =3105
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =3105
                    Top =330
                    Width =585
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo482"
                    Caption ="Idade"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3105
                    LayoutCachedTop =330
                    LayoutCachedWidth =3690
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =3689
                    Top =330
                    Width =570
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo483"
                    Caption ="Sexo"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3689
                    LayoutCachedTop =330
                    LayoutCachedWidth =4259
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =4256
                    Top =330
                    Width =570
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo484"
                    Caption ="Raça/Cor"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =4256
                    LayoutCachedTop =330
                    LayoutCachedWidth =4826
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =4830
                    Top =330
                    Width =960
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo485"
                    Caption ="MunicNasc"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =4830
                    LayoutCachedTop =330
                    LayoutCachedWidth =5790
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =5790
                    Top =330
                    Width =570
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo486"
                    Caption ="UFNasc"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =5790
                    LayoutCachedTop =330
                    LayoutCachedWidth =6360
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =6360
                    Top =330
                    Width =570
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo487"
                    Caption ="RG"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =6360
                    LayoutCachedTop =330
                    LayoutCachedWidth =6930
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =6927
                    Top =330
                    Width =570
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo488"
                    Caption ="OrgaoRG"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =6927
                    LayoutCachedTop =330
                    LayoutCachedWidth =7497
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =7485
                    Top =330
                    Width =870
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo489"
                    Caption ="Data Emissão RG"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =7485
                    LayoutCachedTop =330
                    LayoutCachedWidth =8355
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =8336
                    Top =330
                    Width =1140
                    Height =750
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo490"
                    Caption ="Endereço"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =8336
                    LayoutCachedTop =330
                    LayoutCachedWidth =9476
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =9473
                    Top =330
                    Width =570
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo491"
                    Caption ="Complemento"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =9473
                    LayoutCachedTop =330
                    LayoutCachedWidth =10043
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =10043
                    Top =330
                    Width =900
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo492"
                    Caption ="Bairro"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =10043
                    LayoutCachedTop =330
                    LayoutCachedWidth =10943
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =10946
                    Top =330
                    Width =570
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo493"
                    Caption ="CEP"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =10946
                    LayoutCachedTop =330
                    LayoutCachedWidth =11516
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =11523
                    Top =330
                    Width =1110
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo496"
                    Caption ="Nome da mãe"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =11523
                    LayoutCachedTop =330
                    LayoutCachedWidth =12633
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =12633
                    Top =330
                    Width =975
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo497"
                    Caption ="Nome Respons Criança"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =12633
                    LayoutCachedTop =330
                    LayoutCachedWidth =13608
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =13605
                    Top =330
                    Width =855
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo498"
                    Caption ="CPF Responsável"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =13605
                    LayoutCachedTop =330
                    LayoutCachedWidth =14460
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =14460
                    Top =330
                    Width =735
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo499"
                    Caption ="Cel Responsável"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =14460
                    LayoutCachedTop =330
                    LayoutCachedWidth =15195
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    TextAlign =2
                    TextFontFamily =18
                    Left =15200
                    Top =330
                    Width =900
                    Height =750
                    FontSize =9
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo501"
                    Caption ="Situação do Usuario"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =15200
                    LayoutCachedTop =330
                    LayoutCachedWidth =16100
                    LayoutCachedHeight =1080
                    ThemeFontIndex =-1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =10204
                    Height =315
                    ColumnWidth =1005
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    BackColor =14277081
                    BorderColor =10921638
                    ForeColor =2366701
                    Name ="TURNO"
                    ControlSource ="TURNO"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =10204
                    LayoutCachedWidth =11905
                    LayoutCachedHeight =315
                    BackShade =85.0
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =735
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =120
                    Width =2145
                    Height =735
                    ColumnWidth =2895
                    FontSize =8
                    Name ="SISC SCFV EXTERNO.NOME"
                    ControlSource ="nomeusuario"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    FontName ="Cambria"
                    EventProcPrefix ="SISC_SCFV_EXTERNO_NOME"
                    GridlineColor =10921638

                    LayoutCachedLeft =120
                    LayoutCachedWidth =2265
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =2265
                    Width =840
                    Height =735
                    ColumnWidth =1200
                    FontSize =8
                    TabIndex =1
                    Name ="DNasc"
                    ControlSource ="dnascusuario"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =2265
                    LayoutCachedWidth =3105
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =3105
                    Width =585
                    Height =735
                    ColumnWidth =1200
                    FontSize =8
                    TabIndex =2
                    Name ="Idade"
                    ControlSource ="IdadeUsuario"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =3105
                    LayoutCachedWidth =3690
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    ListWidth =2700
                    Left =3689
                    Width =570
                    Height =735
                    FontSize =8
                    TabIndex =3
                    Name ="Sexo"
                    ControlSource ="Sexo"
                    RowSourceType ="Value List"
                    RowSource ="\"M\";\"F\";\"Trans\""
                    ColumnWidths ="2700"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =3689
                    LayoutCachedWidth =4259
                    LayoutCachedHeight =735
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    ListWidth =2625
                    Left =4256
                    Width =570
                    Height =735
                    FontSize =8
                    TabIndex =4
                    Name ="Raça/Cor"
                    ControlSource ="Raça/Cor"
                    RowSourceType ="Value List"
                    RowSource ="\"BRANCA\";\"PRETA\";\"AMARELA\";\"PARDA\";\"INDIGENA\""
                    ColumnWidths ="2625"
                    FontName ="Cambria"
                    EventProcPrefix ="Raça_Cor"
                    Format =">"
                    GridlineColor =10921638
                    AllowValueListEdits =0

                    LayoutCachedLeft =4256
                    LayoutCachedWidth =4826
                    LayoutCachedHeight =735
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =4830
                    Width =960
                    Height =735
                    FontSize =8
                    TabIndex =5
                    Name ="MunicNasc"
                    ControlSource ="MunicNasc"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =4830
                    LayoutCachedWidth =5790
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin ComboBox
                    RowSourceTypeInt =1
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    ListWidth =1444
                    Left =5790
                    Width =570
                    Height =735
                    FontSize =8
                    TabIndex =6
                    Name ="UFNasc"
                    ControlSource ="UFNasc"
                    RowSourceType ="Value List"
                    RowSource ="\"AC\";\"AL\";\"AP\";\"AM\";\"BA\";\"CE\";\"DF\";\"ES\";\"GO\";\"MA\";\"MT\";\"M"
                        "S\";\"MG\";\"PA \";\"PB\";\"PR\";\"PE\";\"PI\";\"RJ\";\"RN\";\"RS\";\"RO\";\"RR\""
                        ";\"SC\";\"SP\";\"SE\";\"TO\""
                    ColumnWidths ="1444"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =5790
                    LayoutCachedWidth =6360
                    LayoutCachedHeight =735
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =6929
                    Width =570
                    Height =735
                    FontSize =8
                    TabIndex =7
                    Name ="OrgaoRG"
                    ControlSource ="OrgaoRG"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =6929
                    LayoutCachedWidth =7499
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =7485
                    Width =870
                    Height =735
                    FontSize =8
                    TabIndex =8
                    Name ="DEmisRG"
                    ControlSource ="DEmisRG"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =7485
                    LayoutCachedWidth =8355
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =8336
                    Width =1140
                    Height =735
                    FontSize =7
                    TabIndex =9
                    Name ="Endereço"
                    ControlSource ="Endereço"
                    Format =">"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =8336
                    LayoutCachedWidth =9476
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =9471
                    Width =570
                    Height =735
                    FontSize =8
                    TabIndex =10
                    Name ="Complemento"
                    ControlSource ="Complemento"
                    Format =">"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =9471
                    LayoutCachedWidth =10041
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    ListWidth =1441
                    Left =10038
                    Width =900
                    Height =735
                    FontSize =8
                    TabIndex =11
                    Name ="Bairro"
                    ControlSource ="Bairro"
                    RowSourceType ="Value List"
                    RowSource ="\"Ancora\";\"Atlântica\";\"Balneário das Garças\";\"Balneário Remanso\";\"Boca d"
                        "a Barra\";\"Bosque d`areia\";\"Bosque da Praia\";\"Cantagalo\";\"Cantinho do Mar"
                        "\";\"Casa Grande\";\"Claudio Ribeiro\";\"Centro\";\"Cidade Beira Mar\";\"Cidade "
                        "Praiana\";\"Colinas\";\"Condomínio Beira Rio\";\"Condomínio Maria Turri\";\"Cond"
                        "omínio Porto Seguro\";\"Costazul\";\"Enseada das Gaivotas\";\"Extensão do bosque"
                        "\";\"Extensão Novo Rio das Ostras\";\"Extensão Serramar\";\"Floresta\";\"Gelson "
                        "Apicelo\";\"Jardim Bela Vista\";\"Jardim Campomar \";\"Jardim Mariléa\";\"Jardim"
                        " Miramar\";\"Jardim Patrícia\";\"Liberdade\";\"Mar do Norte\";\"Mar y Lago\";\"M"
                        "ariléa Chácara\";\"Nova Aliança\";\"Nova Cidade\";\"Nova Esperança\";\"Novo Rio "
                        "das Ostras\";\"Operário\";\"Ouro Verde\";\"Palmital\";\"Parque São Jorge\";\"Par"
                        "que Zabulão\";\"Peroba\";\"Praia Mar\";\"Recanto\";\"Recreio\";\"Reduto da Paz\""
                        ";\"Residencial Camping do Bosque\";\"Residencial Praia Âncora\";\"Residencial Ri"
                        "o das Ostras\";\"Rocha Leão\";\"São Cristóvão\";\"Serramar\";\"Sobradinho Cervej"
                        "a\";\"Terra Firme\";\"Verdes Mares\";\"Village Rio das Ostras\";\"Village Sol e "
                        "Mar\";\"Viverde\""
                    ColumnWidths ="1441"
                    FontName ="Cambria"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =10038
                    LayoutCachedWidth =10938
                    LayoutCachedHeight =735
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =10935
                    Width =585
                    Height =735
                    FontSize =8
                    TabIndex =12
                    Name ="CEP"
                    ControlSource ="CEP"
                    FontName ="Cambria"
                    InputMask ="00000\\-000;0;_"
                    GridlineColor =10921638

                    LayoutCachedLeft =10935
                    LayoutCachedWidth =11520
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =11523
                    Width =1110
                    Height =735
                    FontSize =8
                    TabIndex =13
                    Name ="NomeMae"
                    ControlSource ="NomeMae"
                    Format =">"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =11523
                    LayoutCachedWidth =12633
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =12633
                    Width =975
                    Height =735
                    FontSize =8
                    TabIndex =14
                    Name ="Nome Respons Criança"
                    ControlSource ="Nome Respons Criança"
                    FontName ="Cambria"
                    EventProcPrefix ="Nome_Respons_Criança"
                    GridlineColor =10921638

                    LayoutCachedLeft =12633
                    LayoutCachedWidth =13608
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =13606
                    Width =855
                    Height =735
                    FontSize =8
                    TabIndex =15
                    Name ="CPF Resp"
                    ControlSource ="CPF Resp"
                    FontName ="Cambria"
                    InputMask ="000,000,000\\-00;0;"
                    EventProcPrefix ="CPF_Resp"
                    GridlineColor =10921638

                    LayoutCachedLeft =13606
                    LayoutCachedWidth =14461
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    Left =14461
                    Width =735
                    Height =735
                    FontSize =8
                    TabIndex =16
                    Name ="Cel Resp"
                    ControlSource ="Cel Resp"
                    FontName ="Cambria"
                    InputMask ="!\\(99\") \"!00000\\-0000;0;_"
                    EventProcPrefix ="Cel_Resp"
                    GridlineColor =10921638

                    LayoutCachedLeft =14461
                    LayoutCachedWidth =15196
                    LayoutCachedHeight =735
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ThemeFontIndex =-1
                    ForeTint =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    TextAlign =2
                    TextFontFamily =18
                    IMESentenceMode =3
                    ListWidth =1442
                    Left =15195
                    Width =900
                    Height =735
                    FontSize =7
                    TabIndex =17
                    Name ="SituaçãoUsuario"
                    ControlSource ="SituaçãoUsuario"
                    RowSourceType ="Value List"
                    RowSource ="\"Não está em situação de prioridade\";\"Em situação de isolamento\";\"Trabalho "
                        "infantil\";\"Vivência de violência e/ou negligência\";\"Fora da escola defasagem"
                        " sup 2 anos\";\"Em situação de acolhimento\";\"Situação de abuso e/ou exploração"
                        " sexual\";\"Com medidas protetivas do ECA\";\"Crianças e adolescentes em situaçã"
                        "o de rua\";\"Vulnerabilidade de pessoa com deficiência\""
                    ColumnWidths ="1442"
                    FontName ="Cambria"
                    GridlineColor =10921638

                    LayoutCachedLeft =15195
                    LayoutCachedWidth =16095
                    LayoutCachedHeight =735
                    ThemeFontIndex =-1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =0
                    ForeShade =100.0
                End
                Begin TextBox
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6349
                    Width =570
                    Height =735
                    ColumnWidth =4305
                    FontSize =8
                    TabIndex =18
                    Name ="SISC SCFV EXTERNO GRUPOS.RG"
                    ControlSource ="RG"
                    EventProcPrefix ="SISC_SCFV_EXTERNO_GRUPOS_RG"
                    GridlineColor =10921638

                    LayoutCachedLeft =6349
                    LayoutCachedWidth =6919
                    LayoutCachedHeight =735
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
    End
End
