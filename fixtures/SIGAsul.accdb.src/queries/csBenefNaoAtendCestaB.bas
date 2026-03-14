Operation =1
Option =0
Where ="(((TbDemandaReprimida.data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbDem"
    "andaReprimida.[Motivo saída])=\"Cesta basica não atendida no Mês\"))"
Begin InputTables
    Name ="TbDemandaReprimida"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.CodDemanda"
    Expression ="TbDemandaReprimida.data"
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.DNasc"
    Expression ="TbDemandaReprimida.[0a5]"
    Expression ="TbDemandaReprimida.[6a11]"
    Expression ="TbDemandaReprimida.[12a14]"
    Expression ="TbDemandaReprimida.[15a17]"
    Expression ="TbDemandaReprimida.[18a29]"
    Expression ="TbDemandaReprimida.[30a59]"
    Expression ="TbDemandaReprimida.[60mais]"
    Expression ="TbDemandaReprimida.cestabasica"
    Expression ="TbDemandaReprimida.[Motivo saída]"
    Expression ="TbDemandaReprimida.cobertor"
    Expression ="TbDemandaReprimida.colchonete"
    Expression ="TbDemandaReprimida.filtro"
    Expression ="TbDemandaReprimida.[Demanda Kit Enxoval]"
    Expression ="TbDemandaReprimida.[KIT TIPO]"
    Expression ="TbDemandaReprimida.[OUTROS DOACAO]"
    Expression ="TbDemandaReprimida.[Data saída]"
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
        dbText "Name" ="TbDemandaReprimida.[KIT TIPO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda Kit Enxoval]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[OUTROS DOACAO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CodDemanda"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbDemandaReprimida].[KIT TIPO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbDemandaReprimida].[OUTROS DOACAO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbDemandaReprimida].[Demanda Kit Enxoval]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbDemandaReprimida].[CodDemanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbDemandaReprimida].[data]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbDemandaReprimida].[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbDemandaReprimida].[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[60mais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[18a29]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.filtro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[0a5]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[6a11]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[12a14]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[15a17]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[30a59]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.cestabasica"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.cobertor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.colchonete"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Motivo saída]"
        dbInteger "ColumnWidth" ="2805"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Data saída]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-198
    Top =73
    Right =961
    Bottom =657
    Left =-1
    Top =-1
    Right =1135
    Bottom =202
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =226
        Bottom =242
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
End
