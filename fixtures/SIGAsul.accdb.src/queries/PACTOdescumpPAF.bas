Operation =1
Option =0
Where ="(((TbAcompdet.[PAF inicio]) Is Not Null) AND ((TbAcompdet.DataDesl) Is Null))"
Begin InputTables
    Name ="csDescumprimNumFamil"
    Name ="TbPessoa"
    Name ="TbAcomp"
    Name ="TbAcompdet"
End
Begin OutputColumns
    Expression ="TbAcompdet.NomeTec"
    Expression ="TbAcomp.Nome"
    Expression ="TbAcompdet.[PAF inicio]"
    Expression ="TbAcompdet.[PAF fim]"
    Expression ="TbAcompdet.DataDesl"
    Expression ="csDescumprimNumFamil.nomeresp"
    Expression ="csDescumprimNumFamil.bairro"
End
Begin Joins
    LeftTable ="TbAcomp"
    RightTable ="TbAcompdet"
    Expression ="TbAcomp.codAcomp = TbAcompdet.CodAcomp"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAcomp"
    Expression ="TbPessoa.CodPessoa = TbAcomp.Nome"
    Flag =1
    LeftTable ="csDescumprimNumFamil"
    RightTable ="TbPessoa"
    Expression ="csDescumprimNumFamil.nomeresp = TbPessoa.Nome"
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
        dbText "Name" ="csDescumprimNumFamil.nomeresp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csDescumprimNumFamil.bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompdet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompdet.NomeTec"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompdet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompdet.[PAF fim]"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-26
    Top =25
    Right =1100
    Bottom =509
    Left =-1
    Top =-1
    Right =1102
    Bottom =98
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =156
        Top =0
        Name ="csDescumprimNumFamil"
        Name =""
    End
    Begin
        Left =240
        Top =0
        Right =384
        Bottom =230
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =432
        Top =12
        Right =576
        Bottom =156
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =624
        Top =12
        Right =768
        Bottom =156
        Top =0
        Name ="TbAcompdet"
        Name =""
    End
End
