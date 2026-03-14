Operation =1
Option =2
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="TbAtend"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="TbAtend.Nome"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
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
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =77
    Top =49
    Right =1141
    Bottom =550
    Left =-1
    Top =-1
    Right =1040
    Bottom =172
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =23
        Top =61
        Right =167
        Bottom =205
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =209
        Top =41
        Right =353
        Bottom =185
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =428
        Top =13
        Right =572
        Bottom =198
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
