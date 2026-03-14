SELECT
  csCadTotalFamilias.CodFam,
  csCadTotalFamilias.DataCad,
  csCadTotalFamilias.Parentesco,
  csCadTotalFamilias.Nome,
  CadResidencia.DataDesligResid
FROM
  csCadTotalFamilias
WHERE
  (
    (
      (csCadTotalFamilias.DataCad)<= [DATA FINAL]
    )
    AND (
      (csCadTotalFamilias.Parentesco)= "Pessoa de Referencia"
    )
    AND (
      (CadResidencia.DataDesligResid) Is Null
      Or (CadResidencia.DataDesligResid)>= [DATA FINAL]
    )
  );
