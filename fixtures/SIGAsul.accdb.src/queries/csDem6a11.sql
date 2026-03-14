SELECT
  csDemDescAtivBenefMun6a11.CodDemanda,
  csDemDescAtivBenefMun6a11.LOGO,
  csDemDescAtivBenefMun6a11.RODAPE,
  csDemDescAtivBenefMun6a11.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemDescAtivBenefMun6a11.TbUnidade.Nome,
  csDemDescAtivBenefMun6a11.[DIRETOR(A)],
  csDemDescAtivBenefMun6a11.FUNÇÃO,
  csDemDescAtivBenefMun6a11.MATRICULA,
  csDemDescAtivBenefMun6a11.TbDemandaReprimida.Nome,
  csDemDescAtivBenefMun6a11.CelularPessoa,
  csDemDescAtivBenefMun6a11.MulherCF,
  csDemDescAtivBenefMun6a11.[PBF FAMILIA],
  csDemDescAtivBenefMun6a11.[Fam Extrema Pb],
  csDemDescAtivBenefMun6a11.[Renda per capita],
  csDemDescAtivBenefMun6a11.[Aposentado/pensionista],
  csDemDescAtivBenefMun6a11.[Area violencia],
  csDemDescAtivBenefMun6a11.[Area de risco],
  csDemDescAtivBenefMun6a11.[Demanda scfv atividade],
  csDemDescAtivBenefMun6a11.[6a11],
  csDemDescAtivBenefMun6a11.data,
  csDemDescAtivBenefMun6a11.csBenefMunicipais.Nome,
  csDemDescAtivBenefMun6a11.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemDescAtivBenefMun6a11 ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun6a11.CodFam;
