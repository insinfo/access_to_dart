SELECT
  TbUnidade.NOME AS [UNIDADE DE ORIGEM],
  TbSCFVExtDetalhe.UNIDADE AS [UNIDADE EXTERNA],
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbSCFVExtAtualiz.DataAtual,
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.DATAINSCR,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbGrupoExterno.NomeGrupo,
  TbGrupoExterno.FxEtariaGr,
  TbGrupoExterno.Turno,
  TbSCFVExtDetalhe.UNIDADE,
  TbSCFVExtDetalhe.SituaçãoUsuario,
  TbSCFVExtDetalhe.SituaçãoMunicipal,
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.MotivoDesl,
  TbSCFVExtDetalhe.UNIDADE
FROM
  TbUnidade,
  TbGrupoExterno
  INNER JOIN (
    TbPessoa
    INNER JOIN (
      TbSCFVExtDetalhe
      INNER JOIN TbSCFVExtAtualiz ON TbSCFVExtDetalhe.CodSCFVEDet = TbSCFVExtAtualiz.CodSCFVEDet
    ) ON TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome
  ) ON TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT
GROUP BY
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbSCFVExtAtualiz.DataAtual,
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.DATAINSCR,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbGrupoExterno.NomeGrupo,
  TbGrupoExterno.FxEtariaGr,
  TbGrupoExterno.Turno,
  TbSCFVExtDetalhe.SituaçãoUsuario,
  TbSCFVExtDetalhe.SituaçãoMunicipal,
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.MotivoDesl,
  TbSCFVExtDetalhe.UNIDADE,
  TbSCFVExtDetalhe.UNIDADE
HAVING
  (
    (
      (TbSCFVExtAtualiz.DataAtual) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
