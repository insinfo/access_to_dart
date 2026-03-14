SELECT
  TbPessoa.Nome,
  [cs distinct pbf].TITULAR,
  TbPessoa.CodFam,
  CadResidencia.[PBF FAMILIA],
  CadResidencia.Volante
FROM
  CadResidencia
  INNER JOIN (
    [cs distinct pbf]
    INNER JOIN TbPessoa ON [cs distinct pbf].TITULAR = TbPessoa.Nome
  ) ON CadResidencia.CodFam = TbPessoa.CodFam;
