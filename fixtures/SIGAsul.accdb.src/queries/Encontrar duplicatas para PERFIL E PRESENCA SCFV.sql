SELECT
  [PERFIL E PRESENCA SCFV].Nome,
  [PERFIL E PRESENCA SCFV].DataInsc
FROM
  [PERFIL E PRESENCA SCFV]
WHERE
  (
    (
      ([PERFIL E PRESENCA SCFV].Nome) In (
        SELECT
          [Nome]
        FROM
          [PERFIL E PRESENCA SCFV] As Tmp
        GROUP BY
          [Nome]
        HAVING
          Count(*)> 1
      )
    )
  )
ORDER BY
  [PERFIL E PRESENCA SCFV].Nome;
