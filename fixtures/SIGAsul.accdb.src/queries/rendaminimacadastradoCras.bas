Operation =1
Option =0
Begin InputTables
    Name ="TbPessoa"
    Name ="rendaminimaFam"
End
Begin OutputColumns
    Expression ="rendaminimaFam.Nome"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.NIS"
    Expression ="TbPessoa.CodFam"
    Expression ="rendaminimaFam.CRAS"
    Alias ="nisrenda"
    Expression ="rendaminimaFam.nis"
    Expression ="TbPessoa.DataDesligPes"
End
Begin Joins
    LeftTable ="rendaminimaFam"
    RightTable ="TbPessoa"
    Expression ="rendaminimaFam.nome = TbPessoa.Nome"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
dbMemo "OrderBy" ="[TbPessoa].[Nome]"
Begin
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rendaminimaPessoas.Nome"
        dbInteger "ColumnWidth" ="4755"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nisrenda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rendaminimaPessoas.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rendaminimaPessoas.nis"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rendaminimaFam.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rendaminimaFam.Nome"
        dbInteger "ColumnWidth" ="4755"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1402
    Bottom =685
    Left =-1
    Top =-1
    Right =1045
    Bottom =296
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =382
        Top =2
        Right =636
        Bottom =307
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =91
        Top =22
        Right =235
        Bottom =261
        Top =0
        Name ="rendaminimaFam"
        Name =""
    End
End
