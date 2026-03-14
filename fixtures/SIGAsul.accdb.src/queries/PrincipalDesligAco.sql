SELECT
  TbAcomp.CodAcomp,
  TbAcompDet.DataDesl,
  TbAcompDet.[Motivo Deslig],
  TbAcomp.Nome,
  TbAcomp.CodFamilia,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  CadResidencia.[Fam Extrema Pb],
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
  TbAcompDet.FragilSocioEcon
FROM
  CadResidencia
  INNER JOIN (
    TbPessoa
    INNER JOIN (
      TbAcomp
      INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
    ) ON TbPessoa.CodPessoa = TbAcomp.Nome
  ) ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (TbAcompDet.DataDesl) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
