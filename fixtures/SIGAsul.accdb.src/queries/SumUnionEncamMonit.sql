SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.LOGO,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  Sum(UnionEncamMonit.ENGOV) AS SomaDeENGOV,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  Sum(UnionEncamMonit.ENGOV) AS SomaDeENGOV1,
  Sum(UnionEncamMonit.RSASSIS) AS SomaDeRSASSIS,
  Sum(UnionEncamMonit.REDU) AS SomaDeREDU,
  Sum(UnionEncamMonit.RSAUD) AS SomaDeRSAUD,
  Sum(UnionEncamMonit.SFAZ) AS SomaDeSFAZ,
  Sum(UnionEncamMonit.OPOL) AS SomaDeOPOL,
  Sum(UnionEncamMonit.ENGMON) AS SomaDeENGMON,
  Sum(UnionEncamMonit.RSAMON) AS SomaDeRSAMON,
  Sum(UnionEncamMonit.REMON) AS SomaDeREMON,
  Sum(UnionEncamMonit.RSMON) AS SomaDeRSMON,
  Sum(UnionEncamMonit.SFMON) AS SomaDeSFMON,
  Sum(UnionEncamMonit.OPMON) AS SomaDeOPMON,
  Sum(UnionEncamMonit.ENGSEM) AS SomaDeENGSEM,
  Sum(UnionEncamMonit.RSASEM) AS SomaDeRSASEM,
  Sum(UnionEncamMonit.RESEM) AS SomaDeRESEM,
  Sum(UnionEncamMonit.RSSEM) AS SomaDeRSSEM,
  Sum(UnionEncamMonit.SFSEM) AS SomaDeSFSEM,
  Sum(UnionEncamMonit.OPSEM) AS SomaDeOPSEM,
  Sum(UnionEncamMonit.ENGATEN) AS SomaDeENGATEN,
  Sum(UnionEncamMonit.RSAATEN) AS SomaDeRSAATEN,
  Sum(UnionEncamMonit.REATEN) AS SomaDeREATEN,
  Sum(UnionEncamMonit.RSATEN) AS SomaDeRSATEN,
  Sum(UnionEncamMonit.SFATEN) AS SomaDeSFATEN,
  Sum(UnionEncamMonit.OPATEN) AS SomaDeOPATEN,
  Sum(UnionEncamMonit.ENGNAO) AS SomaDeENGNAO,
  Sum(UnionEncamMonit.RSANAO) AS SomaDeRSANAO,
  Sum(UnionEncamMonit.RENAO) AS SomaDeRENAO,
  Sum(UnionEncamMonit.RSNAO) AS SomaDeRSNAO,
  Sum(UnionEncamMonit.SFNAO) AS SomaDeSFNAO,
  Sum(UnionEncamMonit.OPNAO) AS SomaDeOPNAO
FROM
  UnionEncamMonit,
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
