SELECT
  csDemDescAtivBenefMun60mais.CodDemanda,
  csDemDescAtivBenefMun60mais.LOGO,
  csDemDescAtivBenefMun60mais.RODAPE,
  csDemDescAtivBenefMun60mais.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemDescAtivBenefMun60mais.TbUnidade.Nome,
  csDemDescAtivBenefMun60mais.[DIRETOR(A)],
  csDemDescAtivBenefMun60mais.FUNÇÃO,
  csDemDescAtivBenefMun60mais.MATRICULA,
  csDemDescAtivBenefMun60mais.TbDemandaReprimida.Nome,
  csDemDescAtivBenefMun60mais.CelularPessoa,
  csDemDescAtivBenefMun60mais.MulherCF,
  csDemDescAtivBenefMun60mais.[PBF FAMILIA],
  csDemDescAtivBenefMun60mais.[Fam Extrema Pb],
  csDemDescAtivBenefMun60mais.[Renda per capita],
  csDemDescAtivBenefMun60mais.[Aposentado/pensionista],
  csDemDescAtivBenefMun60mais.[Area violencia],
  csDemDescAtivBenefMun60mais.[Area de risco],
  csDemDescAtivBenefMun60mais.[Demanda scfv atividade],
  csDemDescAtivBenefMun60mais.[60mais],
  csDemDescAtivBenefMun60mais.data,
  csDemDescAtivBenefMun60mais.csBenefMunicipais.Nome,
  csDemDescAtivBenefMun60mais.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemDescAtivBenefMun60mais ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun60mais.CodFam;
