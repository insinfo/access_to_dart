SELECT
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.LOGO,
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO,
  Sum(UnionAtendPerfil.ATMULHERCF) AS SomaDeATMULHERCF,
  Sum(UnionAtendPerfil.ATBPCD) AS SomaDeATBPCD,
  Sum(UnionAtendPerfil.ATBPCI) AS SomaDeATBPCI,
  Sum(UnionAtendPerfil.APOPENS) AS SomaDeAPOPENS,
  Sum(UnionAtendPerfil.ATPBF) AS SomaDeATPBF,
  Sum(UnionAtendPerfil.ATCAD) AS SomaDeATCAD,
  Sum(UnionAtendPerfil.ATOUTPROG) AS SomaDeATOUTPROG,
  Sum(UnionAtendPerfil.ATEXTPBZ) AS SomaDeATEXTPBZ,
  Sum(UnionAtendPerfil.ATAREARSC) AS SomaDeATAREARSC,
  Sum(UnionAtendPerfil.ATAREAVIOL) AS SomaDeATAREAVIOL,
  Sum(UnionAtendPerfil.ATBMD) AS SomaDeATBMD,
  Sum(UnionAtendPerfil.ATBMI) AS SomaDeATBMI,
  Sum(UnionAtendPerfil.ATBSF) AS SomaDeATBSF
FROM
  UnionAtendPerfil,
  TbUnidade
GROUP BY
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
