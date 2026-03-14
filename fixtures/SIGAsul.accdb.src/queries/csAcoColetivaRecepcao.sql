SELECT
  TbRecepção.CodRecepcao,
  TbRecepção.Data,
  TbRecepção.ACOCOLETIVA
FROM
  TbRecepção
WHERE
  (
    (
      (TbRecepção.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbRecepção.ACOCOLETIVA) Is Not Null
    )
  );
