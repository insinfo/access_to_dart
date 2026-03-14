SELECT
  PACTOsuas.Identificação,
  PACTOsuas.CRAS,
  PACTOsuas.NOMECADUNICO,
  PACTOsuas.NIS,
  TbPessoa.SEXO,
  PACTOsuas.DNASC,
  PACTOsuas.CPF,
  PACTOsuas.MAE,
  TbAcompDet.[PAF inicio],
  TbAcompDet.DataDesl
FROM
  (
    PACTOsuas
    INNER JOIN TbPessoa ON PACTOsuas.NOMECADUNICO = TbPessoa.Nome
  )
  INNER JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (TbAcompDet.[PAF inicio]) Is Not Null
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
    )
  );
