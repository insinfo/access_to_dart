Operation =1
Option =0
Where ="(((TbEncaminhamento.DataMonit) Between [DATA INICIAL] And [DATA FINAL]) AND ((Tb"
    "Encaminhamento.ATENDIDO)=No) AND ((TbEncaminhamento.[Monitoramento Sem Exito])=N"
    "o))"
Begin InputTables
    Name ="TbEncaminhamento"
End
Begin OutputColumns
    Alias ="USUÁRIO"
    Expression ="TbEncaminhamento.Nome"
    Expression ="TbEncaminhamento.DataMonit"
    Expression ="TbEncaminhamento.ATENDIDO"
    Expression ="TbEncaminhamento.MotivoNão"
    Expression ="TbEncaminhamento.NomeFunc"
    Expression ="TbEncaminhamento.ENG"
    Expression ="TbEncaminhamento.RSA"
    Expression ="TbEncaminhamento.RS"
    Expression ="TbEncaminhamento.RE"
    Expression ="TbEncaminhamento.SF"
    Expression ="TbEncaminhamento.OP"
End
Begin OrderBy
    Expression ="TbEncaminhamento.CODENC"
    Flag =0
    Expression ="TbEncaminhamento.DataEnc"
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
dbBoolean "TotalsRow" ="0"
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbEncaminhamento.MotivoNão"
        dbInteger "ColumnWidth" ="1710"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.NomeFunc"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1530"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="USUÁRIO"
        dbInteger "ColumnWidth" ="3180"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataMonit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ENG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.SF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =866
    Bottom =677
    Left =-1
    Top =-1
    Right =842
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =314
        Bottom =273
        Top =0
        Name ="TbEncaminhamento"
        Name =""
    End
End
