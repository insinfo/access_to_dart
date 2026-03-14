Operation =1
Option =2
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbUnidade"
    Name ="CadResidencia"
    Name ="TbPessoa"
    Name ="TbAtend"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="TbAtend.Volante"
    Expression ="CadResidencia.Bairro"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbAtend"
    Expression ="TbPessoa.CodPessoa = TbAtend.Nome"
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
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Volante"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =219
    Top =-7
    Right =1015
    Bottom =560
    Left =-1
    Top =-1
    Right =772
    Bottom =193
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =544
        Top =12
        Right =688
        Bottom =260
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =392
        Top =11
        Right =513
        Bottom =169
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =58
        Top =5
        Right =182
        Bottom =136
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =222
        Top =95
        Right =380
        Bottom =291
        Top =0
        Name ="TbAtend"
        Name =""
    End
End
