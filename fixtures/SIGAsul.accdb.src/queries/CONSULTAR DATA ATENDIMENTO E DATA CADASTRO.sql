SELECT
  TbAtend.CodAtend,
  TbAtend.Volante,
  TbAtend.Data,
  CadResidencia.DataCad,
  CadResidencia.CodFam,
  TbAtend.Nome,
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
      (CadResidencia.DataCad)> [Data]
    )
  )
ORDER BY
  TbAtend.Nome;
