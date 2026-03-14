SELECT
  TbPessoa.Nome,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbBeneficiosMunicipais.DataSusp,
  TbPessoa.CPF,
  TbPessoa.Celular,
  TbBeneficiosMunicipais.Responsavel,
  TbBeneficiosMunicipais.[CPF Responsavel],
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN TbBeneficiosMunicipais ON TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome
GROUP BY
  TbPessoa.Nome,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbBeneficiosMunicipais.DataDesl,
  TbBeneficiosMunicipais.DataSusp,
  TbBeneficiosMunicipais.DataTransf,
  TbPessoa.CPF,
  TbPessoa.Celular,
  TbBeneficiosMunicipais.Responsavel,
  TbBeneficiosMunicipais.[CPF Responsavel],
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
HAVING
  (
    (
      (
        TbBeneficiosMunicipais.DataDesl
      ) Is Null
    )
    AND (
      (
        TbBeneficiosMunicipais.DataSusp
      ) Is Not Null
    )
    AND (
      (
        TbBeneficiosMunicipais.DataTransf
      ) Is Null
    )
  )
ORDER BY
  TbPessoa.Nome;
