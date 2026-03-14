SELECT
  DISTINCT csRMAD1a.Nome
FROM
  csRMAD1a
  INNER JOIN TbAcomp ON csRMAD1a.Nome = TbAcomp.Nome;
