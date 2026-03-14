SELECT
  TbBeneficiosMunicipais.Nome,
  TbPessoa.Nome,
  TbAcomp.Nome,
  TbAcompDet.[PAF inicio],
  TbAcompDet.DataDesl,
  TbBeneficiosMunicipais.TipoBeneficio
FROM
  (
    TbPessoa
    INNER JOIN (
      TbAcomp
      INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
    ) ON TbPessoa.CodPessoa = TbAcomp.Nome
  )
  INNER JOIN TbBeneficiosMunicipais ON TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome;
