SELECT
  DISTINCT CadResidencia.CodFam,
  TbAtend.Volante,
  CadResidencia.Bairro,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
FROM
  TbUnidade
  INNER JOIN (
    (
      CadResidencia
      INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
    )
    INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
  ) ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  )
ORDER BY
  CadResidencia.Bairro;
