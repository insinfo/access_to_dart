SELECT
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  CadResidencia.[CRAS Origem],
  CadResidencia.[Nº Cras],
  TbUnidade.NOME,
  Last(
    CadResidAtualizacao.[DATA ATUALIZ]
  ) AS [ÚltimoDeDATA ATUALIZ]
FROM
  TbUnidade
  INNER JOIN (
    CadResidencia
    INNER JOIN CadResidAtualizacao ON CadResidencia.CodFam = CadResidAtualizacao.CodCadResd
  ) ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
GROUP BY
  CadResidencia.CodFam,
  CadResidencia.DataCad,
  CadResidencia.[CRAS Origem],
  CadResidencia.[Nº Cras],
  TbUnidade.NOME
HAVING
  (
    (
      (CadResidencia.CodFam)= [DIGITE O COD FAMILIAR]
    )
  )
ORDER BY
  Last(
    CadResidAtualizacao.[DATA ATUALIZ]
  ) DESC;
