SELECT
  TbDiario.CodDiario,
  TbGrupo.Grupo,
  TbGrupo.TIPO,
  TbDiario.Horario,
  TbDiario.FxEtaria,
  TbDiario.DiaSemana,
  TbDiario.CodFunc,
  TbDiario.NomeOficineiro,
  TbPessoa.CodPessoa,
  TbDiarioDet.Nome,
  TbDiarioDet.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.NomeMae,
  TbPessoa.NIS,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.DataDesligPes,
  TbPessoa.MotivoDeslPes,
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  CadResidencia.UF,
  CadResidencia.CEP
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN (
    TbGrupo
    INNER JOIN (
      TbDiario
      INNER JOIN TbDiarioDet ON TbDiario.CodDiario = TbDiarioDet.CodDiario
    ) ON TbGrupo.CodGrupo = TbDiario.Grupo
  ) ON TbPessoa.CodPessoa = TbDiarioDet.Nome
WHERE
  (
    (
      (TbGrupo.TIPO)= "OFICINA SOCIOEDUCATIVA"
    )
  );
