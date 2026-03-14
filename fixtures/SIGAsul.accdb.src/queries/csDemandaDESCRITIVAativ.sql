SELECT
  TbDemandaReprimida.CodDemanda,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  CadResidencia.CodFam,
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
  TbDemandaReprimida.[Demanda scfv atividade],
  TbDemandaReprimida.[0a5],
  TbDemandaReprimida.[6a11],
  TbDemandaReprimida.[12a14],
  TbDemandaReprimida.[15a17],
  TbDemandaReprimida.[18a29],
  TbDemandaReprimida.[30a59],
  TbDemandaReprimida.[60mais],
  TbDemandaReprimida.data
FROM
  (
    (
      TbUnidade
      INNER JOIN CadResidencia ON TbUnidade.CodUnidade = CadResidencia.[CRAS Origem]
    )
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbDemandaReprimida ON TbPessoa.CodPessoa = TbDemandaReprimida.Nome
WHERE
  (
    (
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
