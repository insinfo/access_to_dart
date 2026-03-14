SELECT
  TbUnidade.NOME,
  TbGestante.Volante,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbGestDet.DataCad,
  TbGestDet.DPP,
  TbGestDet.DPSaida,
  TbGestDet.DataDesl,
  TbPessoa.Nome,
  TbGestante.Celular
FROM
  TbUnidade,
  TbPessoa
  INNER JOIN (
    TbGestante
    INNER JOIN TbGestDet ON TbGestante.CodGestante = TbGestDet.CodGestante
  ) ON TbPessoa.CodPessoa = TbGestante.Nome
WHERE
  (
    (
      (TbUnidade.NOME) Like "*" + [DIGITE A UNIDADE] + "*"
    )
    AND (
      (TbGestante.Volante)= No
    )
    AND (
      (TbGestDet.DataDesl) Is Null
    )
  );
