SELECT
  DISTINCT csCadTotalFamilias.CodFam
FROM
  csCadTotalFamilias
  INNER JOIN PACTOrendaPCapitaNome ON csCadTotalFamilias.Nome = PACTOrendaPCapitaNome.NOME;
