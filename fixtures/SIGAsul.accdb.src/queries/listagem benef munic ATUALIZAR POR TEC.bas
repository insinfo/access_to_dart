Operation =1
Option =0
Where ="((([listagem benef munic GERAL].NomeFunc) Like \"*\"+[DIGITE O TÉCNICO]+\"*\") A"
    "ND (([listagem benef munic movimento ano GERAL].TbPessoa.Nome) Is Null))"
Begin InputTables
    Name ="listagem benef munic GERAL"
    Name ="listagem benef munic movimento ano GERAL"
End
Begin OutputColumns
    Expression ="[listagem benef munic GERAL].NomeFunc"
    Expression ="[listagem benef munic GERAL].TbPessoa.NOME"
    Expression ="[listagem benef munic movimento ano GERAL].[Ano de referencia]"
    Expression ="[listagem benef munic GERAL].TipoBeneficio"
    Expression ="[listagem benef munic GERAL].DataDesl"
    Expression ="[listagem benef munic GERAL].DataSusp"
    Expression ="[listagem benef munic GERAL].DataTransf"
    Expression ="[listagem benef munic GERAL].CPF"
    Expression ="[listagem benef munic GERAL].Celular"
    Expression ="[listagem benef munic GERAL].Responsavel"
    Expression ="[listagem benef munic GERAL].[CPF Responsavel]"
    Expression ="[listagem benef munic GERAL].TbUnidade.NOME"
    Expression ="[listagem benef munic GERAL].[DIRETOR(A)]"
    Expression ="[listagem benef munic GERAL].FUNÇÃO"
    Expression ="[listagem benef munic GERAL].MATRICULA"
    Expression ="[listagem benef munic GERAL].LOGO"
    Expression ="[listagem benef munic GERAL].RODAPE"
End
Begin Joins
    LeftTable ="listagem benef munic GERAL"
    RightTable ="listagem benef munic movimento ano GERAL"
    Expression ="[listagem benef munic GERAL].[TbPessoa].[NOME] = [listagem benef munic movimento"
        " ano GERAL].[TbPessoa].[Nome]"
    Flag =2
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
        dbText "Name" ="[listagem benef munic GERAL].TbPessoa.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.TbPessoa.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.DataSusp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.DataTransf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.Responsavel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.CPF Responsavel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.DIRETOR(A)"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="listagem benef munic GERAL.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic movimento ano GERAL].[Ano de referencia]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Ano de referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].NomeFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].DataSusp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].DataTransf"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].TipoBeneficio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].Responsavel"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].[CPF Responsavel]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[listagem benef munic GERAL].FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =0
    Top =40
    Right =1069
    Bottom =660
    Left =-1
    Top =-1
    Right =1045
    Bottom =256
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =321
        Bottom =248
        Top =0
        Name ="listagem benef munic GERAL"
        Name =""
    End
    Begin
        Left =439
        Top =2
        Right =769
        Bottom =231
        Top =0
        Name ="listagem benef munic movimento ano GERAL"
        Name =""
    End
End
