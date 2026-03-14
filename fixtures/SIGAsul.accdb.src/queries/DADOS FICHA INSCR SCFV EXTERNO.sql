SELECT
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtAtualiz.CodSCFVExtAtual,
  TbSCFVExtAtualiz.CodSCFVEDet,
  TbSCFVExtDetalhe.DATAINSCR,
  TbSCFVExtAtualiz.DataAtual,
  TbSCFVExtDetalhe.GRUPOEXT,
  TbGrupoExterno.NomeGrupo,
  TbSCFVExtDetalhe.FXETARIA,
  TbSCFVExtDetalhe.TURNO,
  TbSCFVExtDetalhe.UNIDADE,
  TbSCFVExtDetalhe.Nome,
  TbSCFVExtDetalhe.SituaçãoUsuario,
  TbSCFVExtDetalhe.DataDesl,
  TbSCFVExtDetalhe.MotivoDesl,
  TbSCFVExtDetalhe.Encaminhado,
  TbSCFVExtDetalhe.Onde,
  TbSCFVExtDetalhe.Obs,
  TbSCFVExtDetalhe.BeneficioMunic,
  TbSCFVExtDetalhe.BPC,
  TbSCFVExtDetalhe.PBF,
  TbSCFVExtDetalhe.CADUNICO,
  TbSCFVExtDetalhe.[Nome Respons Criança],
  TbSCFVExtDetalhe.[CPF Resp],
  TbSCFVExtDetalhe.[Cel Resp],
  TbSCFVExtDetalhe.[Parentesco Resp],
  TbSCFVExtDetalhe.Aco,
  TbSCFVExtDetalhe.PAF,
  TbSCFVExtDetalhe.[Motivo busca serviço],
  TbSCFVExtDetalhe.[Qual politica encaminhou],
  TbSCFVExtDetalhe.[Cuidador exclusivo],
  TbSCFVExtDetalhe.[Cuidador exclusivo trabalha],
  TbSCFVExtDetalhe.VacinaEmDia,
  TbSCFVExtDetalhe.Medicamentos,
  TbSCFVExtDetalhe.QuaisMedicamentos,
  TbSCFVExtDetalhe.TratamentoSaude,
  TbSCFVExtDetalhe.QualTratamento,
  TbSCFVExtDetalhe.Alergia,
  TbSCFVExtDetalhe.QualAlergia,
  TbSCFVExtDetalhe.Pediatra,
  TbSCFVExtDetalhe.[Autorizado a sair sozinho],
  TbSCFVExtDetalhe.QuemBusca,
  TbSCFVExtDetalhe.PessoaEmergencia,
  TbSCFVExtDetalhe.TelEmergencia
FROM
  TbGrupoExterno
  INNER JOIN (
    TbSCFVExtDetalhe
    LEFT JOIN TbSCFVExtAtualiz ON TbSCFVExtDetalhe.CodSCFVEDet = TbSCFVExtAtualiz.CodSCFVEDet
  ) ON TbGrupoExterno.CodGrupo = TbSCFVExtDetalhe.GRUPOEXT
WHERE
  (
    (
      (TbSCFVExtDetalhe.CodSCFVEDet)= [Formulários]![FrmSCFVExterno]![CodSCFVEDet]
    )
    AND (
      (TbSCFVExtDetalhe.DataDesl) Is Null
    )
  );
