SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  TbAtend.Nome,
  TbCadFuncionario.Nome AS Funcionario,
  TbAtend.FuncaoFuncionario,
  TbAtend.Social,
  TbAtend.Psicologico,
  TbAtend.Multidisciplinar,
  TbAtend.OrientadorSoc,
  TbAtend.Administrativo,
  TbAtend.AtGestao
FROM
  TbAtend
  INNER JOIN TbCadFuncionario ON TbAtend.CodFunc = TbCadFuncionario.CodFunc
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.Social)= Yes
    )
  )
  OR (
    (
      (TbAtend.Psicologico)= Yes
    )
  )
  OR (
    (
      (TbAtend.Multidisciplinar)= Yes
    )
  )
  OR (
    (
      (TbAtend.OrientadorSoc)= Yes
    )
  )
  OR (
    (
      (TbAtend.Administrativo)= Yes
    )
  )
ORDER BY
  TbCadFuncionario.Nome;
