SELECT
  TbEncaminhamento.Volante,
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.LOGO,
  TbEncaminhamento.CODENC,
  TbEncaminhamento.DataEnc,
  TbEncaminhamento.CodFunc,
  TbCadFuncionario.Nome,
  TbPessoa.Nome,
  TbEncaminhamento.Tel1,
  TbEncaminhamento.Tel2,
  TbEncaminhamento.DataMonit,
  TbEncaminhamento.ServidorMonitor,
  TbEncaminhamento.ATENDIDO,
  TbEncaminhamento.MotivoNão,
  TbEncaminhamento.[Descrição outros motivos],
  TbEncaminhamento.Obs,
  TbEncaminhamento.ENG,
  TbEncaminhamento.ENG1,
  TbEncaminhamento.ENG2,
  TbEncaminhamento.ENG3,
  TbEncaminhamento.ENG4,
  TbEncaminhamento.ENG5,
  TbEncaminhamento.ENG6,
  TbEncaminhamento.ENGOUT,
  TbEncaminhamento.RSA,
  TbEncaminhamento.RSA5,
  TbEncaminhamento.RSA6,
  TbEncaminhamento.RSA7,
  TbEncaminhamento.RSA8,
  TbEncaminhamento.RSA9,
  TbEncaminhamento.RSA10,
  TbEncaminhamento.[MOTIVO CRAS],
  TbEncaminhamento.RSA11,
  TbEncaminhamento.[MOTIVO CREAS],
  TbEncaminhamento.RSA12,
  TbEncaminhamento.RSA13,
  TbEncaminhamento.RSA14,
  TbEncaminhamento.RS,
  TbEncaminhamento.RS1,
  TbEncaminhamento.RS2,
  TbEncaminhamento.RS3,
  TbEncaminhamento.RS4,
  TbEncaminhamento.RS5,
  TbEncaminhamento.RS6,
  TbEncaminhamento.RS7,
  TbEncaminhamento.RS8,
  TbEncaminhamento.RS9,
  TbEncaminhamento.RS10,
  TbEncaminhamento.RS11,
  TbEncaminhamento.RS12,
  TbEncaminhamento.RS13,
  TbEncaminhamento.RS14,
  TbEncaminhamento.RS15,
  TbEncaminhamento.RS16,
  TbEncaminhamento.RS17,
  TbEncaminhamento.RS18,
  TbEncaminhamento.RS19,
  TbEncaminhamento.RS20,
  TbEncaminhamento.RE,
  TbEncaminhamento.RE1,
  TbEncaminhamento.RE2,
  TbEncaminhamento.RE3,
  TbEncaminhamento.SF,
  TbEncaminhamento.SF1,
  TbEncaminhamento.SF2,
  TbEncaminhamento.OP,
  TbEncaminhamento.OP1,
  TbEncaminhamento.OP2,
  TbEncaminhamento.OP3,
  TbEncaminhamento.OP4,
  TbEncaminhamento.OP5,
  TbEncaminhamento.OP6,
  TbEncaminhamento.OP7,
  TbEncaminhamento.OP8,
  TbEncaminhamento.OP9,
  TbEncaminhamento.OP10,
  TbEncaminhamento.OP11,
  TbEncaminhamento.OP12,
  TbEncaminhamento.OP13,
  TbEncaminhamento.OP14,
  TbEncaminhamento.OP15,
  TbEncaminhamento.OP16,
  TbEncaminhamento.OP17,
  TbEncaminhamento.OP18,
  TbEncaminhamento.OP19,
  TbEncaminhamento.OPOUTROS,
  *
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN (
    TbCadFuncionario
    INNER JOIN TbEncaminhamento ON TbCadFuncionario.CodFunc = TbEncaminhamento.CodFunc
  ) ON TbPessoa.CodPessoa = TbEncaminhamento.Nome
WHERE
  (
    (
      (TbEncaminhamento.Volante)= Yes
    )
    AND (
      (TbEncaminhamento.DataEnc) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbCadFuncionario.Nome) Like "*" + [DIGITE O NOME DO TÉCNICO] + "*"
    )
  );
