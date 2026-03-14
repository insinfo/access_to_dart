SELECT
  DISTINCT TbPessoa.Nome,
  TbPessoa.BPCI,
  TbPessoa.DNasc,
  Int(
    DateDiff("d", [DNasc], [DATA FINAL])/ 365.25
  ) AS Idade,
  CadResidencia.Volante
FROM
  TbPessoa
  INNER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam;
