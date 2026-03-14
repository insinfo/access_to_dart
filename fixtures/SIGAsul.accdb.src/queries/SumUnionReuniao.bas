Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionReuniao"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Alias ="SomaDePARTICINT"
    Expression ="Sum(UnionReuniao.PARTICINT)"
    Alias ="SomaDePARTICEXT"
    Expression ="Sum(UnionReuniao.PARTICEXT)"
    Alias ="SomaDeREINT"
    Expression ="Sum(UnionReuniao.REINT)"
    Alias ="SomaDeREEXT"
    Expression ="Sum(UnionReuniao.REEXT)"
    Alias ="SomaDeINTERINT"
    Expression ="Sum(UnionReuniao.INTERINT)"
    Alias ="SomaDeINTEREXT"
    Expression ="Sum(UnionReuniao.INTEREXT)"
    Alias ="SomaDePARTICINTINTER"
    Expression ="Sum(UnionReuniao.PARTICINTINTER)"
    Alias ="SomaDePARTICEXTINTER"
    Expression ="Sum(UnionReuniao.PARTICEXTINTER)"
End
Begin Groups
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.CRAS"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
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
        dbText "Name" ="SomaDePARTICINT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePARTICEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeREINT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeREEXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeINTERINT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeINTEREXT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePARTICINTINTER"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDePARTICEXTINTER"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1135
    Bottom =660
    Left =-1
    Top =-1
    Right =1111
    Bottom =255
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="UnionReuniao"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =274
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
