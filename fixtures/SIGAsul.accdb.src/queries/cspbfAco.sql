SELECT
  TbAcomp.Nome,
  [cs distinct pbf cras].TITULAR,
  TbAcompDet.[PAF inicio],
  TbAcompDet.DataDesl
FROM
  (
    [cs distinct pbf cras]
    INNER JOIN TbPessoa ON [cs distinct pbf cras].Nome = TbPessoa.Nome
  )
  INNER JOIN (
    TbAcompDet
    INNER JOIN TbAcomp ON TbAcompDet.CodAcomp = TbAcomp.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)>= [DATA FINAL]
    )
  );
