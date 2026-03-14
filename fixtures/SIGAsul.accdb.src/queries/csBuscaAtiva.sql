SELECT
  TbBuscaAtivaDet.CodBADet,
  TbBuscaAtivaDet.DataBA,
  TbBuscaAtivaDet.Tecnico,
  TbBuscaAtivaDet.[Nao Localizado],
  TbBuscaAtivaDet.[Motivo Não localizado],
  TbBuscaAtiva.DataBA,
  TbBuscaAtiva.Origem,
  TbBuscaAtiva.Nome,
  TbBuscaAtiva.Endereço,
  TbBuscaAtiva.Bairro,
  TbBuscaAtiva.TelFixo,
  TbBuscaAtiva.Celular,
  TbBuscaAtiva.Referencia,
  TbBuscaAtiva.Obs
FROM
  TbBuscaAtiva
  INNER JOIN TbBuscaAtivaDet ON TbBuscaAtiva.CodBA = TbBuscaAtivaDet.CodBA
WHERE
  (
    (
      (TbBuscaAtivaDet.DataBA) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  );
