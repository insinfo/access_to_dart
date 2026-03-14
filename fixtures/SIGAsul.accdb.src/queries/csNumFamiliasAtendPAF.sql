SELECT
  csNumFamiliasAtend.CodFam,
  TbAcomp.Nome,
  TbAcompDet.[PAF inicio]
FROM
  (
    csNumFamiliasAtend
    INNER JOIN TbAcomp ON csNumFamiliasAtend.Nome = TbAcomp.Nome
  )
  INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
WHERE
  (
    (
      (TbAcompDet.[PAF inicio]) Is Not Null
    )
  );
