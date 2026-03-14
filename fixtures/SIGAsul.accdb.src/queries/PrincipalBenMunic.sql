SELECT
  TbBeneficiosMunicipais.CodBenef,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbBeneficiosMunicipais.DataDesl
FROM
  TbBeneficiosMunicipais
WHERE
  (
    (
      (
        TbBeneficiosMunicipais.DataDesl
      ) Is Null
      Or (
        TbBeneficiosMunicipais.DataDesl
      )>= [DATA FINAL]
    )
  );
