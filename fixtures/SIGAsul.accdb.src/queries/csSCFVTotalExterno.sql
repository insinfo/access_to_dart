SELECT
  TbSCFVExtDetalhe.CodSCFVEDet,
  TbSCFVExtDetalhe.Nome,
  TbSCFVExtDetalhe.SituaçãoUsuario,
  TbSCFVExtDetalhe.DataDesl
FROM
  TbSCFVExtDetalhe
WHERE
  (
    (
      (
        TbSCFVExtDetalhe.SituaçãoUsuario
      )<> "Não está em situação de prioridade"
    )
    AND (
      (TbSCFVExtDetalhe.DataDesl) Is Null
    )
  );
