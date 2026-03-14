SELECT
  CADUNICO.NOME,
  CadResidencia.Volante,
  TbPessoa.Nome,
  CADUNICO.DNASC,
  CADUNICO.DATAATUALIZ,
  TbPessoa.CodFam,
  CadResidencia.CodFam,
  CadResidencia.CADUNICO,
  CadResidencia.DATAATCAD
FROM
  CadResidencia
  INNER JOIN (
    TbPessoa
    INNER JOIN CADUNICO ON TbPessoa.Nome = CADUNICO.NOME
  ) ON CadResidencia.CodFam = TbPessoa.CodFam
ORDER BY
  CADUNICO.NOME;
