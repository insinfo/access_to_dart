SELECT
  TbViolacoes.CodViol,
  TbViolacoes.TecnicoResp,
  TbViolacoes.NomePessoa,
  TbViolacoes.CodFam,
  TbViolacoes.data,
  TbViolacoes.TrabInf,
  TbViolacoes.SupTrabInf
FROM
  TbViolacoes
WHERE
  (
    (
      (TbViolacoes.TrabInf)= Yes
    )
    AND (
      (TbViolacoes.SupTrabInf) Is Null
    )
  );
