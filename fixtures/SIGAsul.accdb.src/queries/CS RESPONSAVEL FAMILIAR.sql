SELECT
  CadResidencia.CodFam,
  TbPessoa.CodPessoa,
  TbPessoa.DataCadPes,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.DNasc,
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
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (TbPessoa.Parentesco)= "pessoa de referencia"
    )
  )
ORDER BY
  TbPessoa.Nome;
