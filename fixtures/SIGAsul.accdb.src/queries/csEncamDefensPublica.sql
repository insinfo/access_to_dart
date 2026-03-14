SELECT
  TbEncaminhamento.DataEnc,
  TbEncaminhamento.Nome,
  TbEncaminhamento.OP13
FROM
  TbEncaminhamento
WHERE
  (
    (
      (TbEncaminhamento.DataEnc) Between [data inicial]
      And [data final]
    )
    AND (
      (TbEncaminhamento.OP13)= Yes
    )
  );
