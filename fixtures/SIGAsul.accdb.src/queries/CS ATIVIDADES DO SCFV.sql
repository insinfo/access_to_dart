SELECT
  TbUnidade.NOME,
  TbUnidade.LOGO,
  TbPessoa.CodPessoa,
  TbDiarioDet.CodDiarioDet,
  TbUnidade.CRAS,
  TbDiario.Volante,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  TbDiario.Grupo,
  TbDiario.FxEtaria,
  TbDiario.Horario,
  TbDiario.DiaSemana,
  TbDiario.CodFunc,
  TbDiario.NomeOficineiro
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN (
    TbDiarioDet
    INNER JOIN TbDiario ON TbDiarioDet.CodDiario = TbDiario.CodDiario
  ) ON TbPessoa.CodPessoa = TbDiarioDet.Nome
WHERE
  (
    (
      (TbUnidade.CRAS)= Yes
    )
    AND (
      (TbPessoa.Nome) Like [DIGITE O NOME] + "*"
    )
  )
ORDER BY
  TbDiario.Horario;
