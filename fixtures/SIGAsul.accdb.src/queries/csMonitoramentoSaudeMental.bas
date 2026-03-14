Operation =1
Option =0
Where ="(((TbEncaminhamento.DataEnc) Between [data inicial] And [data final]) AND ((TbEn"
    "caminhamento.RS1)=Yes)) OR (((TbEncaminhamento.RS2)=Yes)) OR (((TbEncaminhamento"
    ".RS3)=Yes)) OR (((TbEncaminhamento.RS4)=Yes)) OR (((TbEncaminhamento.RS5)=Yes))"
Begin InputTables
    Name ="TbEncaminhamento"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbEncaminhamento.CODENC"
    Expression ="TbEncaminhamento.DataEnc"
    Expression ="TbPessoa.Nome"
    Expression ="TbEncaminhamento.RS"
    Expression ="TbEncaminhamento.RS1"
    Expression ="TbEncaminhamento.RS2"
    Expression ="TbEncaminhamento.RS3"
    Expression ="TbEncaminhamento.RS4"
    Expression ="TbEncaminhamento.RS5"
    Expression ="TbEncaminhamento.DataMonit"
    Expression ="TbEncaminhamento.ServidorMonitor"
    Expression ="TbEncaminhamento.[Monitoramento Sem Exito]"
    Expression ="TbEncaminhamento.ATENDIDO"
    Expression ="TbEncaminhamento.MotivoNão"
    Expression ="TbEncaminhamento.[Descrição outros motivos]"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbEncaminhamento"
    Expression ="TbPessoa.CodPessoa = TbEncaminhamento.Nome"
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbEncaminhamento.RS3"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS2"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS1"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS5"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataEnc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS4"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.CODENC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.MotivoNão"
        dbInteger "ColumnWidth" ="2265"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.[Descrição outros motivos]"
        dbInteger "ColumnWidth" ="2370"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataMonit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ServidorMonitor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.[Monitoramento Sem Exito]"
        dbInteger "ColumnWidth" ="2250"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ATENDIDO"
        dbInteger "ColumnWidth" ="2055"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1402
    Bottom =685
    Left =-1
    Top =-1
    Right =1108
    Bottom =275
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =174
        Top =21
        Right =345
        Bottom =255
        Top =0
        Name ="TbEncaminhamento"
        Name =""
    End
    Begin
        Left =467
        Top =24
        Right =611
        Bottom =168
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
