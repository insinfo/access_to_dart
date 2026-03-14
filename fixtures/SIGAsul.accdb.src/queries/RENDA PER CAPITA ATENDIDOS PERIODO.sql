SELECT
  DISTINCT TbAtend.Nome,
  [renda per capita cadastro].[Renda per capita]
FROM
  [renda per capita cadastro]
  INNER JOIN TbAtend ON [renda per capita cadastro].CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
