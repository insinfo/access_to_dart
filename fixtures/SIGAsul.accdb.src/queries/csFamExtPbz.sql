SELECT
  DISTINCT CadResidencia.CodFam,
  CadResidencia.[Fam Extrema Pb],
  TbPessoa.CodPessoa,
  TbPessoa.Nome
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (CadResidencia.[Fam Extrema Pb])= Yes
    )
  );
