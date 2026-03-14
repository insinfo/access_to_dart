SELECT
  TbAcomp.Nome,
  TbAcompDet.NomeTec,
  TbAcoRetorno.DataRetorno,
  TbAcoRetorno.Compareceu,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcoRetorno.Historico,
  TbAcoRetorno.Obs
FROM
  (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  )
  INNER JOIN TbAcoRetorno ON TbAcomp.CodAcomp = TbAcoRetorno.CodAcomp
WHERE
  (
    (
      (TbAcoRetorno.Compareceu)= No
    )
    AND (
      (
        Month([DataRetorno])
      )= Month(
        Date()
      )
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
    )
  )
ORDER BY
  TbAcoRetorno.DataRetorno;
