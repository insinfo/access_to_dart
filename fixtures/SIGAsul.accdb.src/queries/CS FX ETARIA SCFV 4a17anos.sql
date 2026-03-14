SELECT
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbOfSocioEduDetalhe.Volante,
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbOfSocioEduDetalhe.DataInsc,
  TbOfSocioEduDetalhe.Nome,
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
  INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
WHERE
  (
    (
      (
        Int(
          DateDiff(
            "d",
            [TbPessoa].[DNasc],
            Date()
          )/ 365.25
        )
      ) Between 4
      And 17
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
