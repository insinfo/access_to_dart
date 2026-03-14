Operation =1
Option =0
Begin InputTables
    Name ="csTrabInfantil"
    Name ="TbAcompDet"
    Name ="TbAcomp"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAcomp.Nome"
    Expression ="TbAcomp.CodFamilia"
    Expression ="csTrabInfantil.data"
    Expression ="csTrabInfantil.TrabInf"
    Expression ="csTrabInfantil.SupTrabInf"
End
Begin Joins
    LeftTable ="TbAcompDet"
    RightTable ="TbAcomp"
    Expression ="TbAcompDet.CodAcomp = TbAcomp.CodAcomp"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="csTrabInfantil"
    Expression ="TbPessoa.CodPessoa = csTrabInfantil.NomePessoa"
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
        dbText "Name" ="csTrabInfantil.SupTrabInf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csTrabInfantil.TrabInf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csTrabInfantil.data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodFamilia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1180
    Bottom =660
    Left =-1
    Top =-1
    Right =1112
    Bottom =219
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =87
        Top =22
        Right =231
        Bottom =223
        Top =0
        Name ="csTrabInfantil"
        Name =""
    End
    Begin
        Left =709
        Top =29
        Right =853
        Bottom =265
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =464
        Top =22
        Right =608
        Bottom =166
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =271
        Top =20
        Right =415
        Bottom =164
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
