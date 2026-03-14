SELECT
  TbAcomp.CodAcomp,
  TbAcomp.Nome,
  TbAcomp.CodFamilia,
  TbAcompDet.CodAcompDet,
  TbAcompDet.[PAF inicio],
  TbAcompDet.DataDesl
FROM
  TbAcomp
  INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
WHERE
  (
    (
      (TbAcomp.Nome) Is Not Null
    )
    AND (
      (TbAcompDet.[PAF inicio])<= [DATA FINAL]
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)>= [DATA FINAL]
    )
  );
