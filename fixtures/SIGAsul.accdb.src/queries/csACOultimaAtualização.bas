Operation =1
Option =0
Begin InputTables
    Name ="csACOatualizado"
    Name ="CadResidencia"
    Name ="CadResidAtualizacao"
End
Begin OutputColumns
    Expression ="csACOatualizado.CodPessoa"
    Expression ="CadResidencia.CodFam"
    Expression ="csACOatualizado.Nome"
    Alias ="MáxDeDATA ATUALIZ"
    Expression ="Max(CadResidAtualizacao.[DATA ATUALIZ])"
    Expression ="csACOatualizado.[PAF inicio]"
    Expression ="CadResidencia.DataCad"
    Expression ="csACOatualizado.CodFam"
    Expression ="csACOatualizado.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="csACOatualizado.Parentesco"
    Expression ="csACOatualizado.CPF"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="CadResidAtualizacao"
    Expression ="CadResidencia.CodFam = CadResidAtualizacao.CodCadResd"
    Flag =1
    LeftTable ="CadResidencia"
    RightTable ="csACOatualizado"
    Expression ="CadResidencia.CodFam = csACOatualizado.CodFam"
    Flag =1
End
Begin OrderBy
    Expression ="csACOatualizado.Nome"
    Flag =0
End
Begin Groups
    Expression ="csACOatualizado.CodPessoa"
    GroupLevel =0
    Expression ="CadResidencia.CodFam"
    GroupLevel =0
    Expression ="csACOatualizado.Nome"
    GroupLevel =0
    Expression ="csACOatualizado.[PAF inicio]"
    GroupLevel =0
    Expression ="CadResidencia.DataCad"
    GroupLevel =0
    Expression ="csACOatualizado.CodFam"
    GroupLevel =0
    Expression ="csACOatualizado.DNasc"
    GroupLevel =0
    Expression ="csACOatualizado.Parentesco"
    GroupLevel =0
    Expression ="csACOatualizado.CPF"
    GroupLevel =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbSingle "ECLScaleFactor" ="1"
dbMemo "OrderBy" ="[Lookup_Nome].[Nome]"
Begin
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MáxDeDATA ATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =64
    Top =8
    Right =1102
    Bottom =619
    Left =-1
    Top =-1
    Right =1014
    Bottom =207
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =283
        Top =0
        Name ="csACOatualizado"
        Name =""
    End
    Begin
        Left =329
        Top =-1
        Right =486
        Bottom =232
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =554
        Top =1
        Right =836
        Bottom =311
        Top =0
        Name ="CadResidAtualizacao"
        Name =""
    End
End
