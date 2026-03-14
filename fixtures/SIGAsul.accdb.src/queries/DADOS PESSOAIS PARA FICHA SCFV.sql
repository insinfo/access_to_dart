SELECT
  TbUnidade.NOME AS UnidadeNome,
  TbUnidade.[Nº UNIDADE],
  TbUnidade.LOGO,
  TbPessoa.CodPessoa,
  TbPessoa.DataDesligPes,
  TbPessoa.MotivoDeslPes,
  TbPessoa.Nome AS NomePessoa,
  TbPessoa.Parentesco,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS IdadePessoa,
  TbPessoa.Celular,
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  CadResidencia.[Nº Cras],
  CadResidencia.CodCREAS,
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  CadResidencia.UF,
  CadResidencia.CEP,
  CadResidencia.Municipio,
  CadResidencia.Complemento,
  CadResidencia.Referencia,
  CadResidencia.[Tel fixo],
  TbPessoa.NomeMae,
  TbPessoa.NomePai,
  TbPessoa.[Tel recado detalhes],
  TbPessoa.NIS,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.[CERT LIVRO/FOLHA/TERMO],
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbPessoa.Escolaridade,
  TbPessoa.[NOME ESCOLA],
  TbPessoa.FreqEscola,
  TbPessoa.Turno,
  TbPessoa.BPCD,
  TbPessoa.BPCI,
  TbPessoa.[Estado Civil],
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.Autismo,
  TbPessoa.Cegueira,
  TbPessoa.[Baixa visão],
  TbPessoa.[Surdez severa profunda],
  TbPessoa.[Surdez leve moderada],
  TbPessoa.[Deficiencia fisica],
  TbPessoa.[Defic mental intelec],
  TbPessoa.[Sindrome down],
  TbPessoa.[Transt doença mental],
  TbPessoa.DoencaCronica,
  TbPessoa.[Qual DCronica],
  TbPessoa.[Renda sem programas sociais],
  TbPessoa.[Renda per capita],
  TbPessoa.[Aposentado/pensionista]
FROM
  TbUnidade
  INNER JOIN (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  ) ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
WHERE
  (
    (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
