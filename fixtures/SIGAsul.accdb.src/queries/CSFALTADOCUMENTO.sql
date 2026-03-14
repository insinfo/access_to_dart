SELECT
  CadResidencia.[CRAS Origem],
  TbPessoa.CodFam,
  TbPessoa.DataCadPes,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.PROVICN,
  TbPessoa.PROVIRG,
  TbPessoa.PROVICTPS,
  TbPessoa.PROVICPF,
  TbPessoa.PROVITE
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (TbPessoa.PROVICN)= Yes
    )
  )
  OR (
    (
      (TbPessoa.PROVIRG)= Yes
    )
  )
  OR (
    (
      (TbPessoa.PROVICTPS)= Yes
    )
  )
  OR (
    (
      (TbPessoa.PROVICPF)= Yes
    )
  )
  OR (
    (
      (TbPessoa.PROVITE)= Yes
    )
  );
