SELECT
  DISTINCT CadResidencia.CodFam,
  TbUnidade.CRAS,
  CadResidencia.DataCad,
  CadResidencia.Bairro,
  TbUnidade.NOME
FROM
  TbUnidade,
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbUnidade.CRAS)= Yes
    )
    AND (
      (CadResidencia.DataCad)<= [DATA FINAL]
    )
    AND (
      (CadResidencia.DataDesligResid) Is Null
      Or (CadResidencia.DataDesligResid)> [DATA FINAL]
    )
  )
ORDER BY
  CadResidencia.Bairro;
