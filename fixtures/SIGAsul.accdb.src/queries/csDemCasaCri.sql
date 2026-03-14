SELECT
  csDemandaDESCRITIVAcasaCri.CodDemanda,
  csDemandaDESCRITIVAcasaCri.LOGO,
  csDemandaDESCRITIVAcasaCri.RODAPE,
  csDemandaDESCRITIVAcasaCri.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemandaDESCRITIVAcasaCri.TbUnidade.Nome,
  csDemandaDESCRITIVAcasaCri.[DIRETOR(A)],
  csDemandaDESCRITIVAcasaCri.FUNÇÃO,
  csDemandaDESCRITIVAcasaCri.MATRICULA,
  csDemandaDESCRITIVAcasaCri.TbDemandaReprimida.Nome,
  csDemandaDESCRITIVAcasaCri.CelularPessoa,
  csDemandaDESCRITIVAcasaCri.MulherCF,
  csDemandaDESCRITIVAcasaCri.[PBF FAMILIA],
  csDemandaDESCRITIVAcasaCri.[Fam Extrema Pb],
  csDemandaDESCRITIVAcasaCri.[Renda per capita],
  csDemandaDESCRITIVAcasaCri.[Aposentado/pensionista],
  csDemandaDESCRITIVAcasaCri.[Area violencia],
  csDemandaDESCRITIVAcasaCri.[Area de risco],
  csDemandaDESCRITIVAcasaCri.[Demanda CASA DA CRIANÇA 1 A 6],
  csDemandaDESCRITIVAcasaCri.data,
  csDemandaDESCRITIVAcasaCri.TipoBeneficio,
  csDemandaDESCRITIVAcasaCri.CodFam
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemandaDESCRITIVAcasaCri ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemandaDESCRITIVAcasaCri.CodFam;
