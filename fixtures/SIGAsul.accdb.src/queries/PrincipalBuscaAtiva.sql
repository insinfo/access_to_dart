SELECT
  TbBuscaAtiva.DataBA,
  TbBuscaAtivaDet.DataBA,
  TbBuscaAtivaDet.Tecnico,
  TbBuscaAtivaDet.Função,
  TbBuscaAtivaDet.[Nao Localizado],
  TbBuscaAtivaDet.[Motivo Não localizado]
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
