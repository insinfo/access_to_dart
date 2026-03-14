SELECT
  TbPessoa.Nome AS USUÁRIO,
  TbCadFuncionario.Nome AS TECNICO,
  PrincipalMediacoesOk.Compareceu,
  PrincipalMediacoesOk.DataDesl,
  PrincipalMediacoesOk.DataRetorno,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO
FROM
  TbUnidade,
  TbCadFuncionario
  INNER JOIN (
    TbPessoa
    INNER JOIN PrincipalMediacoesOk ON TbPessoa.CodPessoa = PrincipalMediacoesOk.Nome
  ) ON TbCadFuncionario.CodFunc = PrincipalMediacoesOk.CodTecnico
WHERE
  (
    (
      (TbCadFuncionario.Nome) Like [DIGITE O TECNICO] + "*"
    )
  );
