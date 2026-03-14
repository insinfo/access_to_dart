SELECT
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbPessoa.CodPessoa,
  TbPessoa.Nome AS NomePessoa,
  CadResidencia.CodFam,
  TbOfSocioEduDetalhe.DataInsc,
  TbOfSocioEduDetalhe.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.SituaçãoUsuario
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
      Or (TbOfSocioEduDetalhe.DataDesl)> [DATA FINAL]
    )
  )
ORDER BY
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  );
