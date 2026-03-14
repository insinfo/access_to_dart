SELECT
  csDemDescAtivBenefMun0a5.CodDemanda,
  csDemDescAtivBenefMun0a5.LOGO,
  csDemDescAtivBenefMun0a5.RODAPE,
  csDemDescAtivBenefMun0a5.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemDescAtivBenefMun0a5.TbUnidade.Nome,
  csDemDescAtivBenefMun0a5.[DIRETOR(A)],
  csDemDescAtivBenefMun0a5.FUNÇÃO,
  csDemDescAtivBenefMun0a5.MATRICULA,
  csDemDescAtivBenefMun0a5.TbDemandaReprimida.Nome,
  csDemDescAtivBenefMun0a5.CelularPessoa,
  csDemDescAtivBenefMun0a5.MulherCF,
  csDemDescAtivBenefMun0a5.[PBF FAMILIA],
  csDemDescAtivBenefMun0a5.[Fam Extrema Pb],
  csDemDescAtivBenefMun0a5.[Renda per capita],
  csDemDescAtivBenefMun0a5.[Aposentado/pensionista],
  csDemDescAtivBenefMun0a5.[Area violencia],
  csDemDescAtivBenefMun0a5.[Area de risco],
  csDemDescAtivBenefMun0a5.[Demanda scfv atividade],
  csDemDescAtivBenefMun0a5.[0a5],
  csDemDescAtivBenefMun0a5.data,
  csDemDescAtivBenefMun0a5.csBenefMunicipais.Nome,
  csDemDescAtivBenefMun0a5.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemDescAtivBenefMun0a5 ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun0a5.CodFam;
