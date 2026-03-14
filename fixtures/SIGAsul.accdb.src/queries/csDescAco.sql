SELECT
  TbAcompDet.[PAF inicio],
  TbPessoa.Nome,
  TbAcomp.Nome,
  csDescumprim.nomeDesc,
  csDescumprim.nomeresp,
  TbAcompDet.DataDesl
FROM
  (
    csDescumprim
    INNER JOIN TbPessoa ON csDescumprim.nomeDesc = TbPessoa.Nome
  )
  INNER JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)>= [DATA FINAL]
    )
  );
