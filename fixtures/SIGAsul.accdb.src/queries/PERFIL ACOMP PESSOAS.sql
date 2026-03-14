SELECT
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.CPF,
  TbPessoa.DataDesligPes,
  TbPessoa.MotivoDeslPes
FROM
  TbPessoa
WHERE
  (
    (
      (TbPessoa.DataDesligPes) Is Null
    )
    AND (
      (TbPessoa.MotivoDeslPes) Is Null
    )
  );
