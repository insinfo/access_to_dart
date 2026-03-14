SELECT
  csBMD.CodBenef,
  csBMD.Nome,
  csBMD.CPF,
  csBMD.TipoBeneficio,
  csBMD.DataDesl,
  csBMD.CodPessoa,
  csBMD.CodFam,
  TbUnidade.NOME AS UNIDADE,
  TbUnidade.[DIRETOR(A)],
  TbUnidade.FUNÇÃO,
  TbUnidade.MATRICULA,
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  csBMD.RG
FROM
  csBMD,
  TbUnidade
WHERE
  (
    (
      (csBMD.CodBenef)= [Formulários]![FrmBeneficios]![CodBenef]
    )
    AND (
      (csBMD.TipoBeneficio)= "BMD"
    )
  );
