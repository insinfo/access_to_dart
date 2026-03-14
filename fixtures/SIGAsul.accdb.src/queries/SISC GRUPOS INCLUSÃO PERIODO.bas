Operation =1
Option =0
Where ="(((TbOfSocioEduDetalhe.DataInsc) Between [DATA INICIAL] And [DATA FINAL]))"
Begin InputTables
    Name ="TbOfSocioEduDetalhe"
    Name ="SISC GRUPOS GERAL"
End
Begin OutputColumns
    Expression ="[SISC GRUPOS GERAL].CodDiario"
    Expression ="TbOfSocioEduDetalhe.DataInsc"
    Expression ="[SISC GRUPOS GERAL].Nome"
    Expression ="[SISC GRUPOS GERAL].Grupo"
    Expression ="[SISC GRUPOS GERAL].Tipo"
    Expression ="[SISC GRUPOS GERAL].Horario"
    Expression ="[SISC GRUPOS GERAL].FxEtaria"
    Expression ="[SISC GRUPOS GERAL].DiaSemana"
    Expression ="[SISC GRUPOS GERAL].CodFunc"
    Expression ="[SISC GRUPOS GERAL].NomeOficineiro"
    Expression ="[SISC GRUPOS GERAL].CodPessoa"
    Expression ="[SISC GRUPOS GERAL].DNasc"
    Expression ="[SISC GRUPOS GERAL].Idade"
    Expression ="[SISC GRUPOS GERAL].Sexo"
    Expression ="[SISC GRUPOS GERAL].[Raça/Cor]"
    Expression ="[SISC GRUPOS GERAL].MunicNasc"
    Expression ="[SISC GRUPOS GERAL].UFNasc"
    Expression ="[SISC GRUPOS GERAL].NomeMae"
    Expression ="[SISC GRUPOS GERAL].NIS"
    Expression ="[SISC GRUPOS GERAL].RG"
    Expression ="[SISC GRUPOS GERAL].OrgaoRG"
    Expression ="[SISC GRUPOS GERAL].DEmisRG"
    Expression ="[SISC GRUPOS GERAL].DataDesligPes"
    Expression ="[SISC GRUPOS GERAL].MotivoDeslPes"
    Expression ="[SISC GRUPOS GERAL].Endereço"
    Expression ="[SISC GRUPOS GERAL].Bairro"
    Expression ="[SISC GRUPOS GERAL].UF"
    Expression ="[SISC GRUPOS GERAL].CEP"
    Expression ="TbOfSocioEduDetalhe.SituaçãoUsuario"
    Expression ="TbOfSocioEduDetalhe.DataDesl"
    Expression ="TbOfSocioEduDetalhe.MotivoDesl"
    Expression ="TbOfSocioEduDetalhe.Encaminhado"
    Expression ="TbOfSocioEduDetalhe.Onde"
End
Begin Joins
    LeftTable ="SISC GRUPOS GERAL"
    RightTable ="TbOfSocioEduDetalhe"
    Expression ="[SISC GRUPOS GERAL].Nome = TbOfSocioEduDetalhe.Nome"
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
        dbText "Name" ="[SISC GRUPOS GERAL].CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Encaminhado"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.Onde"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].CodDiario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].FxEtaria"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].Idade"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].Horario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].Tipo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].Nome"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3090"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].Grupo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].DiaSemana"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].CodFunc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].NomeOficineiro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].DataDesligPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].MotivoDeslPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[SISC GRUPOS GERAL].Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.SituaçãoUsuario"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.MotivoDesl"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbOfSocioEduDetalhe.DataInsc"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =73
    Top =124
    Right =1024
    Bottom =385
    Left =-1
    Top =-1
    Right =927
    Bottom =183
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =346
        Top =42
        Right =558
        Bottom =290
        Top =0
        Name ="TbOfSocioEduDetalhe"
        Name =""
    End
    Begin
        Left =61
        Top =6
        Right =266
        Bottom =238
        Top =0
        Name ="SISC GRUPOS GERAL"
        Name =""
    End
End
