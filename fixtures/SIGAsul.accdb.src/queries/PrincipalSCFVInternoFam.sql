SELECT
  DISTINCT CadResidencia.CodFam
FROM
  (
    TbPessoa
    INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
  )
  INNER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
    )
  )
ORDER BY
  CadResidencia.CodFam;
