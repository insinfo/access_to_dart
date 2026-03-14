SELECT
  [CS PESSOA PARA FICHA SCFV].TbPessoa.CodFam,
  [CS PESSOA PARA FICHA SCFV].Nome,
  Int(
    DateDiff(
      "d",
      [CS PESSOA PARA FICHA SCFV].[DNasc],
      Date()
    )/ 365.25
  ) AS Idade,
  csACOatualizado.[PAF inicio]
FROM
  [CS PESSOA PARA FICHA SCFV]
  INNER JOIN csACOatualizado ON [CS PESSOA PARA FICHA SCFV].TbPessoa.CodFam = csACOatualizado.CodFam
WHERE
  (
    (
      (
        Int(
          DateDiff(
            "d",
            [CS PESSOA PARA FICHA SCFV].[DNasc],
            Date()
          )/ 365.25
        )
      ) Between 15
      And 17
    )
  );
