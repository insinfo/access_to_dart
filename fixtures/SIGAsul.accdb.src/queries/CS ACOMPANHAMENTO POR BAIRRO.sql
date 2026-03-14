SELECT
  DISTINCT CadResidencia.CodFam,
  TbUnidade.CRAS,
  CadResidencia.Bairro,
  TbUnidade.NOME,
  TbAcomp.Volante
FROM
  TbUnidade
  INNER JOIN (
    (
      CadResidencia
      INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
    )
    INNER JOIN (
      TbAcomp
      INNER JOIN TbAcompDet ON TbAcomp.CodAcomp = TbAcompDet.CodAcomp
    ) ON TbPessoa.CodPessoa = TbAcomp.Nome
  ) ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
WHERE
  (
    (
      (TbAcompDet.[PAF inicio]) Is Not Null
    )
    AND (
      (TbAcompDet.DataDesl) Is Null
    )
  )
ORDER BY
  CadResidencia.Bairro;
