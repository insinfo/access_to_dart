SELECT
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  TbPessoa.CodPessoa,
  TbPessoa.DataCadPes,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.DNasc,
  TbPessoa.NomeMae,
  TbPessoa.NomePai,
  TbPessoa.Celular,
  TbPessoa.NIS,
  TbPessoa.CPF,
  TbPessoa.RG,
  TbPessoa.OrgaoRG,
  TbPessoa.DEmisRG,
  TbPessoa.[CERT LIVRO/FOLHA/TERMO],
  TbPessoa.[TITULO/ZONA/SEÇAO],
  TbPessoa.Sexo,
  TbPessoa.[Raça/Cor],
  TbPessoa.MunicNasc,
  TbPessoa.UFNasc,
  TbPessoa.[Estado Civil]
FROM
  TbPessoa
  INNER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam;
