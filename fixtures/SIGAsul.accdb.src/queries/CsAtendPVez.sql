SELECT
  TbAtend.CodAtend,
  CadResidencia.DataCad,
  TbPessoa.Nome,
  TbAtend.Data,
  TbAtend.Administrativo,
  TbAtend.Social,
  TbAtend.Psicologico,
  TbAtend.MULTIDISCIPLINAR,
  TbAtend.OrientadorSoc,
  TbAtend.AtGestao
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (CadResidencia.DataCad)= [Data]
    )
    AND (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
