SELECT
  TbAcomp.CodAcomp,
  TbAcomp.DataIncl,
  TbAcomp.Nome,
  TbAcomp.CodFamilia,
  TbAcomp.Volante,
  TbAcoRetorno.DataRetorno,
  TbAcoRetorno.Historico,
  TbAcoRetorno.Compareceu
FROM
  TbAcomp
  INNER JOIN TbAcoRetorno ON TbAcomp.CodAcomp = TbAcoRetorno.CodAcomp;
