SELECT
  csDemDescAtivBenefMun30a59.CodDemanda,
  csDemDescAtivBenefMun30a59.LOGO,
  csDemDescAtivBenefMun30a59.RODAPE,
  csDemDescAtivBenefMun30a59.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemDescAtivBenefMun30a59.TbUnidade.Nome,
  csDemDescAtivBenefMun30a59.[DIRETOR(A)],
  csDemDescAtivBenefMun30a59.FUNÇÃO,
  csDemDescAtivBenefMun30a59.MATRICULA,
  csDemDescAtivBenefMun30a59.TbDemandaReprimida.Nome,
  csDemDescAtivBenefMun30a59.CelularPessoa,
  csDemDescAtivBenefMun30a59.MulherCF,
  csDemDescAtivBenefMun30a59.[PBF FAMILIA],
  csDemDescAtivBenefMun30a59.[Fam Extrema Pb],
  csDemDescAtivBenefMun30a59.[Renda per capita],
  csDemDescAtivBenefMun30a59.[Aposentado/pensionista],
  csDemDescAtivBenefMun30a59.[Area violencia],
  csDemDescAtivBenefMun30a59.[Area de risco],
  csDemDescAtivBenefMun30a59.[Demanda scfv atividade],
  csDemDescAtivBenefMun30a59.[30a59],
  csDemDescAtivBenefMun30a59.data,
  csDemDescAtivBenefMun30a59.csBenefMunicipais.Nome,
  csDemDescAtivBenefMun30a59.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemDescAtivBenefMun30a59 ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun30a59.CodFam;
