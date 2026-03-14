SELECT
  DISTINCT TbPessoa.Nome,
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
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [MÊS INICIAL DO ANO]
      And [MÊS DE FECHAMENTO]
    )
  );
