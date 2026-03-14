SELECT
  DISTINCT TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbPessoa.NIS,
  TbGrupo.Grupo,
  TbAtColetivo.horario,
  TbAtColetivo.fxetariadoscfv
FROM
  TbGrupo
  INNER JOIN (
    (
      TbPessoa
      INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
    )
    INNER JOIN (
      TbAtColetivoDet
      INNER JOIN TbAtColetivo ON TbAtColetivoDet.CodColetivo = TbAtColetivo.CodColetivo
    ) ON TbOfSocioEduDetalhe.Nome = TbAtColetivoDet.Nome
  ) ON TbGrupo.CodGrupo = TbAtColetivo.GRUPOSCFV
GROUP BY
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbPessoa.NIS,
  TbGrupo.Grupo,
  TbAtColetivo.horario,
  TbAtColetivo.fxetariadoscfv,
  TbAtColetivo.DataCol
HAVING
  (
    (
      (TbAtColetivo.DataCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
