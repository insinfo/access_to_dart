SELECT
  TbBeneficioEmergencial.CodBenef,
  TbBeneficioEmergencial.DataBenef,
  CadResidencia.CodFam,
  TbBeneficioEmergencial.Volante,
  TbPessoa.Nome,
  TbPessoa.CPF,
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
  TbBeneficioEmergencial.RGRepresent,
  CadResidencia.[CRAS Origem],
  CadResidencia.[Nº Cras],
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE
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
  )
WHERE
  (
    (
      (
        TbBeneficioEmergencial.DataBenef
      ) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  )
ORDER BY
  TbBeneficioEmergencial.DataBenef,
  TbPessoa.Nome;
