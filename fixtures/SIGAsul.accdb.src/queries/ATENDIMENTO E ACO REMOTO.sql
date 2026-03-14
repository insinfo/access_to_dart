SELECT
  TbAtend.CodAtend,
  TbAtend.Volante,
  TbAtend.Data,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbAtend.AtRemoto,
  TbAtend.Acoremoto,
  TbPessoa.DataDesligPes
FROM
  TbPessoa
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.AtRemoto)= Yes
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)> [DATA FINAL]
    )
  )
  OR (
    (
      (TbAtend.Acoremoto)= Yes
    )
  );
