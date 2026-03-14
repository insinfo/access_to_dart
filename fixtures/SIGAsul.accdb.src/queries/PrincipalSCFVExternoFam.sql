SELECT
  DISTINCT CadResidencia.CodFam
FROM
  (
    TbPessoa
    INNER JOIN TbSCFVExtDetalhe ON TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome
  )
  INNER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam
WHERE
  (
    (
      (TbSCFVExtDetalhe.DataDesl) Is Null
    )
  )
ORDER BY
  CadResidencia.CodFam;
