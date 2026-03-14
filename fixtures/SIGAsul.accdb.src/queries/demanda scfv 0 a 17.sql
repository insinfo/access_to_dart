SELECT
  TbDemandaReprimida.CodDemanda,
  TbDemandaReprimida.data,
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.DNasc,
  Int(
    DateDiff(
      "d",
      [DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbDemandaReprimida.CelularPessoa,
  TbDemandaReprimida.[0a5],
  TbDemandaReprimida.[6a11],
  TbDemandaReprimida.[12a14],
  TbDemandaReprimida.[15a17],
  TbDemandaReprimida.[Data saída]
FROM
  TbDemandaReprimida
WHERE
  (
    (
      (TbDemandaReprimida.[0a5])= Yes
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
    )
  )
  OR (
    (
      (TbDemandaReprimida.[6a11])= Yes
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
    )
  )
  OR (
    (
      (TbDemandaReprimida.[12a14])= Yes
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
    )
  )
  OR (
    (
      (TbDemandaReprimida.[15a17])= Yes
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
    )
  );
