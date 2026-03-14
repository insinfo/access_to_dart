SELECT
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.[Renda per capita]
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (TbPessoa.Parentesco)= "Pessoa de Referencia"
    )
  );
