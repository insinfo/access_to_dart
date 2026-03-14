SELECT
  TbAcomp.Nome,
  TbAcomp.Volante,
  TbAcomp.CodAcomp,
  TbAcomp.DataIncl,
  TbBeneficiosMunicipais.Nome,
  TbBeneficiosMunicipais.CPFPessoa,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbAcompDet.DataDesl
FROM
  (
    TbAcomp
    INNER JOIN TbBeneficiosMunicipais ON TbAcomp.Nome = TbBeneficiosMunicipais.Nome
  )
  INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
WHERE
  (
    (
      (TbAcompDet.DataDesl) Is Null
    )
  );
