Operation =1
Option =0
Where ="(((TbPessoa.Nome) In (SELECT [Nome] FROM [TbPessoa] As Tmp GROUP BY [Nome],[DNas"
    "c],[CPF] HAVING Count(*)>1  And [DNasc] = [TbPessoa].[DNasc] And [CPF] = [TbPess"
    "oa].[CPF])))"
Begin InputTables
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="CadResidencia.DataCad"
    Expression ="CadResidencia.CodFam"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.DNasc"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.MotivoDeslPes"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
End
Begin OrderBy
    Expression ="TbPessoa.Nome"
    Flag =0
    Expression ="TbPessoa.DNasc"
    Flag =0
    Expression ="TbPessoa.CPF"
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
dbSingle "ECLScaleFactor" ="1"
Begin
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Nome]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[CPF]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[DNasc]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[CodPessoa]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.MotivoDeslPes"
        dbInteger "ColumnWidth" ="1920"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =54
    Top =71
    Right =1301
    Bottom =650
    Left =-1
    Top =-1
    Right =1093
    Bottom =260
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =338
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =346
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
