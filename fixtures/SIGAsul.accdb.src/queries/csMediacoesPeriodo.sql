SELECT
  TbAcoRetorno.CodAcoRetorno,
  TbAcoRetorno.DataRetorno,
  TbAcoRetorno.Compareceu
FROM
  TbAcomp
  INNER JOIN TbAcoRetorno ON TbAcomp.CodAcomp = TbAcoRetorno.CodAcomp
WHERE
  (
    (
      (TbAcoRetorno.Compareceu)= Yes
    )
  );
