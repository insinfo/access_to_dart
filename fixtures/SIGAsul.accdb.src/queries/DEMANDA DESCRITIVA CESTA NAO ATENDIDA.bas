Operation =1
Option =0
Where ="(((TbDemandaReprimida.cestabasica)=Yes) AND ((TbDemandaReprimida.data)<=[DATA FI"
    "NAL]) AND ((TbDemandaReprimida.[Data saída]) Is Null Or (TbDemandaReprimida.[Dat"
    "a saída])>[DATA FINAL]))"
Begin InputTables
    Name ="TbDemandaReprimida"
End
Begin OutputColumns
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.CelularPessoa"
    Expression ="TbDemandaReprimida.DNasc"
    Expression ="TbDemandaReprimida.cestabasica"
    Expression ="TbDemandaReprimida.cobertor"
    Expression ="TbDemandaReprimida.colchonete"
    Expression ="TbDemandaReprimida.filtro"
    Expression ="TbDemandaReprimida.[Demanda Kit Enxoval]"
    Expression ="TbDemandaReprimida.[KIT TIPO]"
    Expression ="TbDemandaReprimida.[OUTROS DOACAO]"
    Expression ="TbDemandaReprimida.[0a5]"
    Expression ="TbDemandaReprimida.[6a11]"
    Expression ="TbDemandaReprimida.[12a14]"
    Expression ="TbDemandaReprimida.[15a17]"
    Expression ="TbDemandaReprimida.[18a29]"
    Expression ="TbDemandaReprimida.[30a59]"
    Expression ="TbDemandaReprimida.[60mais]"
    Expression ="TbDemandaReprimida.[Demanda CIC 6 A 12]"
    Expression ="TbDemandaReprimida.[Demanda CIC 13 A 17]"
    Expression ="TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6]"
    Expression ="TbDemandaReprimida.[Demanda BMD]"
    Expression ="TbDemandaReprimida.[Demanda BMI]"
    Expression ="TbDemandaReprimida.data"
    Expression ="TbDemandaReprimida.Obs"
    Expression ="TbDemandaReprimida.[Data saída]"
    Expression ="TbDemandaReprimida.[Motivo saída]"
End
Begin OrderBy
    Expression ="TbDemandaReprimida.data"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbDemandaReprimida.cestabasica"
        dbInteger "ColumnWidth" ="1035"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[60mais]"
        dbInteger "ColumnWidth" ="825"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6]"
        dbInteger "ColumnWidth" ="3015"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda BMI]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[30a59]"
        dbInteger "ColumnWidth" ="705"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[18a29]"
        dbInteger "ColumnWidth" ="810"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Nome"
        dbInteger "ColumnWidth" ="3165"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.filtro"
        dbInteger "ColumnWidth" ="480"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[6a11]"
        dbInteger "ColumnWidth" ="705"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[0a5]"
        dbInteger "ColumnWidth" ="765"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[12a14]"
        dbInteger "ColumnWidth" ="825"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[15a17]"
        dbInteger "ColumnWidth" ="705"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.colchonete"
        dbInteger "ColumnWidth" ="600"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda CIC 6 A 12]"
        dbInteger "ColumnWidth" ="2115"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda CIC 13 A 17]"
        dbInteger "ColumnWidth" ="1800"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda BMD]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[KIT TIPO]"
        dbInteger "ColumnWidth" ="1395"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.cobertor"
        dbInteger "ColumnWidth" ="705"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.DNasc"
        dbInteger "ColumnWidth" ="1185"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.CelularPessoa"
        dbInteger "ColumnWidth" ="1380"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.data"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[OUTROS DOACAO]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda Kit Enxoval]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Data saída]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Motivo saída]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =30
    Top =78
    Right =1117
    Bottom =592
    Left =-1
    Top =-1
    Right =1055
    Bottom =299
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =152
        Top =16
        Right =349
        Bottom =261
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
End
