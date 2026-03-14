SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  TbAtend.CodFunc,
  TbAtend.NomeFunc,
  TbAtend.FuncaoFuncionario,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbAtend.AcolhidaPartic,
  TbAtend.AtRemoto,
  TbAtend.Acoremoto,
  TbAtend.Volante,
  TbAtend.VD,
  TbAtend.[ESTUDO SOCIAL],
  TbAtend.[Acolhida Coletiva],
  TbAtend.[ART INSTITUC],
  TbAtend.RELATORIO,
  TbAtend.VDLFR,
  TbAtend.VDCDL,
  TbAtend.VDDCP,
  TbAtend.VDDPAF,
  TbAtend.VDAMF,
  TbAtend.VDFVI,
  TbAtend.VDAMD,
  TbAtend.VDASF,
  TbAtend.VDPBF,
  TbAtend.VDSCFV,
  TbAtend.VDOUT,
  TbAtend.[QUAL VD],
  TbAtend.[VD NAO LOCALIZADA],
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
  TbAtend.OBS
FROM
  TbPessoa
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
