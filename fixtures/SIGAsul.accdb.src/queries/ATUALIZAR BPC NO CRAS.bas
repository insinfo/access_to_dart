Operation =1
Option =2
Begin InputTables
    Name ="TbPessoa"
    Name ="BPC"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="BPC.NomeTitular"
    Expression ="BPC.[Especie Ben]"
    Expression ="BPC.Situacao"
    Expression ="CadResidencia.Volante"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="BPC"
    Expression ="TbPessoa.Nome = BPC.NomeTitular"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="CadResidencia"
    Expression ="TbPessoa.CodFam = CadResidencia.CodFam"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="BPC.Situacao"
        dbInteger "ColumnWidth" ="1695"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.[Especie Ben]"
        dbInteger "ColumnWidth" ="2265"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPC.NomeTitular"
        dbInteger "ColumnWidth" ="4065"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =283
    Top =60
    Right =969
    Bottom =627
    Left =-1
    Top =-1
    Right =662
    Bottom =202
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =106
        Top =8
        Right =250
        Bottom =216
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =315
        Top =13
        Right =459
        Bottom =221
        Top =0
        Name ="BPC"
        Name =""
    End
    Begin
        Left =507
        Top =12
        Right =651
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
