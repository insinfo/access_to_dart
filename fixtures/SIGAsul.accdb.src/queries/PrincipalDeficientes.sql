SELECT
  DISTINCT BPC.NomeTitular,
  TbPessoa.Nome,
  TbPessoa.BPCD,
  TbPessoa.BPCI
FROM
  TbPessoa
  LEFT JOIN BPC ON TbPessoa.Nome = BPC.NomeTitular
WHERE
  (
    (
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
  );
