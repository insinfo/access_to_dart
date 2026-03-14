Operation =1
Option =0
Where ="((([DADOS SCFV GRUPOS E FX ETARIA].CodDiarioDet)=[Formulários]![DIARIO SUBFORM]!"
    "[CodDiarioDet]))"
Begin InputTables
    Name ="DADOS SCFV GRUPOS E FX ETARIA"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].CodDiarioDet"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].Grupo"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].Tipo"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].FxEtaria"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].Horario"
    Expression ="[DADOS SCFV GRUPOS E FX ETARIA].DiaSemana"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="DADOS SCFV GRUPOS E FX ETARIA"
    Expression ="TbPessoa.CodPessoa = [DADOS SCFV GRUPOS E FX ETARIA].Nome"
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
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[DADOS SCFV GRUPOS E FX ETARIA].CodDiarioDet"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =127
    Top =42
    Right =941
    Bottom =465
    Left =-1
    Top =-1
    Right =790
    Bottom =237
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =272
        Top =0
        Name ="DADOS SCFV GRUPOS E FX ETARIA"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =431
        Bottom =272
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
