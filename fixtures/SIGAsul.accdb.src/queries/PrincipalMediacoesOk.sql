SELECT
  TbAcoRetorno.CodAcoRetorno,
  TbAcoRetorno.Compareceu,
  TbAcompDet.DataDesl,
  TbAcoRetorno.CodAcomp,
  TbAcoRetorno.DataRetorno,
  TbAcoRetorno.Historico,
  TbAcoRetorno.Obs,
  TbAcomp.CodAcomp,
  TbAcomp.DataIncl,
  TbAcomp.Nome,
  TbAcomp.CodFamilia,
  TbAcompDet.CodAcompDet,
  TbAcompDet.CodAcomp,
  TbAcompDet.CodTecnico,
  TbAcompDet.NomeTec,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.Particular,
  TbAcompDet.Coletivo,
  TbAcompDet.Grupo,
  TbAcompDet.Defic,
  TbAcompDet.Idoso,
  TbAcompDet.Gest,
  TbAcompDet.Criança,
  TbAcompDet.Adol,
  TbAcompDet.[Alcool/Drogas],
  TbAcompDet.ConflitoFam,
  TbAcompDet.FragilSocioEcon,
  TbAcompDet.[Motivo Deslig]
FROM
  (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  )
  INNER JOIN TbAcoRetorno ON TbAcomp.CodAcomp = TbAcoRetorno.CodAcomp
WHERE
  (
    (
      (TbAcoRetorno.Compareceu)= Yes
    )
    AND (
      (TbAcoRetorno.DataRetorno) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
