SELECT
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbPessoa.Escolaridade,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
FROM
  TbPessoa,
  TbUnidade
WHERE
  (
    (
      (TbPessoa.Escolaridade) Like [digite o ano] + "*"
    )
    AND (
      (
        Int(
          DateDiff(
            "d",
            [TbPessoa].[DNasc],
            Date()
          )/ 365.25
        )
      ) Between [IDADE INICIAL]
      And [IDADE FINAL]
    )
  )
ORDER BY
  TbPessoa.Nome;
