SELECT
  TbPessoa.CodFam,
  TbPessoa.DataDesligPes,
  CadResidencia.Volante,
  TbPessoa.CodPessoa,
  TbPessoa.DataCadPes,
  TbPessoa.Nome,
  TbPessoa.Parentesco,
  TbPessoa.DNasc,
  TbPessoa.Celular,
  TbPessoa.NIS,
  TbPessoa.CPF,
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
      (TbPessoa.DataDesligPes) Is Null
    )
    AND (
      (TbPessoa.Parentesco)= "pessoa de referencia"
    )
  )
ORDER BY
  TbPessoa.Nome;
