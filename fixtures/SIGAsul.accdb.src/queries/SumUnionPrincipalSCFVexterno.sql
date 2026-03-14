SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  Sum(
    UnionPrincipalSCFVExterno.ate5inscE
  ) AS SomaDeate5inscE,
  Sum(
    UnionPrincipalSCFVExterno.[6a11inscE]
  ) AS SomaDe6a11inscE,
  Sum(
    UnionPrincipalSCFVExterno.[12a17inscE]
  ) AS SomaDe12a17inscE,
  Sum(
    UnionPrincipalSCFVExterno.[18a29inscE]
  ) AS SomaDe18a29inscE,
  Sum(
    UnionPrincipalSCFVExterno.[30a59inscE]
  ) AS SomaDe30a59inscE,
  Sum(
    UnionPrincipalSCFVExterno.[60inscE]
  ) AS SomaDe60inscE,
  Sum(
    UnionPrincipalSCFVExterno.ate5prioriE
  ) AS SomaDeate5prioriE,
  Sum(
    UnionPrincipalSCFVExterno.[6a11prioriE]
  ) AS SomaDe6a11prioriE,
  Sum(
    UnionPrincipalSCFVExterno.[12a17prioriE]
  ) AS SomaDe12a17prioriE,
  Sum(
    UnionPrincipalSCFVExterno.[18a29prioriE]
  ) AS SomaDe18a29prioriE,
  Sum(
    UnionPrincipalSCFVExterno.[30a59prioriE]
  ) AS SomaDe30a59prioriE,
  Sum(
    UnionPrincipalSCFVExterno.[60prioriE]
  ) AS SomaDe60prioriE,
  Sum(
    UnionPrincipalSCFVExterno.ate5naoprioriE
  ) AS SomaDeate5naoprioriE,
  Sum(
    UnionPrincipalSCFVExterno.[6a11naoprioriE]
  ) AS SomaDe6a11naoprioriE,
  Sum(
    UnionPrincipalSCFVExterno.[12a17naoprioriE]
  ) AS SomaDe12a17naoprioriE,
  Sum(
    UnionPrincipalSCFVExterno.[18a29naoprioriE]
  ) AS SomaDe18a29naoprioriE,
  Sum(
    UnionPrincipalSCFVExterno.[30a59naoprioriE]
  ) AS SomaDe30a59naoprioriE,
  Sum(
    UnionPrincipalSCFVExterno.[60naoprioriE]
  ) AS SomaDe60naoprioriE,
  Sum(
    UnionPrincipalSCFVExterno.ate5presE
  ) AS SomaDeate5presE,
  Sum(
    UnionPrincipalSCFVExterno.[6a11presE]
  ) AS SomaDe6a11presE,
  Sum(
    UnionPrincipalSCFVExterno.[12a17presE]
  ) AS SomaDe12a17presE,
  Sum(
    UnionPrincipalSCFVExterno.[18a29presE]
  ) AS SomaDe18a29presE,
  Sum(
    UnionPrincipalSCFVExterno.[30a59presE]
  ) AS SomaDe30a59presE,
  Sum(
    UnionPrincipalSCFVExterno.[60presE]
  ) AS SomaDe60presE
FROM
  TbUnidade,
  UnionPrincipalSCFVExterno
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
