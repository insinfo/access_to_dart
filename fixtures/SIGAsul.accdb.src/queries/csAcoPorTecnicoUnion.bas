Operation =1
Option =0
Where ="(((TbAcomp.Nome) Is Not Null) AND ((TbAcompDet.DataDesl) Is Null Or (TbAcompDet."
    "DataDesl)>=[DATA FINAL]))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcompDet"
    Name ="TbCadFuncionario"
    Name ="TbPessoa"
    Name ="TbUnidade"
End
Begin OutputColumns
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbAcompDet.NomeTec"
    Expression ="TbAcompDet.CodTecnico"
    Expression ="TbUnidade.LOGO"
    Expression ="TbAcomp.Nome"
    Expression ="TbCadFuncionario.[Carga Horária]"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbAcompDet.[PAF fim]"
    Expression ="TbAcompDet.DataDesl"
    Expression ="TbAcompDet.[Motivo Deslig]"
    Expression ="TbAcompDet.Defic"
    Expression ="TbAcompDet.Idoso"
    Expression ="TbAcompDet.Gest"
    Expression ="TbAcompDet.Criança"
    Expression ="TbAcompDet.Adol"
    Expression ="TbAcompDet.[Alcool/Drogas]"
    Expression ="TbAcompDet.ConflitoFam"
    Expression ="TbAcompDet.FragilSocioEcon"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="TbCadFuncionario"
    RightTable ="TbAcompDet"
    Expression ="TbCadFuncionario.CodFunc = TbAcompDet.CodTecnico"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAcomp"
    Expression ="TbPessoa.CodPessoa = TbAcomp.Nome"
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
        dbText "Name" ="TbAcompDet.FragilSocioEcon"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.ConflitoFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Defic"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Idoso"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Gest"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Criança"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Adol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Alcool/Drogas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbCadFuncionario.[Carga Horária]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.CodTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =15
    Top =26
    Right =1177
    Bottom =646
    Left =-1
    Top =-1
    Right =1138
    Bottom =136
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =319
        Top =15
        Right =463
        Bottom =159
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =514
        Top =9
        Right =658
        Bottom =323
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =714
        Top =22
        Right =858
        Bottom =303
        Top =0
        Name ="TbCadFuncionario"
        Name =""
    End
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =905
        Top =31
        Right =1049
        Bottom =175
        Top =0
        Name ="TbUnidade"
        Name =""
    End
End
