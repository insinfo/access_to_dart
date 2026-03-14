SELECT
  csAcoPorTecnicoUnion.CodTecnico,
  csAcoPorTecnicoUnion.NomeTec,
  csAcoPorTecnicoUnion.[Carga Horária],
  csAcoPorTecnicoUnion.Nome,
  csAcoPorTecnicoUnion.[PAF inicio],
  csAcoPorTecnicoUnion.DataDesl,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.RODAPE,
  TbUnidade.LOGO
FROM
  TbUnidade,
  csAcoPorTecnicoUnion
WHERE
  (
    (
      (
        csAcoPorTecnicoUnion.[PAF inicio]
      ) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (csAcoPorTecnicoUnion.DataDesl) Is Null
    )
  );
