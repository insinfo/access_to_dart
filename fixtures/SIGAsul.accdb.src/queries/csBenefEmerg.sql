SELECT
  TbBeneficioEmergencial.CodBenef,
  TbBeneficioEmergencial.DataBenef,
  TbBeneficioEmergencial.CodTecnico,
  TbBeneficioEmergencial.NomeTecnico,
  TbBeneficioEmergencial.MatriculaTec,
  TbBeneficioEmergencial.Nome,
  TbBeneficioEmergencial.CodFam,
  TbBeneficioEmergencial.Endereço,
  TbBeneficioEmergencial.Bairro,
  TbBeneficioEmergencial.CPFPessoa,
  TbBeneficioEmergencial.RGPessoa,
  TbBeneficioEmergencial.TelPessoa,
  TbBeneficioEmergencial.CodCras,
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
  TbBeneficioEmergencial
WHERE
  (
    (
      (
        (
          (
            (
              [TbBeneficioEmergencial].[Doação]
            )= Yes
          )
        )
        Or (
          (
            [TbBeneficioEmergencial].[Proprio]
          )= Yes
        )
      )<> False
    )
    AND (
      (
        (
          (
            [TbBeneficioEmergencial].[ApoioAlim]
          )= Yes
        )
        Or (
          (
            (
              [TbBeneficioEmergencial].[AuxNatal]
            )= Yes
          )
          Or (
            (
              (
                [TbBeneficioEmergencial].[Cobertor]
              )= Yes
            )
          )
          Or (
            (
              (
                [TbBeneficioEmergencial].[Colchonete]
              )= Yes
            )
          )
          Or (
            (
              (
                [TbBeneficioEmergencial].[Outro]
              )= Yes
            )
          )
        )
      )<> False
    )
  );
