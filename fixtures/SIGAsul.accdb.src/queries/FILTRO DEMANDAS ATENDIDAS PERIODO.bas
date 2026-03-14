Operation =1
Option =0
Where ="(((TbDemandaReprimida.[Motivo saída])=\"ATENDIDO\") AND ((TbDemandaReprimida.[Da"
    "ta saída]) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbDemandaReprimida"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.[Motivo saída]"
    Expression ="TbDemandaReprimida.[Data saída]"
    Expression ="TbDemandaReprimida.CodDemanda"
    Expression ="TbDemandaReprimida.data"
    Expression ="TbDemandaReprimida.Volante"
    Expression ="TbDemandaReprimida.CodFunc"
    Expression ="TbDemandaReprimida.NomeFuncionario"
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.CelularPessoa"
    Expression ="TbDemandaReprimida.DNasc"
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
        dbText "Name" ="TbDemandaReprimida.[Motivo saída]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.NomeFuncionario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Data saída]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CelularPessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1103
    Bottom =660
    Left =-1
    Top =-1
    Right =1035
    Bottom =273
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =387
        Bottom =274
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
End
