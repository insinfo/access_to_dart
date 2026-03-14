SELECT
  csNumFxEtariaAtendAteMes.[Nome],
  csNumFxEtariaAtendAteMes.[Idade]
FROM
  csNumFxEtariaAtendAteMes
WHERE
  (
    (
      (
        csNumFxEtariaAtendAteMes.[Nome]
      ) In (
        SELECT
          [Nome]
        FROM
          [csNumFxEtariaAtendAteMes] As Tmp
        GROUP BY
          [Nome]
        HAVING
          Count(*)> 1
      )
    )
  )
ORDER BY
  csNumFxEtariaAtendAteMes.[Nome];
