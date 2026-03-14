SELECT
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbAtend.NomeFunc,
  TbAtend.CodAtend,
  TbAtend.Data,
  TbPessoa.CodPessoa,
  TbPessoa.CodFam,
  TbPessoa.Nome,
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
  TbAtend.DemandaRecJus,
  TbAtend.DemandaDocCivil,
  TbAtend.DemandaApoioAlim,
  TbAtend.[Outra Demanda],
  TbAtend.[Especif Outra],
  TbAtend.AcolhidaPartic,
  TbAtend.AtRemoto,
  TbAtend.Acoremoto,
  TbAtend.Volante,
  TbAtend.VD,
  TbAtend.[ESTUDO SOCIAL],
  TbAtend.[Acolhida Coletiva],
  TbAtend.[ART INSTITUC],
  TbAtend.RELATORIO
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbPessoa.Nome) Like [DIGITE O NOME] + "*"
    )
  );
