Operation =1
Option =0
Where ="(((CADUNICO.CODFAM)=[DIGITE O CODIGO FAMILIAR]))"
Begin InputTables
    Name ="CADUNICO"
End
Begin OutputColumns
    Expression ="CADUNICO.Identificação"
    Expression ="CADUNICO.CODFAM"
    Expression ="CADUNICO.nom_pessoa"
    Expression ="CADUNICO.MAE"
    Expression ="CADUNICO.PAI"
    Expression ="CADUNICO.NIS"
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
        dbText "Name" ="CadUnicoNov22.nom_pessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.MAE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.CODFAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.PAI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadUnicoNov22.Identificação"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =0
    Right =1225
    Bottom =657
    Left =-1
    Top =-1
    Right =1201
    Bottom =246
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="CADUNICO"
        Name =""
    End
End
