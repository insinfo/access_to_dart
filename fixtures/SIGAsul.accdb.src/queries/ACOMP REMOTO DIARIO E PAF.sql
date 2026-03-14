SELECT
  TbAcomp.CodAcomp,
  TbAcomp.Volante,
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbAcomp.Nome,
  TbAcomp.CodFamilia,
  TbAcompDet.CodAcompDet,
  TbAcompDet.[PAF inicio],
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
      (TbAcomp.Nome) Is Not Null
    )
    AND (
      (TbAcompDet.[PAF inicio])<= [DATA FINAL]
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)>= [DATA FINAL]
    )
  );
