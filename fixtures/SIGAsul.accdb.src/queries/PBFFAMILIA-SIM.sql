SELECT
  DISTINCT TbPBF08.TITULAR,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  CadResidencia.CodFam,
  CadResidencia.[PBF FAMILIA],
  TbPessoa.Parentesco
FROM
  CadResidencia
  INNER JOIN (
    TbPBF08
    INNER JOIN TbPessoa ON TbPBF08.TITULAR = TbPessoa.Nome
  ) ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (TbPessoa.Parentesco)= "pessoa de referencia"
    )
  )
ORDER BY
  CadResidencia.[PBF FAMILIA];
