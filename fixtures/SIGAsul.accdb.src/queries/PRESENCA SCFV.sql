SELECT
  TbAtColetivo.GRUPOSCFV,
  [PERFIL E PRESENCA SCFV].Nome,
  [PERFIL E PRESENCA SCFV].CodOfSEDet,
  [PERFIL E PRESENCA SCFV].DataInsc,
  [PERFIL E PRESENCA SCFV].SituaçãoUsuario,
  [PERFIL E PRESENCA SCFV].DataDesl,
  [PERFIL E PRESENCA SCFV].DNasc,
  [PERFIL E PRESENCA SCFV].Idade,
  TbAtColetivoDet.Nome,
  TbAtColetivo.DataCol,
  TbAtColetivo.OfSESCFV,
  TbAtColetivo.AtividadeSCFV
FROM
  TbAtColetivo
  INNER JOIN (
    [PERFIL E PRESENCA SCFV]
    INNER JOIN TbAtColetivoDet ON [PERFIL E PRESENCA SCFV].Nome = TbAtColetivoDet.Nome
  ) ON TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
WHERE
  (
    (
      (TbAtColetivo.OfSESCFV)= Yes
    )
  )
  OR (
    (
      (TbAtColetivo.AtividadeSCFV)= Yes
    )
  );
