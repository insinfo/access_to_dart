SELECT
  PrincipalSCFVInterno.CodPessoa,
  PrincipalSCFVInterno.CodFam,
  PrincipalSCFVInterno.DataInsc,
  PrincipalSCFVInterno.NomePessoa,
  PrincipalSCFVInterno.DNasc,
  PrincipalSCFVInterno.Idade,
  PrincipalSCFVInterno.DataDesl,
  PrincipalSCFVInterno.SituaçãoUsuario,
  [CS RESPONSAVEL FAMILIAR].Nome AS RESPONSAVEL,
  [CS RESPONSAVEL FAMILIAR].Parentesco,
  [CS RESPONSAVEL FAMILIAR].CPF,
  [CS RESPONSAVEL FAMILIAR].RG,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO
FROM
  TbUnidade,
  [CS RESPONSAVEL FAMILIAR]
  INNER JOIN PrincipalSCFVInterno ON [CS RESPONSAVEL FAMILIAR].CodFam = PrincipalSCFVInterno.CodFam;
