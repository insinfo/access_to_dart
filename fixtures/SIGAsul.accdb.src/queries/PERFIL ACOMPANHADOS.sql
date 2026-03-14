SELECT
  TbAcomp.DataIncl,
  TbAcomp.Nome,
  TbPessoa.Parentesco,
  TbPessoa.NIS,
  TbPessoa.CPF,
  TbAcomp.CodFamilia,
  TbAcompDet.NomeTec,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.DataDesl,
  TbAcompDet.[Motivo Deslig],
  TbAcompDet.extpbz,
  TbAcompDet.trabinf,
  TbAcompDet.servacol,
  TbAcompDet.Defic,
  TbAcompDet.Idoso,
  TbAcompDet.Gest,
  TbAcompDet.Criança,
  TbAcompDet.Adol,
  TbAcompDet.[Alcool/Drogas],
  TbAcompDet.descPBF,
  TbAcompDet.ConflitoFam,
  TbAcompDet.FragilSocioEcon
FROM
  (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  )
  INNER JOIN TbPessoa ON TbAcomp.Nome = TbPessoa.CodPessoa
WHERE
  (
    (
      (TbAcompDet.DataDesl) Is Null
    )
  );
