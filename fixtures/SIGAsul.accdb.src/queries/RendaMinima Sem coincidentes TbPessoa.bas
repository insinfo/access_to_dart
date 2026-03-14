Operation =1
Option =0
Where ="(((rendaminimaFam.CRAS) Like [DIGITE O CRAS]+\"*\") AND ((TbPessoa.Nome) Is Null"
    "))"
Begin InputTables
    Name ="TbPessoa"
    Name ="rendaminimaFam"
End
Begin OutputColumns
    Expression ="rendaminimaFam.CRAS"
    Expression ="rendaminimaFam.NOME"
    Expression ="rendaminimaFam.nis"
    Expression ="rendaminimaFam.RENDAPC"
End
Begin Joins
    LeftTable ="rendaminimaFam"
    RightTable ="TbPessoa"
    Expression ="rendaminimaFam.nome = TbPessoa.Nome"
    Flag =2
End
Begin OrderBy
    Expression ="rendaminimaFam.CRAS"
    Flag =0
    Expression ="rendaminimaFam.NOME"
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
        dbText "Name" ="rendaminimaFam.RENDAPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rendaminimaFam.NOME"
        dbInteger "ColumnWidth" ="3030"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rendaminimaFam.CRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RendaMinima].[RENDAPC]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[RendaMinima].[NOME]"
        dbInteger "ColumnWidth" ="2040"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RendaMinima.RENDAPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RendaMinima.NOME"
        dbInteger "ColumnWidth" ="3030"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="rendaminimaFam.nis"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1105
    Bottom =660
    Left =-1
    Top =-1
    Right =1081
    Bottom =197
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =230
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =232
        Top =0
        Name ="rendaminimaFam"
        Name =""
    End
End
