SELECT
  [PBFFAMILIA-NÃO].TITULAR,
  [PBFFAMILIA-NÃO].CodFam,
  [PBFFAMILIA-NÃO].CodPessoa,
  CadResidencia.[PBF FAMILIA],
  [PBFFAMILIA-NÃO].Nome,
  [PBFFAMILIA-NÃO].Parentesco
FROM
  [PBFFAMILIA-NÃO]
  INNER JOIN CadResidencia ON [PBFFAMILIA-NÃO].CodFam = CadResidencia.CodFam
WHERE
  (
    (
      ([PBFFAMILIA-NÃO].TITULAR) Is Null
    )
  );
