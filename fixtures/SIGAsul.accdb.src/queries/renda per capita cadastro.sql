SELECT
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.[Renda per capita],
  TbPessoa.Parentesco
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (TbPessoa.Parentesco)= "Pessoa de Referencia"
    )
  );
