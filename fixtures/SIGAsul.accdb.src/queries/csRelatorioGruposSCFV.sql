SELECT
  TbGrupo.CodGrupo,
  TbGrupo.Grupo,
  TbGrupo.FxEtaria,
  TbGrupo.DiaSemana,
  TbGrupo.Horario,
  TbGrupo.TIPO,
  TbDiarioDet.Nome
FROM
  TbGrupo
  RIGHT JOIN (
    TbDiario
    INNER JOIN TbDiarioDet ON TbDiario.CodDiario = TbDiarioDet.CodDiario
  ) ON TbGrupo.CodGrupo = TbDiario.Grupo;
