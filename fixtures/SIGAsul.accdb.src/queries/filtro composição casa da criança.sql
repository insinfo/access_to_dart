SELECT
  TOP 50 [contar Composição Familiar].CodFam,
  [contar Composição Familiar].ContarDeNome,
  [filtro composição].Nome,
  [filtro composição].Parentesco,
  [filtro composição].Idade
FROM
  [filtro composição]
  INNER JOIN [contar Composição Familiar] ON [filtro composição].CodFam = [contar Composição Familiar].CodFam
WHERE
  (
    (
      ([filtro composição].DNasc) Is Not Null
    )
    AND (
      ([filtro composição].Idade) Between 4
      And 6
    )
  )
ORDER BY
  [filtro composição].Idade;
