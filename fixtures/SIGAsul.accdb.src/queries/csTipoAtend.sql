SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  TbPessoa.Nome,
  CadResidencia.CodFam,
  TbAtend.VD,
  TbAtend.AcolhidaPartic,
  TbAtend.AtRemoto,
  TbAtend.Acoremoto,
  TbAtend.[ESTUDO SOCIAL],
  TbAtend.RELATORIO,
  TbAtend.[Acolhida Coletiva],
  TbAtend.[ART INSTITUC],
  TbAtend.DemandaBPC,
  TbAtend.DemandaINSS,
  TbAtend.DemandaSCFV,
  TbAtend.DemandaEduc,
  TbAtend.DemandaDocCivil,
  TbAtend.DemandaApoioAlim,
  TbAtend.DemandaSaude,
  TbAtend.DemandaJustiça,
  TbAtend.DemandaBenefMun,
  TbAtend.DemandaAuxNatal,
  TbAtend.DemandaGratTransp,
  TbAtend.[Outra Demanda],
  TbAtend.[Especif Outra]
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
  );
