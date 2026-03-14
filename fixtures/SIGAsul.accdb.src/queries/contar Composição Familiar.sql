SELECT
  TbPessoa.CodFam,
  Count(TbPessoa.Nome) AS ContarDeNome
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
GROUP BY
  TbPessoa.CodFam;
