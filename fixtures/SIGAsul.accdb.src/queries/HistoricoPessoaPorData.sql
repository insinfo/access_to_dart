SELECT
  historicoPessoa.Data,
  historicoPessoa.CodPessoa,
  historicoPessoa.Nome,
  historicoPessoa.Administrativo,
  historicoPessoa.Social,
  historicoPessoa.Psicologico,
  historicoPessoa.Multidisciplinar,
  historicoPessoa.OrientadorSoc,
  historicoPessoa.AtGestao,
  historicoPessoa.DemandaBPC,
  historicoPessoa.DemandaINSS,
  historicoPessoa.DemandaSCFV,
  historicoPessoa.DemandaEduc,
  historicoPessoa.DemandaSaude,
  historicoPessoa.DemandaJustiça,
  historicoPessoa.DemandaBenefMun,
  historicoPessoa.DemandaAuxNatal,
  historicoPessoa.DemandaGratTransp,
  historicoPessoa.DemandaRecJus,
  historicoPessoa.DemandaDocCivil,
  historicoPessoa.DemandaApoioAlim,
  historicoPessoa.[Outra Demanda],
  historicoPessoa.[Especif Outra],
  TbBeneficioEmergencial.DataBenef,
  TbBeneficioEmergencial.DescreverItem,
  TbBeneficioEmergencial.Qtd,
  TbBeneficioEmergencial.ApoioAlim,
  TbBeneficioEmergencial.AuxNatal,
  TbBeneficioEmergencial.Cobertor,
  TbBeneficioEmergencial.Colchonete,
  TbBeneficioEmergencial.Outro,
  TbBeneficioEmergencial.OutroDescrever,
  TbEncaminhamento.ENG,
  TbEncaminhamento.ATENDIDO,
  TbEncaminhamento.DataMonit,
  TbEncaminhamento.RSA,
  TbEncaminhamento.RS,
  TbEncaminhamento.RE,
  TbEncaminhamento.OP
FROM
  (
    historicoPessoa
    LEFT JOIN TbBeneficioEmergencial ON historicoPessoa.CodPessoa = TbBeneficioEmergencial.Nome
  )
  LEFT JOIN TbEncaminhamento ON historicoPessoa.CodPessoa = TbEncaminhamento.Nome
WHERE
  (
    (
      (historicoPessoa.Nome) Like [DIGITE O NOME] + "*"
    )
  );
