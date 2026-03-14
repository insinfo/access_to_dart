SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.LOGO,
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  Sum(UnionVisitaDom.LFR) AS SomaDeLFR,
  Sum(UnionVisitaDom.CDL) AS SomaDeCDL,
  Sum(UnionVisitaDom.DCP) AS SomaDeDCP,
  Sum(UnionVisitaDom.DPAF) AS SomaDeDPAF,
  Sum(UnionVisitaDom.AMF) AS SomaDeAMF,
  Sum(UnionVisitaDom.FVI) AS SomaDeFVI,
  Sum(UnionVisitaDom.AMD) AS SomaDeAMD,
  Sum(UnionVisitaDom.ASD) AS SomaDeASD,
  Sum(UnionVisitaDom.PBF) AS SomaDePBF,
  Sum(UnionVisitaDom.SCFV) AS SomaDeSCFV,
  Sum(UnionVisitaDom.OUT) AS SomaDeOUT,
  Sum(UnionVisitaDom.VDNAOLOC) AS SomaDeVDNAOLOC,
  Sum(UnionVisitaDom.BA) AS SomaDeBA,
  Sum(UnionVisitaDom.BANAOLOC) AS SomaDeBANAOLOC,
  Sum(UnionVisitaDom.VISITA) AS SomaDeVISITA
FROM
  UnionVisitaDom,
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
