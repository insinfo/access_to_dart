SELECT
  CadResidencia.CodFam,
  TbUnidade.[Nº UNIDADE],
  TbUnidade.NOME,
  TbPessoa.Nome,
  TbPessoa.NIS,
  TbPessoa.Parentesco,
  TbUnidade.CODBARRAS,
  CadResidencia.CodCREAS,
  CadResidencia.CodCEAM,
  TbUnidade.imgCartaoSuas
FROM
  TbPessoa
  INNER JOIN (
    TbUnidade
    INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
  ) ON TbPessoa.CodFam = CadResidencia.CodFam
WHERE
  (
    (
      (CadResidencia.CodFam)= [Formulários]![FrmCadGeral]![CodFam]
    )
    AND (
      (TbPessoa.Parentesco)= "Pessoa de Referencia"
    )
  )
ORDER BY
  CadResidencia.CodFam;
