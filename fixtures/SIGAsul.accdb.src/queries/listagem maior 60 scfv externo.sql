SELECT
  TbPessoa.Nome,
  CadResidencia.CodFam,
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.MotivoDesl
FROM
  (
    (
      TbPessoa
      INNER JOIN TbSCFVExtDetalhe ON (
        TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome
      )
      AND (
        TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome
      )
    )
    INNER JOIN TbSCFVExtAtualiz ON TbSCFVExtDetalhe.CodSCFVEDet = TbSCFVExtAtualiz.CodSCFVEDet
  )
  INNER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam
GROUP BY
  TbPessoa.Nome,
  CadResidencia.CodFam,
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.MotivoDesl,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  )
HAVING
  (
    (
      (TbSCFVExtDetalhe.DataDesl) Is Null
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
