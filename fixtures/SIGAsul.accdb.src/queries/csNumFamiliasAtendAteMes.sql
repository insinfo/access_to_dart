SELECT
  DISTINCT CadResidencia.CodFam
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [MÊS INICIAL DO ANO]
      And [MÊS DE FECHAMENTO]
    )
  );
