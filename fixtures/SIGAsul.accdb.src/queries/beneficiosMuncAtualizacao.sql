SELECT
  CadResidencia.CodFam,
  CadResidAtualizacao.[DATA ATUALIZ],
  TbPessoa.DataDesligPes,
  CadResidencia.[CRAS Origem],
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.NIS,
  TbPessoa.DNasc,
  TbPessoa.CPF,
  TbPessoa.NomeMae,
  TbPessoa.NomePai,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  TbPessoa.Celular,
  CadResidencia.Referencia,
  TbPessoa.Sexo,
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
  TbPessoa.Escolaridade,
  TbPessoa.Escolaridade,
  TbPessoa.[Condição Ocupação],
  TbPessoa.[Renda sem programas sociais]
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  LEFT JOIN CadResidAtualizacao ON CadResidencia.CodFam = CadResidAtualizacao.CodCadResd;
