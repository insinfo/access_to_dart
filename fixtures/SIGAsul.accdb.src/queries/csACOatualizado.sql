SELECT
  TbPessoa.CodPessoa,
  TbAcompDet.NomeTec,
  TbPessoa.CodFam,
  TbAcomp.Nome,
  TbAcompDet.[PAF inicio],
  TbPessoa.DNasc,
  TbPessoa.Idade,
  TbPessoa.Parentesco,
  TbPessoa.CPF,
  TbAcompDet.DataDesl,
  TbAcompDet.[Motivo Deslig]
FROM
  TbPessoa
  INNER JOIN (
    TbAcomp
    INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
  ) ON TbPessoa.CodPessoa = TbAcomp.Nome
GROUP BY
  TbPessoa.CodPessoa,
  TbAcompDet.NomeTec,
  TbPessoa.CodFam,
  TbAcomp.Nome,
  TbAcompDet.[PAF inicio],
  TbPessoa.DNasc,
  TbPessoa.Idade,
  TbPessoa.Parentesco,
  TbPessoa.CPF,
  TbAcompDet.DataDesl,
  TbAcompDet.[Motivo Deslig],
  TbPessoa.CodFam
HAVING
  (
    (
      (TbAcompDet.[PAF inicio]) Is Not Null
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
    )
  );
