Operation =1
Option =0
Having ="(((TbUnidade.CRAS)=Yes))"
Begin InputTables
    Name ="UnionPrincipalContinuacao"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.CRAS"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Alias ="SomaDevdExito"
    Expression ="Sum(UnionPrincipalContinuacao.vdExito)"
    Alias ="SomaDevdSemExito"
    Expression ="Sum(UnionPrincipalContinuacao.vdSemExito)"
    Alias ="SomaDebaExito"
    Expression ="Sum(UnionPrincipalContinuacao.baExito)"
    Alias ="SomaDebaSemExito"
    Expression ="Sum(UnionPrincipalContinuacao.baSemExito)"
    Alias ="SomaDeacolhidas"
    Expression ="Sum(UnionPrincipalContinuacao.acolhidas)"
    Alias ="SomaDeatDemandEspon"
    Expression ="Sum(UnionPrincipalContinuacao.atDemandEspon)"
    Alias ="SomaDeencProtSocEspecial"
    Expression ="Sum(UnionPrincipalContinuacao.encProtSocEspecial)"
    Alias ="SomaDeencConselho"
    Expression ="Sum(UnionPrincipalContinuacao.encConselho)"
    Alias ="SomaDeprovProtSocEspecial"
    Expression ="Sum(UnionPrincipalContinuacao.provProtSocEspecial)"
    Alias ="SomaDeprovConselho"
    Expression ="Sum(UnionPrincipalContinuacao.provConselho)"
    Alias ="SomaDefamBSF"
    Expression ="Sum(UnionPrincipalContinuacao.famBSF)"
    Alias ="SomaDefamBMI"
    Expression ="Sum(UnionPrincipalContinuacao.famBMI)"
    Alias ="SomaDefamBMD"
    Expression ="Sum(UnionPrincipalContinuacao.famBMD)"
    Alias ="SomaDedemBMI"
    Expression ="Sum(UnionPrincipalContinuacao.demBMI)"
    Alias ="SomaDedemBMD"
    Expression ="Sum(UnionPrincipalContinuacao.demBMD)"
    Alias ="SomaDetotalCadUnic"
    Expression ="Sum(UnionPrincipalContinuacao.totalCadUnic)"
    Alias ="SomaDetotalNewCadUnico"
    Expression ="Sum(UnionPrincipalContinuacao.totalNewCadUnico)"
    Alias ="SomaDeataualCadUnico"
    Expression ="Sum(UnionPrincipalContinuacao.ataualCadUnico)"
    Alias ="SomaDetotalPBF"
    Expression ="Sum(UnionPrincipalContinuacao.totalPBF)"
    Alias ="SomaDetotalDeficient"
    Expression ="Sum(UnionPrincipalContinuacao.totalDeficient)"
    Alias ="SomaDedeficBPC"
    Expression ="Sum(UnionPrincipalContinuacao.deficBPC)"
    Alias ="SomaDeIdos"
    Expression ="Sum(UnionPrincipalContinuacao.Idos)"
    Alias ="SomaDeidososBPC"
    Expression ="Sum(UnionPrincipalContinuacao.idososBPC)"
    Alias ="SomaDedemCesta"
    Expression ="Sum(UnionPrincipalContinuacao.demCesta)"
    Alias ="SomaDedemCobert"
    Expression ="Sum(UnionPrincipalContinuacao.demCobert)"
    Alias ="SomaDedemColchon"
    Expression ="Sum(UnionPrincipalContinuacao.demColchon)"
    Alias ="SomaDedemFiltro"
    Expression ="Sum(UnionPrincipalContinuacao.demFiltro)"
    Alias ="SomaDedemEnxoval"
    Expression ="Sum(UnionPrincipalContinuacao.demEnxoval)"
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
        dbText "Name" ="UnionPrincipalContinuacao.provProtSocEspecial"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.acolhidas"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.vdExito"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeencConselho"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDebaSemExito"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.encConselho"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.baSemExito"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDefamBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeencProtSocEspecial"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDebaExito"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.famBSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.encProtSocEspecial"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.baExito"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeprovConselho"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeatDemandEspon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDevdSemExito"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.provConselho"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.atDemandEspon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.vdSemExito"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeprovProtSocEspecial"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeacolhidas"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDevdExito"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.demEnxoval"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.demCesta"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.totalDeficient"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.totalCadUnic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.famBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedemCesta"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDetotalDeficient"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDetotalCadUnic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDefamBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.demCobert"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.deficBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.totalNewCadUnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.famBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedemCobert"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedeficBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDetotalNewCadUnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDefamBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.demColchon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.Idos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.ataualCadUnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.demBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedemColchon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeIdos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeataualCadUnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedemBMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.demFiltro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.idososBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.totalPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UnionPrincipalContinuacao.demBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedemFiltro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDeidososBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDetotalPBF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedemBMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="SomaDedemEnxoval"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[MATRICULA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[LOGO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[NOME]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[FUNÇÃO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[TbUnidade].[RODAPE]"
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
        dbText "Name" ="FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="MATRICULA"
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
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =15
    Top =19
    Right =1072
    Bottom =485
    Left =-1
    Top =-1
    Right =1033
    Bottom =237
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =128
        Top =27
        Right =312
        Bottom =195
        Top =0
        Name ="UnionPrincipalContinuacao"
        Name =""
    End
    Begin
        Left =360
        Top =12
        Right =597
        Bottom =258
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
