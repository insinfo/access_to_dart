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
    Width =11022
    DatasheetFontHeight =11
    ItemSuffix =157
    Left =1350
    Top =3360
    RecSrcDt = Begin
        0xd5c72f54bdfce540
    End
    RecordSource ="CSPRONT1"
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
        Begin PageHeader
            Height =0
            Name ="PageHeaderSection"
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
        End
        Begin Section
            KeepTogether = NotDefault
            Height =15285
            Name ="Detalhe"
            AlternateBackThemeColorIndex =1
            BackThemeColorIndex =1
            Begin
                Begin Label
                    BackStyle =1
                    OldBorderStyle =1
                    Left =510
                    Top =963
                    Width =9855
                    Height =345
                    FontSize =14
                    FontWeight =700
                    BackColor =10469818
                    Name ="Rótulo60"
                    Caption ="PLANEJAMENTO E EVOLUÇÃO DO ACOMPANHAMENTO FAMILIAR "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =963
                    LayoutCachedWidth =10365
                    LayoutCachedHeight =1308
                    BackThemeColorIndex =-1
                    BorderTint =100.0
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =1395
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo62"
                    Caption ="REGISTRO SINTÉTICO DE AVALIAÇÃO DE RESULTADOS DO ACOMPANHAMENTO FAMILIAR "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =1395
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =1650
                    ForeTint =100.0
                End
                Begin Image
                    PictureType =2
                    Left =453
                    Top =510
                    Width =567
                    Height =454
                    BorderColor =10921638
                    Name ="Imagem96"
                    Picture ="logo-SUAS-ICON"
                    GridlineColor =10921638

                    LayoutCachedLeft =453
                    LayoutCachedTop =510
                    LayoutCachedWidth =1020
                    LayoutCachedHeight =964
                    TabIndex =2
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =1854
                    Top =637
                    Width =1371
                    Height =315
                    FontWeight =700
                    BackColor =14675966
                    Name ="CadResidencia.CodFam"
                    ControlSource ="CodFam"
                    EventProcPrefix ="CadResidencia_CodFam"
                    GridlineColor =10921638

                    LayoutCachedLeft =1854
                    LayoutCachedTop =637
                    LayoutCachedWidth =3225
                    LayoutCachedHeight =952
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =1008
                            Top =637
                            Width =825
                            Height =315
                            FontWeight =700
                            BackColor =10469818
                            Name ="Rótulo186"
                            Caption ="CodFam"
                            GridlineColor =10921638
                            LayoutCachedLeft =1008
                            LayoutCachedTop =637
                            LayoutCachedWidth =1833
                            LayoutCachedHeight =952
                            BackThemeColorIndex =-1
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin TextBox
                    TextAlign =1
                    IMESentenceMode =3
                    Left =3984
                    Top =637
                    Width =6381
                    Height =315
                    FontWeight =700
                    TabIndex =1
                    BackColor =14675966
                    Name ="Nome"
                    ControlSource ="TbPessoa.NOME"
                    Format =">"
                    StatusBarText ="Em caso de homônimo, colocar o CPF, RG ou data de nascimento na frente do nome"
                    GridlineColor =10921638

                    LayoutCachedLeft =3984
                    LayoutCachedTop =637
                    LayoutCachedWidth =10365
                    LayoutCachedHeight =952
                    BackThemeColorIndex =-1
                    BorderThemeColorIndex =0
                    BorderShade =100.0
                    ForeTint =100.0
                    Begin
                        Begin Label
                            BackStyle =1
                            OldBorderStyle =1
                            Left =3243
                            Top =637
                            Width =720
                            Height =315
                            FontWeight =700
                            BackColor =10469818
                            Name ="Rótulo187"
                            Caption ="Nome: "
                            GridlineColor =10921638
                            LayoutCachedLeft =3243
                            LayoutCachedTop =637
                            LayoutCachedWidth =3963
                            LayoutCachedHeight =952
                            BackThemeColorIndex =-1
                            BorderTint =100.0
                            ForeTint =100.0
                        End
                    End
                End
                Begin Rectangle
                    BackStyle =0
                    Left =510
                    Top =1757
                    Width =9859
                    Height =1871
                    BorderColor =10921638
                    Name ="Caixa65"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =1757
                    LayoutCachedWidth =10369
                    LayoutCachedHeight =3628
                End
                Begin Label
                    Left =720
                    Top =1920
                    Width =9435
                    Height =825
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo66"
                    Caption ="A Avaliação de Resultados do Acompanhamento Familiar pode ser realizada a qualqu"
                        "er momento, a critério do profissional responsável. Entretanto, recomenda-se que"
                        " o registro sintético da avaliação de resultados seja preenchido, no mínimo, uma"
                        " vez a cada seis meses durante o período de acompanhamento; e origatoriamente, s"
                        "empre que houver o desligamento de uma família do PAIF ou PAEFI."
                    GridlineColor =10921638
                    LayoutCachedLeft =720
                    LayoutCachedTop =1920
                    LayoutCachedWidth =10155
                    LayoutCachedHeight =2745
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =3855
                    Width =9855
                    Height =285
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo67"
                    Caption ="Nome do profissional responsável: ______________________________________________"
                        "_____________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =3855
                    LayoutCachedWidth =10365
                    LayoutCachedHeight =4140
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =10148
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo87"
                    Caption ="Em caso de desligamento, após a segunda reavaliação, preencher se a família prec"
                        "isa de novo acompanhamento:"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =10148
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =10403
                    ForeTint =100.0
                End
                Begin Label
                    Left =495
                    Top =10560
                    Width =2175
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo88"
                    Caption ="SIM (   )   NÃO (   )"
                    GridlineColor =10921638
                    LayoutCachedLeft =495
                    LayoutCachedTop =10560
                    LayoutCachedWidth =2670
                    LayoutCachedHeight =10815
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =11610
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo90"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =11610
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =11865
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =11985
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo91"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =11985
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =12240
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =12375
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo92"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =12375
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =12630
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =12750
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo93"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =12750
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =13005
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =13125
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo94"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =13125
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =13380
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =13500
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo95"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =13500
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =13755
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =13875
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo96"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =13875
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =14130
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =14235
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo97"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =14235
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =14490
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =14625
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo98"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =14625
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =14880
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =15030
                    Width =9750
                    Height =255
                    FontSize =10
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo99"
                    Caption ="________________________________________________________________________________"
                        "___________________________"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =15030
                    LayoutCachedWidth =10260
                    LayoutCachedHeight =15285
                    ForeTint =100.0
                End
                Begin Label
                    Left =720
                    Top =2775
                    Width =9330
                    Height =825
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo100"
                    Caption ="A Avaliação de Resultados deve ser realizada com a participação da família acomp"
                        "anhada (ou indivíduo), e a avaliação do profissional também deve considerar as o"
                        "piniões e percepções da própria família  (ou indivíduo). Deve, ainda, haver espe"
                        "cial atençãocom a identificação dos fatores que contribuíram ou que dificultaram"
                        " o alcance dos resultados esperados."
                    GridlineColor =10921638
                    LayoutCachedLeft =720
                    LayoutCachedTop =2775
                    LayoutCachedWidth =10050
                    LayoutCachedHeight =3600
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =4095
                    Width =9855
                    Height =285
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo101"
                    Caption ="Data da avaliação: _____/_____/______________     Número de meses que a família "
                        "está sendo acompanhada: |__|__| meses"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =4095
                    LayoutCachedWidth =10365
                    LayoutCachedHeight =4380
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =4590
                    Width =10155
                    Height =450
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo102"
                    Caption ="Foram efetivamente disponibilizadas para a família/indivíduo todas as ofertas de"
                        " Assistência Social (em termos de serviços, benefícios, programas e projetos cuj"
                        "a necessidade havia sido identificada pelo profissional?"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =4590
                    LayoutCachedWidth =10665
                    LayoutCachedHeight =5040
                    ForeTint =100.0
                End
                Begin Label
                    Left =514
                    Top =5043
                    Width =9855
                    Height =285
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo103"
                    Caption ="|__| Sim         |__| Parcialmente         |__| Não"
                    GridlineColor =10921638
                    LayoutCachedLeft =514
                    LayoutCachedTop =5043
                    LayoutCachedWidth =10369
                    LayoutCachedHeight =5328
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =5580
                    Width =10155
                    Height =450
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo104"
                    Caption ="Em relação aos encaminhamentos da família/indivíduo para as demais políticas, ho"
                        "uve atendimento efetivo e resolutivo por parte da área que recebeu os encaminham"
                        "entos?"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =5580
                    LayoutCachedWidth =10665
                    LayoutCachedHeight =6030
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =6009
                    Width =10140
                    Height =285
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo105"
                    Caption ="|__| Sim         |__| Parcialmente         |__| Não           |__| Não se aplica"
                        ", pois houve necessidade de encaminhamento para "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =6009
                    LayoutCachedWidth =10650
                    LayoutCachedHeight =6294
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =7230
                    Width =9855
                    Height =285
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo106"
                    Caption ="|__| Sim             |__| Parcialmente         |__| Não"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =7230
                    LayoutCachedWidth =10365
                    LayoutCachedHeight =7515
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =6746
                    Width =10155
                    Height =450
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo107"
                    Caption ="A família reconhece o Serviço de Aconpanhamento como algo que contribuiu para a "
                        "superação ou enfrentamento dos problemas e dificuldades e deseja continuar receb"
                        "endo atenções desse serviço?"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =6746
                    LayoutCachedWidth =10665
                    LayoutCachedHeight =7196
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =8190
                    Width =6465
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo108"
                    Caption ="|__| Houve um agravamento/piora em relação à situação inicial da família/indivíd"
                        "uo "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =8190
                    LayoutCachedWidth =6975
                    LayoutCachedHeight =8460
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =7740
                    Width =10155
                    Height =450
                    FontSize =9
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo109"
                    Caption ="Como você classifica os resultados obtidos, até o presente momento, no que se re"
                        "fere à ampliação da capacidade de enfrentamento ou superação das condições de vu"
                        "lnerabilidade e/ou risco social e pessoal por parte da família/indivíduo?"
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =7740
                    LayoutCachedWidth =10665
                    LayoutCachedHeight =8190
                    ForeTint =100.0
                End
                Begin Label
                    Left =4755
                    Top =6240
                    Width =1125
                    Height =285
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo110"
                    Caption ="outras áreas."
                    GridlineColor =10921638
                    LayoutCachedLeft =4755
                    LayoutCachedTop =6240
                    LayoutCachedWidth =5880
                    LayoutCachedHeight =6525
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =8415
                    Width =6465
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo111"
                    Caption ="|__| A situação atual é equivalente à situação inicial, sem avanços identificáve"
                        "is "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =8415
                    LayoutCachedWidth =6975
                    LayoutCachedHeight =8685
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =8655
                    Width =8265
                    Height =270
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo112"
                    Caption ="|__| Houve avanço/melhora da capacidade de enfrentamento ou de superação dos ris"
                        "cos e vulnerabilidades  "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =8655
                    LayoutCachedWidth =8775
                    LayoutCachedHeight =8925
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =8895
                    Width =10320
                    Height =255
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo113"
                    Caption ="|__| Houve significativo avanço/melhora da capacidade de enfrentamento ou de sup"
                        "eração dos riscos e vulnerabilidades, justificando-se "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =8895
                    LayoutCachedWidth =10830
                    LayoutCachedHeight =9150
                    ForeTint =100.0
                End
                Begin Label
                    Left =810
                    Top =9150
                    Width =10155
                    Height =480
                    FontSize =9
                    BorderColor =8355711
                    Name ="Rótulo114"
                    Caption ="o desligamento do acompanhamento sistemático, sem prejuízo da eventual permanênc"
                        "ia da família ou indivíduo em outros programas, projetos, serviços ou benefícios"
                        " da Assistência Social"
                    GridlineColor =10921638
                    LayoutCachedLeft =810
                    LayoutCachedTop =9150
                    LayoutCachedWidth =10965
                    LayoutCachedHeight =9630
                    ForeTint =100.0
                End
                Begin Label
                    Left =510
                    Top =11175
                    Width =9810
                    Height =240
                    FontSize =8
                    FontWeight =700
                    BorderColor =8355711
                    Name ="Rótulo115"
                    Caption ="Registre, descritivamente, os principaos resultados alcançados, bem como fatores"
                        " que contribuíram ou dificultaram o alcance dos resultados:  "
                    GridlineColor =10921638
                    LayoutCachedLeft =510
                    LayoutCachedTop =11175
                    LayoutCachedWidth =10320
                    LayoutCachedHeight =11415
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
