SELECT
  DISTINCT TbAtend.CodAtend,
  TbAtend.Data,
  TbAtend.Nome
FROM
  TbAtend
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
