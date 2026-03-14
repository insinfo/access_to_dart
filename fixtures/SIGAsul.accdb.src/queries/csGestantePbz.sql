SELECT
  DISTINCT csGestantes.Nome
FROM
  csFamExtPbz
  INNER JOIN csGestantes ON csFamExtPbz.Nome = csGestantes.Nome;
