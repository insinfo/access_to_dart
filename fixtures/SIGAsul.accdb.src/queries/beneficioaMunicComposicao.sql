SELECT
  TbBeneficiosMunicipais.CodBenef,
  TbPessoa.CodFam,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbBeneficiosMunicipais.Nome AS BENEFICIARIO,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.Sexo,
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
  TbPessoa.[Qual DCronica],
  TbPessoa.Escolaridade,
  TbPessoa.[Condição Ocupação],
  TbPessoa.[Renda sem programas sociais],
  TbPessoa.DataDesligPes
FROM
  TbPessoa
  LEFT JOIN TbBeneficiosMunicipais ON TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome
WHERE
  (
    (
      (TbPessoa.CodFam)= [DIGITE O CODIGO FAMILIAR]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
