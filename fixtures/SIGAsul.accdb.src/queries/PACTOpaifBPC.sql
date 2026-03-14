SELECT
  TbAcomp.Nome,
  csPBFDistinct.TITULAR,
  TbAcompDet.[PAF inicio],
  TbAcompDet.DataDesl
FROM
  (
    csPBFDistinct
    INNER JOIN TbPessoa ON csPBFDistinct.TITULAR = TbPessoa.Nome
  )
  INNER JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.[PAF inicio]) Is Not Null
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
    )
  );
