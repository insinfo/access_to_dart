SELECT
  DISTINCT csRMAD7.Nome,
  csRMAD7.Autismo,
  csRMAD7.Cegueira,
  csRMAD7.[Baixa visão],
  csRMAD7.[Surdez severa profunda],
  csRMAD7.[Surdez leve moderada],
  csRMAD7.[Deficiencia fisica],
  csRMAD7.[Defic mental intelec],
  csRMAD7.[Sindrome down],
  csRMAD7.[Transt doença mental]
FROM
  csRMAD7
WHERE
  (
    (
      (csRMAD7.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
