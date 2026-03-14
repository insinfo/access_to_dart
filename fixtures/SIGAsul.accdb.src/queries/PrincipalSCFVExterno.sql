SELECT
  TbPessoa.CodPessoa,
  CadResidencia.CodFam,
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.DATAINSCR,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbSCFVExtDetalhe.SituaçãoUsuario,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.UNIDADE,
  TbSCFVExtDetalhe.TURNO
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbSCFVExtDetalhe ON TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome
WHERE
  (
    (
      (TbSCFVExtDetalhe.DataDesl) Is Null
    )
  )
ORDER BY
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  );
