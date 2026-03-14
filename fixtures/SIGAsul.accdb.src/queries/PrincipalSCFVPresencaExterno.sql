SELECT
  TbAtColetivoDet.Nome,
  TbAtColetivo.DataCol,
  PrincipalSCFVExterno.DNasc,
  PrincipalSCFVExterno.Idade,
  PrincipalSCFVExterno.Nome
FROM
  PrincipalSCFVExterno
  INNER JOIN (
    TbAtColetivoDet
    INNER JOIN TbAtColetivo ON TbAtColetivoDet.CodColetivo = TbAtColetivo.CodColetivo
  ) ON PrincipalSCFVExterno.CodPessoa = TbAtColetivoDet.Nome
WHERE
  (
    (
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
