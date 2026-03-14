SELECT
  Sum(UnionPrincipalAco.TotFichas) AS SomaDeTotFichas,
  Sum(UnionPrincipalAco.ComPAF) AS SomaDeComPAF,
  Sum(UnionPrincipalAco.SemPAF) AS SomaDeSemPAF,
  Sum(UnionPrincipalAco.desligPAF) AS SomaDedesligPAF,
  Sum(UnionPrincipalAco.AcoAtend) AS SomaDeAcoAtend,
  Sum(UnionPrincipalAco.TotMediacoes) AS SomaDeTotMediacoes,
  Sum(UnionPrincipalAco.AcoInserPAF) AS SomaDeAcoInserPAF,
  Sum(
    UnionPrincipalAco.TotFamSCFVInt
  ) AS SomaDeTotFamSCFVInt,
  Sum(
    UnionPrincipalAco.TotFamSCFVExt
  ) AS SomaDeTotFamSCFVExt,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.FUNÇÃO,
  TbUnidade.CRAS
FROM
  UnionPrincipalAco,
  TbUnidade
GROUP BY
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO,
  TbUnidade.CRAS
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
