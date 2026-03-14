SELECT
  TbAtColetivo.CodColetivo,
  TbAtColetivo.DataCol,
  TbAtColetivo.OfSESCFV,
  TbAtColetivo.AtividadeSCFV,
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
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtColetivo.OfSESCFV)= Yes
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)> [DATA FINAL]
    )
  )
  OR (
    (
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtColetivo.AtividadeSCFV)= Yes
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)> [DATA FINAL]
    )
  );
