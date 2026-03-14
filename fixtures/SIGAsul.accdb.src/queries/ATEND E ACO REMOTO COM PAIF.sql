SELECT
  [ATENDIMENTO E ACO REMOTO].Data,
  TbAcomp.Volante,
  [ATENDIMENTO E ACO REMOTO].Nome,
  [ATENDIMENTO E ACO REMOTO].DNasc,
  [ATENDIMENTO E ACO REMOTO].AtRemoto,
  [ATENDIMENTO E ACO REMOTO].Acoremoto,
  TbAcompDet.[PAF inicio],
  TbAcompDet.[PAF fim],
  TbAcompDet.DataDesl
FROM
  [ATENDIMENTO E ACO REMOTO]
  INNER JOIN (
    TbAcompDet
    INNER JOIN TbAcomp ON TbAcompDet.CodAcomp = TbAcomp.CodAcomp
  ) ON [ATENDIMENTO E ACO REMOTO].CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (
        [ATENDIMENTO E ACO REMOTO].Data
      ) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
      Or (TbAcompDet.DataDesl)> [DATA FINAL]
    )
  )
ORDER BY
  [ATENDIMENTO E ACO REMOTO].Data;
