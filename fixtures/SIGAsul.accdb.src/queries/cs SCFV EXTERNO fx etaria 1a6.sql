SELECT
  TbGrupoExterno.NomeGrupo,
  TbGrupoExterno.FxEtariaGr,
  TbGrupoExterno.Turno,
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.UNIDADE,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbSCFVExtDetalhe.BPC,
  TbSCFVExtDetalhe.PBF,
  TbSCFVExtDetalhe.CADUNICO,
  TbSCFVExtDetalhe.[Nome Respons Criança],
  TbSCFVExtDetalhe.[Cel Resp],
  TbSCFVExtDetalhe.[Parentesco Resp],
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.MotivoDesl,
  TbSCFVExtDetalhe.Volante
FROM
  TbPessoa
  INNER JOIN (
    TbGrupoExterno
    RIGHT JOIN TbSCFVExtDetalhe ON TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT
  ) ON TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome
WHERE
  (
    (
      (
        Int(
          DateDiff(
            "d",
            TbPessoa.DNasc,
            Date()
          )/ 365.25
        )
      )< 6
    )
    And (
      (TbSCFVExtDetalhe.DataDesl) Is Null
    )
  );
