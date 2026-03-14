SELECT
  TbBeneficioEmergencial.CodBenef,
  TbBeneficioEmergencial.DataBenef,
  TbBeneficioEmergencial.CodTecnico,
  TbBeneficioEmergencial.NomeTecnico,
  TbBeneficioEmergencial.MatriculaTec,
  TbPessoa.Nome,
  TbPessoa.CodFam,
  CadResidencia.Endereço,
  CadResidencia.Bairro,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbPessoa.Celular,
  CadResidencia.[Nº Cras],
  CadResidencia.[CRAS Origem],
  TbBeneficioEmergencial.NomeCras,
  TbBeneficioEmergencial.DescreverItem,
  TbBeneficioEmergencial.Qtd,
  TbBeneficioEmergencial.ApoioAlim,
  TbBeneficioEmergencial.AuxNatal,
  TbBeneficioEmergencial.Cobertor,
  TbBeneficioEmergencial.Colchonete,
  TbBeneficioEmergencial.Outro,
  TbBeneficioEmergencial.OutroDescrever,
  TbBeneficioEmergencial.Proprio,
  TbBeneficioEmergencial.Doação,
  TbBeneficioEmergencial.NomeRepresent,
  TbBeneficioEmergencial.TelRepresent,
  TbBeneficioEmergencial.CPFRepresent,
  TbBeneficioEmergencial.RGRepresent
FROM
  CadResidencia
  INNER JOIN (
    TbPessoa
    INNER JOIN TbBeneficioEmergencial ON (
      TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome
    )
    AND (
      TbPessoa.CodPessoa = TbBeneficioEmergencial.Nome
    )
  ) ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (
        TbBeneficioEmergencial.DataBenef
      ) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (
        TbBeneficioEmergencial.ApoioAlim
      )= Yes
    )
  );
