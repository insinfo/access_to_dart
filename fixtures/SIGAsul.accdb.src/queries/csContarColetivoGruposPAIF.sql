SELECT
  TbAtColetivo.CodColetivo,
  TbAtColetivo.DataCol,
  TbAtColetivo.GruposPAIF,
  Count(TbAtColetivo.DataCol) AS ContarDeDataCol,
  TbAtColetivo.Tema,
  TbAtColetivo.OFICINEIRO,
  TbCadFuncionario.Nome,
  TbCadFuncionario.[FUNÇÃO NO SISTEMA],
  TbCadFuncionario.Cargo
FROM
  TbCadFuncionario
  INNER JOIN (
    TbAtColetivo
    INNER JOIN TbAtColetivoDet ON TbAtColetivo.CodColetivo = TbAtColetivoDet.CodColetivo
  ) ON TbCadFuncionario.CodFunc = TbAtColetivo.OFICINEIRO
GROUP BY
  TbAtColetivo.CodColetivo,
  TbAtColetivo.DataCol,
  TbAtColetivo.GruposPAIF,
  TbAtColetivo.Tema,
  TbAtColetivo.OFICINEIRO,
  TbCadFuncionario.Nome,
  TbCadFuncionario.[FUNÇÃO NO SISTEMA],
  TbCadFuncionario.Cargo
HAVING
  (
    (
      (TbAtColetivo.GruposPAIF)= Yes
    )
  );
