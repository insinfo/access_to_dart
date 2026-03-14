SELECT
  TbAcomp.CodAcomp,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbAcomp.DataIncl,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.DataDesl
FROM
  TbPessoa
  INNER JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.DataDesl) Is Null
    )
  );
