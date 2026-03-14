Operation =1
Option =0
Where ="(((TbPessoa.CodFam) Between [DIGITE O PRIMEIRO CODIGO] And [DIGITE O ULTIMO CODI"
    "GO]) AND ((TbPessoa.Parentesco)=\"Pessoa de Referencia\"))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
End
Begin OrderBy
    Expression ="TbPessoa.CodFam"
    Flag =0
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
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3225"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1065"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1245"
        dbBoolean "ColumnHidden" ="0"
    End
End
Begin
    State =0
    Left =-95
    Top =33
    Right =1016
    Bottom =653
    Left =-1
    Top =-1
    Right =1087
    Bottom =306
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =290
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
