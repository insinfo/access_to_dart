SELECT
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  CadResidencia.[Nº Cras],
  CadResidencia.DataDesligResid,
  CadResidencia.MotivoDeslResid,
  TbPessoa.Nome,
  TbPessoa.DataDesligPes,
  TbPessoa.MotivoDeslPes
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (CadResidencia.DataDesligResid) Is Not Null
    )
  )
ORDER BY
  CadResidencia.CodFam;
