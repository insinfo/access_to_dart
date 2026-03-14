SELECT
  TbBeneficiosMunicipais.CodBenef,
  TbPessoa.Nome,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbBeneficiosMunicipais.DataDesl,
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbPessoa.CPF,
  TbPessoa.RG
FROM
  TbPessoa
  INNER JOIN TbBeneficiosMunicipais ON TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome
WHERE
  (
    (
      (
        TbBeneficiosMunicipais.TipoBeneficio
      )= "bsf"
    )
    AND (
      (
        TbBeneficiosMunicipais.DataDesl
      ) Is Null
      Or (
        TbBeneficiosMunicipais.DataDesl
      )>= [DATA FINAL]
    )
  );
