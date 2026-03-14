SELECT
  TbBeneficiosMunicipais.CodBenef,
  TbBeneficiosMunicipais.Nome,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbBeneficiosMunicipais.DataDesl,
  TbBeneficiosMunicipais.DataTransf,
  TbPessoa.CodFam,
  TbPessoa.CodPessoa
FROM
  TbPessoa
  INNER JOIN TbBeneficiosMunicipais ON TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome
WHERE
  (
    (
      (
        TbBeneficiosMunicipais.DataDesl
      ) Is Null
    )
    AND (
      (
        TbBeneficiosMunicipais.DataTransf
      ) Is Null
    )
  );
