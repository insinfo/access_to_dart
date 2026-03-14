Operation =1
Option =0
Where ="(((CadResidencia.CodFam)=[Formulários]![FrmCadGeral]![CodFam]) AND ((TbPessoa.Pa"
    "rentesco)=\"Pessoa de Referencia\"))"
Begin InputTables
    Name ="TbUnidade"
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="TbUnidade.[Nº UNIDADE]"
    Expression ="TbUnidade.NOME"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.NIS"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbUnidade.CODBARRAS"
    Expression ="CadResidencia.CodCREAS"
    Expression ="CadResidencia.CodCEAM"
    Expression ="TbUnidade.imgCartaoSuas"
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
    State =2
    Left =-8
    Top =-31
    Right =1402
    Bottom =685
    Left =-1
    Top =-1
    Right =1378
    Bottom =193
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =494
        Top =50
        Right =638
        Bottom =194
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
