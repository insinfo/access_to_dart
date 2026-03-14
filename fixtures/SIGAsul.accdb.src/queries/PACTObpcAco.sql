SELECT
  BPC.NomeTitular,
  TbAcomp.Nome,
  TbAcompDet.[PAF inicio],
  TbAcompDet.DataDesl,
  BPC.CRAS
FROM
  (
    BPC
    INNER JOIN TbPessoa ON BPC.[NomeTitular] = TbPessoa.Nome
  )
  INNER JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
WHERE
  (
    (
      (BPC.CRAS) Like [DIGITE O CRAS] + "*"
    )
  );
