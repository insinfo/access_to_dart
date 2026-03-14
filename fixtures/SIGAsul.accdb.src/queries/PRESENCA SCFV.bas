Operation =1
Option =0
Where ="(((TbAtColetivo.OfSESCFV)=Yes)) OR (((TbAtColetivo.AtividadeSCFV)=Yes))"
Begin InputTables
    Name ="PERFIL E PRESENCA SCFV"
    Name ="TbAtColetivo"
    Name ="TbAtColetivoDet"
End
Begin OutputColumns
    Expression ="TbAtColetivo.GRUPOSCFV"
    Expression ="[PERFIL E PRESENCA SCFV].Nome"
    Expression ="[PERFIL E PRESENCA SCFV].CodOfSEDet"
    Expression ="[PERFIL E PRESENCA SCFV].DataInsc"
    Expression ="[PERFIL E PRESENCA SCFV].SituaçãoUsuario"
    Expression ="[PERFIL E PRESENCA SCFV].DataDesl"
    Expression ="[PERFIL E PRESENCA SCFV].DNasc"
    Expression ="[PERFIL E PRESENCA SCFV].Idade"
    Expression ="TbAtColetivoDet.Nome"
    Expression ="TbAtColetivo.DataCol"
    Expression ="TbAtColetivo.OfSESCFV"
    Expression ="TbAtColetivo.AtividadeSCFV"
End
Begin Joins
    LeftTable ="PERFIL E PRESENCA SCFV"
    RightTable ="TbAtColetivoDet"
    Expression ="[PERFIL E PRESENCA SCFV].Nome = TbAtColetivoDet.Nome"
    Flag =1
    LeftTable ="TbAtColetivo"
    RightTable ="TbAtColetivoDet"
    Expression ="TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="TbAtColetivoDet.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].DataInsc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].CodOfSEDet"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PERFIL E PRESENCA SCFV].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.DataCol"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.GRUPOSCFV"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2490"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtColetivo.AtividadeSCFV"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtColetivo.OfSESCFV"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =7
    Top =38
    Right =1013
    Bottom =658
    Left =-1
    Top =-1
    Right =982
    Bottom =261
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =552
        Top =105
        Right =733
        Bottom =310
        Top =0
        Name ="PERFIL E PRESENCA SCFV"
        Name =""
    End
    Begin
        Left =91
        Top =14
        Right =235
        Bottom =291
        Top =0
        Name ="TbAtColetivo"
        Name =""
    End
    Begin
        Left =313
        Top =20
        Right =457
        Bottom =260
        Top =0
        Name ="TbAtColetivoDet"
        Name =""
    End
End
