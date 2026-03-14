SELECT
  TbAtColetivo.CodColetivo,
  TbAtColetivo.DataCol,
  TbPessoa.Nome,
  TbPessoa.DataCadPes,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.DataDesligPes,
  TbAtColetivo.OfSESCFV,
  TbAtColetivo.AtividadeSCFV
FROM
  TbPessoa
  INNER JOIN (
    TbAtColetivo
    INNER JOIN TbAtColetivoDet ON TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
  ) ON TbPessoa.CodPessoa = TbAtColetivoDet.Nome
WHERE
  (
    (
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)> [DATA FINAL]
    )
    AND (
      (TbAtColetivo.OfSESCFV)= Yes
    )
  )
  OR (
    (
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)> [DATA FINAL]
    )
    AND (
      (TbAtColetivo.AtividadeSCFV)= Yes
    )
  );
