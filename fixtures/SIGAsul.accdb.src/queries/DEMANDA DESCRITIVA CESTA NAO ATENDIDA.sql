SELECT
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.CelularPessoa,
  TbDemandaReprimida.DNasc,
  TbDemandaReprimida.cestabasica,
  TbDemandaReprimida.cobertor,
  TbDemandaReprimida.colchonete,
  TbDemandaReprimida.filtro,
  TbDemandaReprimida.[Demanda Kit Enxoval],
  TbDemandaReprimida.[KIT TIPO],
  TbDemandaReprimida.[OUTROS DOACAO],
  TbDemandaReprimida.[0a5],
  TbDemandaReprimida.[6a11],
  TbDemandaReprimida.[12a14],
  TbDemandaReprimida.[15a17],
  TbDemandaReprimida.[18a29],
  TbDemandaReprimida.[30a59],
  TbDemandaReprimida.[60mais],
  TbDemandaReprimida.[Demanda CIC 6 A 12],
  TbDemandaReprimida.[Demanda CIC 13 A 17],
  TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6],
  TbDemandaReprimida.[Demanda BMD],
  TbDemandaReprimida.[Demanda BMI],
  TbDemandaReprimida.data,
  TbDemandaReprimida.Obs,
  TbDemandaReprimida.[Data saída],
  TbDemandaReprimida.[Motivo saída]
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (TbDemandaReprimida.cestabasica)= Yes
    )
    AND (
      (TbDemandaReprimida.data)<= [DATA FINAL]
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
      Or (
        TbDemandaReprimida.[Data saída]
      )> [DATA FINAL]
    )
  )
ORDER BY
  TbDemandaReprimida.data;
