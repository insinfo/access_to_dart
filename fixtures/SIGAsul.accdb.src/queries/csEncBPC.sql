SELECT
  TbEncaminhamento.DataEnc,
  TbEncaminhamento.OP1
FROM
  TbEncaminhamento
WHERE
  (
    (
      (TbEncaminhamento.OP1)= Yes
    )
  );
