SELECT
  TbPessoa.CodPessoa,
  Max(TbSCFVExtAtualiz.DataAtual) AS MáxDeDataAtual,
  TbPessoa.CodFam,
  TbSCFVExtDetalhe.DATAINSCR,
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.GRUPOEXT,
  TbSCFVExtDetalhe.FXETARIA,
  TbSCFVExtDetalhe.TURNO,
  TbSCFVExtDetalhe.UNIDADE,
  TbPessoa.Nome AS nomeusuario,
  TbPessoa.DNasc AS dnascusuario,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS IdadeUsuario,
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.NomeMae,
  TbSCFVExtDetalhe.[Nome Respons Criança],
  TbSCFVExtDetalhe.[CPF Resp],
  TbSCFVExtDetalhe.[Cel Resp],
  TbSCFVExtDetalhe.[Parentesco Resp],
  TbSCFVExtDetalhe.SituaçãoUsuario,
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.MotivoDesl,
  TbPessoa.NIS AS nisusuario
FROM
  (
    TbPessoa
    INNER JOIN TbSCFVExtDetalhe ON (
      TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome
    )
    AND (
      TbPessoa.CodPessoa = TbSCFVExtDetalhe.Nome
    )
  )
  INNER JOIN TbSCFVExtAtualiz ON TbSCFVExtDetalhe.CodSCFVEDet = TbSCFVExtAtualiz.CodSCFVEDet
GROUP BY
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbSCFVExtDetalhe.DATAINSCR,
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.GRUPOEXT,
  TbSCFVExtDetalhe.FXETARIA,
  TbSCFVExtDetalhe.TURNO,
  TbSCFVExtDetalhe.UNIDADE,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ),
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.NomeMae,
  TbSCFVExtDetalhe.[Nome Respons Criança],
  TbSCFVExtDetalhe.[CPF Resp],
  TbSCFVExtDetalhe.[Cel Resp],
  TbSCFVExtDetalhe.[Parentesco Resp],
  TbSCFVExtDetalhe.SituaçãoUsuario,
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.MotivoDesl,
  TbPessoa.NIS
HAVING
  (
    (
      (TbSCFVExtDetalhe.DataDesl) Is Null
    )
  );
