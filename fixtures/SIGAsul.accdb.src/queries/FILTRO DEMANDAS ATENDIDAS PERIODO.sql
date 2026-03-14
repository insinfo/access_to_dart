SELECT
  TbDemandaReprimida.[Motivo saída],
  TbDemandaReprimida.[Data saída],
  TbDemandaReprimida.CodDemanda,
  TbDemandaReprimida.data,
  TbDemandaReprimida.Volante,
  TbDemandaReprimida.CodFunc,
  TbDemandaReprimida.NomeFuncionario,
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.CelularPessoa,
  TbDemandaReprimida.DNasc
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (
        TbDemandaReprimida.[Motivo saída]
      )= "ATENDIDO"
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
