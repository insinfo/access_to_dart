Operation =1
Option =0
Begin InputTables
    Name ="csFormaDeAcesso"
    Name ="PrincipalAtendDemEsp"
End
Begin OutputColumns
    Expression ="csFormaDeAcesso.DataCad"
    Expression ="csFormaDeAcesso.Nome"
    Expression ="PrincipalAtendDemEsp.Data"
    Expression ="PrincipalAtendDemEsp.Nome"
    Expression ="csFormaDeAcesso.Volante"
End
Begin Joins
    LeftTable ="PrincipalAtendDemEsp"
    RightTable ="csFormaDeAcesso"
    Expression ="PrincipalAtendDemEsp.CodPessoa = csFormaDeAcesso.CodPessoa"
    Flag =3
End
Begin OrderBy
    Expression ="csFormaDeAcesso.Nome"
    Flag =0
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
        dbText "Name" ="PrincipalAtendDemEsp.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csFormaDeAcesso.Nome"
        dbInteger "ColumnWidth" ="3405"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="PrincipalAtendDemEsp.Nome"
        dbInteger "ColumnWidth" ="3450"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="csFormaDeAcesso.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="csFormaDeAcesso.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =103
    Top =3
    Right =884
    Bottom =622
    Left =-1
    Top =-1
    Right =757
    Bottom =169
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =244
        Top =5
        Right =388
        Bottom =149
        Top =0
        Name ="csFormaDeAcesso"
        Name =""
    End
    Begin
        Left =527
        Top =-1
        Right =730
        Bottom =215
        Top =0
        Name ="PrincipalAtendDemEsp"
        Name =""
    End
End
