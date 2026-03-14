SELECT
  csBenefEmergFamilia.CodFam AS [CodFam Campo],
  Count(csBenefEmergFamilia.CodFam) AS ContarDeCodFam
FROM
  csBenefEmergFamilia
GROUP BY
  csBenefEmergFamilia.CodFam
ORDER BY
  Count(csBenefEmergFamilia.CodFam) DESC;
