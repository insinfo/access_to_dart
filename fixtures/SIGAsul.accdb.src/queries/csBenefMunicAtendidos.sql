SELECT
  TbAtend.Data,
  csBenefMunicipais.dataInsc,
  csBenefMunicipais.DataDesl,
  csBenefMunicipais.Nome,
  csBenefMunicipais.CPFPessoa,
  csBenefMunicipais.Celularpessoa,
  csBenefMunicipais.Responsavel,
  csBenefMunicipais.TipoBeneficio
FROM
  csBenefMunicipais
  INNER JOIN TbAtend ON csBenefMunicipais.Nome = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
