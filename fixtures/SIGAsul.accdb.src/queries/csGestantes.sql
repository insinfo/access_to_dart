SELECT
  TbPessoa.Nome,
  TbGestDet.DataCad,
  TbGestDet.DataDesl,
  TbPessoa.CodPessoa
FROM
  TbPessoa
  INNER JOIN (
    TbGestante
    INNER JOIN TbGestDet ON TbGestante.CodGestante = TbGestDet.CodGestante
  ) ON TbPessoa.CodPessoa = TbGestante.Nome
WHERE
  (
    (
      (TbGestDet.DataDesl) Is Null
    )
  );
