SELECT
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbPessoa.Celular,
  TbPessoa.CPF,
  TbPessoa.Sexo
FROM
  TbPessoa
ORDER BY
  TbPessoa.CodFam;
