SELECT
  DISTINCT csPessDemanEspec.Nome,
  csPessDemanEspec.CodPessoa,
  csPessDemanEspec.CodFam,
  csPessDemanEspec.DataDesligPes,
  csPessDemanEspec.DNasc,
  csPessDemanEspec.Autismo,
  csPessDemanEspec.Cegueira,
  csPessDemanEspec.[Baixa visão],
  csPessDemanEspec.[Surdez severa profunda],
  csPessDemanEspec.[Surdez leve moderada],
  csPessDemanEspec.[Deficiencia fisica],
  csPessDemanEspec.[Defic mental intelec],
  csPessDemanEspec.[Sindrome down],
  csPessDemanEspec.[Transt doença mental],
  csPessDemanEspec.DoencaCronica
FROM
  csPessDemanEspec
  INNER JOIN TbPBF08 ON csPessDemanEspec.Nome = TbPBF08.TITULAR;
