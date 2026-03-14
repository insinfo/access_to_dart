SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  CadResidencia.DataCad,
  TbAtend.Nome,
  TbCadFuncionario.Nome,
  TbCadFuncionario.[FUNÇÃO NO SISTEMA],
  TbAtend.FuncaoFuncionario,
  TbAtend.Administrativo,
  TbAtend.Social,
  TbAtend.Psicologico,
  TbAtend.MULTIDISCIPLINAR,
  TbAtend.OrientadorSoc,
  TbAtend.AtGestao,
  TbAtend.[Acolhida Coletiva]
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN (
    TbCadFuncionario
    INNER JOIN TbAtend ON TbCadFuncionario.CodFunc = TbAtend.CodFunc
  ) ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  )
ORDER BY
  TbAtend.Nome;
