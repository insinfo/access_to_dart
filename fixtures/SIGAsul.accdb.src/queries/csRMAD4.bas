Operation =1
Option =0
Where ="(((TbAtColetivo.DataCol) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtCole"
    "tivo.OfSESCFV)=Yes) AND ((TbPessoa.DataDesligPes) Is Null Or (TbPessoa.DataDesli"
    "gPes)>[DATA FINAL])) OR (((TbAtColetivo.DataCol) Between [DATA INICIAL] And [DAT"
    "A FINAL]) AND ((TbAtColetivo.AtividadeSCFV)=Yes) AND ((TbPessoa.DataDesligPes) I"
    "s Null Or (TbPessoa.DataDesligPes)>[DATA FINAL]))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbAtColetivo"
    Name ="TbAtColetivoDet"
End
Begin OutputColumns
    Expression ="TbAtColetivo.CodColetivo"
    Expression ="TbAtColetivo.DataCol"
    Expression ="TbAtColetivo.OfSESCFV"
    Expression ="TbAtColetivo.AtividadeSCFV"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DataCadPes"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
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
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
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
    Begin
        dbText "Name" ="TbAtColetivo.OfSESCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.AtividadeSCFV"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1113
    Bottom =660
    Left =-1
    Top =-1
    Right =1045
    Bottom =212
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
End
