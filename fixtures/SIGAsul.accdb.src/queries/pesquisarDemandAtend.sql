SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  TbPessoa.Nome,
  TbAtend.DemandaApoioAlim,
  TbAtend.DemandaBPC,
  TbAtend.DemandaINSS,
  TbAtend.DemandaSCFV,
  TbAtend.DemandaEduc,
  TbAtend.DemandaSaude,
  TbAtend.DemandaJustiça,
  TbAtend.DemandaBenefMun,
  TbAtend.DemandaAuxNatal,
  TbAtend.DemandaGratTransp,
  TbAtend.DemandaRecJus,
  TbAtend.DemandaDocCivil,
  TbAtend.[Outra Demanda],
  TbAtend.[Especif Outra]
FROM
  TbPessoa
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbPessoa.Nome) Like "*" + [DIGITE O NOME] + "*"
    )
  );
