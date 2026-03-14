SELECT
  csGestantes.Nome,
  csBenefMunicipais.TipoBeneficio
FROM
  csGestantes
  INNER JOIN csBenefMunicipais ON csGestantes.CodPessoa = csBenefMunicipais.Nome
WHERE
  (
    (
      (
        csBenefMunicipais.TipoBeneficio
      )= "BSF"
    )
  );
