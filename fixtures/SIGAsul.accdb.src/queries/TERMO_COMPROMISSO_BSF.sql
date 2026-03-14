SELECT
  TbBeneficiosMunicipais.CodBenef,
  TbPessoa.Nome,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbUnidade.NOME AS UNIDADE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN TbBeneficiosMunicipais ON TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome
WHERE
  (
    (
      (
        TbBeneficiosMunicipais.CodBenef
      )= [Formulários]![FrmBeneficios]![CodBenef]
    )
    AND (
      (
        TbBeneficiosMunicipais.TipoBeneficio
      )= "BSF"
    )
  );
