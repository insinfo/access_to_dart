SELECT
  TbAcomp.CodAcomp,
  TbAcompDet.CodTecnico,
  TbAcompDet.NomeTec,
  TbPessoa.Nome,
  TbCadFuncionario.[Carga Horária],
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.[Motivo Deslig],
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
  TbAcompDet.DataDesl
FROM
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
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)> [DATA FINAL]
    )
  );
