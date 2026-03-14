SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  Sum(
    UnionEncamMonitTESTE.ENGOVgeral
  ) AS SomaDeENGOVgeral,
  Sum(
    UnionEncamMonitTESTE.RSASSISgeral
  ) AS SomaDeRSASSISgeral,
  Sum(UnionEncamMonitTESTE.REDUgeral) AS SomaDeREDUgeral,
  Sum(
    UnionEncamMonitTESTE.RSAUDgeral
  ) AS SomaDeRSAUDgeral,
  Sum(UnionEncamMonitTESTE.SFAZgeral) AS SomaDeSFAZgeral,
  Sum(UnionEncamMonitTESTE.OPOLgeral) AS SomaDeOPOLgeral,
  Sum(UnionEncamMonitTESTE.ENGOV) AS SomaDeENGOV,
  Sum(UnionEncamMonitTESTE.RSASSIS) AS SomaDeRSASSIS,
  Sum(UnionEncamMonitTESTE.REDU) AS SomaDeREDU,
  Sum(UnionEncamMonitTESTE.RSAUD) AS SomaDeRSAUD,
  Sum(UnionEncamMonitTESTE.SFAZ) AS SomaDeSFAZ,
  Sum(UnionEncamMonitTESTE.OPOL) AS SomaDeOPOL,
  Sum(UnionEncamMonitTESTE.ENGMON) AS SomaDeENGMON,
  Sum(UnionEncamMonitTESTE.RSAMON) AS SomaDeRSAMON,
  Sum(UnionEncamMonitTESTE.REMON) AS SomaDeREMON,
  Sum(UnionEncamMonitTESTE.RSMON) AS SomaDeRSMON,
  Sum(UnionEncamMonitTESTE.SFMON) AS SomaDeSFMON,
  Sum(UnionEncamMonitTESTE.OPMON) AS SomaDeOPMON,
  Sum(UnionEncamMonitTESTE.ENGSEM) AS SomaDeENGSEM,
  Sum(UnionEncamMonitTESTE.RSASEM) AS SomaDeRSASEM,
  Sum(UnionEncamMonitTESTE.RESEM) AS SomaDeRESEM,
  Sum(UnionEncamMonitTESTE.RSSEM) AS SomaDeRSSEM,
  Sum(UnionEncamMonitTESTE.SFSEM) AS SomaDeSFSEM,
  Sum(UnionEncamMonitTESTE.OPSEM) AS SomaDeOPSEM,
  Sum(UnionEncamMonitTESTE.ENGATEN) AS SomaDeENGATEN,
  Sum(UnionEncamMonitTESTE.RSAATEN) AS SomaDeRSAATEN,
  Sum(UnionEncamMonitTESTE.REATEN) AS SomaDeREATEN,
  Sum(UnionEncamMonitTESTE.RSATEN) AS SomaDeRSATEN,
  Sum(UnionEncamMonitTESTE.SFATEN) AS SomaDeSFATEN,
  Sum(UnionEncamMonitTESTE.OPATEN) AS SomaDeOPATEN,
  Sum(UnionEncamMonitTESTE.ENGNAO) AS SomaDeENGNAO,
  Sum(UnionEncamMonitTESTE.RSANAO) AS SomaDeRSANAO,
  Sum(UnionEncamMonitTESTE.RENAO) AS SomaDeRENAO,
  Sum(UnionEncamMonitTESTE.RSNAO) AS SomaDeRSNAO,
  Sum(UnionEncamMonitTESTE.SFNAO) AS SomaDeSFNAO,
  Sum(UnionEncamMonitTESTE.OPNAO) AS SomaDeOPNAO
FROM
  UnionEncamMonitTESTE,
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
