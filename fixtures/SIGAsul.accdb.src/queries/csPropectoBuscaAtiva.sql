SELECT
  TbBuscaAtiva.CodBA,
  TbBuscaAtiva.DataBA,
  TbBuscaAtiva.Origem,
  TbBuscaAtiva.Nome,
  TbBuscaAtiva.Endereço,
  TbBuscaAtiva.Bairro,
  TbBuscaAtiva.TelFixo,
  TbBuscaAtiva.Celular,
  TbBuscaAtiva.Referencia,
  TbBuscaAtiva.Obs,
  TbBuscaAtivaDet.CodBADet,
  TbBuscaAtivaDet.CodBA,
  TbBuscaAtivaDet.DataBA,
  TbCadFuncionario.Nome,
  TbCadFuncionario.[FUNÇÃO NO SISTEMA],
  TbBuscaAtivaDet.[Nao Localizado],
  TbBuscaAtivaDet.[Motivo Não localizado]
FROM
  TbCadFuncionario
  INNER JOIN (
    TbBuscaAtiva
    INNER JOIN TbBuscaAtivaDet ON TbBuscaAtiva.CodBA = TbBuscaAtivaDet.CodBA
  ) ON TbCadFuncionario.CodFunc = TbBuscaAtivaDet.Tecnico
WHERE
  (
    (
      (TbBuscaAtiva.CodBA)= [Formulários]![FrmBuscaAtiva]![CodBA]
    )
  );
