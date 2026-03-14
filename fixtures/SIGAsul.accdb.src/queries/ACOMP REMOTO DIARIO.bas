Operation =1
Option =0
Where ="(((TbAtend.Acoremoto)=Yes) AND ((TbAtend.Data) Between [DATA INICIAL] And [DATA "
    "FINAL]))"
Begin InputTables
    Name ="TbAtend"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Volante"
    Expression ="TbAtend.NomeFunc"
    Expression ="TbAtend.FuncaoFuncionario"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Expression ="TbAtend.DemandaBPC"
    Expression ="TbAtend.DemandaINSS"
    Expression ="TbAtend.DemandaSCFV"
    Expression ="TbAtend.DemandaEduc"
    Expression ="TbAtend.DemandaSaude"
    Expression ="TbAtend.DemandaJustiça"
    Expression ="TbAtend.DemandaBenefMun"
    Expression ="TbAtend.DemandaAuxNatal"
    Expression ="TbAtend.DemandaGratTransp"
    Expression ="TbAtend.DemandaDocCivil"
    Expression ="TbAtend.DemandaApoioAlim"
    Expression ="TbAtend.[Outra Demanda]"
    Expression ="TbAtend.[Especif Outra]"
    Expression ="TbAtend.OBS"
    Expression ="TbAtend.Acoremoto"
    Expression ="TbAtend.Data"
    Expression ="TbPessoa.PROVICN"
    Expression ="TbPessoa.PROVIRG"
    Expression ="TbPessoa.PROVICTPS"
    Expression ="TbPessoa.PROVICPF"
    Expression ="TbPessoa.PROVITE"
    Expression ="TbPessoa.Autismo"
    Expression ="TbPessoa.Cegueira"
    Expression ="TbPessoa.[Baixa visão]"
    Expression ="TbPessoa.[Surdez severa profunda]"
    Expression ="TbPessoa.[Surdez leve moderada]"
    Expression ="TbPessoa.[Deficiencia fisica]"
    Expression ="TbPessoa.[Defic mental intelec]"
    Expression ="TbPessoa.[Sindrome down]"
    Expression ="TbPessoa.[Transt doença mental]"
    Expression ="TbPessoa.DoencaCronica"
    Expression ="TbPessoa.BPCD"
    Expression ="TbPessoa.BPCI"
End
Begin Joins
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1035"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Especif Outra]"
        dbInteger "ColumnWidth" ="1665"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaJustiça"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBenefMun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaAuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaGratTransp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DESDOBRAMENTO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Acoremoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.OBS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.FuncaoFuncionario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.BPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DoencaCronica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Autismo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.PROVITE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.BPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =56
    Top =36
    Right =1180
    Bottom =656
    Left =-1
    Top =-1
    Right =1100
    Bottom =280
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =54
        Top =43
        Right =202
        Bottom =288
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =307
        Top =11
        Right =465
        Bottom =362
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
