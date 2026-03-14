SELECT
  [DIARIO CS OFICINA SOCIOEDUC].CodOfSEduc,
  [DIARIO CS OFICINA SOCIOEDUC].DataDesl,
  TbUnidade.LOGO,
  TbPessoa.DataDesligPes,
  TbUnidade.NOME,
  [DIARIO CS OFICINA SOCIOEDUC].DataInsc,
  [DIARIO CS OFICINA SOCIOEDUC].CodGrupo,
  [DIARIO CS OFICINA SOCIOEDUC].FxEtaria,
  [DIARIO CS OFICINA SOCIOEDUC].Grupo,
  [DIARIO CS OFICINA SOCIOEDUC].Dia,
  [DIARIO CS OFICINA SOCIOEDUC].Horario,
  [DIARIO CS OFICINA SOCIOEDUC].CodOrientador,
  [DIARIO CS OFICINA SOCIOEDUC].NomeOrientador,
  [DIARIO CS OFICINA SOCIOEDUC].Nome,
  [DIARIO CS OFICINA SOCIOEDUC].DNasPessoa,
  [DIARIO CS OFICINA SOCIOEDUC].Idade,
  TbPessoa.Celular
FROM
  TbUnidade,
  TbCadFuncionario
  INNER JOIN (
    TbPessoa
    INNER JOIN [DIARIO CS OFICINA SOCIOEDUC] ON TbPessoa.CodPessoa = [DIARIO CS OFICINA SOCIOEDUC].Nome
  ) ON TbCadFuncionario.CodFunc = [DIARIO CS OFICINA SOCIOEDUC].CodOrientador
WHERE
  (
    (
      (
        [DIARIO CS OFICINA SOCIOEDUC].CodOfSEduc
      )= [Formulários]![FrmOficinaSocioeducativa]![CodOfSEduc]
    )
    AND (
      (
        [DIARIO CS OFICINA SOCIOEDUC].DataDesl
      ) Is Null
    )
    AND (
      (TbPessoa.DataDesligPes) Is Null
    )
  );
