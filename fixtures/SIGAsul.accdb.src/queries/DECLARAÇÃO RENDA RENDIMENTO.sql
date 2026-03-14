SELECT
  TbBeneficiosMunicipais.CodBenef,
  TbPessoa.Nome,
  TbPessoa.CPF,
  TbPessoa.RG,
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
  );
