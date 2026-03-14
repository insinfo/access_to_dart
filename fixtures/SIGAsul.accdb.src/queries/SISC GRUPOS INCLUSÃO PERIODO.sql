SELECT
  [SISC GRUPOS GERAL].CodDiario,
  TbOfSocioEduDetalhe.DataInsc,
  [SISC GRUPOS GERAL].Nome,
  [SISC GRUPOS GERAL].Grupo,
  [SISC GRUPOS GERAL].Tipo,
  [SISC GRUPOS GERAL].Horario,
  [SISC GRUPOS GERAL].FxEtaria,
  [SISC GRUPOS GERAL].DiaSemana,
  [SISC GRUPOS GERAL].CodFunc,
  [SISC GRUPOS GERAL].NomeOficineiro,
  [SISC GRUPOS GERAL].CodPessoa,
  [SISC GRUPOS GERAL].DNasc,
  [SISC GRUPOS GERAL].Idade,
  [SISC GRUPOS GERAL].Sexo,
  [SISC GRUPOS GERAL].[Raça/Cor],
  [SISC GRUPOS GERAL].MunicNasc,
  [SISC GRUPOS GERAL].UFNasc,
  [SISC GRUPOS GERAL].NomeMae,
  [SISC GRUPOS GERAL].NIS,
  [SISC GRUPOS GERAL].RG,
  [SISC GRUPOS GERAL].OrgaoRG,
  [SISC GRUPOS GERAL].DEmisRG,
  [SISC GRUPOS GERAL].DataDesligPes,
  [SISC GRUPOS GERAL].MotivoDeslPes,
  [SISC GRUPOS GERAL].Endereço,
  [SISC GRUPOS GERAL].Bairro,
  [SISC GRUPOS GERAL].UF,
  [SISC GRUPOS GERAL].CEP,
  TbOfSocioEduDetalhe.SituaçãoUsuario,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl,
  TbOfSocioEduDetalhe.Encaminhado,
  TbOfSocioEduDetalhe.Onde
FROM
  [SISC GRUPOS GERAL]
  INNER JOIN TbOfSocioEduDetalhe ON [SISC GRUPOS GERAL].Nome = TbOfSocioEduDetalhe.Nome
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataInsc) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
