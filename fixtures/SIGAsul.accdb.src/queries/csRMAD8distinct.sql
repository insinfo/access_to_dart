SELECT
  DISTINCT csRMAD8.Nome,
  csRMAD8.Idade
FROM
  csRMAD8
WHERE
  (
    (
      (csRMAD8.OfSESCFV)= Yes
    )
  )
  OR (
    (
      (csRMAD8.AtividadeSCFV)= Yes
    )
  );
