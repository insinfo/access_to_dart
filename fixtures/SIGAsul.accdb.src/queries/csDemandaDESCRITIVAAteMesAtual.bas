Operation =1
Option =0
Where ="(((TbDemandaReprimida.data)<=[DATA FINAL]) AND ((TbDemandaReprimida.[Data saída]"
    ") Is Null))"
Begin InputTables
    Name ="TbDemandaReprimida"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbDemandaReprimida.Nome"
    Expression ="TbDemandaReprimida.CelularPessoa"
    Expression ="TbDemandaReprimida.DNasc"
    Expression ="TbDemandaReprimida.cestabasica"
    Expression ="TbDemandaReprimida.cobertor"
    Expression ="TbDemandaReprimida.colchonete"
    Expression ="TbDemandaReprimida.filtro"
    Expression ="TbDemandaReprimida.[KIT TIPO]"
    Expression ="TbDemandaReprimida.[Demanda scfv atividade]"
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
        dbInteger "ColumnWidth" ="690"
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
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbDemandaReprimida.[Demanda scfv atividade]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1092
    Bottom =660
    Left =-1
    Top =-1
    Right =1024
    Bottom =228
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =245
        Bottom =244
        Top =0
        Name ="TbDemandaReprimida"
        Name =""
    End
    Begin
        Left =293
        Top =12
        Right =437
        Bottom =213
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
