SELECT
  TbAtColetivoDet.CodColetivo,
  TbAtColetivoDet.Nome,
  TbAtColetivo.CodColetivo,
  TbAtColetivo.DataCol,
  TbAtColetivo.Tema,
  TbAtColetivo.GruposPAIF,
  TbAtColetivo.OfSESCFV,
  TbAtColetivo.MediacoesPAIF,
  TbAtColetivo.[0a5interno],
  TbAtColetivo.[6a11interno],
  TbAtColetivo.[12a14interno],
  TbAtColetivo.[15a17interno],
  TbAtColetivo.[18a29interno],
  TbAtColetivo.[30a59interno],
  TbAtColetivo.[60maisinterno],
  TbAtColetivo.[0a5externo],
  TbAtColetivo.[6a11externo],
  TbAtColetivo.[12a14externo],
  TbAtColetivo.[15a17externo],
  TbAtColetivo.[18a29externo],
  TbAtColetivo.[30a59externo],
  TbAtColetivo.[60maisexterno]
FROM
  TbAtColetivo
  INNER JOIN TbAtColetivoDet ON (
    TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
  )
  AND (
    TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
  );
