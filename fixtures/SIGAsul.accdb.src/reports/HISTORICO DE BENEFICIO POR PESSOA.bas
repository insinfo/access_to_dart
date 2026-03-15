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
    Width =11178
    DatasheetFontHeight =11
    ItemSuffix =476
    Left =3675
    Top =2550
    RecSrcDt = Begin
        0x5df92ccfafd6e540
    End
    RecordSource ="BENEFICIO POR PESSOA"
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
        Begin Subform
            BorderLineStyle =0
            Width =1701
            Height =1701
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
        Begin BreakLevel
            ControlSource ="DataBenef"
        End
        Begin FormHeader
            KeepTogether = NotDefault
            Height =0
            Name ="CabeçalhoDoRelatório"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =2
            BackTint =20.0
        End
        Begin PageHeader
            Height =3742
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin Label
                    TextAlign =2
                    TextFontFamily =18
                    Left =3345
                    Top =1305
                    Width =5025
                    Height =345
                    FontSize =13
                    BorderColor =8355711
                    ForeColor =8355711
                    Name ="Rótulo160"
                    Caption ="HISTÓRICO DE ATENDIMENTO POR PESSOA"
                    FontName ="Cambria"
                    GridlineColor =-2147483609
                    LayoutCachedLeft =3345
                    LayoutCachedTop =1305
                    LayoutCachedWidth =8370
                    LayoutCachedHeight =1650
                    ThemeFontIndex =-1
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =1200
                    Top =1980
                    Width =5961
                    Height =390
                    FontSize =13
                    FontWeight =700
                    TabIndex =2
                    BorderColor =10921638
                    Name ="CSATENDIMENTOBASICO.Nome"
                    ControlSource ="TbPessoa.NOME"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    EventProcPrefix ="CSATENDIMENTOBASICO_Nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =1200
                    LayoutCachedTop =1980
                    LayoutCachedWidth =7161
                    LayoutCachedHeight =2370
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =1
                    BackStyle =0
                    IMESentenceMode =3
                    Left =9434
                    Top =2040
                    Width =1506
                    Height =315
                    FontWeight =700
                    TabIndex =3
                    BorderColor =10921638
                    Name ="CodFam"
                    ControlSource ="CodFam"
                    GridlineColor =10921638

                    LayoutCachedLeft =9434
                    LayoutCachedTop =2040
                    LayoutCachedWidth =10940
                    LayoutCachedHeight =2355
                    ForeTint =100.0
                    Begin
                        Begin Label
                            Left =7493
                            Top =2040
                            Width =1935
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo330"
                            Caption ="CÓDIGO FAMILIAR: "
                            GridlineColor =10921638
                            LayoutCachedLeft =7493
                            LayoutCachedTop =2040
                            LayoutCachedWidth =9428
                            LayoutCachedHeight =2355
                        End
                    End
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    IMESentenceMode =3
                    Left =6462
                    Top =283
                    Width =4311
                    Height =315
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    Name ="TbUnidade.Nome"
                    ControlSource ="TbUnidade.Nome"
                    Format =">"
                    EventProcPrefix ="TbUnidade_Nome"
                    GridlineColor =-2147483609

                    LayoutCachedLeft =6462
                    LayoutCachedTop =283
                    LayoutCachedWidth =10773
                    LayoutCachedHeight =598
                    ForeTint =100.0
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin Attachment
                    BackStyle =1
                    OldBorderStyle =0
                    Left =60
                    Width =5445
                    Height =1200
                    BorderColor =16777215
                    Name ="LOGO"
                    ControlSource ="LOGO"
                    GridlineColor =10921638

                    LayoutCachedLeft =60
                    LayoutCachedWidth =5505
                    LayoutCachedHeight =1200
                    BorderShade =100.0
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =1200
                    Top =2535
                    Width =1365
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo412"
                    Caption ="DataBenef"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =1200
                    LayoutCachedTop =2535
                    LayoutCachedWidth =2565
                    LayoutCachedHeight =3705
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =2625
                    Top =2535
                    Width =1740
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo417"
                    Caption ="DescreverItem"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =2625
                    LayoutCachedTop =2535
                    LayoutCachedWidth =4365
                    LayoutCachedHeight =3705
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =4425
                    Top =2535
                    Width =420
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo419"
                    Caption ="Qtd"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =4425
                    LayoutCachedTop =2535
                    LayoutCachedWidth =4845
                    LayoutCachedHeight =3705
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =4905
                    Top =2535
                    Width =525
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo420"
                    Caption ="ApoioAlim"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =4905
                    LayoutCachedTop =2535
                    LayoutCachedWidth =5430
                    LayoutCachedHeight =3705
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =5490
                    Top =2535
                    Width =525
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo421"
                    Caption ="AuxNatal"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =5490
                    LayoutCachedTop =2535
                    LayoutCachedWidth =6015
                    LayoutCachedHeight =3705
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =6075
                    Top =2535
                    Width =525
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo422"
                    Caption ="Cobertor"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =6075
                    LayoutCachedTop =2535
                    LayoutCachedWidth =6600
                    LayoutCachedHeight =3705
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =6660
                    Top =2535
                    Width =525
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo423"
                    Caption ="Colchonete"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =6660
                    LayoutCachedTop =2535
                    LayoutCachedWidth =7185
                    LayoutCachedHeight =3705
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    Vertical = NotDefault
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =7245
                    Top =2535
                    Width =525
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo424"
                    Caption ="Outro"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =7245
                    LayoutCachedTop =2535
                    LayoutCachedWidth =7770
                    LayoutCachedHeight =3705
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    OverlapFlags =4
                    TextAlign =2
                    Left =7830
                    Top =2535
                    Width =3030
                    Height =1170
                    FontSize =8
                    FontWeight =700
                    BackColor =14277081
                    Name ="Rótulo425"
                    Caption ="OutroDescrever"
                    GroupTable =1
                    GridlineColor =10921638
                    LayoutCachedLeft =7830
                    LayoutCachedTop =2535
                    LayoutCachedWidth =10860
                    LayoutCachedHeight =3705
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =1
                    BackShade =85.0
                    BorderTint =100.0
                    ForeTint =100.0
                    GroupTable =1
                End
            End
        End
        Begin Section
            KeepTogether = NotDefault
            Height =383
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =4
                    TextAlign =2
                    IMESentenceMode =3
                    Left =1200
                    Top =30
                    Width =1365
                    Height =315
                    FontSize =8
                    ForeColor =4210752
                    Name ="DataBenef"
                    ControlSource ="DataBenef"
                    GroupTable =1
                    GridlineColor =10921638
                    ShowDatePicker =1

                    LayoutCachedLeft =1200
                    LayoutCachedTop =30
                    LayoutCachedWidth =2565
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =4
                    TextAlign =2
                    IMESentenceMode =3
                    Left =2625
                    Top =30
                    Width =1740
                    Height =315
                    FontSize =8
                    TabIndex =1
                    ForeColor =4210752
                    Name ="DescreverItem"
                    ControlSource ="DescreverItem"
                    Format =">"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =2625
                    LayoutCachedTop =30
                    LayoutCachedWidth =4365
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    ColumnStart =1
                    ColumnEnd =1
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =4
                    TextAlign =2
                    IMESentenceMode =3
                    Left =4425
                    Top =30
                    Width =420
                    Height =315
                    FontSize =8
                    TabIndex =2
                    ForeColor =4210752
                    Name ="Qtd"
                    ControlSource ="Qtd"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =4425
                    LayoutCachedTop =30
                    LayoutCachedWidth =4845
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    ColumnStart =2
                    ColumnEnd =2
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
                Begin CheckBox
                    OverlapFlags =4
                    Left =4905
                    Top =30
                    Width =525
                    Height =315
                    TabIndex =3
                    Name ="ApoioAlim"
                    ControlSource ="ApoioAlim"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =4905
                    LayoutCachedTop =30
                    LayoutCachedWidth =5430
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    ColumnStart =3
                    ColumnEnd =3
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
                Begin CheckBox
                    OverlapFlags =4
                    Left =5490
                    Top =30
                    Width =525
                    Height =315
                    TabIndex =4
                    Name ="AuxNatal"
                    ControlSource ="AuxNatal"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =5490
                    LayoutCachedTop =30
                    LayoutCachedWidth =6015
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    ColumnStart =4
                    ColumnEnd =4
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
                Begin CheckBox
                    OverlapFlags =4
                    Left =6075
                    Top =30
                    Width =525
                    Height =315
                    TabIndex =5
                    Name ="Cobertor"
                    ControlSource ="Cobertor"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =6075
                    LayoutCachedTop =30
                    LayoutCachedWidth =6600
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    ColumnStart =5
                    ColumnEnd =5
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
                Begin CheckBox
                    OverlapFlags =4
                    Left =6660
                    Top =30
                    Width =525
                    Height =315
                    TabIndex =6
                    Name ="Colchonete"
                    ControlSource ="Colchonete"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =6660
                    LayoutCachedTop =30
                    LayoutCachedWidth =7185
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    ColumnStart =6
                    ColumnEnd =6
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
                Begin CheckBox
                    OverlapFlags =4
                    Left =7245
                    Top =30
                    Width =525
                    Height =315
                    TabIndex =7
                    Name ="Outro"
                    ControlSource ="Outro"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =7245
                    LayoutCachedTop =30
                    LayoutCachedWidth =7770
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    ColumnStart =7
                    ColumnEnd =7
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
                Begin TextBox
                    OverlapFlags =4
                    TextAlign =2
                    IMESentenceMode =3
                    Left =7830
                    Top =30
                    Width =3030
                    Height =315
                    FontSize =8
                    TabIndex =8
                    ForeColor =4210752
                    Name ="OutroDescrever"
                    ControlSource ="OutroDescrever"
                    Format =">"
                    GroupTable =1
                    GridlineColor =10921638

                    LayoutCachedLeft =7830
                    LayoutCachedTop =30
                    LayoutCachedWidth =10860
                    LayoutCachedHeight =345
                    RowStart =1
                    RowEnd =1
                    ColumnStart =8
                    ColumnEnd =8
                    LayoutGroup =1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    GroupTable =1
                End
            End
        End
        Begin PageFooter
            Height =2080
            Name ="PageFooterSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =3
                    BackStyle =0
                    IMESentenceMode =3
                    Left =4488
                    Width =6690
                    FontSize =8
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Texto26"
                    ControlSource ="=\"Página \" & [Page] & \" de \" & [Pages]"
                    GridlineColor =-2147483609

                    LayoutCachedLeft =4488
                    LayoutCachedWidth =11178
                    LayoutCachedHeight =240
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =630
                    Top =120
                    Width =10206
                    Height =270
                    FontSize =10
                    FontWeight =700
                    TabIndex =1
                    BorderColor =10921638
                    Name ="DIRETOR(A)"
                    ControlSource ="DIRETOR(A)"
                    Format =">"
                    EventProcPrefix ="DIRETOR_A_"
                    GridlineColor =10921638

                    LayoutCachedLeft =630
                    LayoutCachedTop =120
                    LayoutCachedWidth =10836
                    LayoutCachedHeight =390
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =630
                    Top =405
                    Width =10206
                    FontSize =8
                    TabIndex =2
                    BorderColor =10921638
                    Name ="FUNÇÃO"
                    ControlSource ="FUNÇÃO"
                    Format =">"
                    GridlineColor =10921638

                    LayoutCachedLeft =630
                    LayoutCachedTop =405
                    LayoutCachedWidth =10836
                    LayoutCachedHeight =645
                    ForeTint =100.0
                End
                Begin TextBox
                    OldBorderStyle =0
                    TextAlign =2
                    BackStyle =0
                    IMESentenceMode =3
                    Left =630
                    Top =615
                    Width =10206
                    FontSize =8
                    TabIndex =3
                    BorderColor =10921638
                    Name ="MATRICULA"
                    ControlSource ="MATRICULA"
                    GridlineColor =10921638

                    LayoutCachedLeft =630
                    LayoutCachedTop =615
                    LayoutCachedWidth =10836
                    LayoutCachedHeight =855
                    ForeTint =100.0
                End
                Begin Attachment
                    OldBorderStyle =0
                    Left =1313
                    Top =850
                    Width =9060
                    Height =1230
                    BorderColor =10921638
                    Name ="RODAPE"
                    ControlSource ="RODAPE"
                    GridlineColor =-2147483609
                    TabIndex =4

                    LayoutCachedLeft =1313
                    LayoutCachedTop =850
                    LayoutCachedWidth =10373
                    LayoutCachedHeight =2080
                    GridlineThemeColorIndex =-1
                    GridlineShade =100.0
                End
            End
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
