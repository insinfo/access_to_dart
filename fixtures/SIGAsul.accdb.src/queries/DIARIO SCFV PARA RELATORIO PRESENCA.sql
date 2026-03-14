SELECT
  TbPessoa.Nome,
  TbPessoa.CodPessoa,
  TbDiario.Grupo,
  TbGrupo.CodGrupo,
  TbDiario.CodDiario,
  TbDiario.Tipo,
  TbDiario.FxEtaria,
  TbDiario.Horario,
  TbDiario.DiaSemana,
  TbDiario.CodFunc,
  TbDiario.NomeOficineiro
FROM
  TbPessoa
  INNER JOIN (
    TbGrupo
    INNER JOIN (
      TbDiario
      INNER JOIN TbDiarioDet ON TbDiario.CodDiario = TbDiarioDet.CodDiario
    ) ON TbGrupo.CodGrupo = TbDiario.Grupo
  ) ON TbPessoa.CodPessoa = TbDiarioDet.Nome;
