SELECT
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (TbPessoa.CodFam) Between [DIGITE O PRIMEIRO CODIGO]
      And [DIGITE O ULTIMO CODIGO]
    )
    AND (
      (TbPessoa.Parentesco)= "Pessoa de Referencia"
    )
  )
ORDER BY
  TbPessoa.CodFam;
