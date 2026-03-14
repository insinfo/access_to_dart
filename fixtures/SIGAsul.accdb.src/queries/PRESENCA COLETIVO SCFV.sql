SELECT
  TbAtColetivo.CodColetivo,
  TbAtColetivoDet.CodAtColetDet,
  TbAtColetivo.DataCol,
  TbAtColetivo.GRUPOSCFV,
  TbPessoa.Nome,
  TbPessoa.CodPessoa,
  TbAtColetivo.OFICINEIRO,
  TbAtColetivo.horario,
  TbAtColetivo.fxetariadoscfv,
  TbAtColetivo.AtividadeSCFV,
  TbAtColetivo.OfSESCFV
FROM
  TbPessoa
  INNER JOIN (
    TbAtColetivo
    INNER JOIN TbAtColetivoDet ON TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
  ) ON TbPessoa.CodPessoa = TbAtColetivoDet.Nome
WHERE
  (
    (
      (TbAtColetivo.AtividadeSCFV)= Yes
    )
  )
  OR (
    (
      (TbAtColetivo.OfSESCFV)= Yes
    )
  );
