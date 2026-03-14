SELECT
  TbUnidade.[Nº UNIDADE],
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.LOGO,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.CARGO,
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO,
  Sum(UnionTipoAtend.ACOPART) AS SomaDeACOPART,
  Sum(UnionTipoAtend.ATENDREM) AS SomaDeATENDREM,
  Sum(UnionTipoAtend.ACOMPREM) AS SomaDeACOMPREM,
  Sum(UnionTipoAtend.ESTUDOSOC) AS SomaDeESTUDOSOC,
  Sum(UnionTipoAtend.RELAT) AS SomaDeRELAT,
  Sum(UnionTipoAtend.ACOCOLET) AS SomaDeACOCOLET,
  Sum(UnionTipoAtend.ATTICINST) AS SomaDeATTICINST,
  Sum(UnionTipoAtend.DEMBPC) AS SomaDeDEMBPC,
  Sum(UnionTipoAtend.DEMINSS) AS SomaDeDEMINSS,
  Sum(UnionTipoAtend.DEMSCFV) AS SomaDeDEMSCFV,
  Sum(UnionTipoAtend.DEMEDUC) AS SomaDeDEMEDUC,
  Sum(UnionTipoAtend.DEMDOCCIV) AS SomaDeDEMDOCCIV,
  Sum(UnionTipoAtend.DEMAPOIOALI) AS SomaDeDEMAPOIOALI,
  Sum(UnionTipoAtend.DEMSAUD) AS SomaDeDEMSAUD,
  Sum(UnionTipoAtend.DEMJUST) AS SomaDeDEMJUST,
  Sum(UnionTipoAtend.DEMBENMUNIC) AS SomaDeDEMBENMUNIC,
  Sum(UnionTipoAtend.DEMAUXNAT) AS SomaDeDEMAUXNAT,
  Sum(UnionTipoAtend.DEMTRANSP) AS SomaDeDEMTRANSP,
  Sum(UnionTipoAtend.DEMOUTRA) AS SomaDeDEMOUTRA,
  Sum(UnionTipoAtend.FORMADE) AS SomaDeFORMADE,
  Sum(UnionTipoAtend.FORMABA) AS SomaDeFORMABA,
  Sum(UnionTipoAtend.FORMAEUPB) AS SomaDeFORMAEUPB,
  Sum(UnionTipoAtend.FORMAEUPE) AS SomaDeFORMAEUPE,
  Sum(UnionTipoAtend.FORMAES) AS SomaDeFORMAES,
  Sum(UnionTipoAtend.FORMAEE) AS SomaDeFORMAEE,
  Sum(UnionTipoAtend.FORMAEPS) AS SomaDeFORMAEPS,
  Sum(UnionTipoAtend.FORMAECT) AS SomaDeFORMAECT,
  Sum(UnionTipoAtend.FORMAEPJ) AS SomaDeFORMAEPJ,
  Sum(UnionTipoAtend.FORMAEDP) AS SomaDeFORMAEDP,
  Sum(UnionTipoAtend.FORMAOUTRO) AS SomaDeFORMAOUTRO
FROM
  UnionTipoAtend,
  TbUnidade
GROUP BY
  TbUnidade.[Nº UNIDADE],
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.CARGO,
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
