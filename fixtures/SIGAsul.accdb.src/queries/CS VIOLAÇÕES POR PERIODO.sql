SELECT
  TbViolacoes.CodViol,
  TbPessoa.Nome,
  TbViolacoes.TecnicoResp,
  TbViolacoes.CodFam,
  TbViolacoesSubF.CodVSF,
  TbViolacoesSubF.CodViol,
  TbViolacoesSubF.DataRetorno,
  TbViolacoesSubF.TrabInf,
  TbViolacoesSubF.SupTrabInf,
  TbViolacoesSubF.ExplSex,
  TbViolacoesSubF.SupExplSex,
  TbViolacoesSubF.AbuViolSex,
  TbViolacoesSubF.SupAbuViolSex,
  TbViolacoesSubF.ViolFis,
  TbViolacoesSubF.SupViolFis,
  TbViolacoesSubF.VioPsic,
  TbViolacoesSubF.SupVioPsic,
  TbViolacoesSubF.NeglIdoso,
  TbViolacoesSubF.SupNeglIdoso,
  TbViolacoesSubF.NegliCri,
  TbViolacoesSubF.SupNegliCri,
  TbViolacoesSubF.NegliPCD,
  TbViolacoesSubF.SupNegliPCD,
  TbViolacoesSubF.TrajRua,
  TbViolacoesSubF.SupTrajRua,
  TbViolacoesSubF.TrafPess,
  TbViolacoesSubF.SupTrafPess,
  TbViolacoesSubF.ViolPatrIdoso,
  TbViolacoesSubF.SupViolPatrIdoso,
  TbViolacoesSubF.ViolPatriPCD,
  TbViolacoesSubF.SupViolPatriPCD,
  TbViolacoesSubF.Outra,
  TbViolacoesSubF.SupOutra
FROM
  TbPessoa
  INNER JOIN (
    TbViolacoes
    INNER JOIN TbViolacoesSubF ON TbViolacoes.CodViol = TbViolacoesSubF.CodViol
  ) ON TbPessoa.CodPessoa = TbViolacoes.NomePessoa
WHERE
  (
    (
      (TbViolacoesSubF.DataRetorno) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
