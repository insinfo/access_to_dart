Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionAtendPerfil"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.FUNÇÃO"
    Alias ="SomaDeATMULHERCF"
    Expression ="Sum(UnionAtendPerfil.ATMULHERCF)"
    Alias ="SomaDeATBPCD"
    Expression ="Sum(UnionAtendPerfil.ATBPCD)"
    Alias ="SomaDeATBPCI"
    Expression ="Sum(UnionAtendPerfil.ATBPCI)"
    Alias ="SomaDeAPOPENS"
    Expression ="Sum(UnionAtendPerfil.APOPENS)"
    Alias ="SomaDeATPBF"
    Expression ="Sum(UnionAtendPerfil.ATPBF)"
    Alias ="SomaDeATCAD"
    Expression ="Sum(UnionAtendPerfil.ATCAD)"
    Alias ="SomaDeATOUTPROG"
    Expression ="Sum(UnionAtendPerfil.ATOUTPROG)"
    Alias ="SomaDeATEXTPBZ"
    Expression ="Sum(UnionAtendPerfil.ATEXTPBZ)"
    Alias ="SomaDeATAREARSC"
    Expression ="Sum(UnionAtendPerfil.ATAREARSC)"
    Alias ="SomaDeATAREAVIOL"
    Expression ="Sum(UnionAtendPerfil.ATAREAVIOL)"
    Alias ="SomaDeATBMD"
    Expression ="Sum(UnionAtendPerfil.ATBMD)"
    Alias ="SomaDeATBMI"
    Expression ="Sum(UnionAtendPerfil.ATBMI)"
    Alias ="SomaDeATBSF"
    Expression ="Sum(UnionAtendPerfil.ATBSF)"
End
Begin Groups
    Expression ="TbUnidade.CRAS"
    GroupLevel =0
    Expression ="TbUnidade.NOME"
    GroupLevel =0
    Expression ="TbUnidade.[DIRETOR(A)]"
    GroupLevel =0
    Expression ="TbUnidade.MATRICULA"
    GroupLevel =0
    Expression ="TbUnidade.FUNÇÃO"
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
        dbText "Name" ="SomaDeAPOPENS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATMULHERCF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATCAD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATBPCD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATOUTPROG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATBPCI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATEXTPBZ"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATAREARSC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATAREAVIOL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeATBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
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
        dbText "Name" ="NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =831
    Bottom =660
    Left =-1
    Top =-1
    Right =763
    Bottom =255
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =263
        Top =14
        Right =537
        Bottom =341
        Top =0
        Name ="UnionAtendPerfil"
        Name =""
    End
    Begin
        Left =587
        Top =27
        Right =731
        Bottom =258
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
