Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbCadFuncionario"
    ".Nome) Like [DIGITE O TÉCNICO]+\"*\"))"
Begin InputTables
    Name ="TbAtend"
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="TbCadFuncionario"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.CRAS"
    Alias ="UNIDADE"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="CadResidencia.DataCad"
    Expression ="TbPessoa.Nome"
    Expression ="TbCadFuncionario.Nome"
    Expression ="TbCadFuncionario.[Carga Horária]"
    Expression ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
    Expression ="TbAtend.FuncaoFuncionario"
    Expression ="TbAtend.AcolhidaPartic"
    Expression ="TbAtend.AtRemoto"
    Expression ="TbAtend.Acoremoto"
    Expression ="TbAtend.Volante"
    Expression ="TbAtend.VD"
    Expression ="TbAtend.[ESTUDO SOCIAL]"
    Expression ="TbAtend.[Acolhida Coletiva]"
    Expression ="TbAtend.[ART INSTITUC]"
    Expression ="TbAtend.RELATORIO"
    Expression ="TbAtend.VDLFR"
    Expression ="TbAtend.VDCDL"
    Expression ="TbAtend.VDDCP"
    Expression ="TbAtend.VDDPAF"
    Expression ="TbAtend.VDAMF"
    Expression ="TbAtend.VDFVI"
    Expression ="TbAtend.VDAMD"
    Expression ="TbAtend.VDASF"
    Expression ="TbAtend.VDPBF"
    Expression ="TbAtend.VDSCFV"
    Expression ="TbAtend.VDOUT"
    Expression ="TbAtend.[QUAL VD]"
    Expression ="TbAtend.[VD NAO LOCALIZADA]"
    Expression ="TbAtend.Administrativo"
    Expression ="TbAtend.Social"
    Expression ="TbAtend.Psicologico"
    Expression ="TbAtend.Multidisciplinar"
    Expression ="TbAtend.OrientadorSoc"
    Expression ="TbAtend.AtGestao"
    Expression ="TbAtend.DemandaBPC"
    Expression ="TbAtend.DemandaINSS"
    Expression ="TbAtend.DemandaSCFV"
    Expression ="TbAtend.DemandaEduc"
    Expression ="TbAtend.DemandaSaude"
    Expression ="TbAtend.DemandaJustiça"
    Expression ="TbAtend.DemandaBenefMun"
    Expression ="TbAtend.DemandaAuxNatal"
    Expression ="TbAtend.DemandaGratTransp"
    Expression ="TbAtend.DemandaRecJus"
    Expression ="TbAtend.DemandaDocCivil"
    Expression ="TbAtend.DemandaApoioAlim"
    Expression ="TbAtend.[Outra Demanda]"
    Expression ="TbAtend.[Especif Outra]"
    Expression ="TbAtend.OBS"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbCadFuncionario"
    RightTable ="TbAtend"
    Expression ="TbCadFuncionario.CodFunc = TbAtend.CodFunc"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="3945"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Psicologico"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Social"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Administrativo"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.OrientadorSoc"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.MULTIDISCIPLINAR"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1995"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.Nome"
        dbInteger "ColumnWidth" ="2250"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[FUNÇÃO NO SISTEMA]"
        dbInteger "ColumnWidth" ="1890"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Acolhida Coletiva]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.OBS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Multidisciplinar"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[ART INSTITUC]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaJustiça"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.RELATORIO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[ESTUDO SOCIAL]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AcolhidaPartic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AtRemoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDOUT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Acoremoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaGratTransp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDAMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDFVI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDLFR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDCDL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBenefMun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDDCP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDDPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDAMF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDASF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[QUAL VD]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[VD NAO LOCALIZADA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaAuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Especif Outra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1060
    Bottom =660
    Left =-1
    Top =-1
    Right =992
    Bottom =266
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =284
        Top =8
        Right =437
        Bottom =227
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =683
        Top =21
        Right =827
        Bottom =165
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =544
        Top =12
        Right =688
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =107
        Top =15
        Right =251
        Bottom =275
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
    Begin
        Left =856
        Top =8
        Right =1000
        Bottom =206
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
