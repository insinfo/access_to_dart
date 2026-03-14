SELECT
  csAcoPorTecnicoUnion.CodTecnico,
  csAcoPorTecnicoUnion.NomeTec,
  csAcoPorTecnicoUnion.[Carga Horária],
  csAcoPorTecnicoUnion.Nome,
  csAcoPorTecnicoUnion.[PAF inicio],
  csAcoPorTecnicoUnion.DataDesl,
  csAcoPorTecnicoUnion.LOGO
FROM
  csAcoPorTecnicoUnion
WHERE
  (
    (
      (
        csAcoPorTecnicoUnion.[PAF inicio]
      ) Is Null
    )
    AND (
      (csAcoPorTecnicoUnion.DataDesl) Is Null
      Or (csAcoPorTecnicoUnion.DataDesl)>= [DATA FINAL]
    )
  );
