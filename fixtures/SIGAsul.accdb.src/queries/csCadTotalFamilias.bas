Operation =1
Option =0
Where ="(((CadResidencia.DataDesligResid) Is Null Or (CadResidencia.DataDesligResid)>=[D"
    "ATA FINAL]))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.[CRAS Origem]"
    Expression ="CadResidencia.[Nº Cras]"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.NIS"
    Expression ="TbPessoa.DNasc"
    Expression ="CadResidencia.DataDesligResid"
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
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[CRAS Origem]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Nº Cras]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbInteger "ColumnWidth" ="3975"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =11
    Top =14
    Right =1120
    Bottom =622
    Left =-1
    Top =-1
    Right =1085
    Bottom =197
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =250
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =245
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
