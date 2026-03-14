Operation =1
Option =0
Having ="(((TbAcompDet.[PAF inicio]) Is Not Null) AND ((TbAcompDet.DataDesl) Is Null))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbAcompDet"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbAcompDet.NomeTec"
    Expression ="TbPessoa.CodFam"
    Expression ="TbAcomp.Nome"
    Expression ="TbAcompDet.[PAF inicio]"
    Expression ="TbPessoa.DNasc"
    Expression ="TbPessoa.Idade"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.CPF"
    Expression ="TbAcompDet.DataDesl"
    Expression ="TbAcompDet.[Motivo Deslig]"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAcomp"
    Expression ="TbPessoa.CodPessoa = TbAcomp.Nome"
    Flag =1
End
Begin Groups
    Expression ="TbPessoa.CodPessoa"
    GroupLevel =0
    Expression ="TbAcompDet.NomeTec"
    GroupLevel =0
    Expression ="TbPessoa.CodFam"
    GroupLevel =0
    Expression ="TbAcomp.Nome"
    GroupLevel =0
    Expression ="TbAcompDet.[PAF inicio]"
    GroupLevel =0
    Expression ="TbPessoa.DNasc"
    GroupLevel =0
    Expression ="TbPessoa.Idade"
    GroupLevel =0
    Expression ="TbPessoa.Parentesco"
    GroupLevel =0
    Expression ="TbPessoa.CPF"
    GroupLevel =0
    Expression ="TbAcompDet.DataDesl"
    GroupLevel =0
    Expression ="TbAcompDet.[Motivo Deslig]"
    GroupLevel =0
    Expression ="TbPessoa.CodFam"
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
dbSingle "ECLScaleFactor" ="1"
dbMemo "OrderBy" ="[Lookup_Nome].[Nome]"
Begin
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[Motivo Deslig]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.NomeTec"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-33
    Top =60
    Right =1020
    Bottom =597
    Left =-1
    Top =-1
    Right =1029
    Bottom =294
    Left =0
    Top =0
    ColumnsShown =543
    Begin
        Left =423
        Top =26
        Right =567
        Bottom =170
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =628
        Top =15
        Right =772
        Bottom =194
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =201
        Top =18
        Right =345
        Bottom =177
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
