SELECT
  TbGrupo.Grupo,
  TbGrupo.FxEtaria,
  TbGrupo.DiaSemana,
  TbGrupo.Horario,
  TbGrupo.TIPO,
  Count(TbDiarioDet.Nome) AS ContarDeNome
FROM
  TbGrupo
  INNER JOIN (
    TbDiario
    INNER JOIN TbDiarioDet ON TbDiario.CodDiario = TbDiarioDet.CodDiario
  ) ON TbGrupo.CodGrupo = TbDiario.Grupo
GROUP BY
  TbGrupo.Grupo,
  TbGrupo.FxEtaria,
  TbGrupo.DiaSemana,
  TbGrupo.Horario,
  TbGrupo.TIPO;
