SELECT
  TbOfSocioEduDetalhe.Nome,
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbOfSocioEduDetalhe.DataInsc,
  TbOfSocioEduDetalhe.SituaçãoUsuario,
  TbOfSocioEduDetalhe.DataDesl,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade
FROM
  TbPessoa
  INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome;
