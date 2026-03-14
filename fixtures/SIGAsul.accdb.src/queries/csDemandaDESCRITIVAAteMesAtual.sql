SELECT
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbDemandaReprimida.Nome,
  TbDemandaReprimida.CelularPessoa,
  TbDemandaReprimida.DNasc,
  TbDemandaReprimida.cestabasica,
  TbDemandaReprimida.cobertor,
  TbDemandaReprimida.colchonete,
  TbDemandaReprimida.filtro,
  TbDemandaReprimida.[KIT TIPO],
  TbDemandaReprimida.[Demanda scfv atividade],
  TbDemandaReprimida.[0a5],
  TbDemandaReprimida.[6a11],
  TbDemandaReprimida.[12a14],
  TbDemandaReprimida.[15a17],
  TbDemandaReprimida.[18a29],
  TbDemandaReprimida.[30a59],
  TbDemandaReprimida.[60mais],
  TbDemandaReprimida.[Demanda CIC 6 A 12],
  TbDemandaReprimida.[Demanda CIC 13 A 17],
  TbDemandaReprimida.[Demanda CASA DA CRIANÇA 1 A 6],
  TbDemandaReprimida.[Demanda BMD],
  TbDemandaReprimida.[Demanda BMI],
  TbDemandaReprimida.data
FROM
  TbDemandaReprimida,
  TbUnidade
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
  )
ORDER BY
  TbDemandaReprimida.data;
