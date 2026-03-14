SELECT
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  CadResidencia.[CRAS Origem],
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.Autismo,
  TbPessoa.Cegueira,
  TbPessoa.[Baixa visão],
  TbPessoa.[Surdez severa profunda],
  TbPessoa.[Surdez leve moderada],
  TbPessoa.[Deficiencia fisica],
  TbPessoa.[Defic mental intelec],
  TbPessoa.[Sindrome down],
  TbPessoa.[Transt doença mental]
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (
        Int(
          DateDiff(
            "d",
            [TbPessoa].[DNasc],
            Date()
          )/ 365.25
        )
      )>= 14
    )
    AND (
      (TbPessoa.Autismo)= Yes
    )
  )
  OR (
    (
      (TbPessoa.Cegueira)= Yes
    )
  )
  OR (
    (
      (TbPessoa.[Baixa visão])= Yes
    )
  )
  OR (
    (
      (
        TbPessoa.[Surdez severa profunda]
      )= Yes
    )
  )
  OR (
    (
      (
        TbPessoa.[Surdez leve moderada]
      )= Yes
    )
  )
  OR (
    (
      (TbPessoa.[Deficiencia fisica])= Yes
    )
  )
  OR (
    (
      (
        TbPessoa.[Defic mental intelec]
      )= Yes
    )
  )
  OR (
    (
      (TbPessoa.[Sindrome down])= Yes
    )
  )
  OR (
    (
      (
        TbPessoa.[Transt doença mental]
      )= Yes
    )
  );
