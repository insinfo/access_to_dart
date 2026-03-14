SELECT
  csDemDescAtivBenefMun12a14.CodDemanda,
  csDemDescAtivBenefMun12a14.LOGO,
  csDemDescAtivBenefMun12a14.RODAPE,
  csDemDescAtivBenefMun12a14.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemDescAtivBenefMun12a14.TbUnidade.Nome,
  csDemDescAtivBenefMun12a14.[DIRETOR(A)],
  csDemDescAtivBenefMun12a14.FUNÇÃO,
  csDemDescAtivBenefMun12a14.MATRICULA,
  csDemDescAtivBenefMun12a14.TbDemandaReprimida.Nome,
  csDemDescAtivBenefMun12a14.CelularPessoa,
  csDemDescAtivBenefMun12a14.MulherCF,
  csDemDescAtivBenefMun12a14.[PBF FAMILIA],
  csDemDescAtivBenefMun12a14.[Fam Extrema Pb],
  csDemDescAtivBenefMun12a14.[Renda per capita],
  csDemDescAtivBenefMun12a14.[Aposentado/pensionista],
  csDemDescAtivBenefMun12a14.[Area violencia],
  csDemDescAtivBenefMun12a14.[Area de risco],
  csDemDescAtivBenefMun12a14.[Demanda scfv atividade],
  csDemDescAtivBenefMun12a14.[12a14],
  csDemDescAtivBenefMun12a14.data,
  csDemDescAtivBenefMun12a14.csBenefMunicipais.Nome,
  csDemDescAtivBenefMun12a14.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemDescAtivBenefMun12a14 ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun12a14.CodFam;
