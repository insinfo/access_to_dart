SELECT
  CadResidencia.CodFam,
  TbAtend.CodAtend,
  TbAtend.Data,
  CadResidencia.DataCad,
  TbPessoa.CodPessoa,
  TbPessoa.Parentesco,
  MonthName(
    Month([Data])
  ) AS [Mês de Referencia],
  TbAtend.Nome,
  CadResidencia.[Demanda espontanea],
  TbAtend.AtRemoto,
  TbAtend.Acoremoto,
  CadResidencia.[Enc Unidades Proteção Basica],
  CadResidencia.[Enc Unidades Proteção Especial],
  CadResidencia.[Enc Conselho Tutelar]
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (CadResidencia.DataCad)= [Data]
    )
  )
ORDER BY
  TbAtend.Nome;
