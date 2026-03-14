SELECT
  DISTINCT CadResidencia.CodFam
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbPBF08 ON TbPessoa.Nome = TbPBF08.TITULAR;
