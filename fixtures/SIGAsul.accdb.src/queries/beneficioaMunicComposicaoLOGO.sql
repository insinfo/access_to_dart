SELECT
  beneficioaMunicComposicao.CodBenef,
  TbUnidade.LOGO,
  beneficioaMunicComposicao.TipoBeneficio,
  beneficioaMunicComposicao.CodFam,
  beneficioaMunicComposicao.BENEFICIARIO,
  beneficioaMunicComposicao.CodPessoa,
  beneficioaMunicComposicao.Nome,
  beneficioaMunicComposicao.Sexo,
  beneficioaMunicComposicao.DNasc,
  beneficioaMunicComposicao.DoencaCronica,
  beneficioaMunicComposicao.[Qual DCronica],
  beneficioaMunicComposicao.Escolaridade,
  beneficioaMunicComposicao.[Condição Ocupação],
  beneficioaMunicComposicao.[Renda sem programas sociais]
FROM
  beneficioaMunicComposicao,
  TbUnidade;
