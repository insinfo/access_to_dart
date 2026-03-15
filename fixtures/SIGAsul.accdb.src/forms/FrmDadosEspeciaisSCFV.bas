Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    AutoCenter = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    Cycle =1
    GridY =10
    Width =14241
    DatasheetFontHeight =11
    ItemSuffix =44
    Left =3495
    Top =2385
    Right =18270
    Bottom =10635
    RecSrcDt = Begin
        0x8ef993c3ba84e540
    End
    RecordSource ="TbDadosPessoaisSCFV"
    Caption ="DADOS ESPECIAIS - SCFV"
    OnClose ="[Event Procedure]"
    DatasheetFontName ="Calibri"
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
        Begin Rectangle
            SpecialEffect =3
            BackStyle =0
            BorderLineStyle =0
            Width =850
            Height =850
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Image
            BackStyle =0
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
            BorderThemeColorIndex =1
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            BorderShade =65.0
            ShowPageHeaderAndPageFooter =1
        End
        Begin FormHeader
            Height =1530
            Name ="CabeçalhoDoFormulário"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            Begin
                Begin Label
                    BackStyle =1
                    OverlapFlags =93
                    Left =90
                    Top =630
                    Width =6000
                    Height =900
                    FontSize =8
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo679"
                    Caption ="IMPRIMIR"
                    FontName ="MS Sans Serif"
                    GridlineColor =10921638
                    LayoutCachedLeft =90
                    LayoutCachedTop =630
                    LayoutCachedWidth =6090
                    LayoutCachedHeight =1530
                    ThemeFontIndex =-1
                    BackThemeColorIndex =4
                    BackTint =20.0
                    ForeTint =100.0
                End
                Begin Label
                    OverlapFlags =85
                    TextAlign =1
                    TextFontFamily =18
                    Width =5415
                    Height =540
                    FontSize =20
                    BorderColor =8355711
                    ForeColor =1490486
                    Name ="Rótulo104"
                    Caption ="DADOS ESPECIAIS - SCFV"
                    FontName ="Castellar"
                    GridlineColor =10921638
                    LayoutCachedWidth =5415
                    LayoutCachedHeight =540
                    ThemeFontIndex =-1
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextAlign =3
                    BackStyle =0
                    IMESentenceMode =3
                    Left =6916
                    Width =5913
                    Height =315
                    BorderColor =10921638
                    Name ="Data_Automática"
                    ControlSource ="=Date()"
                    Format ="Long Date"
                    GridlineColor =10921638

                    LayoutCachedLeft =6916
                    LayoutCachedWidth =12829
                    LayoutCachedHeight =315
                    ForeThemeColorIndex =2
                    ForeTint =100.0
                End
                Begin TextBox
                    Enabled = NotDefault
                    Locked = NotDefault
                    OldBorderStyle =0
                    OverlapFlags =93
                    TextAlign =3
                    BackStyle =0
                    IMESentenceMode =3
                    Left =6916
                    Top =345
                    Width =5913
                    Height =315
                    TabIndex =1
                    BorderColor =10921638
                    Name ="Horário_Automático"
                    ControlSource ="=Time()"
                    Format ="Long Time"
                    GridlineColor =10921638

                    LayoutCachedLeft =6916
                    LayoutCachedTop =345
                    LayoutCachedWidth =12829
                    LayoutCachedHeight =660
                    ForeThemeColorIndex =2
                    ForeTint =100.0
                End
                Begin Image
                    PictureType =2
                    Left =12819
                    Width =1363
                    Height =1486
                    BorderColor =10921638
                    Name ="Imagem212"
                    Picture ="Brasão_de_Rio_das_Ostras (1)"
                    GridlineColor =10921638

                    LayoutCachedLeft =12819
                    LayoutCachedWidth =14182
                    LayoutCachedHeight =1486
                    TabIndex =3
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =570
                    Top =885
                    Width =1815
                    Height =570
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    ForeColor =4210752
                    Name ="Comando4"
                    Caption ="   Imprimir Ficha de Inscrição"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =0
                        Begin
                            Action ="OpenReport"
                            Argument ="FICHA INSCRIÇÃO SCFV GERAL"
                            Argument ="2"
                            Argument =""
                            Argument =""
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"Comando4\" Event=\"OnClick\" xmlns=\"http://schemas.microsof"
                                "t.com/office/accessservices/2009/11/application\"><Statements><Action Name=\"Ope"
                                "nReport\"><Argument Name=\"ReportN"
                        End
                        Begin
                            Comment ="_AXL:ame\">FICHA INSCRIÇÃO SCFV GERAL</Argument><Argument Name=\"View\">Print Pr"
                                "eview</Argument></Action></Statements></UserInterfaceMacro>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff0000000000000000 ,
                        0x000000000000000000000000000000000000000000000000727272ffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffff727272ff0000000000000000 ,
                        0x000000000000000000000000000000000000000000000000727272ffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffff727272ff0000000000000000 ,
                        0x00000000000000007272726f727272ea727272ff727272ff727272ffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffff727272ff727272ff727272ff ,
                        0x727272ea7272726c727272fc727272ff727272ff727272ff727272ffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffff727272ff727272ff00000000 ,
                        0x727272ff727272f6727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272de7272726672727218000000007272721872727266 ,
                        0x727272de727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ba7272720c90a4686c90a468c390a468ed90a468c390a4686c ,
                        0x7272720c727272ba727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272de787c700f90a468bd90a468ff90a468ff90a468ff90a468ff90a468ff ,
                        0x90a468bd787c700f727272fc727272ff727272ff000000000000000000000000 ,
                        0x0000000090a4687590a468ff93a76df8e2e7d8ff9daf7aff90a468ff90a468ff ,
                        0x90a468ff90a4687572727284727272fc727272ff00000000727272ff727272ff ,
                        0x7272721b94a86ee792a66bfee2e7d8ffeef1e8ffe7ecdfff93a66cff90a468ff ,
                        0x90a468ff90a468de00000000000000000000000000000000727272f0ffffffff ,
                        0xffffff0691a569fbb5c29affdee4d3ff93a66cffdde3d1ffd1dac1ff90a468ff ,
                        0x90a468ff90a468f900000000000000000000000000000000727272f0ffffffff ,
                        0xffffff1b93a76de590a468ff90a468ff90a468ff98aa73fff2f4edffbac6a1ff ,
                        0x90a468ff90a468de00000000000000000000000000000000727272f0ffffffff ,
                        0xffffff6c90a4688490a468ff90a468ff90a468ff90a468ffa8b788ffe7ecdfff ,
                        0x90a468ff90a4688400000000000000000000000000000000727272ff727272ff ,
                        0x727272e17e866e1790a468cc90a468ff90a468ff90a468ff90a468ff90a468ff ,
                        0x93a66cd190a46809000000000000000000000000000000000000000000000000 ,
                        0x000000000000000090a4680690a4688190a468d590a468ff90a468d590a46881 ,
                        0x90a4680600000000
                    End

                    CursorOnHover =1
                    LayoutCachedLeft =570
                    LayoutCachedTop =885
                    LayoutCachedWidth =2385
                    LayoutCachedHeight =1455
                    PictureCaptionArrangement =5
                    Gradient =0
                    BackColor =10288878
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    BorderColor =14461583
                    HoverColor =10288878
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedColor =10288878
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =255
                    HoverForeThemeColorIndex =-1
                    HoverForeTint =100.0
                    PressedForeColor =255
                    PressedForeThemeColorIndex =-1
                    PressedForeTint =100.0
                    Overlaps =1
                End
            End
        End
        Begin Section
            CanGrow = NotDefault
            Height =6735
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =56
                    Top =1077
                    Width =1266
                    Height =315
                    ColumnWidth =930
                    FontSize =10
                    FontWeight =700
                    BorderColor =10921638
                    Name ="CodDPscfv"
                    ControlSource ="CodDPscfv"
                    GridlineColor =10921638

                    LayoutCachedLeft =56
                    LayoutCachedTop =1077
                    LayoutCachedWidth =1322
                    LayoutCachedHeight =1392
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =56
                            Top =793
                            Width =1266
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="CodDPscfv_Rótulo"
                            Caption ="CodDPscfv"
                            GridlineColor =10921638
                            LayoutCachedLeft =56
                            LayoutCachedTop =793
                            LayoutCachedWidth =1322
                            LayoutCachedHeight =1123
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =7035
                    Top =1079
                    Width =1860
                    Height =330
                    ColumnWidth =1350
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    Name ="DNascTXT"
                    ControlSource ="DNasc"
                    GridlineColor =10921638

                    LayoutCachedLeft =7035
                    LayoutCachedTop =1079
                    LayoutCachedWidth =8895
                    LayoutCachedHeight =1409
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =7042
                            Top =795
                            Width =1425
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="DNasc_Rótulo"
                            Caption ="DNasc"
                            GridlineColor =10921638
                            LayoutCachedLeft =7042
                            LayoutCachedTop =795
                            LayoutCachedWidth =8467
                            LayoutCachedHeight =1125
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    IMESentenceMode =3
                    Left =9070
                    Top =1077
                    Width =1860
                    Height =330
                    ColumnWidth =1860
                    FontSize =10
                    FontWeight =700
                    TabIndex =2
                    BorderColor =10921638
                    Name ="CelularMaeTXT"
                    ControlSource ="CelularMae"
                    GridlineColor =10921638

                    LayoutCachedLeft =9070
                    LayoutCachedTop =1077
                    LayoutCachedWidth =10930
                    LayoutCachedHeight =1407
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =9070
                            Top =793
                            Width =1425
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="CelularMae_Rótulo"
                            Caption ="CelularMae"
                            GridlineColor =10921638
                            LayoutCachedLeft =9070
                            LayoutCachedTop =793
                            LayoutCachedWidth =10495
                            LayoutCachedHeight =1123
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =1590
                    Top =1593
                    TabIndex =3
                    BorderColor =10921638
                    Name ="VacinaEmDia"
                    ControlSource ="VacinaEmDia"
                    GridlineColor =10921638

                    LayoutCachedLeft =1590
                    LayoutCachedTop =1593
                    LayoutCachedWidth =1850
                    LayoutCachedHeight =1833
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =75
                            Top =1593
                            Width =1425
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="VacinaEmDia_Rótulo"
                            Caption ="VacinaEmDia"
                            GridlineColor =10921638
                            LayoutCachedLeft =75
                            LayoutCachedTop =1593
                            LayoutCachedWidth =1500
                            LayoutCachedHeight =1923
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =93
                    Left =4723
                    Top =1607
                    Width =395
                    TabIndex =4
                    BorderColor =10921638
                    Name ="Medicamentos"
                    ControlSource ="Medicamentos"
                    GridlineColor =10921638

                    LayoutCachedLeft =4723
                    LayoutCachedTop =1607
                    LayoutCachedWidth =5118
                    LayoutCachedHeight =1847
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =2008
                            Top =1607
                            Width =2610
                            Height =315
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Medicamentos_Rótulo"
                            Caption ="Faz uso de Medicamentos? "
                            GridlineColor =10921638
                            LayoutCachedLeft =2008
                            LayoutCachedTop =1607
                            LayoutCachedWidth =4618
                            LayoutCachedHeight =1922
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7169
                    Top =1590
                    Width =6825
                    Height =345
                    ColumnWidth =1710
                    FontSize =10
                    FontWeight =700
                    TabIndex =5
                    BorderColor =10921638
                    Name ="QuaisMedicamentos"
                    ControlSource ="QuaisMedicamentos"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =7169
                    LayoutCachedTop =1590
                    LayoutCachedWidth =13994
                    LayoutCachedHeight =1935
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =5070
                            Top =1590
                            Width =2055
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="QuaisMedicamentos_Rótulo"
                            Caption ="QuaisMedicamentos"
                            GridlineColor =10921638
                            LayoutCachedLeft =5070
                            LayoutCachedTop =1590
                            LayoutCachedWidth =7125
                            LayoutCachedHeight =1920
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =93
                    Left =2606
                    Top =2154
                    Width =305
                    TabIndex =6
                    BorderColor =10921638
                    Name ="TratamentoSaude"
                    ControlSource ="TratamentoSaude"
                    GridlineColor =10921638

                    LayoutCachedLeft =2606
                    LayoutCachedTop =2154
                    LayoutCachedWidth =2911
                    LayoutCachedHeight =2394
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =56
                            Top =2154
                            Width =2520
                            Height =315
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="TratamentoSaude_Rótulo"
                            Caption ="Faz tratamento de Saude? "
                            GridlineColor =10921638
                            LayoutCachedLeft =56
                            LayoutCachedTop =2154
                            LayoutCachedWidth =2576
                            LayoutCachedHeight =2469
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =4406
                    Top =2154
                    Width =3990
                    Height =345
                    ColumnWidth =2235
                    FontSize =10
                    FontWeight =700
                    TabIndex =7
                    BorderColor =10921638
                    Name ="QualTratamento"
                    ControlSource ="QualTratamento"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =4406
                    LayoutCachedTop =2154
                    LayoutCachedWidth =8396
                    LayoutCachedHeight =2499
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =119
                            Left =2891
                            Top =2154
                            Width =1425
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="QualTratamento_Rótulo"
                            Caption ="QualTratamento"
                            GridlineColor =10921638
                            LayoutCachedLeft =2891
                            LayoutCachedTop =2154
                            LayoutCachedWidth =4316
                            LayoutCachedHeight =2484
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =93
                    Left =795
                    Top =2550
                    Width =515
                    TabIndex =8
                    BorderColor =10921638
                    Name ="Alergia"
                    ControlSource ="Alergia"
                    GridlineColor =10921638

                    LayoutCachedLeft =795
                    LayoutCachedTop =2550
                    LayoutCachedWidth =1310
                    LayoutCachedHeight =2790
                    Begin
                        Begin Label
                            OverlapFlags =119
                            Left =60
                            Top =2550
                            Width =735
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Alergia_Rótulo"
                            Caption ="Alergia"
                            GridlineColor =10921638
                            LayoutCachedLeft =60
                            LayoutCachedTop =2550
                            LayoutCachedWidth =795
                            LayoutCachedHeight =2880
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2400
                    Top =2550
                    Width =4440
                    Height =330
                    ColumnWidth =2055
                    FontSize =10
                    FontWeight =700
                    TabIndex =9
                    BorderColor =10921638
                    Name ="QualAlergia"
                    ControlSource ="QualAlergia"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2400
                    LayoutCachedTop =2550
                    LayoutCachedWidth =6840
                    LayoutCachedHeight =2880
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =247
                            Left =1140
                            Top =2550
                            Width =1230
                            Height =285
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="QualAlergia_Rótulo"
                            Caption ="Qual Alergia? "
                            GridlineColor =10921638
                            LayoutCachedLeft =1140
                            LayoutCachedTop =2550
                            LayoutCachedWidth =2370
                            LayoutCachedHeight =2835
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =7815
                    Top =2550
                    Width =6180
                    Height =330
                    ColumnWidth =3000
                    FontSize =10
                    FontWeight =700
                    TabIndex =10
                    BorderColor =10921638
                    Name ="Pediatra"
                    ControlSource ="Pediatra"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =7815
                    LayoutCachedTop =2550
                    LayoutCachedWidth =13995
                    LayoutCachedHeight =2880
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =6975
                            Top =2550
                            Width =840
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Pediatra_Rótulo"
                            Caption ="Pediatra"
                            GridlineColor =10921638
                            LayoutCachedLeft =6975
                            LayoutCachedTop =2550
                            LayoutCachedWidth =7815
                            LayoutCachedHeight =2880
                            ForeTint =100.0
                        End
                    End
                End
                Begin CheckBox
                    OverlapFlags =85
                    Left =2385
                    Top =3003
                    Width =620
                    TabIndex =11
                    BorderColor =10921638
                    Name ="Autorizado a sair sozinho"
                    ControlSource ="Autorizado a sair sozinho"
                    EventProcPrefix ="Autorizado_a_sair_sozinho"
                    GridlineColor =10921638

                    LayoutCachedLeft =2385
                    LayoutCachedTop =3003
                    LayoutCachedWidth =3005
                    LayoutCachedHeight =3243
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =60
                            Top =3003
                            Width =2265
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Autorizado a sair sozinho_Rótulo"
                            Caption ="Autorizado a sair sozinho? "
                            EventProcPrefix ="Autorizado_a_sair_sozinho_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =60
                            LayoutCachedTop =3003
                            LayoutCachedWidth =2325
                            LayoutCachedHeight =3333
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =5556
                    Top =3004
                    Width =8445
                    Height =330
                    ColumnWidth =3000
                    FontSize =10
                    FontWeight =700
                    TabIndex =12
                    BorderColor =10921638
                    Name ="QuemBusca"
                    ControlSource ="QuemBusca"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =5556
                    LayoutCachedTop =3004
                    LayoutCachedWidth =14001
                    LayoutCachedHeight =3334
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =3231
                            Top =3004
                            Width =2265
                            Height =330
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="QuemBusca_Rótulo"
                            Caption ="Se não, quem virá buscar? "
                            GridlineColor =10921638
                            LayoutCachedLeft =3231
                            LayoutCachedTop =3004
                            LayoutCachedWidth =5496
                            LayoutCachedHeight =3334
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    EnterKeyBehavior = NotDefault
                    ScrollBars =2
                    OverlapFlags =87
                    IMESentenceMode =3
                    Left =2141
                    Top =3401
                    Width =3156
                    Height =330
                    ColumnWidth =3000
                    FontSize =10
                    FontWeight =700
                    TabIndex =13
                    BorderColor =10921638
                    Name ="PessoaEmergencia"
                    ControlSource ="PessoaEmergencia"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =2141
                    LayoutCachedTop =3401
                    LayoutCachedWidth =5297
                    LayoutCachedHeight =3731
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =56
                            Top =3401
                            Width =2085
                            Height =315
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="PessoaEmergencia_Rótulo"
                            Caption ="Pessoa de emergencia: "
                            GridlineColor =10921638
                            LayoutCachedLeft =56
                            LayoutCachedTop =3401
                            LayoutCachedWidth =2141
                            LayoutCachedHeight =3716
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =7650
                    Top =3401
                    Width =2340
                    Height =330
                    ColumnWidth =1860
                    FontSize =10
                    FontWeight =700
                    TabIndex =14
                    BorderColor =10921638
                    Name ="TelEmergencia"
                    ControlSource ="TelEmergencia"
                    InputMask ="!\\(99\") \"!99000\\-0000;0;"
                    GridlineColor =10921638

                    LayoutCachedLeft =7650
                    LayoutCachedTop =3401
                    LayoutCachedWidth =9990
                    LayoutCachedHeight =3731
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =5385
                            Top =3401
                            Width =2205
                            Height =315
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="TelEmergencia_Rótulo"
                            Caption ="Telefone de emergencia: "
                            GridlineColor =10921638
                            LayoutCachedLeft =5385
                            LayoutCachedTop =3401
                            LayoutCachedWidth =7590
                            LayoutCachedHeight =3716
                            ForeTint =100.0
                        End
                    End
                End
                Begin Rectangle
                    BackStyle =1
                    OverlapFlags =93
                    Left =60
                    Width =14181
                    Height =630
                    BackColor =15590879
                    BorderColor =10921638
                    Name ="Caixa552"
                    GridlineColor =10921638
                    LayoutCachedLeft =60
                    LayoutCachedWidth =14241
                    LayoutCachedHeight =630
                    BackThemeColorIndex =-1
                End
                Begin CommandButton
                    OverlapFlags =223
                    Left =124
                    Top =56
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =15
                    Name ="BTPRIM"
                    Caption ="Primeiro"
                    FontName ="MS Sans Serif"
                    ControlTipText ="Primeiro registro"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =8
                        Begin
                            Action ="GoToRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="2"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"BTPRIM\" xmlns=\"http://schemas.microsoft.com/office/accesss"
                                "ervices/2009/11/application\"><Statements><Action Name=\"GoToRecord\"><Argument "
                                "Name=\"Record\">First</Argument><"
                        End
                        Begin
                            Comment ="_AXL:/Action></Statements></UserInterfaceMacro>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x000000000000000000000000000000000000000000000000b17d4a33b17d4ae1 ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x0000000000000000000000000000000000000000b17d4a60b17d4af6b17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x000000000000000000000000b17d4a06b17d4a96b17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x0000000000000000b17d4a18b17d4ac3b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000b17d4a39b17d4ae4b17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4a66b17d4af9b17d4affb17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4a66b17d4af9b17d4affb17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000b17d4a39b17d4ae7b17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x0000000000000000b17d4a18b17d4ac6b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x000000000000000000000000b17d4a06b17d4a99b17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x0000000000000000000000000000000000000000b17d4a66b17d4af9b17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x000000000000000000000000000000000000000000000000b17d4a39b17d4ae7 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =124
                    LayoutCachedTop =56
                    LayoutCachedWidth =1373
                    LayoutCachedHeight =561
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    UseTheme =0
                    BackColor =14461583
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =223
                    Left =1369
                    Top =60
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =16
                    Name ="BTPROX"
                    Caption ="Último"
                    FontName ="MS Sans Serif"
                    ControlTipText ="Próximo registro"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Action ="GoToRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="1"
                        End
                        Begin
                            Condition ="[MacroError]<>0"
                            Action ="MsgBox"
                            Argument ="=[MacroError].[Description]"
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"BTPROX\" xmlns=\"http://schemas.microsoft.com/office/accesss"
                                "ervices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Action Name"
                                "=\"GoToRecord\"/><ConditionalBloc"
                        End
                        Begin
                            Comment ="_AXL:k><If><Condition>[MacroError]&lt;&gt;0</Condition><Statements><Action Name="
                                "\"MessageBox\"><Argument Name=\"Message\">=[MacroError].[Description]</Argument>"
                                "</Action></Statements></If></ConditionalBlock></Statements></UserInterfaceMacro>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000b17d4ae1b17d4a360000000000000000 ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4af6b17d4a6000000000 ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4a96 ,
                        0xb17d4a06000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4ac3b17d4a180000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4ae7b17d4a3900000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4af9b17d4a66b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4af9b17d4a66b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4ae7b17d4a3900000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4ac6b17d4a180000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4a99 ,
                        0xb17d4a06000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4affb17d4af9b17d4a6600000000 ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x00000000000000000000000000000000b17d4ae7b17d4a390000000000000000 ,
                        0x00000000000000000000000000000000b17d4affb17d4affb17d4affb17d4aff ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =1369
                    LayoutCachedTop =60
                    LayoutCachedWidth =2618
                    LayoutCachedHeight =565
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    UseTheme =0
                    BackColor =14461583
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =223
                    Left =2614
                    Top =60
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =17
                    Name =" BTANTER"
                    Caption ="Anterior"
                    FontName ="MS Sans Serif"
                    EventProcPrefix ="Ctl_BTANTER"
                    ControlTipText ="Registro anterior"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Action ="GoToRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="0"
                        End
                        Begin
                            Condition ="[MacroError]<>0"
                            Action ="MsgBox"
                            Argument ="=[MacroError].[Description]"
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\" BTANTER\" xmlns=\"http://schemas.microsoft.com/office/acces"
                                "sservices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Action Na"
                                "me=\"GoToRecord\"><Argument Name="
                        End
                        Begin
                            Comment ="_AXL:\"Record\">Previous</Argument></Action><ConditionalBlock><If><Condition>[Ma"
                                "croError]&lt;&gt;0</Condition><Statements><Action Name=\"MessageBox\"><Argument "
                                "Name=\"Message\">=[MacroError].[Description]</Argument></Action></Statements></I"
                                "f></ConditionalBloc"
                        End
                        Begin
                            Comment ="_AXL:k></Statements></UserInterfaceMacro>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000b17d4a33b17d4ae10000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000b17d4a60b17d4af6b17d4aff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000b17d4a06b17d4a96b17d4affb17d4affb17d4aff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0xb17d4a18b17d4ac3b17d4affb17d4affb17d4affb17d4aff0000000000000000 ,
                        0x00000000000000000000000000000000000000000000000000000000b17d4a39 ,
                        0xb17d4ae4b17d4affb17d4affb17d4affb17d4affb17d4aff0000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4a66b17d4af9 ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4affb17d4aff0000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4a66b17d4af9 ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4affb17d4aff0000000000000000 ,
                        0x00000000000000000000000000000000000000000000000000000000b17d4a39 ,
                        0xb17d4ae7b17d4affb17d4affb17d4affb17d4affb17d4aff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0xb17d4a18b17d4ac6b17d4affb17d4affb17d4affb17d4aff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000b17d4a06b17d4a99b17d4affb17d4affb17d4aff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000b17d4a66b17d4af9b17d4aff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000b17d4a39b17d4ae70000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =2614
                    LayoutCachedTop =60
                    LayoutCachedWidth =3863
                    LayoutCachedHeight =565
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    UseTheme =0
                    BackColor =14461583
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =223
                    Left =3859
                    Top =60
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =18
                    Name ="BTULT"
                    Caption ="Próximo"
                    FontName ="MS Sans Serif"
                    ControlTipText ="Último registro"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =8
                        Begin
                            Action ="GoToRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="3"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"BTULT\" xmlns=\"http://schemas.microsoft.com/office/accessse"
                                "rvices/2009/11/application\"><Statements><Action Name=\"GoToRecord\"><Argument N"
                                "ame=\"Record\">Last</Argument></A"
                        End
                        Begin
                            Comment ="_AXL:ction></Statements></UserInterfaceMacro>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4ae1b17d4a36 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4af6 ,
                        0xb17d4a6000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4aff ,
                        0xb17d4affb17d4a96b17d4a060000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4ac3b17d4a1800000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4ae7b17d4a39000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4af9b17d4a660000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4af9b17d4a660000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4ae7b17d4a39000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4ac6b17d4a1800000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4aff ,
                        0xb17d4affb17d4a99b17d4a060000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4affb17d4af9 ,
                        0xb17d4a6600000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000000000000b17d4ae7b17d4a39 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    LayoutCachedLeft =3859
                    LayoutCachedTop =60
                    LayoutCachedWidth =5108
                    LayoutCachedHeight =565
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    UseTheme =0
                    BackColor =14461583
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =6379
                    Top =60
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =19
                    Name ="cmdGravar"
                    Caption ="  Gravar"
                    FontName ="MS Sans Serif"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =0
                        Begin
                            Action ="RunCommand"
                            Argument ="97"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"cmdGravar\" Event=\"OnClick\" xmlns=\"http://schemas.microso"
                                "ft.com/office/accessservices/2009/11/application\"><Statements><Action Name=\"Sa"
                                "veRecord\"/></Statements></UserIn"
                        End
                        Begin
                            Comment ="_AXL:terfaceMacro>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000d0687050c06860ffb05850ffa05050ffa05050ff ,
                        0xa05050ff904850ff904840ff904840ff804040ff803840ff803840ff703840ff ,
                        0x703830ff0000000000000000d06870fff09090ffe08080ffb04820ff403020ff ,
                        0xc0b8b0ffc0b8b0ffd0c0c0ffd0c8c0ff505050ffa04030ffa04030ffa03830ff ,
                        0x703840ff0000000000000000d07070ffff98a0fff08880ffe08080ff705850ff ,
                        0x404030ff907870fff0e0e0fff0e8e0ff908070ffa04030ffa04040ffa04030ff ,
                        0x803840ff0000000000000000d07870ffffa0a0fff09090fff08880ff705850ff ,
                        0x000000ff404030fff0d8d0fff0e0d0ff807860ffb04840ffb04840ffa04040ff ,
                        0x804040ff0000000000000000d07880ffffa8b0ffffa0a0fff09090ff705850ff ,
                        0x705850ff705850ff705850ff706050ff806860ffc05850ffb05050ffb04840ff ,
                        0x804040ff0000000000000000e08080ffffb0b0ffffb0b0ffffa0a0fff09090ff ,
                        0xf08880ffe08080ffe07880ffd07070ffd06870ffc06060ffc05850ffb05050ff ,
                        0x904840ff0000000000000000e08890ffffb8c0ffffb8b0ffd06060ffc06050ff ,
                        0xc05850ffc05040ffb05030ffb04830ffa04020ffa03810ffc06060ffc05850ff ,
                        0x904840ff0000000000000000e09090ffffc0c0ffd06860ffffffffffffffffff ,
                        0xfff8f0fff0f0f0fff0e8e0fff0d8d0ffe0d0c0ffe0c8c0ffa03810ffc06060ff ,
                        0x904850ff0000000000000000e098a0ffffc0c0ffd07070ffffffffffffffffff ,
                        0xfffffffffff8f0fff0f0f0fff0e8e0fff0d8d0ffe0d0c0ffa04020ffd06860ff ,
                        0xa05050ff0000000000000000f0a0a0ffffc0c0ffe07870ffffffffffffffffff ,
                        0xfffffffffffffffffff8f0fff0f0f0fff0e8e0fff0d8d0ffb04830ffd07070ff ,
                        0xa05050ff0000000000000000f0a8a0ffffc0c0ffe08080ffffffffffffffffff ,
                        0xfffffffffffffffffffffffffff8f0fff0f0f0fff0e8e0ffb05030ffe07880ff ,
                        0xa05050ff0000000000000000f0b0b0ffffc0c0fff08890ffffffffffffffffff ,
                        0xfffffffffffffffffffffffffffffffffff8f0fff0f0f0ffc05040ff603030ff ,
                        0xb05850ff0000000000000000f0b0b0ffffc0c0ffff9090ffffffffffffffffff ,
                        0xfffffffffffffffffffffffffffffffffffffffffff8f0ffc05850ffb05860ff ,
                        0xb05860ff0000000000000000f0b8b0fff0b8b0fff0b0b0fff0b0b0fff0a8b0ff ,
                        0xf0a0a0ffe098a0ffe09090ffe09090ffe08890ffe08080ffd07880ffd07870ff ,
                        0xd07070ff00000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    CursorOnHover =1
                    LayoutCachedLeft =6379
                    LayoutCachedTop =60
                    LayoutCachedWidth =7628
                    LayoutCachedHeight =565
                    PictureCaptionArrangement =1
                    ForeTint =100.0
                    Gradient =0
                    BackColor =15189940
                    BackTint =40.0
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverColor =15189940
                    PressedColor =15189940
                    PressedTint =40.0
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =223
                    Left =7654
                    Top =60
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =20
                    Name ="btpesquisar"
                    Caption ="Pesquisar"
                    FontName ="MS Sans Serif"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =0
                        Begin
                            Action ="OpenForm"
                            Argument ="PesquisarDadosSCFV"
                            Argument ="0"
                            Argument =""
                            Argument =""
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"btpesquisar\" Event=\"OnClick\" xmlns=\"http://schemas.micro"
                                "soft.com/office/accessservices/2009/11/application\"><Statements><Action Name=\""
                                "OpenForm\"><Argument Name=\"FormNa"
                        End
                        Begin
                            Comment ="_AXL:me\">PesquisarDadosSCFV</Argument></Action></Statements></UserInterfaceMacr"
                                "o>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000b17d4a5ab17d4affb17d4a780000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000b17d4aeab17d4affb17d4affb17d4a9fb17d4a03 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000b17d4a3fb17d4af3b17d4affb17d4affb17d4ab7 ,
                        0xb17d4a0c00000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000000000000b17d4a30b17d4ae7b17d4affb17d4aff ,
                        0xb17d4ad2b17d4a7eb27f4cdbb17d4affb17e4bd0b17d4a75b17d4a0300000000 ,
                        0x0000000000000000000000000000000000000000b17d4a1eb17d4adbb17d4aff ,
                        0xb17d4affb17d4affcca988ffdac2aaffcba987feb17d4affb17e4bcab17d4a09 ,
                        0x000000000000000000000000000000000000000000000000b17d4a15b17d4ad8 ,
                        0xb27e4bfeeadcceffffffffffffffffffffffffffe8d9caffb27e4bfeb17d4a84 ,
                        0x00000000000000000000000000000000000000000000000000000000b48352e8 ,
                        0xcdac8cffffffffffffffffffffffffffffffffffffffffffcdac8bfeb27e4be0 ,
                        0x00000000000000000000000000000000000000000000000000000000b27f4cfc ,
                        0xdbc3acffffffffffffffffffffffffffffffffffffffffffdbc3acffb17e4bfa ,
                        0x00000000000000000000000000000000000000000000000000000000b58453ea ,
                        0xcca988ffffffffffffffffffffffffffffffffffffffffffcdab8affb3804ee2 ,
                        0x00000000000000000000000000000000000000000000000000000000b6855583 ,
                        0xb27f4cffe8d9caffffffffffffffffffffffffffe8d9caffb27e4bfeb17d4a7b ,
                        0x00000000000000000000000000000000000000000000000000000000b17d4a03 ,
                        0xb78657cfb17d4affcca988ffd8bfa6ffcca988ffb17d4affb38150c6b17d4a03 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0xb17d4a03b686567ab78757dcb17e4bfdb68555dab17d4a72b17d4a0300000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    CursorOnHover =1
                    LayoutCachedLeft =7654
                    LayoutCachedTop =60
                    LayoutCachedWidth =8903
                    LayoutCachedHeight =565
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    Gradient =0
                    BackThemeColorIndex =9
                    BackTint =40.0
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverThemeColorIndex =9
                    PressedThemeColorIndex =9
                    PressedTint =40.0
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =12915
                    Top =60
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =21
                    Name ="cmdSair"
                    Caption ="  Sair"
                    OnClick ="[Event Procedure]"
                    FontName ="MS Sans Serif"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000010081080 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000000000000040485020100810e0104050ff ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000040404080405860ff106890ff2080a0f0 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000607070ff80a0b0ff4080a0ff20a0d0ff40a8e0ff2078a0ff ,
                        0x101020ff101020ff000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000708890ffa0d8f0ff60d0ffff50c0f0ff30a8e0ff1080b0ff ,
                        0xe0d8d0ff102020ff000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000708890ffb0e8f0ff80e0ffff60c8f0ff50b8f0ff1088c0ff ,
                        0xf0d8d0ff202830ff000000000000000090482030904820ff0000000000000000 ,
                        0x0000000000000000808890ffb0e8f0ff80e0ffff60d0ffff404050ff1090c0ff ,
                        0xf0e0d0ff303840ff0000000090482030a05030ffa05020ff0000000000000000 ,
                        0x00000000000000008090a0ffc0f0ffff90e0ffff70d8ffff60c8f0ff0090c0ff ,
                        0xf0e0e0ff404050ff90482030a05030ffd07840ffb05830ffa05020ffa04820ff ,
                        0x904820ff904820ff8090a0ffc0f0ffffa0e8ffff80d8ffff70d0f0ff40b0e0ff ,
                        0xf0e8e0ff605050ffa05830ffe08860fff09060fff08850ffe07850ffd07040ff ,
                        0xb06840ff904820ff8098a0ffc0f0ffffa0e8ffff90e8ffff80e0ffff80b8d0ff ,
                        0xf0e8e0ffe09870ffffc0a0ffffb090ffffa070fff09060fff08850ffe07850ff ,
                        0xd07040ffa05020ff8098a0ffc0f0ffffc0f8ffffa0e0f0ff90a8b0ffc0c8d0ff ,
                        0xf0f0e0ff908080fff0a070ffffc0a0ffffb090ffffb090ffffa880fff0a080ff ,
                        0xe09870ffb05030ff90a0a0ffe0f8ffffb0c8d0ff90a0b0fff0f0f0fffff8f0ff ,
                        0xf0f0f0ff607080ffe0987050f0a070ffffc0a0ffd06830ffe09870ffe09060ff ,
                        0xe08860ffe08050ff90a0b0ff90a8b0ffc0c8d0ffffffffffffffffffffffffff ,
                        0xffffffff708890ff00000000e0987050e09870ffd07040ff0000000000000000 ,
                        0x000000000000000090a0b0ff90a0b0ff90a0b0ff90a0b0ff90a0a0ff8098a0ff ,
                        0x8098a0ff9098a0ff0000000000000000e0987050e09870ff0000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    CursorOnHover =1
                    LayoutCachedLeft =12915
                    LayoutCachedTop =60
                    LayoutCachedWidth =14164
                    LayoutCachedHeight =565
                    PictureCaptionArrangement =1
                    ForeTint =100.0
                    BackColor =14461583
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverColor =15189940
                    PressedColor =9917743
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =8899
                    Top =60
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =22
                    Name ="BTEXCLUIR"
                    Caption ="  Excluir"
                    OnClick ="[Event Procedure]"
                    FontName ="MS Sans Serif"
                    ControlTipText ="Excluir registro"
                    GridlineColor =10921638
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000003255d6943255d68300000000000000000000000000000000 ,
                        0x3255d6043255d681000000000000000000000000000000000000000000000000 ,
                        0x000000003255d60e3255d6f43255d6f63255d66a000000000000000000000000 ,
                        0x3255d6c13255d6b7000000000000000000000000000000000000000000000000 ,
                        0x00000000000000003255d68d3255d6f83255d6f43255d652000000003255d6ba ,
                        0x3255d6ec3255d618000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000003255d6943255d6f63255d6f43255d6d23255d6f6 ,
                        0x3255d65900000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000000000003255d68d3255d6f83255d6f83255d6cd ,
                        0x0000000000000000727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff00000000000000003255d6753255d6f13255d6f83255d6eb3255d6f8 ,
                        0x3255d6c63255d614727272ffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffff423255d69b3255d6f83255d6f63255d6a1ffffff033255d65e ,
                        0x3255d6d93255d6ad727272ffffffffffb17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affcead8da33255d6623255d6bf546acb52c9a582ccb48250ffc9a581cf ,
                        0xffffff3300000000727272ffffffffffb17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb58454fecca988bbcdab8bb1ba8c5ffbb17d4affb17d4affb17d4aff ,
                        0xffffffff727272ff727272ffffffffffb17d4affb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4affb17d4affb17d4affb17d4aff ,
                        0xffffffff727272ff727272ffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ,
                        0xffffffff727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    CursorOnHover =1
                    LayoutCachedLeft =8899
                    LayoutCachedTop =60
                    LayoutCachedWidth =10148
                    LayoutCachedHeight =565
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    Gradient =0
                    BackColor =9144054
                    BackThemeColorIndex =-1
                    BackTint =100.0
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverColor =9144054
                    HoverThemeColorIndex =-1
                    HoverTint =100.0
                    PressedColor =9144054
                    PressedThemeColorIndex =-1
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin CommandButton
                    OverlapFlags =215
                    Left =5104
                    Top =60
                    Width =1249
                    Height =505
                    FontSize =8
                    FontWeight =700
                    TabIndex =23
                    Name ="btnovo"
                    Caption ="  Novo"
                    FontName ="MS Sans Serif"
                    ControlTipText ="Adicionar registro"
                    GridlineColor =10921638
                    OnClickEmMacro = Begin
                        Version =196611
                        ColumnsShown =10
                        Begin
                            Action ="OnError"
                            Argument ="0"
                        End
                        Begin
                            Action ="GoToRecord"
                            Argument ="-1"
                            Argument =""
                            Argument ="5"
                        End
                        Begin
                            Condition ="[MacroError]<>0"
                            Action ="MsgBox"
                            Argument ="=[MacroError].[Description]"
                            Argument ="-1"
                            Argument ="0"
                        End
                        Begin
                            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                                "nterfaceMacro For=\"btnovo\" xmlns=\"http://schemas.microsoft.com/office/accesss"
                                "ervices/2009/11/application\"><Statements><Action Name=\"OnError\"/><Action Name"
                                "=\"GoToRecord\"><Argument Name=\"R"
                        End
                        Begin
                            Comment ="_AXL:ecord\">New</Argument></Action><ConditionalBlock><If><Condition>[MacroError"
                                "]&lt;&gt;0</Condition><Statements><Action Name=\"MessageBox\"><Argument Name=\"M"
                                "essage\">=[MacroError].[Description]</Argument></Action></Statements></If></Cond"
                                "itionalBlock></Sta"
                        End
                        Begin
                            Comment ="_AXL:tements></UserInterfaceMacro>"
                        End
                    End
                    ImageData = Begin
                        0x2800000010000000100000000100200000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000000000000727272ff727272ff727272ff727272ff727272ff ,
                        0x727272ff727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x000000000000000000000000727272ffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff727272ff ,
                        0x000000000000000000000000727272ffffffffffb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4affb17d4affffffffff727272ff ,
                        0x000000000000000000000000727272ffffffffffb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4affb17d4affffffffff727272ff ,
                        0x000000000000000000000000727272ffffffffffb17d4affb17d4affb17d4aff ,
                        0xb17d4affb17d4affb17d4affb17d4affb17d4affb17d4affffffffff727272ff ,
                        0x000000000000000000000000727272ffffffffffffffffffffffffffffffffff ,
                        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff727272ff ,
                        0x0000000000000000000000000000000082c2ea0f82c2eaf00000000000000000 ,
                        0x00000000727272ff727272ff727272ff727272ff727272ff727272ff727272ff ,
                        0x00000000000000000000000082c2eaff82c2ea1582c2eaf382c2ea0982c2eaff ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000082c2ea1b82c2eaea82c2eaff82c2eaea82c2ea21 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x000000000000000082c2eaf082c2eaff82c2eaff0000000082c2eaff82c2eaff ,
                        0x82c2eaff00000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000082c2ea2182c2eaf982c2eaff82c2eaf982c2ea2a ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x00000000000000000000000082c2eaff82c2ea3682c2eaf682c2ea2d82c2eaff ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000000000000000000082c2ea0f82c2eaf00000000000000000 ,
                        0x0000000000000000000000000000000000000000000000000000000000000000 ,
                        0x0000000000000000
                    End

                    CursorOnHover =1
                    LayoutCachedLeft =5104
                    LayoutCachedTop =60
                    LayoutCachedWidth =6353
                    LayoutCachedHeight =565
                    PictureCaptionArrangement =5
                    ForeTint =100.0
                    Gradient =0
                    BackColor =15189940
                    BackTint =40.0
                    BorderColor =14461583
                    ThemeFontIndex =-1
                    HoverColor =15189940
                    PressedColor =15189940
                    PressedTint =40.0
                    PressedShade =100.0
                    HoverForeColor =0
                    HoverForeTint =100.0
                    PressedForeColor =0
                    PressedForeTint =100.0
                    Overlaps =1
                End
                Begin Subform
                    OverlapFlags =215
                    Left =60
                    Top =4215
                    Width =10770
                    Height =2520
                    TabIndex =24
                    BorderColor =10921638
                    Name ="ATUALIZAÇÃO INSCR SUBFRM"
                    SourceObject ="Form.ATUALIZAÇÃO INSCR SUBFRM"
                    LinkChildFields ="CodDPscfv"
                    LinkMasterFields ="CodDPscfv"
                    EventProcPrefix ="ATUALIZAÇÃO_INSCR_SUBFRM"
                    GridlineColor =10921638

                    LayoutCachedLeft =60
                    LayoutCachedTop =4215
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =6735
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =60
                            Top =3915
                            Width =3915
                            Height =375
                            FontSize =14
                            FontWeight =700
                            BorderColor =8355711
                            ForeColor =255
                            Name ="ATUALIZAÇÃO INSCR SUBFRM Rótulo"
                            Caption ="ATUALIZAÇÃO DA INSCRIÇÃO"
                            EventProcPrefix ="ATUALIZAÇÃO_INSCR_SUBFRM_Rótulo"
                            GridlineColor =10921638
                            LayoutCachedLeft =60
                            LayoutCachedTop =3915
                            LayoutCachedWidth =3975
                            LayoutCachedHeight =4290
                            ForeThemeColorIndex =-1
                            ForeTint =100.0
                        End
                    End
                End
                Begin ComboBox
                    LimitToList = NotDefault
                    OverlapFlags =215
                    IMESentenceMode =3
                    ColumnCount =4
                    ListWidth =6735
                    Left =1587
                    Top =1077
                    Width =5001
                    Height =315
                    FontSize =10
                    FontWeight =700
                    TabIndex =25
                    Name ="NomePessoatxt"
                    ControlSource ="NomePessoa"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT [TbPessoa].[CodPessoa], [TbPessoa].[Nome], [TbPessoa].[DNasc], [TbPessoa]"
                        ".[Celular] FROM TbPessoa ORDER BY [Nome]; "
                    ColumnWidths ="0;3855;1440;1440"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =1587
                    LayoutCachedTop =1077
                    LayoutCachedWidth =6588
                    LayoutCachedHeight =1392
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeThemeColorIndex =4
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =1590
                            Top =795
                            Width =1290
                            Height =315
                            FontSize =10
                            FontWeight =700
                            BorderColor =8355711
                            Name ="Rótulo43"
                            Caption ="NomePessoa"
                            GridlineColor =10921638
                            LayoutCachedLeft =1590
                            LayoutCachedTop =795
                            LayoutCachedWidth =2880
                            LayoutCachedHeight =1110
                            ForeTint =100.0
                        End
                    End
                End
            End
        End
        Begin FormFooter
            Height =0
            Name ="RodapéDoFormulário"
            AutoHeight =1
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
    End
End
CodeBehindForm
' See "FrmDadosEspeciaisSCFV.cls"
