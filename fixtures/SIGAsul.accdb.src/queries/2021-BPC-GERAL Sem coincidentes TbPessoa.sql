SELECT
  [2021-BPC-GERAL].CRAS,
  [2021-BPC-GERAL].[Nome Titular],
  [2021-BPC-GERAL].NOME_CRAS,
  [2021-BPC-GERAL].[Data Nasc],
  [2021-BPC-GERAL].Endereco,
  [2021-BPC-GERAL].Bairro,
  [2021-BPC-GERAL].CEP,
  [2021-BPC-GERAL].Mae,
  [2021-BPC-GERAL].Situacao,
  [2021-BPC-GERAL].[Especie Ben],
  [2021-BPC-GERAL].[TEM CAD],
  [2021-BPC-GERAL].NIS
FROM
  [2021-BPC-GERAL]
  LEFT JOIN TbPessoa ON [2021-BPC-GERAL].[Nome Titular] = TbPessoa.[Nome]
WHERE
  (
    (
      ([2021-BPC-GERAL].CRAS) Like [DGITE O CRAS] + "*"
    )
    AND (
      ([2021-BPC-GERAL].NOME_CRAS)= [Nome Titular]
    )
    AND (
      (TbPessoa.Nome) Is Null
    )
  );
