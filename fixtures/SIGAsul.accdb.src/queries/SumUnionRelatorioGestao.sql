SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.LOGO,
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  Sum(UnionRelatorioGestao.ATS1V) AS SomaDeATS1V,
  Sum(UnionRelatorioGestao.ATPSI1V) AS SomaDeATPSI1V,
  Sum(UnionRelatorioGestao.ATMULT1V) AS SomaDeATMULT1V,
  Sum(UnionRelatorioGestao.ATADM1V) AS SomaDeATADM1V,
  Sum(UnionRelatorioGestao.CAD1V) AS SomaDeCAD1V,
  Sum(UnionRelatorioGestao.CADSUB) AS SomaDeCADSUB,
  Sum(UnionRelatorioGestao.CADORI) AS SomaDeCADORI,
  Sum(UnionRelatorioGestao.ACOREM) AS SomaDeACOREM,
  Sum(UnionRelatorioGestao.ATREM) AS SomaDeATREM,
  Sum(UnionRelatorioGestao.ATRECEP) AS SomaDeATRECEP,
  Sum(UnionRelatorioGestao.ATGEST) AS SomaDeATGEST,
  Sum(UnionRelatorioGestao.FAMATIVAS) AS SomaDeFAMATIVAS,
  Sum(
    UnionRelatorioGestao.PAFATENDIDA
  ) AS SomaDePAFATENDIDA,
  Sum(UnionRelatorioGestao.ATORI1V) AS SomaDeATORI1V,
  Sum(UnionRelatorioGestao.GESTRECEP) AS SomaDeGESTRECEP,
  Sum(UnionRelatorioGestao.EQUITEC) AS SomaDeEQUITEC,
  Sum(UnionRelatorioGestao.ADMIN) AS SomaDeADMIN,
  Sum(UnionRelatorioGestao.ADMSUB) AS SomaDeADMSUB,
  Sum(UnionRelatorioGestao.SOCSUB) AS SomaDeSOCSUB,
  Sum(UnionRelatorioGestao.PSISUB) AS SomaDePSISUB,
  Sum(UnionRelatorioGestao.MULTISUB) AS SomaDeMULTISUB,
  Sum(UnionRelatorioGestao.ORISUB) AS SomaDeORISUB,
  Sum(UnionRelatorioGestao.GESTSUB) AS SomaDeGESTSUB
FROM
  UnionRelatorioGestao,
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
