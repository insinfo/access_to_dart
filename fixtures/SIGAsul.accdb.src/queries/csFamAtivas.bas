Operation =1
Option =0
Where ="(((csCadTotalFamilias.DataCad)<=[DATA FINAL]) AND ((csCadTotalFamilias.Parentesc"
    "o)=\"Pessoa de Referencia\") AND ((CadResidencia.DataDesligResid) Is Null Or (Ca"
    "dResidencia.DataDesligResid)>=[DATA FINAL]))"
Begin InputTables
    Name ="csCadTotalFamilias"
End
Begin OutputColumns
    Expression ="csCadTotalFamilias.CodFam"
    Expression ="csCadTotalFamilias.DataCad"
    Expression ="csCadTotalFamilias.Parentesco"
    Expression ="csCadTotalFamilias.Nome"
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
        dbText "Name" ="csCadTotalFamilias.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCadTotalFamilias.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCadTotalFamilias.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCadTotalFamilias.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csCadTotalFamilias.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =36
    Top =65
    Right =1078
    Bottom =496
    Left =-1
    Top =-1
    Right =1018
    Bottom =135
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =186
        Top =19
        Right =499
        Bottom =272
        Top =0
        Name ="csCadTotalFamilias"
        Name =""
    End
End
