SELECT
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [DNasc],
      Date()
    )/ 365.25
  ) AS Idade
FROM
  TbPessoa
WHERE
  (
    (
      (
        Int(
          DateDiff(
            "d",
            [DNasc],
            Date()
          )/ 365.25
        )
      )>= 60
    )
  );
