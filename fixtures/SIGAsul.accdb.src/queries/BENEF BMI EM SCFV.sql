SELECT
  TbBeneficiosMunicipais.Nome,
  TbBeneficiosMunicipais.CPFPessoa,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbOfSocioEduDetalhe.Nome,
  TbOfSocioEduDetalhe.DNasPessoa,
  TbOfSocioEduDetalhe.DataDesl,
  TbBeneficiosMunicipais.Volante
FROM
  TbOfSocioEduDetalhe
  INNER JOIN TbBeneficiosMunicipais ON TbOfSocioEduDetalhe.Nome = TbBeneficiosMunicipais.Nome
WHERE
  (
    (
      (
        TbBeneficiosMunicipais.TipoBeneficio
      )= "BMI"
    )
    AND (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
    )
  );
