Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbAtend"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.CodFam"
    Expression ="TbAtend.VD"
    Expression ="TbAtend.AcolhidaPartic"
    Expression ="TbAtend.AtRemoto"
    Expression ="TbAtend.Acoremoto"
    Expression ="TbAtend.[ESTUDO SOCIAL]"
    Expression ="TbAtend.RELATORIO"
    Expression ="TbAtend.[Acolhida Coletiva]"
    Expression ="TbAtend.[ART INSTITUC]"
    Expression ="TbAtend.DemandaBPC"
    Expression ="TbAtend.DemandaINSS"
    Expression ="TbAtend.DemandaSCFV"
    Expression ="TbAtend.DemandaEduc"
    Expression ="TbAtend.DemandaDocCivil"
    Expression ="TbAtend.DemandaApoioAlim"
    Expression ="TbAtend.DemandaSaude"
    Expression ="TbAtend.DemandaJustiça"
    Expression ="TbAtend.DemandaBenefMun"
    Expression ="TbAtend.DemandaAuxNatal"
    Expression ="TbAtend.DemandaGratTransp"
    Expression ="TbAtend.[Outra Demanda]"
    Expression ="TbAtend.[Especif Outra]"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
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
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbAtend.VD"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Acoremoto"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaDocCivil"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.AtRemoto"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.[Especif Outra]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.AcolhidaPartic"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.[ART INSTITUC]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaApoioAlim"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.RELATORIO"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.[Acolhida Coletiva]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[ESTUDO SOCIAL]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBPC"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaINSS"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSCFV"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaEduc"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSaude"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaJustiça"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBenefMun"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaAuxNatal"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaGratTransp"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.[Outra Demanda]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaRecJus"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="TbAtend.OrientadorSoc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Multidisciplinar"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Administrativo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Social"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Psicologico"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-188
    Top =23
    Right =1114
    Bottom =370
    Left =-1
    Top =-1
    Right =1278
    Bottom =111
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =251
        Bottom =343
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =259
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =270
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
