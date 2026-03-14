SELECT
  TbAcompDet.CodTecnico,
  TbAcompDet.NomeTec,
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbCadFuncionario.[Carga Horária],
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbUnidade.LOGO,
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
  TbAcompDet.DataDesl,
  TbPessoa.BPCD,
  TbPessoa.BPCI,
  TbPessoa.[Aposentado/pensionista],
  TbPessoa.[Renda sem programas sociais]
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
GROUP BY
  TbAcompDet.CodTecnico,
  TbAcompDet.NomeTec,
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
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
  TbAcompDet.DataDesl,
  TbPessoa.BPCD,
  TbPessoa.BPCI,
  TbPessoa.[Aposentado/pensionista],
  TbPessoa.[Renda sem programas sociais]
HAVING
  (
    (
      (TbAcompDet.[PAF inicio]) Is Null
      Or (TbAcompDet.[PAF inicio])<= [DATA FINAL]
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)> [DATA FINAL]
    )
  );
