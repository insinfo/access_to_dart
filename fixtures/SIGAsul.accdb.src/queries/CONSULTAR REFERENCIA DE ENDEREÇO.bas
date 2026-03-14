Operation =1
Option =0
Where ="(((CadResidencia.Referencia) Like \"*\"+[Informe a referencia:] & \"*\"))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.Endereço"
    Expression ="CadResidencia.Bairro"
    Expression ="CadResidencia.Referencia"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.DNasc"
End
Begin Joins
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
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Referencia"
        dbInteger "ColumnWidth" ="4500"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1376
    Bottom =677
    Left =-1
    Top =-1
    Right =1352
    Bottom =326
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =340
        Bottom =284
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =539
        Top =25
        Right =817
        Bottom =265
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
