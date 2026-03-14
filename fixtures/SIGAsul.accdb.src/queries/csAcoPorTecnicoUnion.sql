SELECT
  TbPessoa.CodPessoa,
  TbAcompDet.NomeTec,
  TbAcompDet.CodTecnico,
  TbUnidade.LOGO,
  TbAcomp.Nome,
  TbCadFuncionario.[Carga Horária],
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.DataDesl,
  TbAcompDet.[Motivo Deslig],
  TbAcompDet.Defic,
  TbAcompDet.Idoso,
  TbAcompDet.Gest,
  TbAcompDet.Criança,
  TbAcompDet.Adol,
  TbAcompDet.[Alcool/Drogas],
  TbAcompDet.ConflitoFam,
  TbAcompDet.FragilSocioEcon
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN (
    TbCadFuncionario
    INNER JOIN (
      TbAcomp
      INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
    ) ON TbCadFuncionario.CodFunc = TbAcompDet.CodTecnico
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcomp.Nome) Is Not Null
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)>= [DATA FINAL]
    )
  );
