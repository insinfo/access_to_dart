SELECT
  TbAtColetivoDet.Nome,
  TbAtColetivo.DataCol,
  PrincipalSCFVInterno.DNasc,
  PrincipalSCFVInterno.Idade,
  PrincipalSCFVInterno.Nome
FROM
  TbAtColetivo
  INNER JOIN (
    PrincipalSCFVInterno
    INNER JOIN TbAtColetivoDet ON PrincipalSCFVInterno.CodPessoa = TbAtColetivoDet.Nome
  ) ON TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
WHERE
  (
    (
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
