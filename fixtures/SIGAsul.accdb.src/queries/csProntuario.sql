SELECT
  TbPessoa.CodFam,
  CadResidencia.DataDesligResid,
  TbPessoa.DataDesligPes,
  TbPessoa.CodPessoa,
  TbPessoa.DataCadPes,
  TbPessoa.Nome,
  TbPessoa.Apelido,
  TbPessoa.NomeMae,
  TbPessoa.Celular,
  TbPessoa.[Tel recado detalhes],
  TbPessoa.NIS,
  TbPessoa.PROVICN,
  TbPessoa.PROVIRG,
  TbPessoa.PROVICTPS,
  TbPessoa.PROVICPF,
  TbPessoa.PROVITE,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.Sexo,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNASC],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.Parentesco,
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
  TbPessoa.SituaçãoRua,
  TbPessoa.LerEscrever,
  TbPessoa.FreqEscola,
  TbPessoa.Escolaridade,
  TbPessoa.CTPS,
  TbPessoa.[Condição Ocupação],
  TbPessoa.[Renda sem programas sociais],
  TbPessoa.[Renda per capita],
  TbPessoa.[Recebe programa social],
  TbPessoa.[Aposentado/pensionista],
  TbPessoa.MotivoDeslPes,
  CadResidencia.DataCad,
  CadResidencia.[CRAS Origem],
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  CadResidencia.UF,
  CadResidencia.CEP,
  CadResidencia.Municipio,
  CadResidencia.Complemento,
  CadResidencia.Referencia,
  CadResidencia.[Tel fixo],
  CadResidencia.[Domicilio Urbano],
  CadResidencia.[Domicilio Rural],
  CadResidencia.Abrigo,
  CadResidencia.[Demanda espontanea],
  CadResidencia.[Busca ativa],
  CadResidencia.[Enc Unidades Proteção Basica],
  CadResidencia.[Enc Unidades Proteção Especial],
  CadResidencia.[Enc Saude],
  CadResidencia.[Enc Educação],
  CadResidencia.[Enc Politicas Setoriais],
  CadResidencia.[Enc Conselho Tutelar],
  CadResidencia.[Enc Poder Judiciario],
  CadResidencia.[Enc Defens Publica/MP/Delegacias],
  CadResidencia.[Enc outros],
  CadResidencia.[Nome Encaminhador],
  CadResidencia.TelEncaminhador,
  CadResidencia.[PBF FAMILIA],
  CadResidencia.[Outros Programas Priori],
  CadResidencia.[Agua canalizada],
  CadResidencia.[Coleta lixo direta],
  CadResidencia.[Nº Comodos],
  CadResidencia.[Nº Dormitorios],
  CadResidencia.[Nº pessoas/Dormitorio],
  CadResidencia.[Area de risco],
  CadResidencia.[Area dif acesso geografico],
  CadResidencia.[Area violencia],
  CadResidencia.MotivoDeslResid,
  CadResidencia.Quilombola,
  CadResidencia.Ribeirinha,
  CadResidencia.Cigana,
  CadResidencia.IndigenaResAldeia,
  CadResidencia.IndigenaNaoResidAldeia,
  CadResidencia.IndigenaEtnia,
  CadResidencia.OutraEtnia
FROM
  TbUnidade
  INNER JOIN (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.[CodFam] = TbPessoa.[CodFam]
  ) ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
WHERE
  (
    (
      (TbPessoa.CodFam)= [Formulários]![FormProntuario]![CodFamTxt]
    )
    AND (
      (CadResidencia.DataDesligResid) Is Null
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
