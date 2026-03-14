SELECT
  TbAtend.Data,
  CadResidencia.DataCad,
  TbAtend.Nome,
  TbAtend.NomeFunc,
  TbAtend.FuncaoFuncionario,
  TbAtend.Administrativo,
  TbAtend.Social,
  TbAtend.Psicologico,
  TbAtend.Multidisciplinar,
  TbAtend.OrientadorSoc,
  TbAtend.AtGestao
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome;
