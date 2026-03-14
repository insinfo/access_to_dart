SELECT
  TbAtColetivo.CodColetivo,
  TbAtColetivo.DataCol,
  TbAtColetivo.GruposPAIF,
  TbAtColetivo.MediacoesPAIF,
  TbAtColetivoDet.Nome,
  TbAtColetivoDet.NomeVisitante,
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
      (TbAtColetivo.GruposPAIF)= Yes
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)> [DATA FINAL]
    )
  )
  OR (
    (
      (TbAtColetivo.MediacoesPAIF)= Yes
    )
  );
