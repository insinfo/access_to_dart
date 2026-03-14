SELECT
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbOfSocioEduDetalhe.DataInsc,
  TbPessoa.Nome,
  TbOfSocioEduDetalhe.DNasPessoa,
  TbOfSocioEduDetalhe.Idade,
  TbPessoa.NIS,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl,
  TbOfSocioEduDetalhe.Encaminhado,
  TbOfSocioEduDetalhe.Onde
FROM
  TbPessoa
  INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataDesl) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
