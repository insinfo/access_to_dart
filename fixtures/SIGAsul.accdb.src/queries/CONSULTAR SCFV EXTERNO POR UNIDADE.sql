SELECT
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.Volante,
  TbSCFVExtDetalhe.DATAINSCR,
  TbGrupoExterno.NomeGrupo,
  TbGrupoExterno.FxEtariaGr,
  TbGrupoExterno.Turno,
  TbSCFVExtDetalhe.UNIDADE,
  TbSCFVExtDetalhe.Nome,
  TbSCFVExtDetalhe.DataDesl
FROM
  TbGrupoExterno
  INNER JOIN TbSCFVExtDetalhe ON TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT
WHERE
  (
    (
      (TbSCFVExtDetalhe.UNIDADE) Like [DIGITE O NOME DA UNIDADE] + "*"
    )
    AND (
      (TbSCFVExtDetalhe.DataDesl) Is Null
    )
  );
