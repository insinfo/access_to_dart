SELECT
  TbAtend.Data,
  TbAtend.CodAtend,
  TbCadFuncionario.Nome AS TECNICO,
  TbCadFuncionario.[FUNÇÃO NO SISTEMA],
  TbPessoa.Nome AS USUÁRIO,
  TbPessoa.CodPessoa,
  TbAtend.DemandaApoioAlim,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN (
    TbAtend
    INNER JOIN TbCadFuncionario ON TbAtend.CodFunc = TbCadFuncionario.CodFunc
  ) ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.DemandaApoioAlim)= Yes
    )
  );
