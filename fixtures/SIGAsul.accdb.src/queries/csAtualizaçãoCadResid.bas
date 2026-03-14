Operation =1
Option =0
Having ="(((CadResidencia.CodFam)=[DIGITE O COD FAMILIAR]))"
Begin InputTables
    Name ="CadResidAtualizacao"
    Name ="CadResidencia"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="CadResidencia.[Nº Cras]"
    Expression ="TbUnidade.NOME"
    Alias ="ÚltimoDeDATA ATUALIZ"
    Expression ="Last(CadResidAtualizacao.[DATA ATUALIZ])"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="CadResidAtualizacao"
    Expression ="CadResidencia.CodFam = CadResidAtualizacao.CodCadResd"
    Flag =1
    LeftTable ="TbUnidade"
    RightTable ="CadResidencia"
    Expression ="TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]"
    Flag =1
End
Begin OrderBy
    Expression ="Last(CadResidAtualizacao.[DATA ATUALIZ])"
    Flag =1
End
Begin Groups
    Expression ="CadResidencia.CodFam"
    GroupLevel =0
    Expression ="CadResidencia.DataCad"
    GroupLevel =0
    Expression ="CadResidencia.[CRAS Origem]"
    GroupLevel =0
    Expression ="CadResidencia.[Nº Cras]"
    GroupLevel =0
    Expression ="TbUnidade.NOME"
    GroupLevel =0
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
        dbText "Name" ="CadResidencia.[Nº Cras]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="ÚltimoDeDATA ATUALIZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1109
    Bottom =677
    Left =-1
    Top =-1
    Right =1085
    Bottom =306
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =514
        Top =25
        Right =658
        Bottom =291
        Top =0
        Name ="CadResidAtualizacao"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =409
        Bottom =313
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
