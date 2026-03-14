SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.LOGO,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  Sum(UnionRelatorioAco.ACOINSER) AS SomaDeACOINSER,
  Sum(UnionRelatorioAco.ACOATE) AS SomaDeACOATE,
  Sum(UnionRelatorioAco.PERFILACO) AS SomaDePERFILACO,
  Sum(UnionRelatorioAco.EXTPBZ) AS SomaDeEXTPBZ,
  Sum(UnionRelatorioAco.PBFAM) AS SomaDePBFAM,
  Sum(UnionRelatorioAco.DESCUM) AS SomaDeDESCUM,
  Sum(UnionRelatorioAco.PESSOABPC) AS SomaDePESSOABPC,
  Sum(UnionRelatorioAco.FAMATIVAS) AS SomaDeFAMATIVAS,
  Sum(UnionRelatorioAco.PAFATENDIDA) AS SomaDePAFATENDIDA,
  Sum(UnionRelatorioAco.FAMMEDI) AS SomaDeFAMMEDI,
  Sum(UnionRelatorioAco.TRABINF) AS SomaDeTRABINF,
  Sum(UnionRelatorioAco.SERVACO) AS SomaDeSERVACO,
  Sum(UnionRelatorioAco.BMIACO) AS SomaDeBMIACO,
  Sum(UnionRelatorioAco.BMDACO) AS SomaDeBMDACO,
  Sum(UnionRelatorioAco.BSFACO) AS SomaDeBSFACO
FROM
  UnionRelatorioAco,
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
