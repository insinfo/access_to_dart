Operation =1
Option =0
Where ="(((TbPessoa.CodFam)=[Formulários]![FrmCadGeral]![CodFam]) AND ((CadResidencia.Da"
    "taDesligResid) Is Null) AND ((TbPessoa.DataDesligPes) Is Null))"
Begin InputTables
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbPessoa.CodFam"
    Expression ="CadResidencia.DataDesligResid"
    Expression ="TbPessoa.DataDesligPes"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.DataCadPes"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.DNasc"
    Alias ="Idade"
    Expression ="Int(DateDiff(\"d\",[TbPessoa].[DNASC],Date())/365.25)"
    Expression ="TbPessoa.LerEscrever"
    Expression ="TbPessoa.FreqEscola"
    Expression ="TbPessoa.Escolaridade"
    Expression ="TbPessoa.[NOME ESCOLA]"
    Expression ="TbPessoa.CTPS"
    Expression ="TbPessoa.[Nº CTPS]"
    Expression ="TbPessoa.[Condição Ocupação]"
    Expression ="TbPessoa.[Renda sem programas sociais]"
    Expression ="TbPessoa.[Renda per capita]"
    Expression ="TbPessoa.[Recebe programa social]"
    Expression ="TbPessoa.[Aposentado/pensionista]"
    Expression ="CadResidencia.MotivoDeslResid"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.[CodFam] = TbPessoa.[CodFam]"
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
        dbText "Name" ="CadResidencia.MotivoDeslResid"
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
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.FreqEscola"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.LerEscrever"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Escolaridade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataDesligResid"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Trabalho Infantil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda sem programas sociais]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Aposentado/pensionista]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CTPS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Condição Ocupação]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Renda per capita]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Recebe programa social]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Nº CTPS]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[NOME ESCOLA]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Trabalho Infantil"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =2
    Left =-8
    Top =-31
    Right =1013
    Bottom =685
    Left =-1
    Top =-1
    Right =989
    Bottom =259
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =87
        Top =19
        Right =265
        Bottom =256
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =361
        Top =18
        Right =577
        Bottom =272
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
