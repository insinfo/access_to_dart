SELECT
  TbPessoa.Nome,
  CadResidencia.CodFam,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl
FROM
  (
    (
      CadResidencia
      INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
    )
    INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
  )
  INNER JOIN TbOfSocioEduAtualiz ON TbOfSocioEduDetalhe.CodOfSEDet = TbOfSocioEduAtualiz.CodOfSEDet
GROUP BY
  TbOfSocioEduDetalhe.DataDesl,
  TbPessoa.Nome,
  CadResidencia.CodFam,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ),
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl
HAVING
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
    )
    AND (
      (
        Int(
          DateDiff(
            "d",
            [TbPessoa].[DNasc],
            Date()
          )/ 365.25
        )
      )>= 60
    )
  );
