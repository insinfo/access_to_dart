SELECT
  csDemandaDESCRITIVAcic6a12.CodDemanda,
  csDemandaDESCRITIVAcic6a12.LOGO,
  csDemandaDESCRITIVAcic6a12.RODAPE,
  csDemandaDESCRITIVAcic6a12.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemandaDESCRITIVAcic6a12.TbUnidade.Nome,
  csDemandaDESCRITIVAcic6a12.[DIRETOR(A)],
  csDemandaDESCRITIVAcic6a12.FUNÇÃO,
  csDemandaDESCRITIVAcic6a12.MATRICULA,
  csDemandaDESCRITIVAcic6a12.TbDemandaReprimida.Nome,
  csDemandaDESCRITIVAcic6a12.CelularPessoa,
  csDemandaDESCRITIVAcic6a12.MulherCF,
  csDemandaDESCRITIVAcic6a12.[PBF FAMILIA],
  csDemandaDESCRITIVAcic6a12.[Fam Extrema Pb],
  csDemandaDESCRITIVAcic6a12.[Renda per capita],
  csDemandaDESCRITIVAcic6a12.[Aposentado/pensionista],
  csDemandaDESCRITIVAcic6a12.[Area violencia],
  csDemandaDESCRITIVAcic6a12.[Area de risco],
  csDemandaDESCRITIVAcic6a12.[Demanda CIC 6 A 12],
  csDemandaDESCRITIVAcic6a12.data,
  csDemandaDESCRITIVAcic6a12.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemandaDESCRITIVAcic6a12 ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemandaDESCRITIVAcic6a12.CodFam;
