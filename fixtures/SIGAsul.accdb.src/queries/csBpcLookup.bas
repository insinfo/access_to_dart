Operation =1
Option =0
Begin InputTables
    Name ="TbOfSocioEduDetalhe"
    Name ="BPC"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="BPC.CODBPC"
    Alias ="BPCNome"
    Expression ="BPC.NomeTitular"
    Alias ="OficinaNome"
    Expression ="TbOfSocioEduDetalhe.Nome"
    Expression ="TbOfSocioEduDetalhe.BeneficioMunic"
    Expression ="TbOfSocioEduDetalhe.BPC"
End
Begin Joins
    LeftTable ="BPC"
    RightTable ="TbPessoa"
    Expression ="BPC.NomeTitular = TbPessoa.Nome"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbOfSocioEduDetalhe"
    Expression ="TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="BPC.CODBPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="BPCNome"
        dbInteger "ColumnWidth" ="1980"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="OficinaNome"
        dbInteger "ColumnWidth" ="2835"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.BPC"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.BeneficioMunic"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="1995"
        dbBoolean "ColumnHidden" ="0"
    End
End
Begin
    State =0
    Left =10
    Top =104
    Right =1170
    Bottom =741
    Left =-1
    Top =-1
    Right =1136
    Bottom =309
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =607
        Top =21
        Right =826
        Bottom =333
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =117
        Top =12
        Right =271
        Bottom =263
        Top =0
        Name ="BPC"
        Name =""
    End
    Begin
        Left =349
        Top =37
        Right =493
        Bottom =181
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
