SELECT
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  CadResidencia.[CRAS Origem],
  CadResidencia.[Nº Cras],
  TbPessoa.Parentesco,
  TbPessoa.Nome,
  TbPessoa.NIS,
  TbPessoa.DNasc,
  CadResidencia.DataDesligResid
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (CadResidencia.DataDesligResid) Is Null
      Or (CadResidencia.DataDesligResid)>= [DATA FINAL]
    )
  );
