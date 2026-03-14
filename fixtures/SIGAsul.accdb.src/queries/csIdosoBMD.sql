SELECT
  csIdosos.Nome,
  csBenefMunicipais.TipoBeneficio
FROM
  csIdosos
  INNER JOIN csBenefMunicipais ON csIdosos.CodPessoa = csBenefMunicipais.Nome
WHERE
  (
    (
      (
        csBenefMunicipais.TipoBeneficio
      )= "BMD"
    )
  );
