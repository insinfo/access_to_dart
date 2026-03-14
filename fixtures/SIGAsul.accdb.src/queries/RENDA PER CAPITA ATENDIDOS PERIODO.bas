Operation =1
Option =2
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbAtend"
    Name ="renda per capita cadastro"
End
Begin OutputColumns
    Expression ="TbAtend.Nome"
    Expression ="[renda per capita cadastro].[Renda per capita]"
End
Begin Joins
    LeftTable ="renda per capita cadastro"
    RightTable ="TbAtend"
    Expression ="[renda per capita cadastro].CodPessoa = TbAtend.Nome"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbByte "RecordsetType" ="0"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[renda per capita cadastro].[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =128
    Top =42
    Right =1283
    Bottom =662
    Left =-1
    Top =-1
    Right =1131
    Bottom =224
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =74
        Top =21
        Right =218
        Bottom =276
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =325
        Top =-8
        Right =469
        Bottom =136
        Top =0
        Name ="renda per capita cadastro"
        Name =""
    End
End
