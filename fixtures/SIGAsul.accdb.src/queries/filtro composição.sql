SELECT
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.[Renda per capita],
  TbPessoa.DataDesligPes
FROM
  TbPessoa
WHERE
  (
    (
      (TbPessoa.DataDesligPes) Is Null
    )
  )
ORDER BY
  TbPessoa.[Renda per capita];
