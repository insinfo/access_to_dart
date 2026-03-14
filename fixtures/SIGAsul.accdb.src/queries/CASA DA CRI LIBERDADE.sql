SELECT
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.DATAINSCR,
  TbGrupoExterno.NomeGrupo,
  TbGrupoExterno.FxEtariaGr,
  TbGrupoExterno.Turno,
  TbSCFVExtDetalhe.UNIDADE,
  TbSCFVExtDetalhe.Nome,
  TbGrupoExterno.Volante
FROM
  TbGrupoExterno
  INNER JOIN TbSCFVExtDetalhe ON TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT
WHERE
  (
    (
      (TbSCFVExtDetalhe.UNIDADE)= "CASA DA CRIANÇA LIBERDADE"
    )
  );
