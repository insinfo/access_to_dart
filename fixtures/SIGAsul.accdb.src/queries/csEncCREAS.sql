SELECT
  TbEncaminhamento.DataEnc,
  TbEncaminhamento.Nome,
  TbEncaminhamento.RSA11 AS creas,
  TbEncaminhamento.RSA5 AS ceam,
  TbEncaminhamento.RSA6 AS conselho
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
  TbEncaminhamento.RSA11,
  TbEncaminhamento.RSA5,
  TbEncaminhamento.RSA6;
