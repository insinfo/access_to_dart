SELECT
  TbOfSocioEduDetalhe.DataInsc,
  TbOfSocioEduDetalhe.Nome,
  TbOfSocioEduDetalhe.DNasPessoa,
  TbOfSocioEduDetalhe.SituaçãoUsuario,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl,
  TbOfSocioEduDetalhe.Encaminhado,
  TbOfSocioEduDetalhe.Onde
FROM
  TbOfSocioEduDetalhe
  LEFT JOIN [SISC GRUPOS GERAL] ON TbOfSocioEduDetalhe.CodOfSEduc = [SISC GRUPOS GERAL].CodDiario
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
