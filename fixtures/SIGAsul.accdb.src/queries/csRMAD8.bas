Operation =1
Option =0
Where ="(((TbAtColetivo.DataCol) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbPessoa"
    ".DataDesligPes) Is Null Or (TbPessoa.DataDesligPes)>[DATA FINAL])) OR (((TbAtCol"
    "etivo.DataCol) Between [DATA INICIAL] And [DATA FINAL]) AND ((TbAtColetivo.OfSES"
    "CFV)=Yes)) OR (((TbAtColetivo.DataCol) Between [DATA INICIAL] And [DATA FINAL]) "
    "AND ((TbAtColetivo.AtividadeSCFV)=Yes))"
Begin InputTables
    Name ="TbPessoa"
    Name ="TbAtColetivo"
    Name ="TbAtColetivoDet"
End
Begin OutputColumns
    Expression ="TbAtColetivo.CodColetivo"
    Expression ="TbAtColetivo.DataCol"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DataCadPes"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNasc],Date())/365.25)"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbAtColetivo.OfSESCFV"
    Expression ="TbAtColetivo.AtividadeSCFV"
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
    Left =46
    Top =29
    Right =1010
    Bottom =588
    Left =-1
    Top =-1
    Right =940
    Bottom =265
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =255
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =272
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =212
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
End
