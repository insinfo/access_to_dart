SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  Sum(
    UnionPrincipalContinuacao.vdExito
  ) AS SomaDevdExito,
  Sum(
    UnionPrincipalContinuacao.vdSemExito
  ) AS SomaDevdSemExito,
  Sum(
    UnionPrincipalContinuacao.baExito
  ) AS SomaDebaExito,
  Sum(
    UnionPrincipalContinuacao.baSemExito
  ) AS SomaDebaSemExito,
  Sum(
    UnionPrincipalContinuacao.acolhidas
  ) AS SomaDeacolhidas,
  Sum(
    UnionPrincipalContinuacao.atDemandEspon
  ) AS SomaDeatDemandEspon,
  Sum(
    UnionPrincipalContinuacao.encProtSocEspecial
  ) AS SomaDeencProtSocEspecial,
  Sum(
    UnionPrincipalContinuacao.encConselho
  ) AS SomaDeencConselho,
  Sum(
    UnionPrincipalContinuacao.provProtSocEspecial
  ) AS SomaDeprovProtSocEspecial,
  Sum(
    UnionPrincipalContinuacao.provConselho
  ) AS SomaDeprovConselho,
  Sum(
    UnionPrincipalContinuacao.famBSF
  ) AS SomaDefamBSF,
  Sum(
    UnionPrincipalContinuacao.famBMI
  ) AS SomaDefamBMI,
  Sum(
    UnionPrincipalContinuacao.famBMD
  ) AS SomaDefamBMD,
  Sum(
    UnionPrincipalContinuacao.demBMI
  ) AS SomaDedemBMI,
  Sum(
    UnionPrincipalContinuacao.demBMD
  ) AS SomaDedemBMD,
  Sum(
    UnionPrincipalContinuacao.totalCadUnic
  ) AS SomaDetotalCadUnic,
  Sum(
    UnionPrincipalContinuacao.totalNewCadUnico
  ) AS SomaDetotalNewCadUnico,
  Sum(
    UnionPrincipalContinuacao.ataualCadUnico
  ) AS SomaDeataualCadUnico,
  Sum(
    UnionPrincipalContinuacao.totalPBF
  ) AS SomaDetotalPBF,
  Sum(
    UnionPrincipalContinuacao.totalDeficient
  ) AS SomaDetotalDeficient,
  Sum(
    UnionPrincipalContinuacao.deficBPC
  ) AS SomaDedeficBPC,
  Sum(UnionPrincipalContinuacao.Idos) AS SomaDeIdos,
  Sum(
    UnionPrincipalContinuacao.idososBPC
  ) AS SomaDeidososBPC,
  Sum(
    UnionPrincipalContinuacao.demCesta
  ) AS SomaDedemCesta,
  Sum(
    UnionPrincipalContinuacao.demCobert
  ) AS SomaDedemCobert,
  Sum(
    UnionPrincipalContinuacao.demColchon
  ) AS SomaDedemColchon,
  Sum(
    UnionPrincipalContinuacao.demFiltro
  ) AS SomaDedemFiltro,
  Sum(
    UnionPrincipalContinuacao.demEnxoval
  ) AS SomaDedemEnxoval
FROM
  UnionPrincipalContinuacao,
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
