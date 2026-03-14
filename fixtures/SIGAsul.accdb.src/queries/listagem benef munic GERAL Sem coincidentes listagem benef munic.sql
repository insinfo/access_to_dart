SELECT
  [listagem benef munic GERAL].TbPessoa.NOME,
  [listagem benef munic movimento ano GERAL].[Ano de referencia],
  [listagem benef munic GERAL].TipoBeneficio,
  [listagem benef munic GERAL].DataDesl,
  [listagem benef munic GERAL].DataSusp,
  [listagem benef munic GERAL].DataTransf,
  [listagem benef munic GERAL].CPF,
  [listagem benef munic GERAL].Celular,
  [listagem benef munic GERAL].Responsavel,
  [listagem benef munic GERAL].[CPF Responsavel],
  [listagem benef munic GERAL].TbUnidade.NOME,
  [listagem benef munic GERAL].[DIRETOR(A)],
  [listagem benef munic GERAL].FUNÇÃO,
  [listagem benef munic GERAL].MATRICULA,
  [listagem benef munic GERAL].LOGO,
  [listagem benef munic GERAL].RODAPE,
  [listagem benef munic GERAL].NomeFunc
FROM
  [listagem benef munic GERAL]
  LEFT JOIN [listagem benef munic movimento ano GERAL] ON [listagem benef munic GERAL].[TbPessoa].[NOME] = [listagem benef munic movimento ano GERAL].[TbPessoa].[Nome]
WHERE
  (
    (
      (
        [listagem benef munic movimento ano GERAL].TbPessoa.Nome
      ) Is Null
    )
  );
