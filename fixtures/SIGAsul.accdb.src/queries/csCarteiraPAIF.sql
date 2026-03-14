SELECT
  CadResidencia.CodFam,
  TbUnidade.[Nº UNIDADE],
  TbUnidade.NOME,
  TbUnidade.ENDEREÇO,
  TbUnidade.MUNICIPIO,
  TbUnidade.UF,
  TbUnidade.TELEFONEUNID,
  TbPessoa.CodPessoa,
  TbPessoa.Nome,
  TbPessoa.NIS,
  TbPessoa.Parentesco,
  TbUnidade.CODBARRAS,
  CadResidencia.CodCREAS,
  CadResidencia.CodCEAM
FROM
  (
    TbUnidade
    INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
  )
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (CadResidencia.CodFam)= [DIGITE O COD FAMILIAR]
    )
    AND (
      (TbPessoa.Parentesco)= "Pessoa de Referencia"
    )
  )
ORDER BY
  CadResidencia.CodFam;
