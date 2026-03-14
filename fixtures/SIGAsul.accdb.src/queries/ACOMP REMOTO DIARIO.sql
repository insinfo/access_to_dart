SELECT
  TbAtend.CodAtend,
  TbAtend.Volante,
  TbAtend.NomeFunc,
  TbAtend.FuncaoFuncionario,
  TbPessoa.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.DNasc,
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
  TbAtend.[Especif Outra],
  TbAtend.OBS,
  TbAtend.Acoremoto,
  TbAtend.Data,
  TbPessoa.PROVICN,
  TbPessoa.PROVIRG,
  TbPessoa.PROVICTPS,
  TbPessoa.PROVICPF,
  TbPessoa.PROVITE,
  TbPessoa.Autismo,
  TbPessoa.Cegueira,
  TbPessoa.[Baixa visão],
  TbPessoa.[Surdez severa profunda],
  TbPessoa.[Surdez leve moderada],
  TbPessoa.[Deficiencia fisica],
  TbPessoa.[Defic mental intelec],
  TbPessoa.[Sindrome down],
  TbPessoa.[Transt doença mental],
  TbPessoa.DoencaCronica,
  TbPessoa.BPCD,
  TbPessoa.BPCI
FROM
  TbPessoa
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Acoremoto)= Yes
    )
    AND (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
