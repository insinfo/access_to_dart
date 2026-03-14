SELECT
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  CadResidencia.[CRAS Origem],
  CadResidencia.[Nº Cras],
  CadResidencia.DataDesligResid
FROM
  CadResidencia
WHERE
  (
    (
      (CadResidencia.DataCad)<= [DATA FINAL]
    )
    AND (
      (CadResidencia.DataDesligResid) Is Null
      Or (CadResidencia.DataDesligResid)>= [DATA FINAL]
    )
  );
