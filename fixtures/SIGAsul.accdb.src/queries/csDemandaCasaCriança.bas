Operation =1
Option =0
Where ="(((TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6])=Yes))"
Begin InputTables
    Name ="TbDemandaReprimida"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6]"
    Expression ="TbDemandaReprimida.[Data saída]"
    Expression ="TbDemandaReprimida.CodDemanda"
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
        dbText "Name" ="TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Nome"
        dbInteger "ColumnWidth" ="3570"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1110"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Data saída]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =104
    Top =21
    Right =946
    Bottom =708
    Left =-1
    Top =-1
    Right =818
    Bottom =258
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =338
        Bottom =340
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
End
