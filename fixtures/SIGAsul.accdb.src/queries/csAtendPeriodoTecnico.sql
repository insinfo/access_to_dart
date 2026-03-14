SELECT
  TbUnidade.CRAS,
  TbUnidade.NOME AS UNIDADE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.MATRICULA,
  TbAtend.CodAtend,
  TbAtend.Data,
  CadResidencia.DataCad,
  TbPessoa.Nome,
  TbCadFuncionario.Nome,
  TbCadFuncionario.[Carga Horária],
  TbCadFuncionario.[FUNÇÃO NO SISTEMA],
  TbAtend.FuncaoFuncionario,
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
  TbUnidade,
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN (
    TbCadFuncionario
    INNER JOIN TbAtend ON TbCadFuncionario.CodFunc = TbAtend.CodFunc
  ) ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbCadFuncionario.Nome) Like [DIGITE O TÉCNICO] + "*"
    )
  );
