SELECT
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl,
  TbOfSocioEduDetalhe.DataInsc,
  TbOfSocioEduAtualiz.DataAtual,
  TbOfSocioEduDetalhe.Nome,
  TbOfSocioEduDetalhe.SituaçãoUsuario,
  TbOfSocioEduDetalhe.BeneficioMunic,
  TbOfSocioEduDetalhe.BPC,
  TbOfSocioEduDetalhe.PBF,
  TbOfSocioEduDetalhe.CADUNICO,
  TbOfSocioEduDetalhe.[Nome Respons Criança],
  TbOfSocioEduDetalhe.[CPF Resp],
  TbOfSocioEduDetalhe.[Cel Resp],
  TbOfSocioEduDetalhe.[Parentesco Resp],
  TbOfSocioEduDetalhe.Aco,
  TbOfSocioEduDetalhe.PAF,
  TbOfSocioEduDetalhe.Obs,
  TbOfSocioEduDetalhe.Encaminhado,
  TbOfSocioEduDetalhe.Onde,
  TbOfSocioEduDetalhe.[Motivo busca serviço],
  TbOfSocioEduDetalhe.[Qual politica encaminhou],
  TbOfSocioEduDetalhe.[Cuidador exclusivo],
  TbOfSocioEduDetalhe.[Cuidador exclusivo trabalha],
  TbOfSocioEduDetalhe.VacinaEmDia,
  TbOfSocioEduDetalhe.Medicamentos,
  TbOfSocioEduDetalhe.QuaisMedicamentos,
  TbOfSocioEduDetalhe.TratamentoSaude,
  TbOfSocioEduDetalhe.QualTratamento,
  TbOfSocioEduDetalhe.Alergia,
  TbOfSocioEduDetalhe.QualAlergia,
  TbOfSocioEduDetalhe.Pediatra,
  TbOfSocioEduDetalhe.[Autorizado a sair sozinho],
  TbOfSocioEduDetalhe.QuemBusca,
  TbOfSocioEduDetalhe.PessoaEmergencia,
  TbOfSocioEduDetalhe.TelEmergencia
FROM
  TbOfSocioEduDetalhe
  INNER JOIN TbOfSocioEduAtualiz ON TbOfSocioEduDetalhe.CodOfSEDet = TbOfSocioEduAtualiz.CodOfSEDet
WHERE
  (
    (
      (TbOfSocioEduDetalhe.CodOfSEDet)= [Formulários]![FrmOficinaSocioeducativa]![CodOfSEDet]
    )
    AND (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
    )
  );
