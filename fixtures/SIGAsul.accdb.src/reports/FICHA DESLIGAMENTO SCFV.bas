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
    Width =11129
    DatasheetFontHeight =11
    ItemSuffix =178
    Left =3675
    Top =2775
    RecSrcDt = Begin
        0xb9528026baa6e540
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
            Height =15675
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =3667
                    Top =1755
                    Width =3690
                    Height =330
                    FontSize =12
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo2"
                    Caption ="FICHA DE DESLIGAMENTO - SCFV"
                    FontName ="Cambria"
                    GridlineColor =10921638
                    LayoutCachedLeft =3667
                    LayoutCachedTop =1755
                    LayoutCachedWidth =7357
                    LayoutCachedHeight =2085
                    ThemeFontIndex =-1
                End
                Begin Label
                    TextAlign =2
                    Left =1133
                    Top =1247
                    Width =5025
                    Height =345
                    FontSize =12
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo160"
                    Caption ="CENTRO DE REFERÊNCIA DE ASSISTÊNCIA SOCIAL -"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =1133
                    LayoutCachedTop =1247
                    LayoutCachedWidth =6158
                    LayoutCachedHeight =1592
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    RowSourceTypeInt =1
                    OldBorderStyle =0
                    IMESentenceMode =3
                    ListWidth =1440
                    Left =6857
                    Top =1247
                    Width =3726
                    Height =345
                    FontSize =12
                    BorderColor =10921638
                    ForeColor =3484194
                    Name ="CRAS"
                    ControlSource ="NOME"
                    RowSourceType ="Value List"
                    ColumnWidths ="1441"
                    GridlineColor =10921638

                    LayoutCachedLeft =6857
                    LayoutCachedTop =1247
                    LayoutCachedWidth =10583
                    LayoutCachedHeight =1592
                    Begin
                        Begin Label
                            Left =6240
                            Top =1247
                            Width =585
                            Height =345
                            FontSize =12
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo112"
                            Caption ="CRAS"
                            GridlineColor =10921638
                            LayoutCachedLeft =6240
                            LayoutCachedTop =1247
                            LayoutCachedWidth =6825
                            LayoutCachedHeight =1592
                        End
                    End
                End
                Begin Label
                    Left =285
                    Top =2265
                    Width =3390
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo125"
                    Caption ="DATA: _______/_______/__________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =2265
                    LayoutCachedWidth =3675
                    LayoutCachedHeight =2550
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =2775
                    Width =10470
                    Height =315
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo126"
                    Caption ="USUÁRIO: _______________________________________________________________________"
                        "________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =2775
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =3090
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =4200
                    Width =10395
                    Height =315
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo127"
                    Caption ="DESCRIÇÃO SCFV: ________________________________________________________________"
                        "_________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =4200
                    LayoutCachedWidth =10680
                    LayoutCachedHeight =4515
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =285
                    Top =4695
                    Width =10605
                    Height =315
                    FontWeight =700
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="Rótulo128"
                    Caption ="MOTIVO: "
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =4695
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =5010
                    BackShade =75.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =570
                    Top =5145
                    Width =2850
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo129"
                    Caption ="(   ) MUDANÇA DO MUNICÍPIO "
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =5145
                    LayoutCachedWidth =3420
                    LayoutCachedHeight =5460
                    ForeTint =100.0
                End
                Begin Label
                    Left =570
                    Top =5580
                    Width =1755
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo130"
                    Caption ="(   ) FALECIMENTO "
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =5580
                    LayoutCachedWidth =2325
                    LayoutCachedHeight =5895
                    ForeTint =100.0
                End
                Begin Label
                    Left =570
                    Top =6015
                    Width =5865
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo131"
                    Caption ="(   ) SOLICITAÇÃO DE DESVINCULAÇÃO POR PARTE DO USUÁRIO "
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =6015
                    LayoutCachedWidth =6435
                    LayoutCachedHeight =6330
                    ForeTint =100.0
                End
                Begin Label
                    Left =570
                    Top =6450
                    Width =5595
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo132"
                    Caption ="(   ) FORA DAS FAIXAS ETÁRIAS ATENDIDAS PELO MUNICÍPIO "
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =6450
                    LayoutCachedWidth =6165
                    LayoutCachedHeight =6765
                    ForeTint =100.0
                End
                Begin Label
                    Left =570
                    Top =6885
                    Width =6555
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo133"
                    Caption ="(   ) AVALIAÇÃO DA EQUIPE TÉCNICA COM PARTICIPAÇÃO DO USUÁRIO "
                    GridlineColor =10921638
                    LayoutCachedLeft =570
                    LayoutCachedTop =6885
                    LayoutCachedWidth =7125
                    LayoutCachedHeight =7200
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =9135
                    Width =10485
                    Height =315
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo139"
                    Caption ="OBSERVAÇÃO: ____________________________________________________________________"
                        "__________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =9135
                    LayoutCachedWidth =10770
                    LayoutCachedHeight =9450
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =9630
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo140"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =9630
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =9915
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =10080
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo141"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =10080
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =10365
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =10530
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo142"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =10530
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =10815
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =10980
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo143"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =10980
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =11265
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =11430
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo144"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =11430
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =11715
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =11880
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo145"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =11880
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =12165
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =285
                    Top =13155
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo150"
                    Caption ="________________________________________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =13155
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =13440
                    ForeTint =100.0
                End
                Begin Label
                    Left =4140
                    Top =13485
                    Width =3705
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo157"
                    Caption ="Assinatura do responsável pelo usuário"
                    GridlineColor =10921638
                    LayoutCachedLeft =4140
                    LayoutCachedTop =13485
                    LayoutCachedWidth =7845
                    LayoutCachedHeight =13770
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =3210
                    Width =10470
                    Height =315
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo161"
                    Caption ="RESPONSÁVEL PELO USUÁRIO: ______________________________________________________"
                        "________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =3210
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =3525
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =3645
                    Width =10470
                    Height =315
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo162"
                    Caption ="CPF / RG: ______________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =3645
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =3960
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =60
                    Top =14295
                    Width =4860
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo163"
                    Caption ="______________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedTop =14295
                    LayoutCachedWidth =4920
                    LayoutCachedHeight =14580
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =45
                    Top =14625
                    Width =4875
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo164"
                    Caption ="TÉCNICO DE REFERÊNCIA"
                    GridlineColor =10921638
                    LayoutCachedLeft =45
                    LayoutCachedTop =14625
                    LayoutCachedWidth =4920
                    LayoutCachedHeight =14910
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =6120
                    Top =14295
                    Width =4845
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo165"
                    Caption ="______________________________________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =6120
                    LayoutCachedTop =14295
                    LayoutCachedWidth =10965
                    LayoutCachedHeight =14580
                    ForeTint =100.0
                End
                Begin Label
                    TextAlign =2
                    Left =6405
                    Top =14640
                    Width =3705
                    Height =285
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo166"
                    Caption ="DIREÇÃO"
                    GridlineColor =10921638
                    LayoutCachedLeft =6405
                    LayoutCachedTop =14640
                    LayoutCachedWidth =10110
                    LayoutCachedHeight =14925
                    ForeTint =100.0
                End
                Begin Label
                    Left =4140
                    Top =5160
                    Width =6390
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo167"
                    Caption ="(   ) MUDANÇA DE ENDEREÇO (PARA ABRANGÊNCIA DE OUTRO CRAS) "
                    GridlineColor =10921638
                    LayoutCachedLeft =4140
                    LayoutCachedTop =5160
                    LayoutCachedWidth =10530
                    LayoutCachedHeight =5475
                    ForeTint =100.0
                End
                Begin Label
                    Left =4140
                    Top =5610
                    Width =2535
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo168"
                    Caption ="(   ) ALTERAÇÃO DE GRUPO "
                    GridlineColor =10921638
                    LayoutCachedLeft =4140
                    LayoutCachedTop =5610
                    LayoutCachedWidth =6675
                    LayoutCachedHeight =5925
                    ForeTint =100.0
                End
                Begin Label
                    Left =6810
                    Top =5610
                    Width =3780
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo169"
                    Caption ="QUAL?_____________________________ "
                    GridlineColor =10921638
                    LayoutCachedLeft =6810
                    LayoutCachedTop =5610
                    LayoutCachedWidth =10590
                    LayoutCachedHeight =5925
                    ForeTint =100.0
                End
                Begin Label
                    BackStyle =1
                    Left =285
                    Top =7320
                    Width =10605
                    Height =315
                    FontWeight =700
                    BackColor =12566463
                    BorderColor =8355711
                    Name ="Rótulo170"
                    Caption ="USUÁRIO ENCAMINHADO A OUTRO SERVIÇO?"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =7320
                    LayoutCachedWidth =10890
                    LayoutCachedHeight =7635
                    BackShade =75.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =7755
                    Width =810
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo171"
                    Caption ="(   ) SIM "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =7755
                    LayoutCachedWidth =1320
                    LayoutCachedHeight =8070
                    ForeTint =100.0
                End
                Begin Label
                    Left =2895
                    Top =7755
                    Width =885
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo172"
                    Caption ="(   ) NÃO "
                    GridlineColor =10921638
                    LayoutCachedLeft =2895
                    LayoutCachedTop =7755
                    LayoutCachedWidth =3780
                    LayoutCachedHeight =8070
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =8190
                    Width =1485
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo173"
                    Caption ="SE SIM, QUAL?  "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =8190
                    LayoutCachedWidth =1995
                    LayoutCachedHeight =8505
                    ForeTint =100.0
                End
                Begin Label
                    Left =2085
                    Top =8220
                    Width =3450
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo174"
                    Caption ="(     ) ENCAMINHADO A OUTRO CRAS  "
                    GridlineColor =10921638
                    LayoutCachedLeft =2085
                    LayoutCachedTop =8220
                    LayoutCachedWidth =5535
                    LayoutCachedHeight =8535
                    ForeTint =100.0
                End
                Begin Label
                    Left =2085
                    Top =8655
                    Width =3450
                    Height =315
                    BorderColor =8355711
                    Name ="Rótulo175"
                    Caption ="(     ) ENCAMINHADO AO CREAS  "
                    GridlineColor =10921638
                    LayoutCachedLeft =2085
                    LayoutCachedTop =8655
                    LayoutCachedWidth =5535
                    LayoutCachedHeight =8970
                    ForeTint =100.0
                End
                Begin Label
                    Left =285
                    Top =12285
                    Width =10470
                    Height =285
                    BorderColor =8355711
                    Name ="Rótulo177"
                    Caption ="________________________________________________________________________________"
                        "___________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =285
                    LayoutCachedTop =12285
                    LayoutCachedWidth =10755
                    LayoutCachedHeight =12570
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
                    TabIndex =1

                    LayoutCachedWidth =5445
                    LayoutCachedHeight =1200
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
