SELECT
  csGestantes.Nome
FROM
  csGestantes
  INNER JOIN BPC ON csGestantes.Nome = BPC.NomeTitular;
