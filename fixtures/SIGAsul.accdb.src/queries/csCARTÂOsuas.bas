Operation =1
Option =0
Where ="(((CadResidencia.CodFam) Between [DIGITE O 1º CÓD FAMILIAR] And [DIGITE O ÚLTIMO"
    " CÓD FAMILIAR]) AND ((TbPessoa.Parentesco)=\"Pessoa de Referencia\"))"
Begin InputTables
    Name ="TbUnidade"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="TbUnidade.imgCartaoSuas"
    Expression ="TbUnidade.[Nº UNIDADE]"
    Expression ="TbUnidade.NOME"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.NIS"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbUnidade.CODBARRAS"
    Expression ="CadResidencia.CodCREAS"
    Expression ="CadResidencia.CodCEAM"
End
Begin Joins
    LeftTable ="TbUnidade"
    RightTable ="CadResidencia"
    Expression ="TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="CadResidencia"
    Expression ="TbPessoa.CodFam = CadResidencia.CodFam"
    Flag =1
End
Begin OrderBy
    Expression ="CadResidencia.CodFam"
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
        dbText "Name" ="TbPessoa.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[Nº UNIDADE]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2715"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbUnidade.CODBARRAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodCREAS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodCEAM"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.imgCartaoSuas"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1034
    Bottom =524
    Left =-1
    Top =-1
    Right =966
    Bottom =204
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =448
        Top =0
        Right =592
        Bottom =144
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =56
        Top =0
        Right =200
        Bottom =270
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =261
        Top =31
        Right =405
        Bottom =271
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
