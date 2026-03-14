Operation =1
Option =0
Begin InputTables
    Name ="TbPessoa"
    Name ="CadResidencia"
End
Begin OutputColumns
    Expression ="CadResidencia.CodFam"
    Expression ="CadResidencia.DataCad"
    Expression ="TbPessoa.CodPessoa"
    Expression ="TbPessoa.DataCadPes"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.DNasc"
    Expression ="TbPessoa.NomeMae"
    Expression ="TbPessoa.NomePai"
    Expression ="TbPessoa.Celular"
    Expression ="TbPessoa.NIS"
    Expression ="TbPessoa.CPF"
    Expression ="TbPessoa.RG"
    Expression ="TbPessoa.OrgaoRG"
    Expression ="TbPessoa.DEmisRG"
    Expression ="TbPessoa.[CERT LIVRO/FOLHA/TERMO]"
    Expression ="TbPessoa.[TITULO/ZONA/SEÇAO]"
    Expression ="TbPessoa.Sexo"
    Expression ="TbPessoa.[Raça/Cor]"
    Expression ="TbPessoa.MunicNasc"
    Expression ="TbPessoa.UFNasc"
    Expression ="TbPessoa.[Estado Civil]"
End
Begin Joins
    LeftTable ="TbPessoa"
    RightTable ="CadResidencia"
    Expression ="TbPessoa.CodFam = CadResidencia.CodFam"
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
        dbText "Name" ="TbPessoa.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Estado Civil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[CERT LIVRO/FOLHA/TERMO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[TITULO/ZONA/SEÇAO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.UFNasc"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =44
    Top =93
    Right =1070
    Bottom =660
    Left =-1
    Top =-1
    Right =1002
    Bottom =273
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =192
        Bottom =274
        Top =0
        Name ="TbPessoa"
        Name =""
    End
    Begin
        Left =240
        Top =12
        Right =384
        Bottom =156
        Top =0
        Name ="CadResidencia"
        Name =""
    End
End
