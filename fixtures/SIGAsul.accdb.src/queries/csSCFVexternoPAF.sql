SELECT
  DISTINCT [SISC SCFV EXTERNO GRUPOS E RF].[SISC SCFV EXTERNO].NOME,
  TbAcomp.CodAcomp,
  TbAcomp.Nome,
  TbAcompDet.NomeTec,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.DataDesl
FROM
  [SISC SCFV EXTERNO GRUPOS E RF]
  INNER JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON [SISC SCFV EXTERNO GRUPOS E RF].CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.[PAF fim]) Is Not Null
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
    )
  )
ORDER BY
  [SISC SCFV EXTERNO GRUPOS E RF].[SISC SCFV EXTERNO].NOME;
