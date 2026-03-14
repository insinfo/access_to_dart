SELECT
  TbDemandaReprimida.[Demanda scfv atividade],
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.CelularPessoa
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (
        TbDemandaReprimida.[Demanda scfv atividade]
      ) Is Not Null
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
    )
  )
ORDER BY
  TbDemandaReprimida.[Demanda scfv atividade];
