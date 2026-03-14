SELECT
  BPC.CODBPC,
  BPC.NomeTitular AS BPCNome,
  TbOfSocioEduDetalhe.Nome AS OficinaNome,
  TbOfSocioEduDetalhe.BeneficioMunic,
  TbOfSocioEduDetalhe.BPC
FROM
  (
    BPC
    INNER JOIN TbPessoa ON BPC.NomeTitular = TbPessoa.Nome
  )
  INNER JOIN TbOfSocioEduDetalhe ON TbPessoa.CodPessoa = TbOfSocioEduDetalhe.Nome;
