SELECT
  TbOfSocioEduc.CodOfSEduc,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduc.CodGrupo,
  TbOfSocioEduc.FxEtaria,
  TbOfSocioEduc.Grupo,
  TbOfSocioEduc.Dia,
  TbOfSocioEduc.Horario,
  TbOfSocioEduc.CodOrientador,
  TbOfSocioEduc.NomeOrientador,
  TbOfSocioEduDetalhe.DataInsc,
  TbOfSocioEduDetalhe.Nome,
  TbOfSocioEduDetalhe.DNasPessoa,
  TbOfSocioEduDetalhe.Idade,
  TbOfSocioEduDetalhe.SituaçãoUsuario
FROM
  TbOfSocioEduc
  INNER JOIN TbOfSocioEduDetalhe ON TbOfSocioEduc.CodOfSEduc = TbOfSocioEduDetalhe.CodOfSEduc
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
    )
  );
