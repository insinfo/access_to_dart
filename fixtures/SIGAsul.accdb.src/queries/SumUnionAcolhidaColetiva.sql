SELECT
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  Sum(UnionAcolhidaColetiva.TOTAL) AS SomaDeTOTAL,
  Sum(UnionAcolhidaColetiva.SOCIAL) AS SomaDeSOCIAL,
  Sum(UnionAcolhidaColetiva.PSI) AS SomaDePSI,
  Sum(UnionAcolhidaColetiva.BPC) AS SomaDeBPC,
  Sum(UnionAcolhidaColetiva.INSS) AS SomaDeINSS,
  Sum(UnionAcolhidaColetiva.SCFV) AS SomaDeSCFV,
  Sum(UnionAcolhidaColetiva.EDUC) AS SomaDeEDUC,
  Sum(UnionAcolhidaColetiva.SAUDE) AS SomaDeSAUDE,
  Sum(UnionAcolhidaColetiva.JUS) AS SomaDeJUS,
  Sum(UnionAcolhidaColetiva.BENMUN) AS SomaDeBENMUN,
  Sum(UnionAcolhidaColetiva.AUXNAT) AS SomaDeAUXNAT,
  Sum(UnionAcolhidaColetiva.TRANSP) AS SomaDeTRANSP,
  Sum(UnionAcolhidaColetiva.RECJUS) AS SomaDeRECJUS,
  Sum(UnionAcolhidaColetiva.DOCIVIL) AS SomaDeDOCIVIL,
  Sum(UnionAcolhidaColetiva.ALIMEN) AS SomaDeALIMEN,
  Sum(UnionAcolhidaColetiva.OUTRADEM) AS SomaDeOUTRADEM,
  Sum(
    UnionAcolhidaColetiva.ENCREDESA
  ) AS SomaDeENCREDESA,
  Sum(UnionAcolhidaColetiva.ENCSAUDE) AS SomaDeENCSAUDE,
  Sum(UnionAcolhidaColetiva.ENCEDUC) AS SomaDeENCEDUC,
  Sum(
    UnionAcolhidaColetiva.ENCSEMFAZ
  ) AS SomaDeENCSEMFAZ,
  Sum(UnionAcolhidaColetiva.ENCENG) AS SomaDeENCENG,
  Sum(UnionAcolhidaColetiva.ENCOP) AS SomaDeENCOP,
  Sum(
    UnionAcolhidaColetiva.ENCCOMITE
  ) AS SomaDeENCCOMITE
FROM
  UnionAcolhidaColetiva,
  TbUnidade
GROUP BY
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA;
