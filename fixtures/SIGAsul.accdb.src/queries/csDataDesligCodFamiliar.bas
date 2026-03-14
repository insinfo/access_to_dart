Operation =1
Option =0
Where ="(((CadResidencia.DataDesligResid) Is Not Null))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.[Nº Cras]"
    Expression ="CadResidencia.DataDesligResid"
    Expression ="CadResidencia.MotivoDeslResid"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.MotivoDeslPes"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
End
Begin OrderBy
    Expression ="CadResidencia.CodFam"
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
dbSingle "ECLScaleFactor" ="1"
dbMemo "OrderBy" ="[csDataDesligCodFamiliar].[MotivoDeslResid]"
Begin
    Begin
        dbText "Name" ="TbPessoa.MotivoDeslPes"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1965"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbInteger "ColumnWidth" ="3015"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.MotivoDeslResid"
        dbInteger "ColumnWidth" ="2580"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº Cras]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1090
    Bottom =685
    Left =-1
    Top =-1
    Right =1022
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =200
        Bottom =286
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =426
        Top =18
        Right =878
        Bottom =320
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
