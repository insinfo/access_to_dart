SELECT
  DISTINCT TbBeneficioEmergencial.CodFam
FROM
  TbBeneficioEmergencial
GROUP BY
  TbBeneficioEmergencial.CodFam,
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
