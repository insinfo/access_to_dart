Operation =1
Option =0
Where ="(((TbEncaminhamento.DataEnc) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbEncaminhamento"
End
Begin OutputColumns
    Expression ="TbEncaminhamento.CODENC"
    Expression ="TbEncaminhamento.DataEnc"
    Expression ="TbEncaminhamento.CodFunc"
    Expression ="TbEncaminhamento.NomeFunc"
    Expression ="TbEncaminhamento.Nome"
    Expression ="TbEncaminhamento.Tel1"
    Expression ="TbEncaminhamento.Tel2"
    Expression ="TbEncaminhamento.DataMonit"
    Expression ="TbEncaminhamento.ServidorMonitor"
    Expression ="TbEncaminhamento.ATENDIDO"
    Expression ="TbEncaminhamento.MotivoNão"
    Expression ="TbEncaminhamento.[Descrição outros motivos]"
    Expression ="TbEncaminhamento.Obs"
    Expression ="TbEncaminhamento.ENG"
    Expression ="TbEncaminhamento.RSA"
    Alias ="Expr1"
    Expression ="TbEncaminhamento.RSA1"
    Alias ="Expr2"
    Expression ="TbEncaminhamento.RSA2"
    Alias ="Expr3"
    Expression ="TbEncaminhamento.RSA3"
    Alias ="Expr4"
    Expression ="TbEncaminhamento.RSA4"
    Expression ="TbEncaminhamento.RSA5"
    Expression ="TbEncaminhamento.RSA6"
    Expression ="TbEncaminhamento.RSA7"
    Expression ="TbEncaminhamento.RSA8"
    Expression ="TbEncaminhamento.RSA9"
    Expression ="TbEncaminhamento.RSA10"
    Expression ="TbEncaminhamento.RSA11"
    Expression ="TbEncaminhamento.RSA12"
    Expression ="TbEncaminhamento.RSA13"
    Expression ="TbEncaminhamento.RSA14"
    Alias ="Expr5"
    Expression ="TbEncaminhamento.RSA15"
    Expression ="TbEncaminhamento.RS"
    Expression ="TbEncaminhamento.RS1"
    Expression ="TbEncaminhamento.RS2"
    Expression ="TbEncaminhamento.RS3"
    Expression ="TbEncaminhamento.RS4"
    Expression ="TbEncaminhamento.RS5"
    Expression ="TbEncaminhamento.RS6"
    Expression ="TbEncaminhamento.RS7"
    Expression ="TbEncaminhamento.RS8"
    Expression ="TbEncaminhamento.RS9"
    Expression ="TbEncaminhamento.RS10"
    Expression ="TbEncaminhamento.RS11"
    Expression ="TbEncaminhamento.RS12"
    Expression ="TbEncaminhamento.RS13"
    Expression ="TbEncaminhamento.RS14"
    Expression ="TbEncaminhamento.RS15"
    Expression ="TbEncaminhamento.RS16"
    Expression ="TbEncaminhamento.RS17"
    Expression ="TbEncaminhamento.RS18"
    Expression ="TbEncaminhamento.RS19"
    Expression ="TbEncaminhamento.RS20"
    Expression ="TbEncaminhamento.RE"
    Expression ="TbEncaminhamento.RE1"
    Expression ="TbEncaminhamento.RE2"
    Expression ="TbEncaminhamento.RE3"
    Expression ="TbEncaminhamento.SF"
    Expression ="TbEncaminhamento.SF1"
    Expression ="TbEncaminhamento.SF2"
    Expression ="TbEncaminhamento.OP"
    Expression ="TbEncaminhamento.OP1"
    Expression ="TbEncaminhamento.OP2"
    Expression ="TbEncaminhamento.OP3"
    Expression ="TbEncaminhamento.OP4"
    Expression ="TbEncaminhamento.OP5"
    Expression ="TbEncaminhamento.OP6"
    Expression ="TbEncaminhamento.OP7"
    Expression ="TbEncaminhamento.OP8"
    Expression ="TbEncaminhamento.OP9"
    Expression ="TbEncaminhamento.OP10"
    Expression ="TbEncaminhamento.OP11"
    Expression ="TbEncaminhamento.OP12"
    Expression ="TbEncaminhamento.OP13"
    Expression ="TbEncaminhamento.OP14"
    Expression ="TbEncaminhamento.OP15"
    Expression ="TbEncaminhamento.OP16"
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
        dbText "Name" ="TbEncaminhamento.RS11"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataEnc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP8"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS10"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.CODENC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP16"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.SF1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Tel1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RE2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.SF2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Tel2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.DataMonit"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS18"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ServidorMonitor"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA13"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ATENDIDO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.MotivoNão"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA15"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.[Descrição outros motivos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.Obs"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.ENG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS7"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA7"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA8"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA9"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA10"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA11"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA12"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RSA14"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS4"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS8"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS9"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS12"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS13"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS14"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS15"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS16"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS17"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS19"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RS20"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RE1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.RE3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.SF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP6"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP7"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP9"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP10"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP11"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP12"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP13"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP14"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbEncaminhamento.OP15"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1166
    Bottom =660
    Left =-1
    Top =-1
    Right =1098
    Bottom =253
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =282
        Bottom =288
        Top =0
        Name ="TbEncaminhamento"
        Name =""
    End
End
