SELECT
  TbDiario.Grupo,
  TbDiario.Tipo,
  TbDiario.FxEtaria,
  TbDiario.Horario,
  TbDiario.DiaSemana,
  TbDiario.NomeOficineiro,
  TbDiario.CodDiario,
  TbDiarioDet.CodDiarioDet,
  TbDiarioDet.Nome,
  TbDiarioDet.DNasc
FROM
  TbGrupo
  INNER JOIN (
    TbDiario
    INNER JOIN TbDiarioDet ON (
      TbDiario.CodDiario = TbDiarioDet.CodDiario
    )
    AND (
      TbDiario.CodDiario = TbDiarioDet.CodDiario
    )
  ) ON (
    TbGrupo.CodGrupo = TbDiario.Grupo
  )
  AND (
    TbGrupo.CodGrupo = TbDiario.Grupo
  );
