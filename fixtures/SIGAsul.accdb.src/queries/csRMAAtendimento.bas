Operation =1
Option =0
Begin InputTables
    Name ="TbAtend"
End
Begin OutputColumns
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="TbAtend.CodFunc"
    Expression ="TbAtend.NomeFunc"
    Expression ="TbAtend.Nome"
    Expression ="TbAtend.AtRemoto"
    Expression ="TbAtend.Acoremoto"
    Expression ="TbAtend.Administrativo"
    Expression ="TbAtend.Social"
    Expression ="TbAtend.Psicologico"
    Expression ="TbAtend.Multidisciplinar"
    Expression ="TbAtend.AcolhidaPartic"
    Expression ="TbAtend.OrientadorSoc"
    Expression ="TbAtend.AtGestao"
    Expression ="TbAtend.VDLFR"
    Expression ="TbAtend.VDCDL"
    Expression ="TbAtend.VDDCP"
    Expression ="TbAtend.VDDPAF"
    Expression ="TbAtend.VDAMF"
    Expression ="TbAtend.VDFVI"
    Expression ="TbAtend.VDAMD"
    Expression ="TbAtend.VDASF"
    Expression ="TbAtend.VDPBF"
    Expression ="TbAtend.VDSCFV"
    Expression ="TbAtend.VDOUT"
    Expression ="TbAtend.[VD NAO LOCALIZADA]"
    Expression ="TbAtend.[ESTUDO SOCIAL]"
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
    Expression ="TbAtend.OBS"
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
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AtRemoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Acoremoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Acolhida Coletiva]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AtGestao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.OBS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaDocCivil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaRecJus"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaApoioAlim"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDLFR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDDCP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDCDL"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDDPAF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDAMF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDFVI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDAMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDASF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.VDOUT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[ESTUDO SOCIAL]"
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
    Begin
        dbText "Name" ="TbAtend.DemandaBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaINSS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaBO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[VD NAO LOCALIZADA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Multidisciplinar"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[ART INSTITUC]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.OrientadorSoc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[COLCHONETE NÃO ATENDIDO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[COBERTOR NÃO ATENDIDO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[CESTA BASICA NÃO ATENDIDO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[FILTRO NÃO ATENDIDO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Telefonema"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[KIT ENXOVAL NÃO ATENDIDO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Psicossocial"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AcolhidaPartic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaEduc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.DemandaSCFV"
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
        dbText "Name" ="TbAtend.[Outra Demanda]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.[Especif Outra]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-299
    Top =42
    Right =835
    Bottom =662
    Left =-1
    Top =-1
    Right =1110
    Bottom =103
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =84
        Top =0
        Right =324
        Bottom =372
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
