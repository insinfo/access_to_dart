SELECT
  TbOfSocioEduDetalhe.DataDesl,
  Max(TbOfSocioEduAtualiz.DataAtual) AS MáxDeDataAtual,
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbPessoa.NIS,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.NomeMae,
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbOfSocioEduDetalhe.SituaçãoUsuario,
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.CodFam,
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  CadResidencia.UF,
  CadResidencia.CEP,
  CadResidencia.Municipio,
  CadResidencia.Complemento,
  CadResidencia.Referencia
FROM
  (
    (
      CadResidencia
      INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
    )
    INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
  )
  INNER JOIN TbOfSocioEduAtualiz ON TbOfSocioEduDetalhe.CodOfSEDet = TbOfSocioEduAtualiz.CodOfSEDet
GROUP BY
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbPessoa.NIS,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ),
  TbPessoa.NomeMae,
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbOfSocioEduDetalhe.SituaçãoUsuario,
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.CodFam,
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  CadResidencia.UF,
  CadResidencia.CEP,
  CadResidencia.Municipio,
  CadResidencia.Complemento,
  CadResidencia.Referencia
HAVING
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
    )
  );
