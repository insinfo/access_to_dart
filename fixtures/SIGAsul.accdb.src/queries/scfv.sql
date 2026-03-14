SELECT
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbPessoa.CodFam,
  TbOfSocioEduDetalhe.DataDesl
FROM
  TbPessoa
  INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
    )
  );
