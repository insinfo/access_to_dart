Operation =1
Option =0
Where ="(((TbAcomp.CodAcomp)=[Formulários]![FrmAco]![CodAcomp]))"
Begin InputTables
    Name ="TbAcomp"
    Name ="TbRegSint"
    Name ="TbAcompDet"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbAcomp.CodAcomp"
    Expression ="TbAcomp.DataIncl"
    Expression ="TbAcompDet.[PAF inicio]"
    Alias ="nummes"
    Expression ="-DateDiff(\"m\",Date(),[TbAcompDet].[PAF inicio])"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CodFam"
    Expression ="TbRegSint.CodRegSint"
    Expression ="TbRegSint.CodAcomp"
    Expression ="TbRegSint.DataRegSint"
    Expression ="TbRegSint.NomeTecnico"
    Expression ="TbRegSint.[Foram efetivamente disponibilizadas]"
    Expression ="TbRegSint.[Em relação aos encaminhamentos]"
    Expression ="TbRegSint.[A familia reconhece o Serviço de Aco]"
    Expression ="TbRegSint.[Houve agravamento]"
    Expression ="TbRegSint.[A situação atual é equivalente à sit inicial]"
    Expression ="TbRegSint.[Houve avanço mas não justifica desligamento]"
    Expression ="TbRegSint.[Houve significativo avanço e justifica desligamento]"
    Expression ="TbRegSint.[Acompanhamento PAIF sem sucesso não aderiu ao PAF]"
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
    LeftTable ="TbAcomp"
    RightTable ="TbRegSint"
    Expression ="TbAcomp.CodAcomp = TbRegSint.CodAcomp"
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
        dbText "Name" ="TbRegSint.[Acompanhamento PAIF sem sucesso não aderiu ao PAF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.DataIncl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcomp.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.CodAcomp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.DataRegSint"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.CodRegSint"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.NomeTecnico"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.[Foram efetivamente disponibilizadas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.[Em relação aos encaminhamentos]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.[A familia reconhece o Serviço de Aco]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.[Houve agravamento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.[A situação atual é equivalente à sit inicial]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.[Houve avanço mas não justifica desligamento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbRegSint.[Houve significativo avanço e justifica desligamento]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAcompDet.[PAF inicio]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="nummes"
        dbInteger "ColumnWidth" ="3765"
        dbBoolean "ColumnHidden" ="0"
        dbText "Format" ="Standard"
        dbByte "DecimalPlaces" ="2"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-327
    Top =45
    Right =1049
    Bottom =682
    Left =-1
    Top =-1
    Right =1352
    Bottom =306
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =710
        Top =13
        Right =854
        Bottom =157
        Top =0
        Name ="TbAcomp"
        Name =""
    End
    Begin
        Left =118
        Top =22
        Right =493
        Bottom =331
        Top =0
        Name ="TbRegSint"
        Name =""
    End
    Begin
        Left =904
        Top =18
        Right =1048
        Bottom =253
        Top =0
        Name ="TbAcompDet"
        Name =""
    End
    Begin
        Left =515
        Top =143
        Right =659
        Bottom =287
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
