SELECT
  DISTINCT [SISC INTERNO SCFV].TbPessoa.Nome AS NomeUsuario,
  [SISC INTERNO SCFV].CodOfSEDet,
  [SISC INTERNO SCFV].DataDesl,
  TbGrupo.Grupo,
  TbGrupo.FxEtaria,
  TbGrupo.DiaSemana,
  TbGrupo.Horario,
  TbGrupo.TIPO,
  [SISC INTERNO SCFV].CodFam,
  [SISC INTERNO SCFV].DNasc,
  [SISC INTERNO SCFV].Idade,
  [SISC INTERNO SCFV].NomeMae,
  [SISC INTERNO SCFV].Sexo,
  [SISC INTERNO SCFV].[Raça/Cor],
  [SISC INTERNO SCFV].SituaçãoUsuario,
  [SISC INTERNO SCFV].MunicNasc,
  [SISC INTERNO SCFV].UFNasc,
  [SISC INTERNO SCFV].NIS,
  [SISC INTERNO SCFV].CPF,
  [SISC INTERNO SCFV].RG,
  [SISC INTERNO SCFV].OrgaoRG,
  [SISC INTERNO SCFV].DEmisRG,
  [SISC INTERNO SCFV].Endereço,
  [SISC INTERNO SCFV].Bairro,
  [SISC INTERNO SCFV].UF,
  [SISC INTERNO SCFV].CEP,
  [SISC INTERNO SCFV].Municipio,
  [SISC INTERNO SCFV].Complemento,
  [SISC INTERNO SCFV].Referencia
FROM
  TbGrupo
  INNER JOIN (
    [SISC INTERNO SCFV]
    INNER JOIN (
      TbDiario
      INNER JOIN TbDiarioDet ON TbDiario.CodDiario = TbDiarioDet.CodDiario
    ) ON [SISC INTERNO SCFV].CodPessoa = TbDiarioDet.Nome
  ) ON TbGrupo.CodGrupo = TbDiario.Grupo;
