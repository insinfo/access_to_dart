SELECT
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbBenfMunDet.[Ano de referencia],
  TbCadFuncionario.Nome AS técnico,
  TbBeneficiosMunicipais.CodBenef,
  TbBeneficiosMunicipais.dataInsc,
  TbBeneficiosMunicipais.DataDesl,
  TbBeneficiosMunicipais.CodFunc,
  TbPessoa.Nome,
  TbPessoa.CPF,
  TbPessoa.Celular,
  TbBeneficiosMunicipais.Responsavel,
  TbBeneficiosMunicipais.[CPF Responsavel],
  TbBeneficiosMunicipais.obs,
  TbBeneficiosMunicipais.Anexo,
  TbBenfMunDet.[Data do Atendimento],
  TbBenfMunDet.CodFunc,
  TbBenfMunDet.NomeFunc,
  TbBenfMunDet.[Tipo de Atendimento],
  TbBenfMunDet.[Cras de Transferencia],
  TbBenfMunDet.[Situação Beneficio],
  TbBenfMunDet.[Motivo Desligamento],
  TbBenfMunDet.[Motivo Suspensão],
  TbBenfMunDet.Obs
FROM
  TbUnidade,
  (
    TbPessoa
    INNER JOIN (
      TbBeneficiosMunicipais
      INNER JOIN TbBenfMunDet ON TbBeneficiosMunicipais.CodBenef = TbBenfMunDet.CodBenef
    ) ON TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome
  )
  INNER JOIN TbCadFuncionario ON TbBeneficiosMunicipais.CodFunc = TbCadFuncionario.CodFunc
WHERE
  (
    (
      (
        TbBenfMunDet.[Ano de referencia]
      )= [DIGITE O ANO]
    )
    AND (
      (TbCadFuncionario.Nome) Like "*" + [DIGITE O TÉCNICO] + "*"
    )
    AND (
      (
        TbBenfMunDet.[Situação Beneficio]
      )= "ATIVO"
    )
  );
