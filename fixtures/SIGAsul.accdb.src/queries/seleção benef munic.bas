Operation =1
Option =0
Where ="(((TbSelecaoBenefMunic.IdSelecao)=[Formulários]![FrmSelecaoBeneficios]![IdSeleca"
    "o]))"
Begin InputTables
    Name ="TbSelecaoBenefMunic"
    Name ="TbUnidade"
    Name ="CadResidencia"
    Name ="TbPessoa"
End
Begin OutputColumns
    Expression ="TbSelecaoBenefMunic.IdSelecao"
    Expression ="TbSelecaoBenefMunic.DataSelecao"
    Expression ="TbSelecaoBenefMunic.[Cadastro nos equip semas]"
    Expression ="TbSelecaoBenefMunic.[Solicitou apoio alim]"
    Expression ="TbPessoa.Nome"
    Expression ="TbPessoa.CodFam"
    Expression ="TbPessoa.NomeMae"
    Expression ="TbPessoa.NomePai"
    Expression ="TbPessoa.Celular"
    Expression ="TbPessoa.Parentesco"
    Expression ="TbPessoa.DNasc"
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
    Expression ="TbSelecaoBenefMunic.DataCad"
    Expression ="TbSelecaoBenefMunic.NomeResp"
    Expression ="TbSelecaoBenefMunic.CPFRespons"
    Expression ="TbSelecaoBenefMunic.BMD"
    Expression ="TbSelecaoBenefMunic.BMI"
    Expression ="TbSelecaoBenefMunic.BSF"
    Expression ="TbUnidade.LOGO"
    Expression ="TbUnidade.RODAPE"
    Alias ="UNIDADE"
    Expression ="TbUnidade.NOME"
    Expression ="TbUnidade.[DIRETOR(A)]"
    Expression ="TbUnidade.FUNÇÃO"
    Expression ="TbUnidade.MATRICULA"
    Expression ="CadResidencia.Endereço"
    Expression ="CadResidencia.Bairro"
    Expression ="CadResidencia.UF"
    Expression ="CadResidencia.CEP"
    Expression ="CadResidencia.Municipio"
    Expression ="CadResidencia.Complemento"
    Expression ="CadResidencia.Referencia"
    Expression ="CadResidencia.[Tel fixo]"
End
Begin Joins
    LeftTable ="CadResidencia"
    RightTable ="TbPessoa"
    Expression ="CadResidencia.CodFam = TbPessoa.CodFam"
    Flag =1
    LeftTable ="TbPessoa"
    RightTable ="TbSelecaoBenefMunic"
    Expression ="TbPessoa.CodPessoa = TbSelecaoBenefMunic.Nome"
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
        dbText "Name" ="TbSelecaoBenefMunic.BMD"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.BSF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.CPFRespons"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.IdSelecao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.BMI"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.DataSelecao"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.NomeResp"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.[Solicitou apoio alim]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.[Cadastro nos equip semas]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbSelecaoBenefMunic.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.DEmisRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.RG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.CodFam"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.NomeMae"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.Parentesco"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.CPF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.DataCadPes"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.NIS"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.CodPessoa"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.[CERT LIVRO/FOLHA/TERMO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.Celular"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.DataCad"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.[Estado Civil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.OrgaoRG"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.[TITULO/ZONA/SEÇAO]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.Sexo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.[Raça/Cor]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.MunicNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="cadastroPessoas.UFNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.MATRICULA"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.RODAPE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Municipio"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.CEP"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.UF"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Complemento"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.LOGO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.[Tel fixo]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.NOME"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.[DIRETOR(A)]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbUnidade.FUNÇÃO"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Endereço"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Bairro"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="CadResidencia.Referencia"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="UNIDADE"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.DNasc"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.[Estado Civil]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Nome"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.NomePai"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="TbPessoa.Celular"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =36
    Top =10
    Right =1334
    Bottom =673
    Left =-1
    Top =-1
    Right =1274
    Bottom =366
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =60
        Top =9
        Right =303
        Bottom =327
        Top =0
        Name ="TbSelecaoBenefMunic"
        Name =""
    End
    Begin
        Left =815
        Top =14
        Right =959
        Bottom =307
        Top =0
        Name ="TbUnidade"
        Name =""
    End
    Begin
        Left =651
        Top =9
        Right =795
        Bottom =264
        Top =0
        Name ="CadResidencia"
        Name =""
    End
    Begin
        Left =351
        Top =12
        Right =495
        Bottom =282
        Top =0
        Name ="TbPessoa"
        Name =""
    End
End
