SELECT
  DISTINCT TbPBF08.TITULAR,
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.Parentesco
FROM
  TbPBF08
  RIGHT JOIN TbPessoa ON TbPBF08.TITULAR = TbPessoa.Nome
WHERE
  (
    (
      (TbPessoa.Parentesco)= "pessoa de referencia"
    )
  );
