SELECT
  TbEncaminhamento.CODENC,
  TbEncaminhamento.DataEnc,
  TbPessoa.Nome,
  TbEncaminhamento.RS,
  TbEncaminhamento.RS1,
  TbEncaminhamento.RS2,
  TbEncaminhamento.RS3,
  TbEncaminhamento.RS4,
  TbEncaminhamento.RS5,
  TbEncaminhamento.DataMonit,
  TbEncaminhamento.ServidorMonitor,
  TbEncaminhamento.[Monitoramento Sem Exito],
  TbEncaminhamento.ATENDIDO,
  TbEncaminhamento.MotivoNão,
  TbEncaminhamento.[Descrição outros motivos]
FROM
  TbPessoa
  INNER JOIN TbEncaminhamento ON TbPessoa.CodPessoa = TbEncaminhamento.Nome
WHERE
  (
    (
      (TbEncaminhamento.DataEnc) Between [data inicial]
      And [data final]
    )
    AND (
      (TbEncaminhamento.RS1)= Yes
    )
  )
  OR (
    (
      (TbEncaminhamento.RS2)= Yes
    )
  )
  OR (
    (
      (TbEncaminhamento.RS3)= Yes
    )
  )
  OR (
    (
      (TbEncaminhamento.RS4)= Yes
    )
  )
  OR (
    (
      (TbEncaminhamento.RS5)= Yes
    )
  );
