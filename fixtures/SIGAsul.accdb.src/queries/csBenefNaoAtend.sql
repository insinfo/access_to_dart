SELECT
  TbDemandaReprimida.CodDemanda,
  TbDemandaReprimida.data,
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.DNasc,
  TbDemandaReprimida.[0a5],
  TbDemandaReprimida.[6a11],
  TbDemandaReprimida.[12a14],
  TbDemandaReprimida.[15a17],
  TbDemandaReprimida.[18a29],
  TbDemandaReprimida.[30a59],
  TbDemandaReprimida.[60mais],
  TbDemandaReprimida.cestabasica,
  TbDemandaReprimida.[Motivo saída],
  TbDemandaReprimida.cobertor,
  TbDemandaReprimida.colchonete,
  TbDemandaReprimida.filtro,
  TbDemandaReprimida.[Demanda Kit Enxoval],
  TbDemandaReprimida.[KIT TIPO],
  TbDemandaReprimida.[OUTROS DOACAO],
  TbDemandaReprimida.[Data saída]
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (TbDemandaReprimida.data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
