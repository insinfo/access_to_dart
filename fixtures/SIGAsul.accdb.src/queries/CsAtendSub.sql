SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  CadResidencia.DataCad,
  TbPessoa.Nome,
  TbAtend.NomeFunc,
  TbAtend.FuncaoFuncionario,
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
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (CadResidencia.DataCad)< [Data]
    )
  );
