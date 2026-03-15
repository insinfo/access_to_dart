Version =20
VersionRequired =20
Begin Form
    PopUp = NotDefault
    DividingLines = NotDefault
    KeyPreview = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =15930
    DatasheetFontHeight =11
    ItemSuffix =4
    Left =1860
    Top =2775
    Right =18330
    Bottom =9165
    RecSrcDt = Begin
        0x3ff292b8cd38e540
    End
    DatasheetFontName ="Calibri"
    OnKeyPress ="[Event Procedure]"
    FilterOnLoad =0
    OnOpenEmMacro = Begin
        Version =196611
        ColumnsShown =0
        Begin
            Action ="GoToControl"
            Argument ="TxtNome"
        End
        Begin
            Comment ="_AXL:<?xml version=\"1.0\" encoding=\"UTF-16\" standalone=\"no\"?>\015\012<UserI"
                "nterfaceMacro Event=\"OnOpen\" xmlns=\"http://schemas.microsoft.com/office/acces"
                "sservices/2009/11/application\" xmlns:a=\"http://schemas.microsoft.com/office/ac"
                "cessservices/2009/11/forms\"><S"
        End
        Begin
            Comment ="_AXL:tatements><Action Name=\"GoToControl\"><Argument Name=\"ControlName\">TxtNo"
                "me</Argument></Action></Statements></UserInterfaceMacro>"
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
        Begin ListBox
            BorderLineStyle =0
            Width =1701
            Height =1417
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AllowValueListEdits =1
            InheritValueList =1
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            Height =6406
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =2141
                    Top =113
                    Width =7956
                    Height =315
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="TxtNome"
                    AfterUpdate ="[Event Procedure]"
                    OnChange ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedLeft =2141
                    LayoutCachedTop =113
                    LayoutCachedWidth =10097
                    LayoutCachedHeight =428
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =170
                            Top =113
                            Width =1935
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Rótulo1"
                            Caption ="CONSULTAR NOME: "
                            GridlineColor =10921638
                            LayoutCachedLeft =170
                            LayoutCachedTop =113
                            LayoutCachedWidth =2105
                            LayoutCachedHeight =428
                        End
                    End
                End
                Begin ListBox
                    ColumnHeads = NotDefault
                    OverlapFlags =85
                    IMESentenceMode =3
                    ColumnCount =10
                    Top =793
                    Width =15750
                    Height =5047
                    TabIndex =1
                    ForeColor =4210752
                    BorderColor =10921638
                    Name ="listausuario"
                    RowSourceType ="Table/Query"
                    RowSource ="SELECT TbBeneficioEmergencial.CodBenef, TbBeneficioEmergencial.DataBenef, TbPess"
                        "oa.Nome, TbBeneficioEmergencial.Qtd, TbBeneficioEmergencial.ApoioAlim, TbBenefic"
                        "ioEmergencial.AuxNatal, TbBeneficioEmergencial.Cobertor, TbBeneficioEmergencial."
                        "Colchonete, TbBeneficioEmergencial.Outro, TbBeneficioEmergencial.OutroDescrever "
                        "FROM TbPessoa INNER JOIN TbBeneficioEmergencial ON TbPessoa.CodPessoa = TbBenefi"
                        "cioEmergencial.Nome WHERE (((TbPessoa.Nome) Like \"*\" & [Formulários]![Pesquisa"
                        "rBenefEmerg].[TxtNome] & \"*\")) ORDER BY TbBeneficioEmergencial.DataBenef DESC "
                        ", TbPessoa.Nome; "
                    ColumnWidths ="1134;1134;2835;1134;1134;1134;1134;1134;1134;1134"
                    OnClick ="[Event Procedure]"
                    GridlineColor =10921638

                    LayoutCachedTop =793
                    LayoutCachedWidth =15750
                    LayoutCachedHeight =5840
                End
            End
        End
    End
End
CodeBehindForm
' See "PesquisarBenefEmerg.cls"
