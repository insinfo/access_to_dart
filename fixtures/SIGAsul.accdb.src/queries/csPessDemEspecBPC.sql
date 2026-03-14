SELECT
  DISTINCT csPessDemanEspec.CodFam,
  csPessDemanEspec.Nome,
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
  INNER JOIN BPC ON csPessDemanEspec.Nome = BPC.NomeTitular
WHERE
  (
    (
      (csPessDemanEspec.Autismo)= Yes
    )
    AND (
      (csPessDemanEspec.DataDesligPes) Is Null
    )
  )
  OR (
    (
      (csPessDemanEspec.Cegueira)= Yes
    )
  )
  OR (
    (
      (csPessDemanEspec.[Baixa visão])= Yes
    )
  )
  OR (
    (
      (
        csPessDemanEspec.[Surdez severa profunda]
      )= Yes
    )
  )
  OR (
    (
      (
        csPessDemanEspec.[Surdez leve moderada]
      )= Yes
    )
  )
  OR (
    (
      (
        csPessDemanEspec.[Deficiencia fisica]
      )= Yes
    )
  )
  OR (
    (
      (
        csPessDemanEspec.[Defic mental intelec]
      )= Yes
    )
  )
  OR (
    (
      (
        csPessDemanEspec.[Sindrome down]
      )= Yes
    )
  )
  OR (
    (
      (
        csPessDemanEspec.[Transt doença mental]
      )= Yes
    )
    AND (
      (csPessDemanEspec.DoencaCronica)= Yes
    )
  );
