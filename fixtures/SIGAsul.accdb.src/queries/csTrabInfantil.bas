Operation =1
Option =0
Where ="(((TbViolacoes.TrabInf)=Yes) AND ((TbViolacoes.SupTrabInf) Is Null))"
Begin InputTables
    Name ="TbViolacoes"
End
Begin OutputColumns
    Expression ="TbViolacoes.CodViol"
    Expression ="TbViolacoes.TecnicoResp"
    Expression ="TbViolacoes.NomePessoa"
    Expression ="TbViolacoes.CodFam"
    Expression ="TbViolacoes.data"
    Expression ="TbViolacoes.TrabInf"
    Expression ="TbViolacoes.SupTrabInf"
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="TbViolacoes.TecnicoResp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.NomePessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.CodViol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.TrabInf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbViolacoes.SupTrabInf"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1097
    Bottom =628
    Left =-1
    Top =-1
    Right =1029
    Bottom =227
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =207
        Top =2
        Right =351
        Bottom =267
        Top =0
        Name ="TbViolacoes"
        Name =""
    End
End
