SELECT
  DISTINCT TbPessoa.Nome,
  TbPessoa.BPCI,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d", [TbPessoa].[DNasc], [DATA FINAL]
    )/ 365.25
  ) AS Idade,
  BPC.NomeTitular
FROM
  TbPessoa
  LEFT JOIN BPC ON TbPessoa.Nome = BPC.NomeTitular
WHERE
  (
    (
      (
        Int(
          DateDiff(
            "d", [TbPessoa].[DNasc], [DATA FINAL]
          )/ 365.25
        )
      )>= 60
    )
  );
