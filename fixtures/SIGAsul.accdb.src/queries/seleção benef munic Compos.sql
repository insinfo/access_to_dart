SELECT
  CadResidencia.CodFam,
  TbPessoa.DataDesligPes,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.DNasc,
  TbPessoa.NomeMae,
  TbPessoa.NomePai,
  TbPessoa.Celular,
  TbPessoa.NIS,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.[CERT LIVRO/FOLHA/TERMO],
  TbPessoa.[TITULO/ZONA/SEÇAO],
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.[Estado Civil],
  TbPessoa.DoencaCronica,
  TbPessoa.Escolaridade,
  TbPessoa.[Condição Ocupação]
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam
WHERE
  (
    (
      (CadResidencia.CodFam)= [DIGITE O COD FAMILIAR]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
