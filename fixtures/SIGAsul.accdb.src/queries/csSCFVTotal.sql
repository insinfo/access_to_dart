SELECT
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbOfSocioEduDetalhe.Nome,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.SituaçãoUsuario
FROM
  TbOfSocioEduDetalhe
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Is Null
    )
    AND (
      (
        TbOfSocioEduDetalhe.SituaçãoUsuario
      )<> "Não está em situação de prioridade"
    )
  );
