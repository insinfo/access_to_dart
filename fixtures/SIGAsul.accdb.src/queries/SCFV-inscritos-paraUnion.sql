SELECT
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbOfSocioEduDetalhe.DataDesl,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [DNasC],
      Date()
    )/ 365.25
  ) AS Idade,
  TbOfSocioEduDetalhe.SituaçãoUsuario
FROM
  TbPessoa
  INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome;
