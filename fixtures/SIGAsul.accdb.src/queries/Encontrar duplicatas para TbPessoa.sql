SELECT
  CadResidencia.DataCad,
  CadResidencia.CodFam,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.DNasc,
  TbPessoa.CPF,
  TbPessoa.CodPessoa,
  TbPessoa.DataDesligPes,
  TbPessoa.MotivoDeslPes
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (TbPessoa.Nome) In (
        SELECT
          [Nome]
        FROM
          [TbPessoa] As Tmp
        GROUP BY
          [Nome],
          [DNasc],
          [CPF]
        HAVING
          Count(*)> 1
          And [DNasc] = [TbPessoa].[DNasc]
          And [CPF] = [TbPessoa].[CPF]
      )
    )
  )
ORDER BY
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbPessoa.CPF;
