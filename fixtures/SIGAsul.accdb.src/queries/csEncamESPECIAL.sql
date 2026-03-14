SELECT
  TbEncaminhamento.RSA11 AS CREAS,
  TbEncaminhamento.RSA5 AS CEAM,
  TbEncaminhamento.RSA6 AS [CONS TUTELAR],
  TbEncaminhamento.DataEnc,
  TbEncaminhamento.Nome,
  TbEncaminhamento.Tel1,
  TbEncaminhamento.Obs,
  TbEncaminhamento.NomeFunc,
  TbEncaminhamento.DataMonit,
  TbEncaminhamento.ServidorMonitor,
  TbEncaminhamento.[Monitoramento Sem Exito],
  TbEncaminhamento.ATENDIDO
FROM
  TbEncaminhamento
WHERE
  (
    (
      (TbEncaminhamento.RSA11)= Yes
    )
  )
  OR (
    (
      (TbEncaminhamento.RSA5)= Yes
    )
  )
  OR (
    (
      (TbEncaminhamento.RSA6)= Yes
    )
  )
ORDER BY
  TbEncaminhamento.DataEnc;
