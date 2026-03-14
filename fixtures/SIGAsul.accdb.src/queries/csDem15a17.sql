SELECT
  csDemDescAtivBenefMun15a17.CodDemanda,
  csDemDescAtivBenefMun15a17.LOGO,
  csDemDescAtivBenefMun15a17.RODAPE,
  csDemDescAtivBenefMun15a17.CodFam,
  [CS RESPONSAVEL FAMILIAR].Nome,
  csDemDescAtivBenefMun15a17.TbUnidade.Nome,
  csDemDescAtivBenefMun15a17.[DIRETOR(A)],
  csDemDescAtivBenefMun15a17.FUNÇÃO,
  csDemDescAtivBenefMun15a17.MATRICULA,
  csDemDescAtivBenefMun15a17.TbDemandaReprimida.Nome,
  csDemDescAtivBenefMun15a17.CelularPessoa,
  csDemDescAtivBenefMun15a17.MulherCF,
  csDemDescAtivBenefMun15a17.[PBF FAMILIA],
  csDemDescAtivBenefMun15a17.[Fam Extrema Pb],
  csDemDescAtivBenefMun15a17.[Renda per capita],
  csDemDescAtivBenefMun15a17.[Aposentado/pensionista],
  csDemDescAtivBenefMun15a17.[Area violencia],
  csDemDescAtivBenefMun15a17.[Area de risco],
  csDemDescAtivBenefMun15a17.[Demanda scfv atividade],
  csDemDescAtivBenefMun15a17.[15a17],
  csDemDescAtivBenefMun15a17.data,
  csDemDescAtivBenefMun15a17.csBenefMunicipais.Nome,
  csDemDescAtivBenefMun15a17.TipoBeneficio
FROM
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN csDemDescAtivBenefMun15a17 ON [CS RESPONSAVEL FAMILIAR].CodFam = csDemDescAtivBenefMun15a17.CodFam;
