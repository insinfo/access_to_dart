SELECT
  TbAcomp.CodAcomp,
  CadResidencia.[PBF FAMILIA],
  CadResidencia.[Fam Extrema Pb],
  TbAcomp.DataIncl,
  TbAcomp.Nome,
  TbAcomp.CodFamilia,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbPessoa.ServAco,
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
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.[Motivo Deslig]) Is Null
    )
  );
