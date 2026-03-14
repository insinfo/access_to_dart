Operation =1
Option =0
Where ="(((CadResidencia.Volante)=No) AND ((CadResidencia.DataCad) Between [DATA INICIAL"
    "] And [DATA FINAL]) AND ((TbPessoa.Parentesco)=\"PESSOA DE REFERENCIA\"))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.Volante"
    Expression ="CadResidencia.DataCad"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.Nome"
    Expression ="CadResidencia.[Demanda espontanea]"
    Expression ="CadResidencia.[Busca ativa]"
    Expression ="CadResidencia.[Enc Unidades Proteção Basica]"
    Expression ="CadResidencia.[Enc Unidades Proteção Especial]"
    Expression ="CadResidencia.[Enc Saude]"
    Expression ="CadResidencia.[Enc Educação]"
    Expression ="CadResidencia.[Enc Politicas Setoriais]"
    Expression ="CadResidencia.[Enc Conselho Tutelar]"
    Expression ="CadResidencia.[Enc Poder Judiciario]"
    Expression ="CadResidencia.[Enc Defens Publica/MP/Delegacias]"
    Expression ="CadResidencia.[Enc outros]"
    Expression ="CadResidencia.[Nome Encaminhador]"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="CadResidencia.[Enc outros]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Defens Publica/MP/Delegacias]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Unidades Proteção Especial]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Unidades Proteção Basica]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Educação]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Saude]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nome Encaminhador]"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="2385"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Politicas Setoriais]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Busca ativa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Conselho Tutelar]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Poder Judiciario]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Demanda espontanea]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =295
    Top =15
    Right =1026
    Bottom =658
    Left =-1
    Top =-1
    Right =707
    Bottom =248
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =141
        Top =12
        Right =334
        Bottom =280
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =540
        Top =20
        Right =684
        Bottom =305
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
