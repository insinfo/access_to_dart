SELECT
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  Sum(UnionReuniao.PARTICINT) AS SomaDePARTICINT,
  Sum(UnionReuniao.PARTICEXT) AS SomaDePARTICEXT,
  Sum(UnionReuniao.REINT) AS SomaDeREINT,
  Sum(UnionReuniao.REEXT) AS SomaDeREEXT,
  Sum(UnionReuniao.INTERINT) AS SomaDeINTERINT,
  Sum(UnionReuniao.INTEREXT) AS SomaDeINTEREXT,
  Sum(UnionReuniao.PARTICINTINTER) AS SomaDePARTICINTINTER,
  Sum(UnionReuniao.PARTICEXTINTER) AS SomaDePARTICEXTINTER
FROM
  UnionReuniao,
  TbUnidade
GROUP BY
  TbUnidade.NOME,
  TbUnidade.CRAS,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA
HAVING
  (
    (
      (TbUnidade.CRAS)= Yes
    )
  );
