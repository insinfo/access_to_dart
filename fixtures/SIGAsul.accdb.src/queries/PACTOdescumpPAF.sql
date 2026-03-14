SELECT
  TbAcompdet.NomeTec,
  TbAcomp.Nome,
  TbAcompdet.[PAF inicio],
  TbAcompdet.[PAF fim],
  TbAcompdet.DataDesl,
  csDescumprimNumFamil.nomeresp,
  csDescumprimNumFamil.bairro
FROM
  csDescumprimNumFamil
  INNER JOIN (
    TbPessoa
    INNER JOIN (
      TbAcomp
      INNER JOIN TbAcompdet ON TbAcomp.codAcomp = TbAcompdet.CodAcomp
    ) ON TbPessoa.CodPessoa = TbAcomp.Nome
  ) ON csDescumprimNumFamil.nomeresp = TbPessoa.Nome
WHERE
  (
    (
      (TbAcompdet.[PAF inicio]) Is Not Null
    )
    AND (
      (TbAcompdet.DataDesl) Is Null
    )
  );
