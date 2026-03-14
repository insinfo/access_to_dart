SELECT
  csDemandaDESCRITIVAcic13a17.CodDemanda,
  csDemandaDESCRITIVAcic13a17.LOGO,
  csDemandaDESCRITIVAcic13a17.RODAPE,
  csDemandaDESCRITIVAcic13a17.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemandaDESCRITIVAcic13a17.TbUnidade.Nome,
  csDemandaDESCRITIVAcic13a17.[DIRETOR(A)],
  csDemandaDESCRITIVAcic13a17.FUNÇÃO,
  csDemandaDESCRITIVAcic13a17.MATRICULA,
  csDemandaDESCRITIVAcic13a17.TbDemandaReprimida.Nome,
  csDemandaDESCRITIVAcic13a17.CelularPessoa,
  csDemandaDESCRITIVAcic13a17.MulherCF,
  csDemandaDESCRITIVAcic13a17.[PBF FAMILIA],
  csDemandaDESCRITIVAcic13a17.[Fam Extrema Pb],
  csDemandaDESCRITIVAcic13a17.[Renda per capita],
  csDemandaDESCRITIVAcic13a17.[Aposentado/pensionista],
  csDemandaDESCRITIVAcic13a17.[Area violencia],
  csDemandaDESCRITIVAcic13a17.[Area de risco],
  csDemandaDESCRITIVAcic13a17.[Demanda CIC 13 A 17],
  csDemandaDESCRITIVAcic13a17.data,
  csDemandaDESCRITIVAcic13a17.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemandaDESCRITIVAcic13a17 ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemandaDESCRITIVAcic13a17.CodFam;
