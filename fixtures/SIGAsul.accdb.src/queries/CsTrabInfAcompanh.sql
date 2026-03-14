SELECT
  TbAcomp.Nome,
  TbAcomp.CodFamilia,
  csTrabInfantil.data,
  csTrabInfantil.TrabInf,
  csTrabInfantil.SupTrabInf
FROM
  (
    TbPessoa
    INNER JOIN csTrabInfantil ON TbPessoa.CodPessoa = csTrabInfantil.NomePessoa
  )
  INNER JOIN (
    TbAcompDet
    INNER JOIN TbAcomp ON TbAcompDet.CodAcomp = TbAcomp.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome;
