SELECT
  DISTINCT PrincipalAtendDemEsp.CodFam,
  PrincipalAtendDemEsp.[Demanda espontanea]
FROM
  PrincipalAtendDemEsp
WHERE
  (
    (
      (
        PrincipalAtendDemEsp.[Demanda espontanea]
      )= Yes
    )
  );
