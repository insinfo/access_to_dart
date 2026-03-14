SELECT
  DISTINCT BPC.NomeTitular,
  BPC.[Especie Ben],
  BPC.Situacao,
  CadResidencia.Volante
FROM
  (
    TbPessoa
    INNER JOIN BPC ON TbPessoa.Nome = BPC.NomeTitular
  )
  INNER JOIN CadResidencia ON TbPessoa.CodFam = CadResidencia.CodFam;
