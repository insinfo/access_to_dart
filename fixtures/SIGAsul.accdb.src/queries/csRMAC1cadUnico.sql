SELECT
  TbRecepção.Data,
  TbRecepção.CAD1VEZ,
  TbRecepção.CADATUALIZ,
  TbRecepção.CADORI
FROM
  TbRecepção
WHERE
  (
    (
      (TbRecepção.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
