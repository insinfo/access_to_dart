SELECT
  [NOVO DIARIO 2020].CodDiario,
  TbPessoa.DataDesligPes,
  TbUnidade.LOGO,
  TbUnidade.NOME,
  TbCadFuncionario.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS IdadePessoa,
  [NOVO DIARIO 2020].HORARIO,
  TbPessoa.Nome,
  TbPessoa.Celular,
  [NOVO DIARIO 2020].Grupo,
  [NOVO DIARIO 2020].Tipo,
  [NOVO DIARIO 2020].FxEtaria,
  [NOVO DIARIO 2020].DiaSemana,
  *
FROM
  (
    TbUnidade
    INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
  )
  INNER JOIN (
    (
      [NOVO DIARIO 2020]
      INNER JOIN TbPessoa ON [NOVO DIARIO 2020].Nome = TbPessoa.CodPessoa
    )
    INNER JOIN TbCadFuncionario ON [NOVO DIARIO 2020].CodFunc = TbCadFuncionario.CodFunc
  ) ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      ([NOVO DIARIO 2020].CodDiario)= [Formulários]![FrmDiario]![CodDiario]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
