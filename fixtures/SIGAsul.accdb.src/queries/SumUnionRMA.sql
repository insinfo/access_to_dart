SELECT
  csUnidade.CodUnidade,
  csUnidade.CRAS,
  csUnidade.RMA1,
  csUnidade.[Nº UNIDADE],
  csUnidade.NOME,
  csUnidade.[DIRETOR(A)],
  csUnidade.CARGO,
  csUnidade.FUNÇÃO,
  csUnidade.MATRICULA,
  csUnidade.ENDEREÇO,
  csUnidade.MUNICIPIO,
  csUnidade.UF,
  Sum(UnionRMA.A2) AS SomaDeA2,
  Sum(UnionRMA.B1) AS SomaDeB1,
  Sum(UnionRMA.B2) AS SomaDeB2,
  Sum(UnionRMA.B3) AS SomaDeB3,
  Sum(UnionRMA.B4) AS SomaDeB4,
  Sum(UnionRMA.B5) AS SomaDeB5,
  Sum(UnionRMA.B6) AS SomaDeB6,
  Sum(UnionRMA.C1) AS SomaDeC1,
  Sum(UnionRMA.C2) AS SomaDeC2,
  Sum(UnionRMA.C3) AS SomaDeC3,
  Sum(UnionRMA.C4) AS SomaDeC4,
  Sum(UnionRMA.C5) AS SomaDeC5,
  Sum(UnionRMA.C6) AS SomaDeC6,
  Sum(UnionRMA.C7) AS SomaDeC7,
  Sum(UnionRMA.C9) AS SomaDeC9,
  Sum(UnionRMA.D1) AS SomaDeD1,
  Sum(UnionRMA.D2) AS SomaDeD2,
  Sum(UnionRMA.D3) AS SomaDeD3,
  Sum(UnionRMA.D4) AS SomaDeD4,
  Sum(UnionRMA.D5) AS SomaDeD5,
  Sum(UnionRMA.D6) AS SomaDeD6,
  Sum(UnionRMA.D7) AS SomaDeD7,
  Sum(UnionRMA.D8) AS SomaDeD8,
  Sum(UnionRMA.A1) AS SomaDeA1,
  Sum(UnionRMA.C1A) AS SomaDeC1A
FROM
  UnionRMA,
  csUnidade
GROUP BY
  csUnidade.CodUnidade,
  csUnidade.CRAS,
  csUnidade.[Nº UNIDADE],
  csUnidade.NOME,
  csUnidade.[DIRETOR(A)],
  csUnidade.CARGO,
  csUnidade.FUNÇÃO,
  csUnidade.MATRICULA,
  csUnidade.ENDEREÇO,
  csUnidade.MUNICIPIO,
  csUnidade.UF
HAVING
  (
    (
      (csUnidade.CRAS)= Yes
    )
  );
