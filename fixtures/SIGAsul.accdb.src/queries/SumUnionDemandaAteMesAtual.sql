SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  Sum(UnionDemandaAteMesAtual.DEM0A5) AS SomaDeDEM0A5,
  Sum(
    UnionDemandaAteMesAtual.DEM6A11
  ) AS SomaDeDEM6A11,
  Sum(
    UnionDemandaAteMesAtual.DEM12A14
  ) AS SomaDeDEM12A14,
  Sum(
    UnionDemandaAteMesAtual.DEM15A17
  ) AS SomaDeDEM15A17,
  Sum(
    UnionDemandaAteMesAtual.DEM18A29
  ) AS SomaDeDEM18A29,
  Sum(
    UnionDemandaAteMesAtual.DEM30A59
  ) AS SomaDeDEM30A59,
  Sum(UnionDemandaAteMesAtual.DEM60M) AS SomaDeDEM60M,
  Sum(
    UnionDemandaAteMesAtual.CIC6A12
  ) AS SomaDeCIC6A12,
  Sum(
    UnionDemandaAteMesAtual.CIC13A17
  ) AS SomaDeCIC13A17,
  Sum(
    UnionDemandaAteMesAtual.CACRI1A6
  ) AS SomaDeCACRI1A6,
  Sum(UnionDemandaAteMesAtual.DEMBMD) AS SomaDeDEMBMD,
  Sum(UnionDemandaAteMesAtual.DEMBMI) AS SomaDeDEMBMI,
  Sum(UnionDemandaAteMesAtual.CBAS) AS SomaDeCBAS,
  Sum(UnionDemandaAteMesAtual.COB) AS SomaDeCOB,
  Sum(UnionDemandaAteMesAtual.COLCH) AS SomaDeCOLCH,
  Sum(UnionDemandaAteMesAtual.FILT) AS SomaDeFILT,
  Sum(UnionDemandaAteMesAtual.KITM) AS SomaDeKITM,
  Sum(UnionDemandaAteMesAtual.KITF) AS SomaDeKITF,
  Sum(UnionDemandaAteMesAtual.OUT) AS SomaDeOUT
FROM
  UnionDemandaAteMesAtual,
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
