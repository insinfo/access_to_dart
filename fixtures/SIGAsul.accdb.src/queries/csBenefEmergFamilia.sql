SELECT
  DISTINCT TbBeneficioEmergencial.CodFam,
  TbBeneficioEmergencial.ApoioAlim,
  TbBeneficioEmergencial.AuxNatal,
  TbBeneficioEmergencial.Cobertor,
  TbBeneficioEmergencial.Colchonete,
  TbBeneficioEmergencial.Outro,
  TbBeneficioEmergencial.Proprio,
  TbBeneficioEmergencial.Doação
FROM
  TbBeneficioEmergencial
GROUP BY
  TbBeneficioEmergencial.CodFam,
  TbBeneficioEmergencial.ApoioAlim,
  TbBeneficioEmergencial.AuxNatal,
  TbBeneficioEmergencial.Cobertor,
  TbBeneficioEmergencial.Colchonete,
  TbBeneficioEmergencial.Outro,
  TbBeneficioEmergencial.Proprio,
  TbBeneficioEmergencial.Doação,
  TbBeneficioEmergencial.DataBenef
HAVING
  (
    (
      (
        TbBeneficioEmergencial.DataBenef
      ) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  )
ORDER BY
  TbBeneficioEmergencial.CodFam;
