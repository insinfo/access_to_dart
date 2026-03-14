Operation =1
Option =0
Begin InputTables
    Name ="TbPessoa"
    Name ="OBITOS"
End
Begin OutputColumns
    Expression ="OBITOS.Nº"
    Expression ="OBITOS.[DATA DA NOTIFICAÇÃO]"
    Expression ="OBITOS.NOME"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.MotivoDeslPes"
    Expression ="OBITOS.[DATA DO ÓBITO]"
    Expression ="OBITOS.CRAS"
    Expression ="OBITOS.SEXO"
    Expression ="OBITOS.CPF"
    Expression ="OBITOS.[DATA DE NASCIMENTO]"
    Expression ="OBITOS.IDADE"
    Expression ="OBITOS.[NOME DA MÃE]"
    Expression ="OBITOS.ENDEREÇO"
    Expression ="OBITOS.BAIRRO"
    Expression ="OBITOS.TELEFONE"
    Expression ="OBITOS.GESTANTE"
    Expression ="OBITOS.PUERPERA"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="OBITOS"
    Expression ="TbPessoa.Nome = OBITOS.NOME"
    Flag =1
End
Begin OrderBy
    Expression ="OBITOS.NOME"
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
Begin
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.MotivoDeslPes"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1185"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="OBITOS.ENDEREÇO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.Nº"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.[DATA DA NOTIFICAÇÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.PUERPERA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.SEXO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.[DATA DE NASCIMENTO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.IDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.[NOME DA MÃE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.BAIRRO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.TELEFONE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.GESTANTE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OBITOS.[DATA DO ÓBITO]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-496
    Top =52
    Right =880
    Bottom =689
    Left =-1
    Top =-1
    Right =1352
    Bottom =292
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =398
        Top =8
        Right =724
        Bottom =278
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="OBITOS"
        Name =""
    End
End
