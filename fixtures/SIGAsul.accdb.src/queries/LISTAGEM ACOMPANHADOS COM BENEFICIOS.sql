SELECT
  csAcompBenTransfRenda.csAcompBenef.NomeTec,
  csAcompBenTransfRenda.csAcompBenef.Nome,
  csAcompBenTransfRenda.csAcompBenef.Idade,
  csAcompBenTransfRenda.csAcompBenef.Defic,
  csAcompBenTransfRenda.csAcompBenef.BPCD,
  csAcompBenTransfRenda.csAcompBenef.BPCI,
  TbBeneficiosMunicipais.TipoBeneficio,
  csAcompBenTransfRenda.csAcompBenef.DataDesl,
  csAcompBenTransfRenda.[Fam Extrema Pb],
  csAcompBenTransfRenda.csAcompBenef.FragilSocioEcon,
  csAcompBenTransfRenda.[PBF FAMILIA],
  csAcompBenTransfRenda.CADUNICO
FROM
  csAcompBenTransfRenda
  LEFT JOIN TbBeneficiosMunicipais ON csAcompBenTransfRenda.csAcompBenef.CodPessoa = TbBeneficiosMunicipais.Nome;
