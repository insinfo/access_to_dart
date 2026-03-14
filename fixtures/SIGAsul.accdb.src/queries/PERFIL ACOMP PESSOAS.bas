Operation =1
Option =0
Where ="(((TbPessoa.DataDesligPes) Is Null) AND ((TbPessoa.MotivoDeslPes) Is Null))"
Begin InputTables
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.MotivoDeslPes"
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
        dbText "Name" ="TbPessoa.MotivoDeslPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1069
    Bottom =660
    Left =-1
    Top =-1
    Right =1001
    Bottom =223
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
