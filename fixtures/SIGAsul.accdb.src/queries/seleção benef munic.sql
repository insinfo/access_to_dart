SELECT
  TbSelecaoBenefMunic.IdSelecao,
  TbSelecaoBenefMunic.DataSelecao,
  TbSelecaoBenefMunic.[Cadastro nos equip semas],
  TbSelecaoBenefMunic.[Solicitou apoio alim],
  TbPessoa.Nome,
  TbPessoa.CodFam,
  TbPessoa.NomeMae,
  TbPessoa.NomePai,
  TbPessoa.Celular,
  TbPessoa.Parentesco,
  TbPessoa.DNasc,
  TbPessoa.NIS,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.[CERT LIVRO/FOLHA/TERMO],
  TbPessoa.[TITULO/ZONA/SEÇAO],
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.[Estado Civil],
  TbSelecaoBenefMunic.DataCad,
  TbSelecaoBenefMunic.NomeResp,
  TbSelecaoBenefMunic.CPFRespons,
  TbSelecaoBenefMunic.BMD,
  TbSelecaoBenefMunic.BMI,
  TbSelecaoBenefMunic.BSF,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.NOME AS UNIDADE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  CadResidencia.UF,
  CadResidencia.CEP,
  CadResidencia.Municipio,
  CadResidencia.Complemento,
  CadResidencia.Referencia,
  CadResidencia.[Tel fixo]
FROM
  TbUnidade,
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbSelecaoBenefMunic ON TbPessoa.CodPessoa = TbSelecaoBenefMunic.Nome
WHERE
  (
    (
      (TbSelecaoBenefMunic.IdSelecao)= [Formulários]![FrmSelecaoBeneficios]![IdSelecao]
    )
  );
