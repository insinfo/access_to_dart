SELECT
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbAcompDet.[PAF inicio],
  TbAcompDet.DataDesl,
  TbAcompDet.[PAF fim]
FROM
  TbPessoa
  INNER JOIN (
    TbAcompDet
    INNER JOIN TbAcomp ON TbAcompDet.CodAcomp = TbAcomp.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.[PAF fim]) Is Null
      Or (TbAcompDet.[PAF fim])> [DATA FINAL]
    )
  );
