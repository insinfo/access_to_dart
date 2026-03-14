SELECT
  csAcompBenef.CodTecnico,
  csAcompBenef.NomeTec,
  csAcompBenef.CodPessoa,
  csAcompBenef.Nome,
  csAcompBenef.Idade,
  csAcompBenef.[Carga Horária],
  csAcompBenef.[PAF inicio],
  csAcompBenef.[PAF fim],
  csAcompBenef.LOGO,
  csAcompBenef.[Motivo Deslig],
  csAcompBenef.Particular,
  csAcompBenef.Coletivo,
  csAcompBenef.Grupo,
  csAcompBenef.Defic,
  csAcompBenef.Idoso,
  csAcompBenef.DataDesl,
  csAcompBenef.BPCD,
  csAcompBenef.BPCI,
  CadResidencia.[Fam Extrema Pb],
  csAcompBenef.FragilSocioEcon,
  CadResidencia.[PBF FAMILIA],
  CadResidencia.CADUNICO,
  CadResidencia.[Outros Programas Priori],
  csAcompBenef.[Aposentado/pensionista],
  csAcompBenef.[Renda sem programas sociais]
FROM
  CadResidencia
  INNER JOIN csAcompBenef ON CadResidencia.CodFam = csAcompBenef.CodFam;
