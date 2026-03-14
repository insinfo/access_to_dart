SELECT
  TbDemandaReprimida.data,
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.DNasc,
  TbDemandaReprimida.[Demanda BMD],
  TbDemandaReprimida.[Demanda BMI],
  TbDemandaReprimida.cestabasica,
  TbDemandaReprimida.cobertor,
  TbDemandaReprimida.colchonete,
  TbDemandaReprimida.filtro,
  TbDemandaReprimida.[Demanda Kit Enxoval]
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (TbDemandaReprimida.data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
      Or (
        TbDemandaReprimida.[Data saída]
      )> [DATA FINAL]
    )
  );
