SELECT
  TbAcolhidaCol.CodAcolhidaCol,
  TbAcolhidaCol.DataAcoCol,
  TbCadFuncionario.Nome,
  TbCadFuncionario.[FUNÇÃO NO SISTEMA] AS ESPECIALIDADE,
  TbNomeAcolhida.Nome,
  TbAcolhidaCol.DNascAcoCol,
  TbAcolhidaCol.cpfAcoCol,
  TbAcolhidaCol.rgAcoCol,
  TbAcolhidaCol.celAcoCol,
  TbAcolhidaCol.demBPCAcoCol,
  TbAcolhidaCol.demINSSAcoCol,
  TbAcolhidaCol.demSCFVAcoCol,
  TbAcolhidaCol.demEducAcoCol,
  TbAcolhidaCol.demSaudeAcoCol,
  TbAcolhidaCol.demJustiçaAcoCol,
  TbAcolhidaCol.demBenefMunAcoCol,
  TbAcolhidaCol.demAuxNatalAcoCol,
  TbAcolhidaCol.demGratTranspAcoCol,
  TbAcolhidaCol.demRecJusAcoCol,
  TbAcolhidaCol.demDocCivilAcoCol,
  TbAcolhidaCol.demApoioAlimAcoCol,
  TbAcolhidaCol.[outra DemAcoCol],
  TbAcolhidaCol.especOutraAcoCol,
  TbAcolhidaCol.encRedeSAAcoCol,
  TbAcolhidaCol.encSaudeAcoCol,
  TbAcolhidaCol.encEducAcoCol,
  TbAcolhidaCol.encSemfazAcoCol,
  TbAcolhidaCol.encENGAcoCol,
  TbAcolhidaCol.encOPAcoCol,
  TbAcolhidaCol.encComiteSR
FROM
  TbCadFuncionario
  INNER JOIN (
    TbNomeAcolhida
    INNER JOIN TbAcolhidaCol ON TbNomeAcolhida.IdNome = TbAcolhidaCol.NomeAcoCol
  ) ON TbCadFuncionario.CodFunc = TbAcolhidaCol.NomeServidor
WHERE
  (
    (
      (TbAcolhidaCol.DataAcoCol) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbNomeAcolhida.Nome) Is Not Null
    )
  );
