SELECT
  csACOatualizado.CodPessoa,
  CadResidencia.CodFam,
  csACOatualizado.Nome,
  Max(
    CadResidAtualizacao.[DATA ATUALIZ]
  ) AS [MáxDeDATA ATUALIZ],
  csACOatualizado.[PAF inicio],
  CadResidencia.DataCad,
  csACOatualizado.CodFam,
  csACOatualizado.DNasc,
  Int(
    DateDiff(
      "d",
      [TbPessoa].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  csACOatualizado.Parentesco,
  csACOatualizado.CPF
FROM
  (
    CadResidencia
    INNER JOIN CadResidAtualizacao ON CadResidencia.CodFam = CadResidAtualizacao.CodCadResd
  )
  INNER JOIN csACOatualizado ON CadResidencia.CodFam = csACOatualizado.CodFam
GROUP BY
  csACOatualizado.CodPessoa,
  CadResidencia.CodFam,
  csACOatualizado.Nome,
  csACOatualizado.[PAF inicio],
  CadResidencia.DataCad,
  csACOatualizado.CodFam,
  csACOatualizado.DNasc,
  csACOatualizado.Parentesco,
  csACOatualizado.CPF
ORDER BY
  csACOatualizado.Nome;
