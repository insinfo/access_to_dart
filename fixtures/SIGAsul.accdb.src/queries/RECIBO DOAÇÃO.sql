SELECT
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  CadResidencia.[Nº Cras],
  TbBeneficioEmergencial.CodBenef,
  TbBeneficioEmergencial.DataBenef,
  TbBeneficioEmergencial.Doação,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.CPF,
  TbPessoa.RG,
  CadResidencia.CodFam,
  TbBeneficioEmergencial.DescreverItem,
  TbBeneficioEmergencial.Qtd,
  TbBeneficioEmergencial.ApoioAlim,
  TbBeneficioEmergencial.AuxNatal,
  TbBeneficioEmergencial.Cobertor,
  TbBeneficioEmergencial.Colchonete,
  TbBeneficioEmergencial.Outro,
  TbBeneficioEmergencial.OutroDescrever,
  TbBeneficioEmergencial.NomeRepresent,
  TbBeneficioEmergencial.TelRepresent,
  TbBeneficioEmergencial.CPFRepresent,
  TbBeneficioEmergencial.RGRepresent
FROM
  (
    (
      TbUnidade
      INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
    )
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbBeneficioEmergencial ON (
    TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome
  )
  AND (
    TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome
  );
