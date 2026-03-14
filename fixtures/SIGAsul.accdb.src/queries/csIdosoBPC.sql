SELECT
  csIdosos.Nome
FROM
  csIdosos
  INNER JOIN BPC ON csIdosos.Nome = BPC.NomeTitular;
