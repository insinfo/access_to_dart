SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  TbPessoa.Nome,
  CadResidencia.CodFam,
  TbPessoa.CodPessoa,
  TbAtend.Administrativo,
  TbAtend.Social,
  TbAtend.Psicologico,
  TbAtend.MULTIDISCIPLINAR,
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
  (
    TbPessoa
    INNER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam
  )
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbPessoa.Nome) Like [DIGITE O NOME] + "*"
    )
  );
