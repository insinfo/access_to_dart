SELECT
  TbUnidade.NOME,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbBeneficiosMunicipais.TipoBeneficio,
  TbBeneficiosMunicipais.CodBenef,
  TbBeneficiosMunicipais.dataInsc,
  TbBeneficiosMunicipais.DataDesl,
  TbBeneficiosMunicipais.CodFunc,
  TbBeneficiosMunicipais.NomeFunc,
  TbPessoa.Nome,
  TbPessoa.CPF,
  TbPessoa.Celular,
  TbBeneficiosMunicipais.Responsavel,
  TbBeneficiosMunicipais.[CPF Responsavel],
  TbBeneficiosMunicipais.obs,
  TbBeneficiosMunicipais.Anexo,
  TbBenfMunDet.[Data do Atendimento],
  TbBenfMunDet.[Ano de referencia],
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
  TbPessoa
  INNER JOIN (
    TbBeneficiosMunicipais
    INNER JOIN TbBenfMunDet ON TbBeneficiosMunicipais.CodBenef = TbBenfMunDet.CodBenef
  ) ON TbPessoa.CodPessoa = TbBeneficiosMunicipais.Nome
WHERE
  (
    (
      (
        TbBeneficiosMunicipais.TipoBeneficio
      )= [DIGITE O BENEFÍCIO]
    )
    AND (
      (
        TbBenfMunDet.[Ano de referencia]
      )= [DIGITE O ANO]
    )
    AND (
      (
        TbBenfMunDet.[Situação Beneficio]
      )= "ATIVO"
    )
  );
