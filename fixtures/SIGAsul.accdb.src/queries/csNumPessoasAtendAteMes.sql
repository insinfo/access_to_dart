SELECT
  DISTINCT TbAtend.Nome,
  TbPessoa.DNasc
FROM
  TbPessoa
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [MÊS INICIAL DO ANO]
      And [MÊS DE FECHAMENTO]
    )
  )
ORDER BY
  TbAtend.Nome;
