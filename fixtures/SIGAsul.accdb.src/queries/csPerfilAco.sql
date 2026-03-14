SELECT
  TbAcomp.CodAcomp,
  TbAcompDet.CodAcompDet,
  TbAcomp.DataIncl,
  TbAcomp.Nome,
  TbAcomp.CodFamilia,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.Defic,
  TbAcompDet.Idoso,
  TbAcompDet.Gest,
  TbAcompDet.Criança,
  TbAcompDet.Adol,
  TbAcompDet.[Alcool/Drogas],
  TbAcompDet.ConflitoFam,
  TbAcompDet.FragilSocioEcon,
  CadResidencia.[Fam Extrema Pb],
  TbPessoa.ServAco,
  TbAcompDet.DataDesl,
  TbAcompDet.[Motivo Deslig]
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
      (TbAcomp.Nome) Is Not Null
    )
    AND (
      (TbAcompDet.[PAF inicio]) Is Null
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)>= [DATA FINAL]
    )
  );
