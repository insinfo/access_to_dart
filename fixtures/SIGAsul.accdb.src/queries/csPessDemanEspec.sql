SELECT
  TbPessoa.CodPessoa,
  TbPessoa.DataCadPes,
  TbPessoa.CodFam,
  TbPessoa.DataDesligPes,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbPessoa.Autismo,
  TbPessoa.Cegueira,
  TbPessoa.[Baixa visão],
  TbPessoa.[Surdez severa profunda],
  TbPessoa.[Surdez leve moderada],
  TbPessoa.[Deficiencia fisica],
  TbPessoa.[Defic mental intelec],
  TbPessoa.[Sindrome down],
  TbPessoa.[Transt doença mental],
  TbPessoa.DoencaCronica,
  TbPessoa.[Qual DCronica]
FROM
  TbPessoa
WHERE
  (
    (
      (TbPessoa.DataCadPes)<= [DATA FINAL]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
