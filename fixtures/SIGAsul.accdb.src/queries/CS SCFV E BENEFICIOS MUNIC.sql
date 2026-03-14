SELECT
  TbBeneficiosMunicipais.Nome,
  TbBeneficiosMunicipais.DataDesl,
  TbOfSocioEduDetalhe.Volante,
  TbOfSocioEduDetalhe.BeneficioMunic,
  TbOfSocioEduDetalhe.BPC,
  TbOfSocioEduDetalhe.PBF,
  TbOfSocioEduDetalhe.CADUNICO,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbOfSocioEduDetalhe.DataInsc,
  TbOfSocioEduDetalhe.Nome,
  TbOfSocioEduDetalhe.DNasPessoa,
  TbOfSocioEduDetalhe.Idade,
  TbOfSocioEduDetalhe.SituaçãoUsuario,
  TbOfSocioEduDetalhe.[Nome Respons Criança],
  TbOfSocioEduDetalhe.[CPF Resp],
  TbOfSocioEduDetalhe.[Cel Resp],
  TbOfSocioEduDetalhe.[Parentesco Resp],
  TbOfSocioEduDetalhe.Aco,
  TbOfSocioEduDetalhe.PAF,
  TbOfSocioEduDetalhe.Obs,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl,
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
  LEFT JOIN TbBeneficiosMunicipais ON TbOfSocioEduDetalhe.Nome = TbBeneficiosMunicipais.Nome
WHERE
  (
    (
      (
        TbBeneficiosMunicipais.DataDesl
      ) Is Null
      Or (
        TbBeneficiosMunicipais.DataDesl
      )>= [DATA FINAL]
    )
  );
