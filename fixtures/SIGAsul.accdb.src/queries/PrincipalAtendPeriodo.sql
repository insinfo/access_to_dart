SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  MonthName(
    Month([Data])
  ) AS [Mês de Referencia],
  TbAtend.Nome,
  TbAtend.AcolhidaPartic,
  TbAtend.[Acolhida Coletiva],
  TbAtend.AtRemoto,
  TbAtend.Acoremoto,
  TbAtend.[ART INSTITUC],
  TbAtend.RELATORIO,
  TbAtend.Administrativo,
  TbAtend.Social,
  TbAtend.Psicologico,
  TbAtend.Multidisciplinar,
  TbAtend.OrientadorSoc,
  TbAtend.AtGestao,
  TbAtend.DemandaBPC,
  TbAtend.DemandaINSS,
  TbAtend.DemandaSCFV,
  TbAtend.DemandaEduc,
  TbAtend.DemandaSaude,
  TbAtend.DemandaJustiça,
  TbAtend.DemandaBenefMun,
  TbAtend.DemandaAuxNatal,
  TbAtend.DemandaGratTransp,
  TbAtend.DemandaDocCivil,
  TbAtend.DemandaApoioAlim,
  TbAtend.[Outra Demanda],
  TbAtend.[Especif Outra]
FROM
  TbAtend
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  )
ORDER BY
  TbAtend.Nome;
