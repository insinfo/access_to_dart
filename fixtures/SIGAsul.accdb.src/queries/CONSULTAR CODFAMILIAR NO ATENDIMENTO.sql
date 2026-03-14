SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  TbAtend.Nome,
  CadResidencia.CodFam,
  CadResidencia.Volante
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome;
