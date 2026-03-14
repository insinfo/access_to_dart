SELECT
  TbBeneficiosMunicipais.CodBenef,
  TbBeneficiosMunicipais.dataInsc,
  TbBeneficiosMunicipais.DataDesl,
  TbBeneficiosMunicipais.Nome,
  TbBeneficiosMunicipais.CPFPessoa,
  TbBeneficiosMunicipais.Celularpessoa,
  TbBeneficiosMunicipais.Responsavel,
  TbBeneficiosMunicipais.TipoBeneficio
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
