SELECT
  TbPessoa.CodFam,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.[Renda per capita]
FROM
  TbPessoa
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
      And 6
    )
  )
ORDER BY
  TbPessoa.[Renda per capita];
