SELECT
  TbPessoa.CodFam,
  CadResidencia.DataDesligResid,
  TbPessoa.DataDesligPes,
  TbPessoa.CodPessoa,
  TbPessoa.DataCadPes,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNASC],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.LerEscrever,
  TbPessoa.FreqEscola,
  TbPessoa.Escolaridade,
  TbPessoa.[NOME ESCOLA],
  TbPessoa.CTPS,
  TbPessoa.[Nº CTPS],
  TbPessoa.[Condição Ocupação],
  TbPessoa.[Renda sem programas sociais],
  TbPessoa.[Renda per capita],
  TbPessoa.[Recebe programa social],
  TbPessoa.[Aposentado/pensionista],
  CadResidencia.MotivoDeslResid
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.[CodFam] = TbPessoa.[CodFam]
WHERE
  (
    (
      (TbPessoa.CodFam)= [Formulários]![FrmCadGeral]![CodFam]
    )
    AND (
      (CadResidencia.DataDesligResid) Is Null
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
