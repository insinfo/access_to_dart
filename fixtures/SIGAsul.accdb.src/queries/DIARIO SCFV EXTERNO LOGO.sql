SELECT
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  [DIARIO SCFV EXTERNO].NomeGrupo,
  [DIARIO SCFV EXTERNO].FxEtariaGr,
  [DIARIO SCFV EXTERNO].Turno,
  [DIARIO SCFV EXTERNO].CodSCFVEDet,
  [DIARIO SCFV EXTERNO].DATAINSCR,
  [DIARIO SCFV EXTERNO].UNIDADE,
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbPessoa.Nome,
  TbPessoa.DNasc,
  [DIARIO SCFV EXTERNO].IdadePessoa,
  [DIARIO SCFV EXTERNO].SituaçãoUsuario,
  [DIARIO SCFV EXTERNO].DataDesl,
  [DIARIO SCFV EXTERNO].MotivoDesl,
  [DIARIO SCFV EXTERNO].Encaminhado,
  [DIARIO SCFV EXTERNO].Obs,
  [DIARIO SCFV EXTERNO].BeneficioMunic,
  [DIARIO SCFV EXTERNO].BPC,
  [DIARIO SCFV EXTERNO].PBF,
  [DIARIO SCFV EXTERNO].CADUNICO,
  [DIARIO SCFV EXTERNO].[Nome Respons Criança],
  [DIARIO SCFV EXTERNO].[CPF Resp],
  [DIARIO SCFV EXTERNO].[Cel Resp],
  [DIARIO SCFV EXTERNO].[Parentesco Resp],
  [DIARIO SCFV EXTERNO].Aco,
  [DIARIO SCFV EXTERNO].PAF,
  [DIARIO SCFV EXTERNO].[Motivo busca serviço],
  [DIARIO SCFV EXTERNO].[Qual politica encaminhou],
  [DIARIO SCFV EXTERNO].[Cuidador exclusivo],
  [DIARIO SCFV EXTERNO].[Cuidador exclusivo trabalha],
  [DIARIO SCFV EXTERNO].VacinaEmDia,
  [DIARIO SCFV EXTERNO].Medicamentos,
  [DIARIO SCFV EXTERNO].QuaisMedicamentos,
  [DIARIO SCFV EXTERNO].TratamentoSaude,
  [DIARIO SCFV EXTERNO].QualTratamento,
  [DIARIO SCFV EXTERNO].Alergia,
  [DIARIO SCFV EXTERNO].QualAlergia,
  [DIARIO SCFV EXTERNO].Pediatra,
  [DIARIO SCFV EXTERNO].[Autorizado a sair sozinho],
  [DIARIO SCFV EXTERNO].QuemBusca,
  [DIARIO SCFV EXTERNO].PessoaEmergencia,
  [DIARIO SCFV EXTERNO].TelEmergencia
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN [DIARIO SCFV EXTERNO] ON TbPessoa.CodPessoa = [DIARIO SCFV EXTERNO].Nome
WHERE
  (
    (
      (
        [DIARIO SCFV EXTERNO].NomeGrupo
      ) Like [DIGITE O GRUPO] + "*"
    )
    AND (
      ([DIARIO SCFV EXTERNO].DataDesl) Is Null
    )
  );
