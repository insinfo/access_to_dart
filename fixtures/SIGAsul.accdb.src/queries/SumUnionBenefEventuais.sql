SELECT
  TbUnidade.LOGO,
  TbUnidade.CRAS,
  Sum(UnionBenefEvent.APOALIMP) AS SomaDeAPOALIMP,
  Sum(UnionBenefEvent.AUXNATP) AS SomaDeAUXNATP,
  Sum(UnionBenefEvent.COBERP) AS SomaDeCOBERP,
  Sum(UnionBenefEvent.COLCHP) AS SomaDeCOLCHP,
  Sum(UnionBenefEvent.OUTROBENP) AS SomaDeOUTROBENP,
  Sum(UnionBenefEvent.APOALIMD) AS SomaDeAPOALIMD,
  Sum(UnionBenefEvent.AUXNATD) AS SomaDeAUXNATD,
  Sum(UnionBenefEvent.COBERD) AS SomaDeCOBERD,
  Sum(UnionBenefEvent.COLCHD) AS SomaDeCOLCHD,
  Sum(UnionBenefEvent.OUTROBEND) AS SomaDeOUTROBEND,
  Sum(UnionBenefEvent.CBASICANAT) AS SomaDeCBASICANAT,
  Sum(UnionBenefEvent.COBERNAT) AS SomaDeCOBERNAT,
  Sum(UnionBenefEvent.COLCHONAT) AS SomaDeCOLCHONAT,
  Sum(UnionBenefEvent.FILTNAT) AS SomaDeFILTNAT,
  Sum(UnionBenefEvent.KITMASNAT) AS SomaDeKITMASNAT,
  Sum(UnionBenefEvent.KITFEMNAT) AS SomaDeKITFEMNAT,
  Sum(UnionBenefEvent.apAliFam) AS SomaDeapAliFam,
  Sum(UnionBenefEvent.auxNatFam) AS SomaDeauxNatFam,
  Sum(UnionBenefEvent.colchFam) AS SomaDecolchFam,
  Sum(UnionBenefEvent.cobFam) AS SomaDecobFam,
  Sum(UnionBenefEvent.outrosFam) AS SomaDeoutrosFam,
  Sum(UnionBenefEvent.TotFam) AS SomaDeTotFam,
  Sum(UnionBenefEvent.FamAtend) AS SomaDeFamAtend,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
FROM
  UnionBenefEvent,
  TbUnidade
GROUP BY
  TbUnidade.CRAS,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
