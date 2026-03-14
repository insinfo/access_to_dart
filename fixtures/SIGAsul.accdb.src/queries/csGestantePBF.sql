SELECT
  DISTINCT csGestantes.Nome
FROM
  csGestantes
  INNER JOIN TbPBF08 ON csGestantes.Nome = TbPBF08.TITULAR;
