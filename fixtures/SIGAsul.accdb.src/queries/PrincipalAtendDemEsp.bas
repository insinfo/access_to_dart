Operation =1
Option =0
Where ="(((TbAtend.Data) Between [DATA INICIAL] And [DATA FINAL]) AND ((CadResidencia.Da"
    "taCad)=[Data]))"
Begin InputTables
    Name ="TbAtend"
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="TbAtend.CodAtend"
    Expression ="TbAtend.Data"
    Expression ="CadResidencia.DataCad"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.Parentesco"
    Alias ="Mês de Referencia"
    Expression ="MonthName(Month([Data]))"
    Expression ="TbAtend.Nome"
    Expression ="CadResidencia.[Demanda espontanea]"
    Expression ="TbAtend.AtRemoto"
    Expression ="TbAtend.Acoremoto"
    Expression ="CadResidencia.[Enc Unidades Proteção Basica]"
    Expression ="CadResidencia.[Enc Unidades Proteção Especial]"
    Expression ="CadResidencia.[Enc Conselho Tutelar]"
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
End
Begin OrderBy
    Expression ="TbAtend.Nome"
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
dbMemo "OrderBy" ="[PrincipalAtendDemEsp].[CodFam], [Lookup_Nome].[Nome]"
Begin
    Begin
        dbText "Name" ="TbAtend.Nome"
        dbLong "AggregateType" ="2"
        dbInteger "ColumnWidth" ="3945"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="TbAtend.Data"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.CodAtend"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Mês de Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.Acoremoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbAtend.AtRemoto"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Demanda espontanea]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Unidades Proteção Basica]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Unidades Proteção Especial]"
        dbLong "AggregateType" ="2"
    End
    Begin
        dbText "Name" ="CadResidencia.[Enc Conselho Tutelar]"
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
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =61
    Top =3
    Right =1159
    Bottom =663
    Left =-1
    Top =-1
    Right =1074
    Bottom =167
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =67
        Top =13
        Right =222
        Bottom =152
        Top =0
        Name ="TbAtend"
        Name =""
    End
    Begin
        Left =468
        Top =7
        Right =589
        Bottom =138
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =274
        Top =12
        Right =387
        Bottom =147
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
