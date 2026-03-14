Operation =1
Option =0
Where ="(((TbPessoa.Nome) Like \"*\"+[DIGITE O NOME]+\"*\"))"
Begin InputTables
    Name ="TbAtend"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="TbPessoa.Nome"
    Expression ="TbAtend.DemandaApoioAlim"
    Expression ="TbAtend.DemandaBPC"
    Expression ="TbAtend.DemandaINSS"
    Expression ="TbAtend.DemandaSCFV"
    Expression ="TbAtend.DemandaEduc"
    Expression ="TbAtend.DemandaSaude"
    Expression ="TbAtend.DemandaJustiça"
    Expression ="TbAtend.DemandaBenefMun"
    Expression ="TbAtend.DemandaAuxNatal"
    Expression ="TbAtend.DemandaGratTransp"
    Expression ="TbAtend.DemandaRecJus"
    Expression ="TbAtend.DemandaDocCivil"
    Expression ="TbAtend.[Outra Demanda]"
    Expression ="TbAtend.[Especif Outra]"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
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
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="TbAtend.DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Especif Outra]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSaude"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaJustiça"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBenefMun"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaAuxNatal"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaGratTransp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1070
    Bottom =660
    Left =-1
    Top =-1
    Right =1046
    Bottom =326
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =215
        Bottom =296
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =377
        Top =9
        Right =521
        Bottom =303
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
