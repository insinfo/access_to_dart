SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  Sum(
    UnionPrincipalSCFVInterno.ate5insc
  ) AS SomaDeate5insc,
  Sum(
    UnionPrincipalSCFVInterno.[6a11insc]
  ) AS SomaDe6a11insc,
  Sum(
    UnionPrincipalSCFVInterno.[12a17insc]
  ) AS SomaDe12a17insc,
  Sum(
    UnionPrincipalSCFVInterno.[18a29insc]
  ) AS SomaDe18a29insc,
  Sum(
    UnionPrincipalSCFVInterno.[30a59insc]
  ) AS SomaDe30a59insc,
  Sum(
    UnionPrincipalSCFVInterno.[60insc]
  ) AS SomaDe60insc,
  Sum(
    UnionPrincipalSCFVInterno.ate5priori
  ) AS SomaDeate5priori,
  Sum(
    UnionPrincipalSCFVInterno.[6a11priori]
  ) AS SomaDe6a11priori,
  Sum(
    UnionPrincipalSCFVInterno.[12a17priori]
  ) AS SomaDe12a17priori,
  Sum(
    UnionPrincipalSCFVInterno.[18a29priori]
  ) AS SomaDe18a29priori,
  Sum(
    UnionPrincipalSCFVInterno.[30a59priori]
  ) AS SomaDe30a59priori,
  Sum(
    UnionPrincipalSCFVInterno.[60priori]
  ) AS SomaDe60priori,
  Sum(
    UnionPrincipalSCFVInterno.ate5naopriori
  ) AS SomaDeate5naopriori,
  Sum(
    UnionPrincipalSCFVInterno.[6a11naopriori]
  ) AS SomaDe6a11naopriori,
  Sum(
    UnionPrincipalSCFVInterno.[12a17naopriori]
  ) AS SomaDe12a17naopriori,
  Sum(
    UnionPrincipalSCFVInterno.[18a29naopriori]
  ) AS SomaDe18a29naopriori,
  Sum(
    UnionPrincipalSCFVInterno.[30a59naopriori]
  ) AS SomaDe30a59naopriori,
  Sum(
    UnionPrincipalSCFVInterno.[60naopriori]
  ) AS SomaDe60naopriori,
  Sum(
    UnionPrincipalSCFVInterno.ate5pres
  ) AS SomaDeate5pres,
  Sum(
    UnionPrincipalSCFVInterno.[6a11pres]
  ) AS SomaDe6a11pres,
  Sum(
    UnionPrincipalSCFVInterno.[12a17pres]
  ) AS SomaDe12a17pres,
  Sum(
    UnionPrincipalSCFVInterno.[18a29pres]
  ) AS SomaDe18a29pres,
  Sum(
    UnionPrincipalSCFVInterno.[30a59pres]
  ) AS SomaDe30a59pres,
  Sum(
    UnionPrincipalSCFVInterno.[60pres]
  ) AS SomaDe60pres
FROM
  UnionPrincipalSCFVInterno,
  TbUnidade
GROUP BY
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
