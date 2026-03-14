SELECT
  TbDiarioDet.Nome,
  TbGrupo.Grupo,
  TbGrupo.FxEtaria,
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbDiario.Volante
FROM
  TbPessoa
  INNER JOIN (
    TbGrupo
    INNER JOIN (
      TbDiario
      INNER JOIN TbDiarioDet ON TbDiario.CodDiario = TbDiarioDet.CodDiario
    ) ON TbGrupo.CodGrupo = TbDiario.Grupo
  ) ON TbPessoa.CodPessoa = TbDiarioDet.Nome;
