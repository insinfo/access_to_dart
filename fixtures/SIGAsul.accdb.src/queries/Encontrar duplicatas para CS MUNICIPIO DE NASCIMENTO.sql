SELECT
  First(
    [CS MUNICIPIO DE NASCIMENTO].MunicNasc
  ) AS [MunicNasc Campo],
  Count(
    [CS MUNICIPIO DE NASCIMENTO].MunicNasc
  ) AS NúmeroDeDupls,
  [CS MUNICIPIO DE NASCIMENTO].UFNasc
FROM
  [CS MUNICIPIO DE NASCIMENTO]
GROUP BY
  [CS MUNICIPIO DE NASCIMENTO].MunicNasc,
  [CS MUNICIPIO DE NASCIMENTO].UFNasc
HAVING
  (
    (
      (
        Count(
          [CS MUNICIPIO DE NASCIMENTO].MunicNasc
        )
      )> 1
    )
  );
