Operation =1
Option =2
Where ="(((TbAtend.Data) Between [MÊS INICIAL DO ANO] And [MÊS DE FECHAMENTO]))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbAtend"
End
Begin OutputColumns
    Expression ="TbAtend.Nome"
    Expression ="TbPessoa.DNasc"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
    Flag =1
End
Begin OrderBy
    Expression ="TbAtend.Nome"
    Flag =0
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
dbMemo "OrderBy" ="[Lookup_Nome].[Nome]"
Begin
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =456
    Top =45
    Right =1072
    Bottom =658
    Left =-1
    Top =-1
    Right =592
    Bottom =228
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =280
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
