Operation =1
Option =0
Where ="(((CadResidencia.DataCad)<=[DATA FINAL]) AND ((CadResidencia.DataDesligResid) Is"
    " Null Or (CadResidencia.DataDesligResid)>=[DATA FINAL]))"
Begin InputTables
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="CadResidencia.[Nº Cras]"
    Expression ="CadResidencia.DataDesligResid"
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
        dbText "Name" ="CadResidencia.[CRAS Origem]"
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
    Begin
        dbText "Name" ="CadResidencia.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =62
    Top =-5
    Right =1237
    Bottom =615
    Left =-1
    Top =-1
    Right =1151
    Bottom =177
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =250
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
