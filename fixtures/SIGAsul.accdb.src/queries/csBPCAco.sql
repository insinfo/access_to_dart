SELECT
  BPC.NomeTitular,
  TbPessoa.Nome,
  TbAcomp.Nome,
  TbAcompDet.[PAF inicio],
  TbAcompDet.DataDesl
FROM
  (
    BPC
    INNER JOIN TbPessoa ON BPC.[NomeTitular] = TbPessoa.Nome
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
