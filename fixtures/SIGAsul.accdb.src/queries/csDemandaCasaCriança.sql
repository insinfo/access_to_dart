SELECT
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6],
  TbDemandaReprimida.[Data saída],
  TbDemandaReprimida.CodDemanda
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (
        TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6]
      )= Yes
    )
  );
