Operation =1
Option =2
Where ="(((TbPessoa.Parentesco)=\"pessoa de referencia\"))"
Begin InputTables
    Name ="TbPBF08"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPBF08.TITULAR"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.Parentesco"
End
Begin Joins
    LeftTable ="TbPBF08"
    RightTable ="TbPessoa"
    Expression ="TbPBF08.TITULAR = TbPessoa.Nome"
    Flag =3
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPBF08.TITULAR"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="1845"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1175
    Bottom =660
    Left =-1
    Top =-1
    Right =1151
    Bottom =169
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =658
        Top =-6
        Right =802
        Bottom =138
        Top =0
        Name ="TbPBF08"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
