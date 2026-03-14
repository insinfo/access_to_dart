SELECT
  TbDemandaReprimida.[Nome],
  TbDemandaReprimida.[data],
  TbDemandaReprimida.[CodDemanda]
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (TbDemandaReprimida.[Nome]) In (
        SELECT
          [Nome]
        FROM
          [TbDemandaReprimida] As Tmp
        GROUP BY
          [Nome]
        HAVING
          Count(*)> 1
      )
    )
  )
ORDER BY
  TbDemandaReprimida.[Nome];
