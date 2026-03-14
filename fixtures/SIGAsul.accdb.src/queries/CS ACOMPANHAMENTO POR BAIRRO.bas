Operation =1
Option =2
Where ="(((TbAcompDet.[PAF inicio]) Is Not Null) AND ((TbAcompDet.DataDesl) Is Null))"
Begin InputTables
    Name ="TbUnidade"
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="TbAcomp"
    Name ="TbAcompDet"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="TbUnidade.CRAS"
    Expression ="CadResidencia.Bairro"
    Expression ="TbUnidade.NOME"
    Expression ="TbAcomp.Volante"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbAcomp"
    RightTable ="TbAcompDet"
    Expression ="TbAcomp.CodAcomp = TbAcompDet.CodAcomp"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAcomp"
    Expression ="TbPessoa.CodPessoa = TbAcomp.Nome"
    Flag =1
    LeftTable ="TbUnidade"
    RightTable ="CadResidencia"
    Expression ="TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]"
    Flag =1
End
Begin OrderBy
    Expression ="CadResidencia.Bairro"
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
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="CadResidencia.Bairro"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2145"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.Volante"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.CRAS"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =28
    Top =49
    Right =980
    Bottom =616
    Left =-1
    Top =-1
    Right =928
    Bottom =269
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =35
        Top =17
        Right =179
        Bottom =161
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =205
        Top =7
        Right =349
        Bottom =266
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =380
        Top =12
        Right =524
        Bottom =156
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =592
        Top =7
        Right =736
        Bottom =151
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =765
        Top =106
        Right =909
        Bottom =304
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
End
