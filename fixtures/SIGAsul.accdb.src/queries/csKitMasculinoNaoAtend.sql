SELECT
  TbDemandaReprimida.CodDemanda,
  TbDemandaReprimida.data,
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.DNasc,
  TbDemandaReprimida.[Demanda Kit Enxoval],
  TbDemandaReprimida.[KIT TIPO]
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (TbDemandaReprimida.data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbDemandaReprimida.[KIT TIPO])= "masculino"
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
    )
  );
