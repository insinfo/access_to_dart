SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO,
  Sum(UnionPessDemanEspec.PESAUT) AS SomaDePESAUT,
  Sum(UnionPessDemanEspec.PESCEG) AS SomaDePESCEG,
  Sum(UnionPessDemanEspec.PESBVISAO) AS SomaDePESBVISAO,
  Sum(UnionPessDemanEspec.PESSURSEV) AS SomaDePESSURSEV,
  Sum(UnionPessDemanEspec.PESSSURLEV) AS SomaDePESSSURLEV,
  Sum(UnionPessDemanEspec.PESDEFIS) AS SomaDePESDEFIS,
  Sum(UnionPessDemanEspec.PESDEFMENT) AS SomaDePESDEFMENT,
  Sum(UnionPessDemanEspec.PESDOWN) AS SomaDePESDOWN,
  Sum(UnionPessDemanEspec.PESTMENT) AS SomaDePESTMENT,
  Sum(UnionPessDemanEspec.PESDCRON) AS SomaDePESDCRON,
  Sum(UnionPessDemanEspec.PESGEST) AS SomaDePESGEST,
  Sum(UnionPessDemanEspec.PESIDO) AS SomaDePESIDO,
  Sum(UnionPessDemanEspec.AUTPBF) AS SomaDeAUTPBF,
  Sum(UnionPessDemanEspec.CEGPBF) AS SomaDeCEGPBF,
  Sum(UnionPessDemanEspec.BVPBF) AS SomaDeBVPBF,
  Sum(UnionPessDemanEspec.SSEVPBF) AS SomaDeSSEVPBF,
  Sum(UnionPessDemanEspec.SLEVPBF) AS SomaDeSLEVPBF,
  Sum(UnionPessDemanEspec.DEFPBF) AS SomaDeDEFPBF,
  Sum(UnionPessDemanEspec.DMENTPBF) AS SomaDeDMENTPBF,
  Sum(UnionPessDemanEspec.SDPBF) AS SomaDeSDPBF,
  Sum(UnionPessDemanEspec.TMENTPBF) AS SomaDeTMENTPBF,
  Sum(UnionPessDemanEspec.DCRONPBF) AS SomaDeDCRONPBF,
  Sum(UnionPessDemanEspec.GESTPBF) AS SomaDeGESTPBF,
  Sum(UnionPessDemanEspec.IDOPBF) AS SomaDeIDOPBF,
  Sum(UnionPessDemanEspec.AUTPBZ) AS SomaDeAUTPBZ,
  Sum(UnionPessDemanEspec.CEGPBZ) AS SomaDeCEGPBZ,
  Sum(UnionPessDemanEspec.BVPBZ) AS SomaDeBVPBZ,
  Sum(UnionPessDemanEspec.SSEVPBZ) AS SomaDeSSEVPBZ,
  Sum(UnionPessDemanEspec.SLEVPBZ) AS SomaDeSLEVPBZ,
  Sum(UnionPessDemanEspec.DEFPBZ) AS SomaDeDEFPBZ,
  Sum(UnionPessDemanEspec.DMENTPBZ) AS SomaDeDMENTPBZ,
  Sum(UnionPessDemanEspec.SDPBZ) AS SomaDeSDPBZ,
  Sum(UnionPessDemanEspec.TMENTPBZ) AS SomaDeTMENTPBZ,
  Sum(UnionPessDemanEspec.DCRONPBZ) AS SomaDeDCRONPBZ,
  Sum(UnionPessDemanEspec.GESTPBZ) AS SomaDeGESTPBZ,
  Sum(UnionPessDemanEspec.IDOPBZ) AS SomaDeIDOPBZ
FROM
  UnionPessDemanEspec,
  TbUnidade
GROUP BY
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.MATRICULA,
  TbUnidade.FUNÇÃO
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
