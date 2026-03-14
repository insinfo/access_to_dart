SELECT
  TbDiario.CodDiario,
  TbDiario.CodFunc,
  TbDiario.NomeOficineiro,
  TbDiarioDet.Nome,
  TbDiarioDet.DNasc,
  TbDiario.Grupo,
  TbDiario.Tipo,
  TbDiario.FxEtaria,
  TbDiario.Horario,
  TbDiario.DiaSemana
FROM
  TbDiario
  INNER JOIN TbDiarioDet ON TbDiario.CodDiario = TbDiarioDet.CodDiario;
