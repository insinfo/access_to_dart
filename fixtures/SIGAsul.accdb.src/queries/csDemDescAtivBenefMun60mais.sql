SELECT
  csDemandaDESCRITIVAativ.CodDemanda,
  csDemandaDESCRITIVAativ.LOGO,
  csDemandaDESCRITIVAativ.RODAPE,
  csDemandaDESCRITIVAativ.CodFam,
  csDemandaDESCRITIVAativ.TbUnidade.Nome,
  csDemandaDESCRITIVAativ.[DIRETOR(A)],
  csDemandaDESCRITIVAativ.FUNÇÃO,
  csDemandaDESCRITIVAativ.MATRICULA,
  csDemandaDESCRITIVAativ.TbDemandaReprimida.Nome,
  csDemandaDESCRITIVAativ.CelularPessoa,
  csDemandaDESCRITIVAativ.MulherCF,
  csDemandaDESCRITIVAativ.[PBF FAMILIA],
  csDemandaDESCRITIVAativ.[Fam Extrema Pb],
  csDemandaDESCRITIVAativ.[Renda per capita],
  csDemandaDESCRITIVAativ.[Aposentado/pensionista],
  csDemandaDESCRITIVAativ.[Area violencia],
  csDemandaDESCRITIVAativ.[Area de risco],
  csDemandaDESCRITIVAativ.[Demanda scfv atividade],
  csDemandaDESCRITIVAativ.[60mais],
  csDemandaDESCRITIVAativ.data,
  csBenefMunicipais.Nome,
  csBenefMunicipais.TipoBeneficio
FROM
  csDemandaDESCRITIVAativ
  LEFT JOIN csBenefMunicipais ON csDemandaDESCRITIVAativ.CodDemanda = csBenefMunicipais.CodBenef
WHERE
  (
    (
      (
        csDemandaDESCRITIVAativ.[60mais]
      )= Yes
    )
  );
