SELECT
  TbAcomp.Nome,
  TbAcompDet.DataDesl
FROM
  (
    csRMAD1distinct
    INNER JOIN TbAcomp ON csRMAD1distinct.Nome = TbAcomp.Nome
  )
  INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
WHERE
  (
    (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)> [DATA FINAL]
    )
  );
