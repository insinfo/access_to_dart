SELECT
  TbEncaminhamento.Nome AS USUÁRIO,
  TbEncaminhamento.DataMonit,
  TbEncaminhamento.ATENDIDO,
  TbEncaminhamento.MotivoNão,
  TbEncaminhamento.NomeFunc,
  TbEncaminhamento.ENG,
  TbEncaminhamento.RSA,
  TbEncaminhamento.RS,
  TbEncaminhamento.RE,
  TbEncaminhamento.SF,
  TbEncaminhamento.OP
FROM
  TbEncaminhamento
WHERE
  (
    (
      (TbEncaminhamento.DataMonit) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbEncaminhamento.ATENDIDO)= No
    )
    AND (
      (
        TbEncaminhamento.[Monitoramento Sem Exito]
      )= No
    )
  )
ORDER BY
  TbEncaminhamento.CODENC,
  TbEncaminhamento.DataEnc;
