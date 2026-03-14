SELECT
  TbPessoa.CodPessoa,
  TbPessoa.DataCadPes,
  CadResidencia.DataCad,
  TbPessoa.CodFam,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor]
FROM
  CadResidencia
  RIGHT JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
ORDER BY
  TbPessoa.DataCadPes,
  TbPessoa.CodFam,
  TbPessoa.DNasc;
