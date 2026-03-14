SELECT
  TbUnidade.LOGO,
  TbUnidade.RODAPE,
  TbReuniao.Data,
  TbReuniao.Assunto,
  TbReuniaoDet.Nome,
  TbReuniaoDet.Função,
  TbReuniaoDet.Celular,
  TbReuniaoDet.Email,
  TbReuniaoDet.[Local de trabalho],
  TbReuniao.Ata,
  TbReuniao.Interna,
  TbReuniao.Externa,
  TbReuniao.Local,
  TbReuniao.Intersetorial,
  TbReuniao.Qual,
  TbReuniao.Volante
FROM
  TbUnidade,
  TbReuniao
  INNER JOIN TbReuniaoDet ON TbReuniao.CodReuniao = TbReuniaoDet.CodReuniao
WHERE
  (
    (
      (TbReuniao.Assunto) Like "*" + [digite o assunto] + "*"
    )
  );
