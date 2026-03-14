SELECT
  PrincipalSCFVExterno.UNIDADE,
  PrincipalSCFVExterno.TURNO,
  PrincipalSCFVExterno.Nome,
  PrincipalSCFVExterno.DNasc,
  PrincipalSCFVExterno.Idade,
  [CS RESPONSAVEL FAMILIAR].Nome,
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
  PrincipalSCFVExterno
  INNER JOIN [CS RESPONSAVEL FAMILIAR] ON PrincipalSCFVExterno.CodFam = [CS RESPONSAVEL FAMILIAR].CodFam
ORDER BY
  PrincipalSCFVExterno.Nome;
