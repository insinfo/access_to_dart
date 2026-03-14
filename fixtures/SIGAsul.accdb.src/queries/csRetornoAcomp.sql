SELECT
  TbAcoRetorno.CodAcoRetorno,
  TbAcoRetorno.CodAcomp,
  TbAcoRetorno.DataRetorno,
  TbAcoRetorno.Historico,
  TbAcoRetorno.Obs,
  TbAcoRetorno.Compareceu,
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
  TbAcompDet.DataDesl,
  TbAcompDet.[Motivo Deslig]
FROM
  (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  )
  INNER JOIN TbAcoRetorno ON TbAcomp.CodAcomp = TbAcoRetorno.CodAcomp;
