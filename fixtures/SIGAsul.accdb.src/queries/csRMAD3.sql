SELECT
  TbAtColetivo.CodColetivo,
  TbAtColetivo.OfSESCFV,
  TbAtColetivo.AtividadeSCFV,
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
  TbPessoa.DataDesligPes
FROM
  TbPessoa
  INNER JOIN (
    TbAtColetivo
    INNER JOIN TbAtColetivoDet ON TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
  ) ON TbPessoa.CodPessoa = TbAtColetivoDet.Nome
WHERE
  (
    (
      (TbAtColetivo.OfSESCFV)= Yes
    )
    AND (
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)> [DATA FINAL]
    )
  )
  OR (
    (
      (TbAtColetivo.AtividadeSCFV)= Yes
    )
    AND (
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)> [DATA FINAL]
    )
  );
