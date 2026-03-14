Operation =1
Option =0
Where ="(((TbAtend.AtRemoto)=Yes) AND ((TbPessoa.DataDesligPes) Is Null Or (TbPessoa.Dat"
    "aDesligPes)>[DATA FINAL])) OR (((TbAtend.Acoremoto)=Yes))"
Begin InputTables
    Name ="TbAtend"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Volante"
    Expression ="TbAtend.Data"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Expression ="TbAtend.AtRemoto"
    Expression ="TbAtend.Acoremoto"
    Expression ="TbPessoa.DataDesligPes"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
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
        dbText "Name" ="TbAtend.Acoremoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AtRemoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =18
    Top =14
    Right =1187
    Bottom =651
    Left =-1
    Top =-1
    Right =1145
    Bottom =238
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =196
        Bottom =358
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =488
        Bottom =290
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
