SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  TbAtend.Nome,
  TbPessoa.CodPessoa,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.CodFam
FROM
  TbPessoa
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome;
