Operation =1
Option =0
Begin InputTables
    Name ="cs distinct pbf"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="TbPessoa.Nome"
    Expression ="[cs distinct pbf].TITULAR"
    Expression ="TbPessoa.CodFam"
    Expression ="CadResidencia.[PBF FAMILIA]"
    Expression ="CadResidencia.Volante"
End
Begin Joins
    LeftTable ="cs distinct pbf"
    RightTable ="TbPessoa"
    Expression ="[cs distinct pbf].TITULAR = TbPessoa.Nome"
    Flag =1
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
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
        dbText "Name" ="[cs distinct pbf].TITULAR"
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
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1108
    Bottom =660
    Left =-1
    Top =-1
    Right =1084
    Bottom =204
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="cs distinct pbf"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =477
        Bottom =337
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =570
        Top =5
        Right =714
        Bottom =293
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
