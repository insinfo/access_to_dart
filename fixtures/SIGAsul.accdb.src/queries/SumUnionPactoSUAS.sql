SELECT
  TbUnidade.[Nº UNIDADE],
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  Sum(UnionPactoSUAS.CadTotal) AS SomaDeCadTotal,
  Sum(UnionPactoSUAS.CadAco) AS SomaDeCadAco,
  Sum(UnionPactoSUAS.bpcTotal) AS SomaDebpcTotal,
  Sum(UnionPactoSUAS.bpcAco) AS SomaDebpcAco,
  Sum(UnionPactoSUAS.bpcCadUnico) AS SomaDebpcCadUnico,
  Sum(UnionPactoSUAS.SitPrioritSCFV) AS SomaDeSitPrioritSCFV,
  Sum(
    UnionPactoSUAS.SitPrioritSCFVExterno
  ) AS SomaDeSitPrioritSCFVExterno,
  Sum(
    UnionPactoSUAS.RendaCadUnicMSal
  ) AS SomaDeRendaCadUnicMSal,
  Sum(UnionPactoSUAS.TotalCadFam) AS SomaDeTotalCadFam,
  Sum(UnionPactoSUAS.pbfTotal) AS SomaDepbfTotal,
  Sum(UnionPactoSUAS.descumpTotal) AS SomaDedescumpTotal
FROM
  UnionPactoSUAS,
  TbUnidade
GROUP BY
  TbUnidade.[Nº UNIDADE],
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
