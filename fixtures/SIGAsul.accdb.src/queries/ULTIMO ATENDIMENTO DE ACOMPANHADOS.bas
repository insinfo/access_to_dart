Operation =1
Option =0
Begin InputTables
    Name ="csACOatualizado"
    Name ="TbAtend"
End
Begin OutputColumns
    Alias ="ÚltimoDeData"
    Expression ="Last(TbAtend.Data)"
    Alias ="ATENDIDO"
    Expression ="TbAtend.Nome"
    Alias ="ACOMPANHADO"
    Expression ="csACOatualizado.Nome"
    Expression ="csACOatualizado.CPF"
End
Begin Joins
    LeftTable ="csACOatualizado"
    RightTable ="TbAtend"
    Expression ="csACOatualizado.CodPessoa = TbAtend.Nome"
    Flag =1
End
Begin Groups
    Expression ="TbAtend.Nome"
    GroupLevel =0
    Expression ="csACOatualizado.Nome"
    GroupLevel =0
    Expression ="csACOatualizado.CPF"
    GroupLevel =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
dbSingle "ECLScaleFactor" ="1"
dbMemo "OrderBy" ="[Lookup_ATENDIDO].[Nome]"
Begin
    Begin
        dbText "Name" ="ACOMPANHADO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeData"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csACOatualizado.CPF"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1002
    Bottom =660
    Left =-1
    Top =-1
    Right =978
    Bottom =326
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =685
        Top =9
        Right =945
        Bottom =272
        Top =0
        Name ="csACOatualizado"
        Name =""
    End
    Begin
        Left =172
        Top =15
        Right =420
        Bottom =328
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
