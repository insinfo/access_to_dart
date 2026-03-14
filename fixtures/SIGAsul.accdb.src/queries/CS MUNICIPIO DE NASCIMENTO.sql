SELECT
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  CadResidencia.Volante
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
ORDER BY
  TbPessoa.MunicNasc;
