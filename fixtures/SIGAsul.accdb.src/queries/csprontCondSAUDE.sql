SELECT
  CadResidencia.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.DataDesligPes,
  TbPessoa.MotivoDeslPes,
  TbPessoa.CodFam,
  TbPessoa.DataCadPes,
  TbPessoa.Parentesco,
  TbPessoa.Nome,
  CadResidencia.DataCad,
  TbPessoa.Autismo,
  TbPessoa.[Baixa visão],
  TbPessoa.Cegueira,
  TbPessoa.[Deficiencia fisica],
  TbPessoa.[Defic mental intelec],
  TbPessoa.DoencaCronica,
  TbPessoa.[Qual DCronica],
  TbPessoa.[Sindrome down],
  TbPessoa.[Surdez severa profunda],
  TbPessoa.[Surdez leve moderada],
  TbPessoa.[Transt doença mental]
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.[CodFam] = TbPessoa.[CodFam]
WHERE
  (
    (
      (CadResidencia.CodFam)= [Formulários]![FormProntuario]![CodFamTxt]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
