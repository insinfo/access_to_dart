SELECT
  TbBeneficiosMunicipais.CodBenef,
  Max(
    beneficiosMuncAtualizacao.[DATA ATUALIZ]
  ) AS [MáxDeDATA ATUALIZ],
  Max(
    TbBenfMunDet.[Data do Atendimento]
  ) AS [MáxDeData do Atendimento],
  TbBenfMunDet.[Tipo de Atendimento],
  TbBenfMunDet.[Situação Beneficio],
  TbUnidade.LOGO,
  TbBeneficiosMunicipais.dataInsc,
  TbBeneficiosMunicipais.Nome,
  beneficiosMuncAtualizacao.NIS,
  TbBeneficiosMunicipais.CPFPessoa,
  TbBeneficiosMunicipais.Celularpessoa,
  TbBeneficiosMunicipais.Responsavel,
  TbBeneficiosMunicipais.[CPF Responsavel],
  TbBeneficiosMunicipais.TipoBeneficio,
  beneficiosMuncAtualizacao.CodFam,
  beneficiosMuncAtualizacao.[CRAS Origem],
  beneficiosMuncAtualizacao.CodPessoa,
  beneficiosMuncAtualizacao.Nome AS NOMEPESSOA,
  beneficiosMuncAtualizacao.DNasc,
  beneficiosMuncAtualizacao.CPF,
  beneficiosMuncAtualizacao.NomeMae,
  beneficiosMuncAtualizacao.NomePai,
  beneficiosMuncAtualizacao.RG,
  beneficiosMuncAtualizacao.OrgaoRG,
  beneficiosMuncAtualizacao.DEmisRG,
  beneficiosMuncAtualizacao.Endereço,
  beneficiosMuncAtualizacao.Bairro,
  beneficiosMuncAtualizacao.Celular,
  beneficiosMuncAtualizacao.Referencia,
  beneficiosMuncAtualizacao.Sexo,
  beneficiosMuncAtualizacao.Autismo,
  beneficiosMuncAtualizacao.Cegueira,
  beneficiosMuncAtualizacao.[Baixa visão],
  beneficiosMuncAtualizacao.[Surdez severa profunda],
  beneficiosMuncAtualizacao.[Surdez leve moderada],
  beneficiosMuncAtualizacao.[Deficiencia fisica],
  beneficiosMuncAtualizacao.[Defic mental intelec],
  beneficiosMuncAtualizacao.[Sindrome down],
  beneficiosMuncAtualizacao.[Transt doença mental],
  beneficiosMuncAtualizacao.DoencaCronica,
  beneficiosMuncAtualizacao.[Qual DCronica],
  beneficiosMuncAtualizacao.[Expr1030],
  beneficiosMuncAtualizacao.Escolaridade,
  beneficiosMuncAtualizacao.[Condição Ocupação],
  beneficiosMuncAtualizacao.[Renda sem programas sociais]
FROM
  TbUnidade,
  (
    beneficiosMuncAtualizacao
    INNER JOIN TbBeneficiosMunicipais ON beneficiosMuncAtualizacao.CodPessoa = TbBeneficiosMunicipais.Nome
  )
  INNER JOIN TbBenfMunDet ON TbBeneficiosMunicipais.CodBenef = TbBenfMunDet.CodBenef
GROUP BY
  TbBeneficiosMunicipais.CodBenef,
  TbBenfMunDet.[Tipo de Atendimento],
  TbBenfMunDet.[Situação Beneficio],
  TbBeneficiosMunicipais.dataInsc,
  TbBeneficiosMunicipais.Nome,
  beneficiosMuncAtualizacao.NIS,
  TbBeneficiosMunicipais.CPFPessoa,
  TbBeneficiosMunicipais.Celularpessoa,
  TbBeneficiosMunicipais.Responsavel,
  TbBeneficiosMunicipais.[CPF Responsavel],
  TbBeneficiosMunicipais.TipoBeneficio,
  beneficiosMuncAtualizacao.CodFam,
  beneficiosMuncAtualizacao.[CRAS Origem],
  beneficiosMuncAtualizacao.CodPessoa,
  beneficiosMuncAtualizacao.Nome,
  beneficiosMuncAtualizacao.DNasc,
  beneficiosMuncAtualizacao.CPF,
  beneficiosMuncAtualizacao.NomeMae,
  beneficiosMuncAtualizacao.NomePai,
  beneficiosMuncAtualizacao.RG,
  beneficiosMuncAtualizacao.OrgaoRG,
  beneficiosMuncAtualizacao.DEmisRG,
  beneficiosMuncAtualizacao.Endereço,
  beneficiosMuncAtualizacao.Bairro,
  beneficiosMuncAtualizacao.Celular,
  beneficiosMuncAtualizacao.Referencia,
  beneficiosMuncAtualizacao.Sexo,
  beneficiosMuncAtualizacao.Autismo,
  beneficiosMuncAtualizacao.Cegueira,
  beneficiosMuncAtualizacao.[Baixa visão],
  beneficiosMuncAtualizacao.[Surdez severa profunda],
  beneficiosMuncAtualizacao.[Surdez leve moderada],
  beneficiosMuncAtualizacao.[Deficiencia fisica],
  beneficiosMuncAtualizacao.[Defic mental intelec],
  beneficiosMuncAtualizacao.[Sindrome down],
  beneficiosMuncAtualizacao.[Transt doença mental],
  beneficiosMuncAtualizacao.DoencaCronica,
  beneficiosMuncAtualizacao.[Qual DCronica],
  beneficiosMuncAtualizacao.[Expr1030],
  beneficiosMuncAtualizacao.Escolaridade,
  beneficiosMuncAtualizacao.[Condição Ocupação],
  beneficiosMuncAtualizacao.[Renda sem programas sociais]
HAVING
  (
    (
      (
        TbBeneficiosMunicipais.CodBenef
      )= [Formulários]![FrmBeneficios]![CodBenef]
    )
  )
ORDER BY
  Max(
    beneficiosMuncAtualizacao.[DATA ATUALIZ]
  ) DESC;
