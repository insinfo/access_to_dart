SELECT
  CadResidencia.CodFam,
  CadResidencia.Volante,
  CadResidencia.DataCad,
  TbPessoa.CodPessoa,
  TbPessoa.Parentesco,
  TbPessoa.Nome,
  CadResidencia.[Demanda espontanea],
  CadResidencia.[Busca ativa],
  CadResidencia.[Enc Unidades Proteção Basica],
  CadResidencia.[Enc Unidades Proteção Especial],
  CadResidencia.[Enc Saude],
  CadResidencia.[Enc Educação],
  CadResidencia.[Enc Politicas Setoriais],
  CadResidencia.[Enc Conselho Tutelar],
  CadResidencia.[Enc Poder Judiciario],
  CadResidencia.[Enc Defens Publica/MP/Delegacias],
  CadResidencia.[Enc outros],
  CadResidencia.[Nome Encaminhador]
FROM
  CadResidencia
  INNER JOIN TbPessoa ON CadResidencia.CodFam = TbPessoa.CodFam
WHERE
  (
    (
      (CadResidencia.Volante)= No
    )
    AND (
      (CadResidencia.DataCad) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbPessoa.Parentesco)= "PESSOA DE REFERENCIA"
    )
  );
