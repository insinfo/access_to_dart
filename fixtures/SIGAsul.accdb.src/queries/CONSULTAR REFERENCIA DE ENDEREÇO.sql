SELECT
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  CadResidencia.Referencia,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.DNasc
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (CadResidencia.Referencia) Like "*" + [Informe a referencia:] & "*"
    )
  );
