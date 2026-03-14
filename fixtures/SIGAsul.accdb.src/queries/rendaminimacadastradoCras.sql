SELECT
  rendaminimaFam.Nome,
  TbPessoa.Nome,
  TbPessoa.NIS,
  TbPessoa.CodFam,
  rendaminimaFam.CRAS,
  rendaminimaFam.nis AS nisrenda,
  TbPessoa.DataDesligPes
FROM
  rendaminimaFam
  INNER JOIN TbPessoa ON rendaminimaFam.nome = TbPessoa.Nome;
