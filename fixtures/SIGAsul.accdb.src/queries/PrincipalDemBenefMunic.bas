Operation =1
Option =0
Where ="(((TbDemandaReprimida.data) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbDem"
    "andaReprimida.[Data saída]) Is Null Or (TbDemandaReprimida.[Data saída])>[DATA F"
    "INAL]))"
Begin InputTables
    Name ="TbDemandaReprimida"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.data"
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.DNasc"
    Expression ="TbDemandaReprimida.[Demanda BMD]"
    Expression ="TbDemandaReprimida.[Demanda BMI]"
    Expression ="TbDemandaReprimida.cestabasica"
    Expression ="TbDemandaReprimida.cobertor"
    Expression ="TbDemandaReprimida.colchonete"
    Expression ="TbDemandaReprimida.filtro"
    Expression ="TbDemandaReprimida.[Demanda Kit Enxoval]"
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
        dbText "Name" ="TbDemandaReprimida.[Demanda BMI]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda BMD]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.DNasc"
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
        dbText "Name" ="TbDemandaReprimida.cestabasica"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.cobertor"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.colchonete"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.filtro"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda Kit Enxoval]"
        dbLong "AggregateType" ="2"
    End
End
Begin
    State =0
    Left =64
    Top =88
    Right =1177
    Bottom =567
    Left =-1
    Top =-1
    Right =1089
    Bottom =153
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =130
        Top =5
        Right =420
        Bottom =205
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
End
