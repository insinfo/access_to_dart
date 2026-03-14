SELECT
  TbOfSocioEduDetalhe.CodOfSEDet,
  TbOfSocioEduDetalhe.DataInsc,
  TbPessoa.Nome,
  TbOfSocioEduDetalhe.DNasPessoa,
  TbOfSocioEduDetalhe.Idade,
  TbOfSocioEduDetalhe.SituaçãoUsuario,
  TbOfSocioEduDetalhe.DataDesl,
  TbOfSocioEduDetalhe.MotivoDesl,
  TbOfSocioEduDetalhe.Encaminhado,
  TbOfSocioEduDetalhe.Onde,
  TbOfSocioEduDetalhe.[Nome Respons Criança],
  TbOfSocioEduDetalhe.[CPF Resp],
  TbOfSocioEduDetalhe.[Cel Resp],
  TbOfSocioEduDetalhe.[Parentesco Resp],
  TbPessoa.DataDesligPes
FROM
  TbPessoa
  INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome
WHERE
  (
    (
      (TbOfSocioEduDetalhe.DataInsc) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
