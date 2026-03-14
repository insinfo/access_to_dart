SELECT
  csDemDescAtivBenefMun18a29.CodDemanda,
  csDemDescAtivBenefMun18a29.LOGO,
  csDemDescAtivBenefMun18a29.RODAPE,
  csDemDescAtivBenefMun18a29.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemDescAtivBenefMun18a29.TbUnidade.Nome,
  csDemDescAtivBenefMun18a29.[DIRETOR(A)],
  csDemDescAtivBenefMun18a29.FUNÇÃO,
  csDemDescAtivBenefMun18a29.MATRICULA,
  csDemDescAtivBenefMun18a29.TbDemandaReprimida.Nome,
  csDemDescAtivBenefMun18a29.CelularPessoa,
  csDemDescAtivBenefMun18a29.MulherCF,
  csDemDescAtivBenefMun18a29.[PBF FAMILIA],
  csDemDescAtivBenefMun18a29.[Fam Extrema Pb],
  csDemDescAtivBenefMun18a29.[Renda per capita],
  csDemDescAtivBenefMun18a29.[Aposentado/pensionista],
  csDemDescAtivBenefMun18a29.[Area violencia],
  csDemDescAtivBenefMun18a29.[Area de risco],
  csDemDescAtivBenefMun18a29.[Demanda scfv atividade],
  csDemDescAtivBenefMun18a29.[18a29],
  csDemDescAtivBenefMun18a29.data,
  csDemDescAtivBenefMun18a29.csBenefMunicipais.Nome,
  csDemDescAtivBenefMun18a29.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemDescAtivBenefMun18a29 ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun18a29.CodFam;
