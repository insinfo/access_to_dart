SELECT
  csBMI.CodBenef,
  csBMI.Nome,
  csBMI.CPF,
  csBMI.RG,
  csBMI.TipoBeneficio,
  csBMI.DataDesl,
  csBMI.CodPessoa,
  csBMI.CodFam,
  TbUnidade.NOME AS UNIDADE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE
FROM
  TbUnidade,
  csBMI
WHERE
  (
    (
      (csBMI.CodBenef)= [Formulários]![FrmBeneficios]![CodBenef]
    )
  );
