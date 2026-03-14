SELECT
  TbAtend.CodAtend,
  TbAtend.Data,
  CadResidencia.CodFam,
  TbPessoa.Nome,
  CadResidencia.MulherCF,
  TbPessoa.BPCD,
  TbPessoa.BPCI,
  TbPessoa.[Aposentado/pensionista],
  CadResidencia.[PBF FAMILIA],
  CadResidencia.CADUNICO,
  CadResidencia.[Outros Programas Priori],
  CadResidencia.[Fam Extrema Pb],
  CadResidencia.[Area de risco],
  CadResidencia.[Area violencia],
  TbPessoa.DataDesligPes,
  TbPessoa.MotivoDeslPes
FROM
  (
    CadResidencia
    INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
  )
  INNER JOIN TbAtend ON TbPessoa.CodPessoa = TbAtend.Nome
WHERE
  (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
      Or (TbPessoa.DataDesligPes)>= [DATA FINAL]
    )
  );
