SELECT
  TbAtColetivo.CodColetivo,
  TbAtColetivoDet.Nome,
  TbAtColetivo.DataCol,
  TbAtColetivo.OfSESCFV,
  TbAtColetivo.AtividadeSCFV,
  TbAtColetivo.GruposPAIF,
  TbAtColetivo.MediacoesPAIF,
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade
FROM
  TbPessoa
  INNER JOIN (
    TbAtColetivo
    INNER JOIN TbAtColetivoDet ON TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
  ) ON TbPessoa.CodPessoa = TbAtColetivoDet.Nome;
