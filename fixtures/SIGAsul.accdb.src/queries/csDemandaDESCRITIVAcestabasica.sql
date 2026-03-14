SELECT
  TbDemandaReprimida.CodDemanda,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.CelularPessoa,
  CadResidencia.MulherCF,
  CadResidencia.[PBF FAMILIA],
  CadResidencia.[Fam Extrema Pb],
  TbPessoa.[Renda per capita],
  TbPessoa.[Aposentado/pensionista],
  CadResidencia.[Area violencia],
  CadResidencia.[Area de risco],
  TbDemandaReprimida.cestabasica,
  TbDemandaReprimida.data,
  csBenefMunicipais.TipoBeneficio,
  TbDemandaReprimida.[Data saída],
  TbDemandaReprimida.[Motivo saída]
FROM
  (
    (
      TbUnidade
      INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
    )
    INNER JOIN (
      TbPessoa
      LEFT JOIN csBenefMunicipais ON TbPessoa.CodPessoa = csBenefMunicipais.Nome
    ) ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbDemandaReprimida ON TbPessoa.CodPessoa = TbDemandaReprimida.Nome
WHERE
  (
    (
      (TbDemandaReprimida.cestabasica)= Yes
    )
    AND (
      (TbDemandaReprimida.data)<= [DATA FINAL]
    )
    AND (
      (
        TbDemandaReprimida.[Data saída]
      ) Is Null
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  )
ORDER BY
  TbDemandaReprimida.data;
