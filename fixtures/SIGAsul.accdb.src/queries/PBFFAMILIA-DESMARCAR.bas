Operation =1
Option =0
Where ="((([PBFFAMILIA-NÃO].TITULAR) Is Null))"
Begin InputTables
    Name ="PBFFAMILIA-NÃO"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="[PBFFAMILIA-NÃO].TITULAR"
    Expression ="[PBFFAMILIA-NÃO].CodFam"
    Expression ="[PBFFAMILIA-NÃO].CodPessoa"
    Expression ="CadResidencia.[PBF FAMILIA]"
    Expression ="[PBFFAMILIA-NÃO].Nome"
    Expression ="[PBFFAMILIA-NÃO].Parentesco"
End
Begin Joins
    LeftTable ="PBFFAMILIA-NÃO"
    RightTable ="CadResidencia"
    Expression ="[PBFFAMILIA-NÃO].CodFam = CadResidencia.CodFam"
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
        dbText "Name" ="CadResidencia.[PBF FAMILIA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PBFFAMILIA-NÃO].Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PBFFAMILIA-NÃO].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PBFFAMILIA-NÃO].CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PBFFAMILIA-NÃO].TITULAR"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PBFFAMILIA-NÃO].Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1175
    Bottom =660
    Left =-1
    Top =-1
    Right =1151
    Bottom =326
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =148
        Top =24
        Right =292
        Bottom =278
        Top =0
        Name ="PBFFAMILIA-NÃO"
        Name =""
    End
    Begin
        Left =340
        Top =12
        Right =484
        Bottom =323
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
