Operation =1
Option =0
Where ="(((TbAtColetivo.DataCol) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtCole"
    "tivo.GruposPAIF)=Yes) AND ((TbPessoa.DataDesligPes) Is Null Or (TbPessoa.DataDes"
    "ligPes)>[DATA FINAL])) OR (((TbAtColetivo.MediacoesPAIF)=Yes))"
Begin InputTables
    Name ="TbAtColetivo"
    Name ="TbAtColetivoDet"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAtColetivo.CodColetivo"
    Expression ="TbAtColetivo.DataCol"
    Expression ="TbAtColetivo.GruposPAIF"
    Expression ="TbAtColetivo.MediacoesPAIF"
    Expression ="TbAtColetivoDet.Nome"
    Expression ="TbAtColetivoDet.NomeVisitante"
    Expression ="TbPessoa.DataDesligPes"
End
Begin Joins
    LeftTable ="TbAtColetivo"
    RightTable ="TbAtColetivoDet"
    Expression ="TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAtColetivoDet"
    Expression ="TbPessoa.CodPessoa = TbAtColetivoDet.Nome"
    Flag =1
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbAtColetivoDet.NomeVisitante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivoDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.MediacoesPAIF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.GruposPAIF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.CodColetivo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-177
    Top =116
    Right =979
    Bottom =683
    Left =-1
    Top =-1
    Right =1132
    Bottom =168
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =215
        Bottom =254
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =319
        Top =4
        Right =552
        Bottom =256
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
    Begin
        Left =600
        Top =12
        Right =744
        Bottom =271
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
