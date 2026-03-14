SELECT
  DISTINCT TbAcomp.CodAcomp,
  TbAcomp.Nome,
  csDemandaCasaCriança.Nome,
  TbAcompDet.NomeTec,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.DataDesl
FROM
  csDemandaCasaCriança
  RIGHT JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON csDemandaCasaCriança.Nome = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)> [DATA FINAL]
    )
  )
ORDER BY
  TbAcompDet.DataDesl;
