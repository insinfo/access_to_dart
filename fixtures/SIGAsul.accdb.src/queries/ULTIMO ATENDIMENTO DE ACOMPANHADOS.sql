SELECT
  Last(TbAtend.Data) AS ÚltimoDeData,
  TbAtend.Nome AS ATENDIDO,
  csACOatualizado.Nome AS ACOMPANHADO,
  csACOatualizado.CPF
FROM
  csACOatualizado
  INNER JOIN TbAtend ON csACOatualizado.CodPessoa = TbAtend.Nome
GROUP BY
  TbAtend.Nome,
  csACOatualizado.Nome,
  csACOatualizado.CPF;
