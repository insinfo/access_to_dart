SELECT
  CadResidencia.CodFam,
  TbUnidade.imgCartaoSuas,
  TbUnidade.[Nº UNIDADE],
  TbUnidade.NOME,
  TbPessoa.Nome,
  TbPessoa.NIS,
  TbPessoa.Parentesco,
  TbUnidade.CODBARRAS,
  CadResidencia.CodCREAS,
  CadResidencia.CodCEAM
FROM
  TbPessoa
  INNER JOIN (
    TbUnidade
    INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
  ) ON TbPessoa.CodFam = CadResidencia.CodFam
WHERE
  (
    (
      (CadResidencia.CodFam) Between [DIGITE O 1º CÓD FAMILIAR]
      And [DIGITE O ÚLTIMO CÓD FAMILIAR]
    )
    AND (
      (TbPessoa.Parentesco)= "Pessoa de Referencia"
    )
  )
ORDER BY
  CadResidencia.CodFam;
