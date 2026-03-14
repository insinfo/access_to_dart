SELECT
  TbOfSocioEduc.CodOfSEduc,
  TbOfSocioEduc.CodGrupo,
  TbOfSocioEduc.FxEtaria,
  TbOfSocioEduc.Grupo,
  TbOfSocioEduc.Dia,
  TbOfSocioEduc.Horario,
  TbOfSocioEduc.CodOrientador,
  TbOfSocioEduc.NomeOrientador,
  CadResidencia.CodFam,
  TbOfSocioEduDetalhe.DataInsc,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl,
  TbPessoa.Nome,
  TbDadosPessoaisSCFV.NCalçado,
  TbAtualSCFV.CodAtual,
  TbAtualSCFV.CodDPscfv,
  TbAtualSCFV.Data,
  TbAtualSCFV.Obs
FROM
  (
    (
      CadResidencia
      INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
    )
    INNER JOIN (
      TbDadosPessoaisSCFV
      INNER JOIN TbAtualSCFV ON TbDadosPessoaisSCFV.CodDPscfv = TbAtualSCFV.CodDPscfv
    ) ON TbPessoa.CodPessoa = TbDadosPessoaisSCFV.NomePessoa
  )
  INNER JOIN (
    TbOfSocioEduc
    INNER JOIN TbOfSocioEduDetalhe ON TbOfSocioEduc.CodOfSEduc = TbOfSocioEduDetalhe.CodOfSEduc
  ) ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome;
