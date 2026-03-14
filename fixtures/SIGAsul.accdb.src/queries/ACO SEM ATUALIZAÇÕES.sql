SELECT
  csACOatualizado.Nome AS [em aco],
  [Encontrar duplicatas para acoAtualizadoAtendido].Nome,
  csACOatualizado.NomeTec
FROM
  [Encontrar duplicatas para acoAtualizadoAtendido]
  RIGHT JOIN csACOatualizado ON [Encontrar duplicatas para acoAtualizadoAtendido].Nome = csACOatualizado.Nome
WHERE
  (
    (
      (
        [Encontrar duplicatas para acoAtualizadoAtendido].Nome
      ) Is Null
    )
  );
